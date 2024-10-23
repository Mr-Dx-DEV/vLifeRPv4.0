local SetupDone = false
KnockRequest = {}
lib.callback.register('lazy-motel:server:getOwnedRooms', function(source, identifier)
    local res = MySQL.query.await('SELECT * FROM motel WHERE owner = ?', {
        identifier
    })
    if res and res[1] then
        return res
    else
        return {}
    end
end)

lib.callback.register('lazy-motel:server:toggleautopay', function(source, motel, room)
    local config = Config.Motel[motel].motel[room]
    Config.Motel[motel].motel[room].autopay = not config.autopay
    local n
    if config.autopay then
        n = 1
    else
        n = 0
    end
    MySQL.update.await('UPDATE motel SET autopay = ? WHERE owner = ? AND motel = ? AND room = ?', {
        n, config.owner, motel, room
    })
    TriggerClientEvent('lazy-motel:client:setRoomConfig', -1, motel, room, Config.Motel[motel].motel[room])
    return {
        text = locale("info_autopayment", n ~= 0 and 'enabled' or 'disabled')
    }
end)

lib.callback.register('lazy-motel:server:resetkey', function(source, motel, room)
    if not motel or not room then
        return {
            text = "Something wrong happened...",
            type = "error"
        }
    end
    local config = Config.Motel[motel].motel[room]
    if not config then
        return {
            text = "Something wrong happened...",
            type = "error"
        }
    end
    local items = Functions.HasItem(source, 'motel_key', 1, { motel = motel, room = room, serialkey = config.serial })
    if items and next(items) ~= nil then
        for _, v in ipairs(items) do
            Functions.RemoveItem(source, 'motel_key', 1, v.slot,
                { motel = motel, room = room, serialkey = config.serial })
        end
    end
    config.serial = GenerateSerialKey()
    Functions.AddItem(source, 'motel_key', 1, {
        motel = motel,
        room = room,
        motel_label = Config.Motel[motel].label,
        room_label = config.label,
        serialkey = config.serial
    })
    SaveMotelData(motel, room)
    SendLogs("Reset Keys", locale("logs_reset_key", config.owner, Config.Motel[motel].label, config.label, config.serial))
    TriggerClientEvent("lazy-motel:client:setRoomConfig", -1, motel, room, config)
    return {
        text = locale("info_reset_key", config.label),
        type = 'success'
    }
end)

lib.callback.register('lazy-motel:server:revoke-key', function(source, motel, room)
    if not motel or not room then
        return {
            text = "Invalid motel or room",
            type = 'error'
        }
    end
    local config = Config.Motel[motel]?.motel[room]
    if not config then
        return {
            text = "Something wrong....",
            type = 'error'
        }
    end
    config.serial = GenerateSerialKey()
    local player = Functions.GetPlayerSource(config.owner)
    if player then
        SendPhoneMail(player, Config.Motel[motel].label, "Revoke Key", "Your key has been revoked")
    end
    TriggerClientEvent('lazy-motel:client:setRoomConfig', -1, motel, room, config)
    return {
        text = locale('info_rent', config.label, config.motel[room].label),
        type = "success"
    }
end)

lib.callback.register('lazy-motel:server:kickperson', function(source, motel, room)
    local config = Config.Motel[motel]?.motel[room]
    if not config then return end
    if not config.owner then return end
    local target = Functions.GetPlayerSource(config.owner)
    if target then
        SendPhoneMail(target, Config.Motel[motel]?.label or "Unknown", "Kicked",
            "We've kicked you out from the motel... bruh fr you can't pay us???")
    end
    if Config.Motel[motel].type == 'shell' then
        local plist = GetPlayersInRoom(motel)
        if plist and next(plist) ~= nil then
            for _, player in ipairs(plist) do
                TriggerClientEvent('lazy-motel:client:kick', player)
            end
        end
    end
    if DeleteMotel(motel, room) then
        return {
            text = "Sucessfully kicked the person from their room",
            type = 'success'
        }
    end
    return {
        text = "Helo world",
        type = 'error'
    }
end)

