if Config.Framework == "QBCore" then
    QBCore = exports["qb-core"]:GetCoreObject()
elseif Config.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
end

CreateThread(function()
    if Config.DevServer then
        print("^1[CAUTION] ^2Config.DevServer IS ENABLED^7")
        print("^1[CAUTION] ^2Config.DevServer IS ENABLED^7")
        print("^1[CAUTION] ^2Config.DevServer IS ENABLED^7")
    end
    if Config.Inventory == "ox_inventory" then
        exports.ox_inventory:RegisterStash("house_robbery", Lang['inventory_title'], 10, 100000)
    end
end)

AddEventHandler("QBCore:Server:PlayerLoaded", function(Player)
    init(Player.PlayerData.source)
end)

RegisterServerEvent("esx:onPlayerJoined")
AddEventHandler("esx:onPlayerJoined", function(Player)
    local src = Player
    if not src then src = source end
    init(src)
end)

function getPlayerByIdentifier(identifier)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if Player then
            return Player
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
        if xPlayer then
            return xPlayer
        end
    end
    return false
end

function getPermission(src, level)
    if Config.Framework == "QBCore" then
        if QBCore.Functions.HasPermission(src, level) or IsPlayerAceAllowed(src, 'command') then
            return true
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        return xPlayer.getGroup() == level
    end
    return false
end

function getIdentifier(src)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            return Player.PlayerData.citizenid
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            return xPlayer.identifier
        end
    end
    return false
end

-- Has item?
function hasItem(src, name, amount)
    local qty = 1
    if tonumber(amount) then
        qty = tonumber(amount)
    end
    if Config.Framework == "QBCore" then
        if Config.Inventory == "ox_inventory" then
            local item = exports.ox_inventory:GetItem(src, name, nil, true)
            if item and tonumber(item) >= qty then
                return true
            end
        else
            return exports[Config.Inventory]:HasItem(src, name, qty)
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        local item = xPlayer.getInventoryItem(name)
        if item and item['count'] >= qty then
            return true
        end
    end
    return false
end

-- Add Item to player
function addItem(src, item, amount, info)
    if Config.Debug then
        print("addItem()", src, item, amount)
    end
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Config.Debug then
            print("addItem() line 93")
        end
        if Player.Functions.AddItem(item, amount, false, info) then
            if Config.Debug then
                print("addItem() line 97")
            end
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
            return true
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer.canCarryItem(item, amount) then
            if Config.Inventory == "qs-inventory" then
                exports['qs-inventory']:AddItem(src, item, amount, nil, info)
            else
                xPlayer.addInventoryItem(item, amount, info)
            end
            return true
        end
    end
    return false
end

-- Remove Item from Player
function removeItem(src, item, amount, slot)
    local amount = amount or 1
    if Config.Framework == "QBCore" then
        if Config.Inventory == "ox_inventory" then
            exports.ox_inventory:RemoveItem(src, item, amount, nil, slot)
        else
            exports[Config.Inventory]:RemoveItem(src, item, amount, slot)
        end
    elseif Config.Framework == "ESX" then
        if Config.Inventory == "ox_inventory" then
            exports.ox_inventory:RemoveItem(src, item, amount, nil, slot)
        elseif Config.Inventory == "qs-inventory" then
            exports[Config.Inventory]:RemoveItem(src, item, amount, slot)
        else
            local xPlayer = ESX.GetPlayerFromId(src)
            xPlayer.removeInventoryItem(item, amount)
        end
    end
end

-- Add Money
function addMoney(src, account, amount)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            Player.Functions.AddMoney(account, amount)
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            xPlayer.addAccountMoney(account, amount)
        end
    end
end

lib.callback.register('av_houserobbery:getItem', function(source, item, amount)
    local src = source
    local qty = 1
    if tonumber(amount) then
        qty = tonumber(amount)
    end
    if type(item) == "table" then
        local count = 0
        for k, v in pairs(item) do
            if hasItem(src, v, qty) then
                count = count + 1
            end
        end
        if count == #item then
            return true
        else
            return false
        end
    end
    return hasItem(src, item, qty)
end)

-- Verify the cooldown table
RegisterCommand('robbery:cooldown', function(source, args)
    local time = os.time()
    local count = 0
    for k, v in pairs(cooldown) do
        count += 1
        local temp = v - time
        print("identifier:", k, "time remaining:", SecondsToClock(temp))
    end
    if count == 0 then print("No one in cooldown") end
end, true)
