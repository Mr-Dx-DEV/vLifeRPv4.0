---@diagnostic disable: duplicate-set-field
local ESX = exports["es_extended"]:getSharedObject()
local ox_inventory = exports.ox_inventory
Functions = {}

function Functions.SaveMetadata(source, motel, room, status)
    if status then
        MySQL.query.await(
            'INSERT INTO motel_instances (identifier, motel, room) VALUES (@id, @motel, @room) ON DUPLICATE KEY UPDATE motel = @motel, room = @room',
            {
                ['@id'] = Functions.GetIdentifier(source),
                ['@motel'] = motel,
                ['@room'] = room
            })
    else
        MySQL.query.await("DELETE FROM motel_instances WHERE identifier = ?", { Functions.GetIdentifier(source) })
    end
end

function Functions.Logout(source)
    TriggerEvent("esx:playerLogout", source)
end

function Functions.AddMoney(source, type, amount, reason)
    if type == "cash" then
        type = "money"
    end
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    return xPlayer.addAccountMoney(type, amount)
end

function Functions.RemoveMoney(source, type, amount, reason)
    if type == "cash" then
        type = "money"
    end
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    local account = xPlayer.getAccount(type)
    if not account or account.money < amount then return end
    xPlayer.removeAccountMoney(type, amount)
    return true
end

function Functions.GetMoney(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    local cash = xPlayer.getAccount("money")
    local bank = xPlayer.getAccount("bank")
    local data = {
        [cash.name] = cash?.money,
        [bank.name] = bank?.money
    }
    print(json.encode(data))
    return data
end

function Functions.GetSocietyMoney(jobname)
    local p = promise:new()
    TriggerEvent("esx_addonaccount:getSharedAccount", string.format("society_%s", jobname), function(account)
        p:resolve(account and account.money)
    end)
    return Citizen.Await(p)
end

function Functions.RemoveSocietyMoney(jobname, amount)
    local p = promise:new()
    TriggerEvent("esx_addonaccount:getSharedAccount", string.format("society_%s", jobname), function(account)
        if not account then
            p:resolve(false)
        end
        if account.money < amount then
            p:resolve(false)
        else
            account.removeMoney(amount)
            p:resolve(true)
        end
    end)
    return Citizen.Await(p)
end

function Functions.AddSocietyMoney(jobname, amount)
    local p = promise:new()
    TriggerEvent("esx_addonaccount:getSharedAccount", string.format("society_%s", jobname), function(account)
        if not account then
            p:resolve(false)
        end
        if account.money < amount then
            p:resolve(false)
        else
            account.addMoney(amount)
            p:resolve(true)
        end
    end)
    return Citizen.Await(p)
end

function Functions.GetOfflinePlayer(identifier)
    local result = MySQL.single.await("SELECT * FROM users WHERE identifier = ?", { identifier })
    if not result then
        return
    end
    local data = {
        Offline = true,
        PlayerData = {
            charinfo = {
                firstname = result.firstname,
                lastname = result.lastname,
            },
            money = json.decode(result.accounts),
        },
    }
    return data
end

function Functions.GetOfflineMoney(identifier)
    return Functions.GetOfflinePlayer(identifier).PlayerData.money
end

function Functions.RemoveOfflineMoney(identifier, type, amount, _)
    if type == "cash" then
        type = "money"
    end
    local money = Functions.GetOfflineMoney(identifier)
    if money and money[type] >= amount then
        money[type] -= amount
        local update = MySQL.update.await("UPDATE users SET accounts = ? WHERE identifier = ?", {
            json.encode(money),
            identifier,
        })
        if update then
            return true
        end
    end
    return false
end

function Functions.AddOfflineMoney(identifier, type, amount, _)
    if type == "cash" then
        type = "money"
    end
    local money = Functions.GetOfflineMoney(identifier)
    if money and money[type] >= amount then
        money[type] += amount
        local update = MySQL.update.await("UPDATE users SET accounts = ? WHERE identifier = ?", {
            json.encode(money),
            identifier,
        })
        if update then
            return true
        end
    end
    return false
end

function Functions.GetIdentifier(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        return
    end
    return xPlayer.identifier
end

function Functions.GetName(source, identifier)
    local xPlayer = source ~= 0 and ESX.GetPlayerFromId(source) or Functions.GetOfflinePlayer(identifier)
    if not xPlayer then
        return
    end
    local charinfo = {}
    if xPlayer?.Offline then
        charinfo = xPlayer.PlayerData.charinfo
    end
    return not xPlayer.Offline and xPlayer.getName() or ("%s %s"):format(charinfo.firstname, charinfo.lastname)
end

function Functions.GetPlayer(identifier)
    return ESX.GetPlayerFromIdentifier(identifier)
end

function Functions.GetPlayerSource(identifier)
    local player = Functions.GetPlayer(identifier)
    return player and player.source
end

function Functions.GetJobInfo(job)
    local res = MySQL.single.await("SELECT * FROM jobs WHERE name = ?", { job })
    return res or nil
end

function Functions.HasItem(source, item, amount, metadata)
    local slots = ox_inventory:Search(source, "slots", item, metadata)
    if slots and slots[1] then
        return slots
    end
    return nil
end

function Functions.AddItem(source, item, amount, metadata)
    return ox_inventory:AddItem(source, item, amount, metadata)
end

function Functions.RemoveItem(source, item, amount, slot, metadata)
    local HasItem = Functions.HasItem(source, item, amount, metadata)
    if HasItem and next(HasItem) ~= nil then
        if slot then
            ox_inventory:RemoveItem(source, item, amount, nil, slot)
        else
            for _, v in pairs(HasItem) do
                ox_inventory:RemoveItem(source, item, amount, v.metadata, v.slot)
            end
        end
    else
        print("Not enough item")
    end
end

function Functions.RegisterUseable(name, cb)
    ESX.RegisterUsableItem(name, function(source, item, data)
        local info = data.metadata
        cb(source, info.motel, info.room, info.serialkey)
    end)
end

lib.callback.register("lazy-motel:server:esx_playerloaded", function(source)
    ::undo::
    local identifier = Functions.GetIdentifier(source)
    local success, res = pcall(MySQL.single.await, "SELECT * FROM motel_instances WHERE identifier = ?", { identifier })
    if not success then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `motel_instances` (
                `identifier` varchar(50) DEFAULT NULL,
                `motel` varchar(50) DEFAULT NULL,
                `room` varchar(50) DEFAULT NULL,
                KEY `identifier` (`identifier`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
        ]])
        goto undo
    end
    if not res or not next(res) then return end
    return {
        motel = res.motel,
        room = res.room
    }
end)