lib.callback.register('lazy-motel:server:cancelmotel', function(source, motel, room)
    if not motel or not room then
        return {
            text = "Something went wrong...",
            type = 'error'
        }
    end
    local config = Config.Motel[motel].motel[room]
    if not config then
        return {
            text = "Something went wrong...",
            type = 'error'
        }
    end
    local items = Functions.HasItem(source, 'motel_key', 1, { motel = motel, room = room })
    if items and next(items) ~= nil then
        for i, v in ipairs(items) do
            Functions.RemoveItem(source, 'motel_key', 1, v.slot, {})
        end
    end
    if DeleteMotel(motel, room) then
        return {
            text = "You just cancel your motel room",
            type = 'success'
        }
    end
end)

lib.callback.register('lazy-motel:server:getkey', function(source, motel, room)
    local config = Config.Motel[motel]?.motel[room]
    if not config?.owned then
        return {
            text = "This room doesn't have owner!",
            type = 'error'
        }
    end
    if Functions.AddItem(source, 'motel_key', 1, {
            motel = motel,
            room = room,
            motel_label = Config.Motel[motel].label,
            room_label = config.label,
            serialkey = config.serial
        }) then
        return {
            text = "You got the key",
            type = 'success'
        }
    else
        return {
            text = "Your inventory is full",
            type = 'error'
        }
    end
end)

lib.callback.register('lazy-motel:server:reclaimkey', function(source, motel, room)
    if not motel or not room then
        return {
            text = "Something wrong happened...",
            type = "error"
        }
    end
    local config = Config.Motel[motel].motel[room]
    if not config then
        return {
            text = "Something wrong happened...",
            type = "error"
        }
    end
    local Items = Functions.HasItem(source, 'motel_key', 3, { motel = motel, room = room, serialkey = config?.serial })
    if Items and next(Items) ~= nil and #Items >= 3 then
        return {
            text = "You already have 3 keys?",
            type = "error"
        }
    end
    Functions.AddItem(source, 'motel_key', 1, {
        motel = motel,
        room = room,
        motel_label = Config.Motel[motel].label,
        room_label = config.label,
        serialkey = config.serial
    })
    return {
        text = locale("info_claim_key"),
        type = "success"
    }
end)


lib.callback.register('lazy-motel:server:getOwnedRoom', function(source, identifier, motel)
    local res = MySQL.single.await('SELECT * FROM motel WHERE owner = ? AND motel = ?', { identifier, motel })
    return res or nil
end)


lib.callback.register('lazy-motel:server:rentMotel', function(source, motel, room)
    return RentMotel(source, motel, room)
end)


lib.callback.register('lazy-motel:server:get-motel-balance', function(source, motel)
    return GetMotelBalance(motel)
end)

lib.callback.register('lazy-motel:server:raidmotel', function(source, motel, room)
    if not motel or not room then
        return
        {
            text = "There is something wrong....",
            type = 'error'
        }
    end
    local config = Config.Motel[motel]?.motel[room]
    if not config then
        return
        {
            text = "There is something wrong....",
            type = 'error'
        }
    end
    config.raid = true
    config.locked = false
    TriggerClientEvent('lazy-motel:client:setRoomConfig', -1, motel, room, config)
    return {
        text = "You've raid the motel",
        type = 'success'
    }
end)

lib.callback.register('lazy-motel:server:takemoney', function(source, motel, amount)
    local balance = GetMotelBalance(motel)
    if not balance then
        return {
            text = "This motel doesn't have any funds",
            type = 'error'
        }
    end
    if balance.balance >= amount then
        if RemoveMotelMoney(motel, amount) then
            Functions.AddMoney(source, 'bank', amount, 'motel-money')
            return {
                text = string.format("You just take %s from your motel fund", amount),
                type = 'success'
            }
        else
            return {
                text = "Something went wrong...",
                type = "error"
            }
        end
    else
        return {
            text = "This motel doesn't have any funds",
            type = 'error'
        }
    end
end)

lib.callback.register("lazy-motel:server:requestknock", function(source, motel, room)
    if not KnockRequest[room] then
        KnockRequest[room] = {}
    end
    if KnockRequest[room][source] then
        return false
    end
    KnockRequest[room][source] = true
    KnockExpire(motel, room, source)
    local plist = GetPlayersInRoom(room)
    if plist and next(plist) ~= nil then
        for _, v in ipairs(plist) do
            TriggerClientEvent("lazy-motel:client:knocknotify", v)
        end
    end
    return true
end)

