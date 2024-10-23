---@diagnostic disable: duplicate-set-field
local QBCore = exports['qb-core']:GetCoreObject()
Functions = {}

function Functions.SaveMetadata(source, motel, room, status)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end
    local insideMeta                   = xPlayer.PlayerData.metadata.inside
    insideMeta.apartment.apartmentType = nil
    insideMeta.apartment.apartmentId   = nil
    insideMeta.house                   = nil
    insideMeta.motel                   = {
        motel = nil,
        room = nil
    }
    if status then
        insideMeta.motel = {
            motel = motel,
            room = room
        }
    end
    xPlayer.Functions.SetMetaData("inside", insideMeta)
    QBCore.Player.Save(source)
end

function Functions.Logout(source)
    QBCore.Player.Logout(source)
    if GetResourceState("jl-multicharacter") == "started" then
        TriggerClientEvent('jl-multicharacter:client:chooseChar', source)
    else
        TriggerClientEvent('qb-multicharacter:client:chooseChar', source)
    end
end

function Functions.AddMoney(source, type, amount, reason)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end
    return xPlayer.Functions.AddMoney(type, amount, reason)
end

function Functions.RemoveMoney(source, type, amount, reason)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return false end
    if xPlayer.PlayerData.money[type] < amount then return false end
    return xPlayer.Functions.RemoveMoney(type, amount, reason)
end

function Functions.GetMoney(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end
    return xPlayer.PlayerData.money
end

function Functions.GetSocietyMoney(jobname)
    return exports['qb-management']:GetAccount(jobname)
end

function Functions.RemoveSocietyMoney(jobname, amount)
    local moneyamount = exports['qb-management']:GetAccount(jobname)
    if moneyamount < amount then return false end
    exports['qb-management']:RemoveMoney(jobname, amount)
    return true
end

function Functions.AddSocietyMoney(jobname, amount)
    return exports['qb-management']:AddMoney(jobname, amount)
end

function Functions.GetOfflinePlayer(identifier)
    return QBCore.Player.GetOfflinePlayer(identifier)
end

function Functions.GetOfflineMoney(identifier)
    return Functions.GetOfflinePlayer(identifier).PlayerData.money
end

function Functions.RemoveOfflineMoney(identifier, type, amount, reason)
    -- Wtf why this one doesn't work, kill me please
    -- local xPlayer = Functions.GetOfflinePlayer(identifier)
    -- if xPlayer.PlayerData.money[type] >= amount then
    --      local success, res = pcall(xPlayer.Functions.RemoveMoney, type, amount, reason)
    --     end
    local res = MySQL.single.await("SELECT money FROM players WHERE citizenid = ?", { identifier })
    if res then
        local money = json.decode(res.money)
        if money[type] >= amount then
            money[type] = money[type] - amount
        end
        local up = MySQL.update.await("UPDATE players SET money = ? WHERE citizenid = ?", {
            json.encode(money), identifier
        })
        if up then return true end
    end
end

function Functions.AddOfflineMoney(identifier, type, amount, reason)
    local xPlayer = Functions.GetOfflinePlayer(identifier)
    return xPlayer and xPlayer.Functions.AddMoney(type, amount, reason)
end

function Functions.GetName(source, identifier)
    local xPlayer = source ~= 0 and QBCore.Functions.GetPlayer(source) or Functions.GetOfflinePlayer(identifier)
    if not xPlayer then return end
    local charinfo = xPlayer.PlayerData.charinfo
    return ('%s %s'):format(charinfo.firstname, charinfo.lastname)
end

function Functions.GetIdentifier(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end
    return xPlayer.PlayerData.citizenid
end

function Functions.GetPlayer(identifier)
    return QBCore.Functions?.GetPlayerByCitizenId(identifier)
end

function Functions.GetPlayerSource(identifier)
    local player = Functions.GetPlayer(identifier)
    return player and player.PlayerData.source or nil
end

function Functions.GetJobInfo(job)
    return QBCore.Shared.Jobs[job] or nil
end

function Functions.HasItem(source, item, amount, metadata)
    if GetResourceState("ox_inventory"):match("start") then
        local slots = exports.ox_inventory:Search(source, "slots", item, metadata)
        return (slots and next(slots) ~= nil) and slots or nil
    else
        local xPlayer = QBCore.Functions.GetPlayer(source)
        local result = xPlayer.PlayerData.items
        local data = {}
        local metadataLength = 0
        for _ in pairs(metadata) do
            metadataLength += 1
        end
        for k, v in pairs(result) do
            if v.name == item then
                if metadata and next(metadata) ~= nil and next(v.info) ~= nil then
                    local valid = 0
                    for n, val in pairs(v.info) do
                        if metadata[n] then
                            if metadata[n] == val then
                                valid += 1
                            end
                        end
                    end
                    if metadataLength == valid then
                        data[#data + 1] = result[k]
                    end
                else
                    print("Yolo 2")
                    data[#data + 1] = result[k]
                end
            end
        end
        return next(data) ~= nil and data or nil
    end
end

function Functions.AddItem(source, item, amount, metadata)
    if GetResourceState("ox_inventory"):match("start") then
        return exports.ox_inventory:AddItem(source, item, amount, metadata)
    else
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if not xPlayer then return end
        local iteminfo = QBCore.Shared.Items[item]
        TriggerClientEvent("inventory:client:ItemBox", source, iteminfo, 'add', amount)
        return xPlayer.Functions.AddItem(item, amount, false, metadata)
    end
end

function Functions.RegisterUseable(name, cb)
    QBCore.Functions.CreateUseableItem(name, function(source, item)
        if GetResourceState('ox_inventory'):match('start') then
            local info = item.metadata
            cb(source, info.motel, info.room, info.serialkey)
        else
            local info = item.info
            cb(source, info.motel, info.room, info.serialkey)
        end
    end)
end

function Functions.RemoveItem(source, item, amount, slot, metadata)
    local HasItem = Functions.HasItem(source, item, amount, metadata)
    if HasItem and next(HasItem) ~= nil then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if slot then
            xPlayer.Functions.RemoveItem(item, amount, slot)
            if not GetResourceState("ox_inventory"):match("start") then
                local iteminfo = QBCore.Shared.Items[item]
                TriggerClientEvent("inventory:client:ItemBox", source, iteminfo, 'remove', amount)
            end
        else
            local iteminfo = QBCore.Shared.Items[item]
            for _, value in pairs(HasItem) do
                if not GetResourceState("ox_inventory"):match("start") then
                    TriggerClientEvent("inventory:client:ItemBox", source, iteminfo, 'remove', amount)
                end
                xPlayer.Functions.RemoveItem(item, amount, value.slot)
            end
        end
    else
        print('Not enough item')
    end
end
