-- RegisterCommand("trunk", function(source,args) -- just a command to test veh trunk and ox inv
--     local ped = GetPlayerPed(source)
--     local coords = GetEntityCoords(ped)
--     local vehicle = CreateVehicle(`asea`, coords['x'], coords['y'], coords['z'], 55.5, true, true)
--     while not DoesEntityExist(vehicle) do Wait(500) end
--     SetVehicleBodyHealth(vehicle, 250.0)
--     local plates = GetVehicleNumberPlateText(vehicle)
--     plates = string.upper(plates)
--     SetVehicleNumberPlateText(vehicle, plates)
--     local stashName = "trunk"..plates
--     print(stashName)
--     registerStash(stashName, stashName, 5, 10000)
--     addTrunkItem(stashName, 'laptop', 1, nil, source)
-- end)

function registerStash(name, label, slots, weight)
    if Config.Inventory == "ox_inventory" then
        exports.ox_inventory:RegisterStash(name, label, slots, weight)
        Wait(1000)
    end
end

function addTrunkItem(name, item, count, metadata, source)
    if Config.Inventory == "ox_inventory" then
        local inventory = exports.ox_inventory:GetInventory(name, false)
        if inventory then
            exports.ox_inventory:AddItem({ id = name, owner = source}, item, count, metadata, 1)
            local res = exports.ox_inventory:GetInventory(name, false)
--            dbug(json.encode(res, {indent = true}))
        else
            print("[WARNING] Trunk "..name.." couldn't be loaded by ox_inventory.")
        end
        return
    end
    if Config.Inventory == "qb-inventory" and not Config.OldQBInventory then
        exports[Config.Inventory]:AddItem(name, item, count, 1, metadata)
    else
        local itemList = {}
        local newItem = QBCore.Shared.Items[item]
        if newItem then
            newItem['amount'] = count
            newItem['info'] = metadata
            newItem['slot'] = 1
            itemList[#itemList+1] = newItem
            exports[Config.Inventory]:addTrunkItems(name, itemList)
        else
            print("[ERROR] Item "..name.." is not registered in your Framework!")
        end
    end
end

function getStashItems(name)
    if Config.Inventory == "ox_inventory" then
        local inv = exports.ox_inventory:GetInventory(name)
        if inv and inv.items then
            return inv.items
        end
    elseif Config.Inventory == "qb-inventory" and not Config.OldQBInventory then
        local items = MySQL.query.await('SELECT * FROM `inventories` WHERE `identifier` = ?', {
            name
        })
        if items and (items[1] and items[1]['items']) then
            items = json.decode(items[1]['items'])
            return items
        end
    else
        local items = exports[Config.Inventory]:GetStashItems(name)
        if items then
            return items
        end
    end
    return false
end

function wipeStash(name)
    if Config.Inventory == "ox_inventory" then
        exports.ox_inventory:ClearInventory(name)
        return
    end
    if Config.Inventory == "qb-inventory" and not Config.OldQBInventory then
        local exists = MySQL.query.await('SELECT * FROM `inventories` WHERE `identifier` = ?', {
            name
        })
        if exists then
            MySQL.update.await('UPDATE inventories SET items = ? WHERE identifier = ?', {
                json.encode({}), name
            })
        end
    else
        exports[Config.Inventory]:WipeStash(name)
    end
end

function addItem(src,item,amount,info)
    if Config.Framework == "qb" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.AddItem(item,amount,false,info) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
            return true
        end
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer.canCarryItem(item,amount) then
            if Config.Inventory == "qs-inventory" then
                exports['qs-inventory']:AddItem(src, item, amount, info)
            else
                xPlayer.addInventoryItem(item,amount,info)
            end
            return true
        end
    end
    return false
end

-- Add Money
function addMoney(src, account, amount)
    dbug("addMoney(), source: "..src.. " account: "..account.." amount: "..amount)
    if Config.Framework == "qb" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            Player.Functions.AddMoney(account,amount)
        else
            print("[ERROR] addMoney() function couldn't find the player (?), source: "..src)
        end
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            xPlayer.addAccountMoney(account,amount)
        else
            print("[ERROR] addMoney() function couldn't find the player (?), source: "..src)
        end
    end
end

function getIdentifier(src)
    if Config.Framework == "qb" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            return Player.PlayerData.citizenid
        end
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            return xPlayer.identifier
        end
    end
    return false
end

function getAllPlayers()
    local list = {}
    if Config.Framework == "qb" then
        local players = QBCore.Functions.GetQBPlayers()
        for k, v in pairs(players) do
            list[#list+1] = v.PlayerData.source
        end
    end
    if Config.Framework == "esx" then
        local players = ESX.GetExtendedPlayers()
        for k, v in pairs(players) do
            list[#list+1] = v.source
        end
    end
    return list
end

-- Has item?
function hasItem(src,name,amount)
    local qty = 1
    if tonumber(amount) then
        qty = tonumber(amount)
    end
    if Config.Framework == "qb" then
        if Config.Inventory == "ox_inventory" then
            local item = exports.ox_inventory:GetItem(src, name, nil, true)
            if item and tonumber(item) >= qty then
                return true 
            end
        else
            return exports[Config.Inventory]:HasItem(src,name,qty)
        end
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        local item = xPlayer.getInventoryItem(name)
        if item and item['count'] >= qty then
            return true
        end
    end
    return false
end

function sendToDiscord(message)
    PerformHttpRequest(Config.Webhook, function() end, 'POST', json.encode({ username = 'AV Scripts', embeds = message}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("av_runs:openStash", function(name,data)
    local src = source
    exports[Config.Inventory]:OpenInventory(src, name, data)
end)