lib.callback.register("lazy-motel:server:getknockrequest", function(source, motel, room)
    if not KnockRequest[room] then return end
    local data = {}
    for k, v in pairs(KnockRequest[room]) do
        data[#data + 1] = {
            name = Functions.GetName(k),
            id = k
        }
    end
    return data
end)

lib.callback.register("lazy-motel:server:renewmotel", function(source, motel, room)
    local config = Config.Motel[motel] and Config.Motel[motel].motel[room]
    if not config then
        return {
            text = "Something went wrong...",
            type = "error"
        }
    end
    local toPay = config.price or Config.Motel[motel].price
    local money = Functions.GetMoney(source)
    if not money then
        return {
            text = "You don't have enough money",
            type = "error"
        }
    end
    if money.bank >= toPay then
        if Functions.RemoveMoney(source, 'bank', toPay, 'renew-motel') then
            RenewMotel(motel, room)
            return {
                text = locale("info_renew"),
                type = "success"
            }
        end
    elseif money.cash >= toPay then
        if Functions.RemoveMoney(source, 'bank', toPay, 'reneww-motel') then
            RenewMotel(motel, room)
            return {
                text = locale("info_renew"),
                type = "success"
            }
        end
    else
        return {
            text = "You don't have enough money",
            type = "error"
        }
    end
end)

RegisterNetEvent("lazy-motel:server:clearRequest", function(motel, room, src)
    if not KnockRequest[room] then return end
    KnockRequest[room][src] = nil
end)

-- Because this shit just throw some random ass +543543/01/01 date when I put timestamp, fck it, Imma go to mysql insert instead :( , see AddRenew function
---@param str string
---@param timestampFormat any
local function ConvertToDate(str, timestampFormat)
    timestampFormat = timestampFormat or os.time()
    if type(timestampFormat) == 'string' then
        timestampFormat = tonumber(timestampFormat:gsub('%.0+$', ''))
    end
    local value, unit = str:match("(%d+)(%a)")
    if not value or not unit then
        return nil -- invalid input
    end
    value = tonumber(value)
    local dateTable = os.date("*t", timestampFormat)
    if unit == "d" then
        dateTable.day = dateTable.day + value
    elseif unit == "w" then
        dateTable.day = dateTable.day + value * 7
    else
        return error('Invalid unit!')
    end
    return os.date("%Y-%m-%d", os.time(dateTable))
end


local function AddRenew(unit, motel, room, identifier)
    local interval = tonumber(unit:sub(1, -2)) .. ' ' .. (unit:sub(-1) == 'w' and 'WEEK' or 'DAY')
    local params = {}
    params['@identifier'] = identifier
    params['@motel'] = motel
    params['@room'] = room
    MySQL.update.await(
        'UPDATE motel SET expire = DATE_ADD(expire, INTERVAL ' ..
        interval .. ') WHERE owner = ? AND motel = ? AND room = ?',
        { params['@identifier'], params['@motel'], params['@room'] }
    )
    local result = MySQL.single.await('SELECT expire FROM motel WHERE owner = ? AND motel = ? AND room = ?',
        { params['@identifier'], params['@motel'], params['@room'] })
    return result and result.expire
end


local function RegisterNewData(source, identifier, motel, room, expire, serialkey)
    local config = Config.Motel[motel].motel[room]
    config.owner = identifier
    config.serial = serialkey
    config.ownerinfo = {
        name = Functions.GetName(source, identifier),
        cid = GetResourceState("qb-core"):match("start") and identifier or nil
    }
    config.owned = true
    config.expire = expire
    Functions.AddItem(source, 'motel_key', 1, {
        motel = motel,
        room = room,
        motel_label = Config.Motel[motel].label,
        room_label = config.label,
        serialkey = serialkey
    })

    if GetResourceState('ox_inventory'):match('start') then
        exports.ox_inventory:RegisterStash(string.format('%s:%s', motel, room), config.label,
            Config.Stash.slot, Config.Stash.maxweight)
    end

    TriggerClientEvent('lazy-motel:client:setRoomConfig', -1, motel, room, Config.Motel[motel].motel[room])
    TriggerClientEvent('lazy-motel:client:updateUser', source, motel, room)
end

local function InsertRoomSQL(source, motel, room)
    local identifier = Functions.GetIdentifier(source)
    local serialkey = GenerateSerialKey()

    local renew = Config.Motel[motel].motel[room].renew or Config.Motel[motel].renew or Config.Renew
    local date = ConvertToDate(renew)

    if not date then
        return print(("Invalid date string '%s'"):format(renew))
    end

    local success, res = pcall(MySQL.insert.await,
        "INSERT INTO motel (owner, motel, room, expire, serialkey, autopay) VALUES (?, ?, ?, ?, ?, ?)", {
            identifier, motel, room, date, serialkey, 0
        })

    if not success then
        return print(('Error occurred: %s'):format(res))
    end
    RegisterNewData(source, identifier, motel, room, date, serialkey)
end


---@param source number
---@param identifier? string | unknown
function GetPlayerMotel(source, identifier)
    if source and source ~= 0 then
        identifier = Functions.GetIdentifier(source)
    end
    if not identifier then return end

    local success, res = pcall(MySQL.query.await, "SELECT * FROM motel WHERE owner = ?", { identifier })

    if not success then
        print("Error: ", res)
        return
    end
    if not res or next(res) == nil then return end

    local mtable = {}
    for _, v in pairs(res) do
        table.insert(mtable, {
            motel = v.motel,
            room = v.room
        })
    end
    return mtable
end

exports("GetPlayerMotel", GetPlayerMotel)

function RentMotel(source, motel, room)
    if Config.MaxRooms and Config.MaxRooms > 0 then
        local mlist = GetPlayerMotel(source)
        if mlist and next(mlist) ~= nil then
            if #mlist >= Config.MaxRooms then
                return {
                    text = "You can't rent more motel..., the maximum are " .. Config.MaxRooms,
                    type = "error"
                }
            end
        end
    end
    local money = Functions.GetMoney(source)
    local toPay = Config.Motel[motel].motel[room]?.price or Config.Motel[motel].price
    local config = Config.Motel[motel]
    if not config then return end
    if not money then
        return {
            text = 'No Money',
            type = "error"
        }
    end
    if money.bank >= toPay then
        if Functions.RemoveMoney(source, 'bank', toPay, 'rent-motel') then
            local success, _ = pcall(InsertRoomSQL, source, motel, room)
            if not success then
                return {
                    text = "Something wrong happened...",
                    type = 'error'
                }
            end
            AddMotelMoney(motel, toPay)
            return {
                text = locale('info_rent', config.label, config.motel[room].label),
                type = 'success'
            }
        end
    elseif money.cash >= toPay then
        if Functions.RemoveMoney(source, 'cash', toPay, 'rent-motel') then
            local success, _ = pcall(InsertRoomSQL, source, motel, room)
            if not success then
                return {
                    text = "Something wrong happened...",
                    type = 'error'
                }
            end
            AddMotelMoney(motel, toPay)
            return {
                text = locale('info_rent', config.label, config.motel[room].label),
                type = 'success'
            }
        end
    else
        return {
            text = "You don't have enough money",
            type = 'error'
        }
    end
    return {
        text = 'Something went wrong...',
        type = 'error'
    }
end

function RenewMotel(motel, room)
    if not Config.Motel[motel] or not Config.Motel[motel].motel[room] then return end
    local roomConfig = Config.Motel[motel].motel[room]
    local renew = roomConfig.renew or Config.Motel[motel].renew or Config.Renew
    roomConfig.expire = AddRenew(renew, motel, room, roomConfig.owner)
    TriggerClientEvent('lazy-motel:client:setRoomConfig', -1, motel, room, roomConfig)
end

exports('RentMotel', RentMotel)

function DeleteMotel(motel, room)
    if not motel or not room then return end
    local config = Config.Motel[motel].motel[room]
    if not config then return end
    local identifier = config.owner
    InitRoom(config, Config.Motel[motel].type)
    AddRoomInstance(motel, room)
    TriggerClientEvent('lazy-motel:client:setRoomConfig', -1, motel, room, config)
    local res = MySQL.query.await("DELETE FROM motel WHERE owner = ? AND motel = ? AND room = ?",
        { identifier, motel, room })
    return res
end

exports('DeleteMotel', DeleteMotel)


function AddMotelMoney(motel, amount)
    local motelconfig = Config.Motel[motel]
    local isjob = Functions.GetJobInfo(motelconfig.owner)
    if isjob then
        Functions.AddSocietyMoney(motelconfig.owner, amount)
    else

    end
    MySQL.insert(
        "INSERT INTO motel_owner (motel, balance, total) VALUES (@motel, @amount, @amount) ON DUPLICATE KEY UPDATE total = total + @amount, balance = balance + @amount",
        {
            ['@motel'] = motel,
            ['@amount'] = amount
        })
    TriggerClientEvent('lazy-motel:client:update-motel-balance', -1, motel)
end

function RemoveMotelMoney(motel, amount)
    local success, res = pcall(MySQL.update.await, 'UPDATE motel_owner SET balance = balance - ? WHERE motel = ?',
        { amount, motel })
    if not success or not res then return false end
    TriggerClientEvent('lazy-motel:client:update-motel-balance', -1, motel)
    return true
end

function GetMotelBalance(motel)
    local success, res = pcall(MySQL.query.await, "SELECT * FROM motel_owner WHERE motel = ?", { motel })
    if not success then return end
    return res[1] or { balance = 0, total = 0 }
end

function GetExpiredMotel()
    local res = MySQL.query.await('SELECT * FROM motel WHERE expire < NOW()', {})
    if res and #res > 0 then
        local batch = {}
        for _, v in ipairs(res) do
            local motelCfg = Config.Motel[v.motel]
            local roomCfg = motelCfg and motelCfg.motel[v.room]

            if roomCfg then
                local price = roomCfg.price or motelCfg.price
                local player = Functions.GetPlayerSource(v.owner)
                local delete = false
                local hasEnoughBank, hasEnoughCash

                if player then
                    local money = Functions.GetMoney(player)
                    if money then
                        hasEnoughBank, hasEnoughCash = money.bank >= price, money.cash >= price
                    else
                        return print("Error")
                    end
                else
                    local money = Functions.GetOfflineMoney(v.owner)
                    hasEnoughBank, hasEnoughCash = money.bank >= price, money.cash >= price
                end

                if roomCfg.autopay then
                    if not hasEnoughBank and not hasEnoughCash then
                        delete = true
                    else
                        local paymentType = hasEnoughBank and 'bank' or 'cash'
                        local removeMoney = player and Functions.RemoveMoney or Functions.RemoveOfflineMoney
                        removeMoney(player or v.owner, paymentType, price, 'renew-motel')
                        RenewMotel(v.motel, v.room)
                    end
                else
                    if player then
                        SendPhoneMail(player, motelCfg.label, "Expired Motel",
                            "Your motel has expired... we've kicked you out")
                    end

                    local plist = GetPlayersInRoom(v.room)
                    if plist and next(plist) ~= nil then
                        for _, source in ipairs(plist) do
                            TriggerClientEvent('lazy-motel:client:kick', source)
                        end
                    end

                    if Config.WipeOnExpire then
                        exports.ox_inventory:ClearInventory(string.format("%s:%s", v.motel, v.room))
                    end

                    delete = true
                end

                if delete then
                    roomCfg.owned, roomCfg.owner, roomCfg.serial = false, nil, nil
                    table.wipe(roomCfg.ownerinfo)
                    batch[#batch + 1] = {
                        query = 'DELETE FROM motel WHERE motel = ? AND room = ? AND owner = ?',
                        values = { v.motel, v.room, v.owner },
                    }
                end

                TriggerClientEvent('lazy-motel:client:setRoomConfig', -1, v.motel, v.room, roomCfg)
            end
        end

        if #batch > 0 then
            MySQL.transaction.await(batch)
        end

        print(('EXPIRED MOTEL FOUND: %d'):format(#res))
    end

    Citizen.SetTimeout(5000, GetExpiredMotel)
end

function InitRoom(room, type)
    room.owned = false
    room.owner = nil
    room.serial = nil
    room.ownerinfo = nil
    room.bucket = GenerateRandomInt(3)
    if type == 'shell' then
        room.stash = {
            locked = true
        }
    elseif type == 'mlo' then
        room.stash.locked = true
    end
end

local function InitRoomsAndInstances(motelKey, motelData)
    for room, v2 in pairs(motelData.motel) do
        InitRoom(v2, motelData.type)
        AddRoomInstance(motelKey, room)
    end
end


local function UpdateRoomWithDBData(room, data)
    local name = Functions.GetName(0, data.owner)

    if not name then
        NilOwner(data.owner)
    else
        room.ownerinfo = { name = name, cid = GetResourceState('qb-core'):match("start") and data.owner or nil }
        room.owned = true
        room.owner = data.owner
        room.serial = data.serialkey
        room.expire = data.expire
        room.autopay = data.autopay ~= 0

        if GetResourceState('ox_inventory'):match('start') then
            exports.ox_inventory:RegisterStash(
                string.format('%s:%s', data.motel, data.room),
                room.label,
                Config.Stash.slot,
                Config.Stash.maxweight
            )
        end
    end
end

function SetupMotel()
    for motel, v in pairs(Config.Motel) do
        InitRoomsAndInstances(motel, v)
    end

    local success, result = pcall(MySQL.query.await, 'SELECT * FROM motel')

    if not success then
        InitDB()
        return SetupMotel()
    end

    for _, data in ipairs(result) do
        local motelConfig = Config.Motel[data.motel]

        if motelConfig and motelConfig.motel[data.room] then
            local room = motelConfig.motel[data.room]
            UpdateRoomWithDBData(room, data)
        end
    end

    TriggerClientEvent('lazy-motel:client:setConfig', -1, Config.Motel)
    SetupDone = true
end

function IsKeyHolders(source, motel, room)
    if not source or not motel or not room then return end
    local config = Config.Motel[motel].motel[room]
    if not config or not config.owned then return false end
    if Functions.HasItem(source, 'motel_key', 1, { motel = motel, room = room, serialkey = Config.Motel[motel].motel
            [room].serial }) then
        return true
    else
        return false
    end
end

exports('IsKeyHolders', IsKeyHolders)

function NilOwner(identifier)
    local success, _ = pcall(MySQL.query.await, 'DELETE FROM motel WHERE owner = ?', { identifier })
    if not success then return print(("Cannot delete %s from DATABASE"):format(identifier)) end
    print(('DELETED %s FROM MOTEL'):format(identifier))
end

function ToggleDoorState(src, motel, room)
    local motelconfig = Config.Motel[motel]
    local config = Config.Motel[motel].motel[room]
    if not config then return end
    config.locked = not config.locked
    if motelconfig.type == 'shell' then
    elseif motelconfig.type == 'mlo' then
        local state
        if config.locked then
            state = 1
        else
            state = 0
        end
        if GetResourceState('ox_doorlock'):match('start') then
            local door = exports.ox_doorlock:getDoorFromName(room)
            if door then
                TriggerEvent('ox_doorlock:setState', door.id, state, false)
            end
        elseif GetResourceState('qb-doorlock'):match("start") then
            TriggerEvent("qb-doorlock:server:updateState", room, config.locked, nil, false, true, true, false, src)
        end
    end
    if config.locked then
        TriggerClientEvent('lazy-motel:notify', src, "You locked the door")
    else
        TriggerClientEvent('lazy-motel:notify', src, "You unlocked the door")
    end
    TriggerClientEvent('lazy-motel:client:setRoomConfig', -1, motel, room, Config.Motel[motel].motel[room])
end

function KnockExpire(motel, room, src)
    SetTimeout(10000, function()
        if KnockRequest[room][src] then
            KnockRequest[room][src] = nil
            TriggerClientEvent("lazy-motel:notify", src, "Nobody answer...", "error")
        end
    end)
end

function SaveMotelData(motel, room)
    local config = Config.Motel[motel] and Config.Motel[motel].motel[room]
    if not config then return end
    MySQL.update("UPDATE motel SET serialkey = @serial WHERE motel = @motel AND room = @room", {
        ["@serial"] = config.serial,
        ["@motel"] = motel,
        ["@room"] = room
    })
end

AddEventHandler('onServerResourceStart', function(resname)
    if resname ~= GetCurrentResourceName() then return end
    -- Make sure all file loaded first....
    Wait(500)
    SetupMotel()
    repeat
        Wait(100)
    until SetupDone
    GetExpiredMotel()
end)
