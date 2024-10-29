local QBCore = nil

Citizen.CreateThread(function() 
    if Config.Framework == "qb" then
        QBCore = exports[Config.FrameworkPseudo]:GetCoreObject()
    end
    RegisterServerCallback('zat-farming:server:GetPlayerItems', function(source, cb)
        local src = source
        if Config.Inventory == 'qb' or Config.Inventory == 'ps' then
            exports['qb-inventory']:SaveInventory(src, false)
            local Player = QBCore.Functions.GetPlayer(src)
            local cid = Player.PlayerData.citizenid
            Wait(200)
            cb(exports['qb-inventory']:LoadInventory(src, cid))
        elseif Config.Inventory == 'ox' then 
            cb(exports.ox_inventory:GetInventoryItems(src, nil)) 
        elseif Config.Inventory == 'qs' then
            cb(exports['qs-inventory']:GetInventory(src))
        end
    end)
end)

function GiveItem(src, item, amount, info)
    if Config.Inventory == 'qb' or Config.Inventory == 'ps' then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem(item, amount, false, info)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
    elseif Config.Inventory == 'ox' then
        exports.ox_inventory:AddItem(src, item, amount, info)
    elseif Config.Inventory == 'qs' then
        exports['qs-inventory']:AddItem(src, item, amount, nil, info)
    elseif Config.Inventory == 'codem' then
        exports['codem-inventory']:AddItem(src, item, amount, nil, info)
    end
end

function GiveItemFromModel(src, model, amount, info, type)
    local item = nil
    if type == 'pots' then
        for k, v in pairs(Config.Pots) do
            if v.model == model then
                item = k
            end
        end
    elseif type == 'lights' then
        for k, v in pairs(Config.Lights) do
            if v.model == model then
                item = k
            end
        end
    elseif type == 'tools' then
        for k, v in pairs(Config.Tools) do
            if v.model == model then
                item = k
            end
        end
    end
    if item ~= nil then
        if Config.Inventory == 'qb' or Config.Inventory == 'ps' then
            local Player = QBCore.Functions.GetPlayer(src)
            Player.Functions.AddItem(item, amount, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
        elseif Config.Inventory == 'ox' then
            exports.ox_inventory:AddItem(src, item, amount, info)
        elseif Config.Inventory == 'qs' then
            exports['qs-inventory']:AddItem(src, item, amount, nil, info)
        elseif Config.Inventory == 'codem' then
            exports['codem-inventory']:AddItem(src, item, amount, nil, info)
        end
    end
end

function RemoveItem(src, item, amount, slot)
    if Config.Inventory == 'qb' or Config.Inventory == 'ps' then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveItem(item, amount, slot)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
    elseif Config.Inventory == 'ox' then
        exports.ox_inventory:RemoveItem(src, item, amount, nil, slot)
    elseif Config.Inventory == 'qs' then
        exports['qs-inventory']:RemoveItem(src, item, amount, slot, nil)
    elseif Config.Inventory == 'codem' then
        exports['codem-inventory']:RemoveItem(src, item, amount, slot)
    end
end


RegisterNetEvent('zat-farming:server:additem', function(item, amount, info)
    local src = source
    if Config.Inventory == 'qb' or Config.Inventory == 'ps' then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem(item, amount, false, info)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
    elseif Config.Inventory == 'ox' then
        exports.ox_inventory:AddItem(src, item, amount, info)
    elseif Config.Inventory == 'qs' then
        exports['qs-inventory']:AddItem(src, item, amount, nil, info)
    elseif Config.Inventory == 'codem' then
        exports['codem-inventory']:AddItem(src, item, amount, nil, info)
    end
end)
RegisterNetEvent('zat-farming:server:removeitem', function(item, amount, slot)
    local src = source
    if Config.Inventory == 'qb' or Config.Inventory == 'ps' then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveItem(item, amount, slot)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
    elseif Config.Inventory == 'ox' then
        exports.ox_inventory:RemoveItem(src, item, amount, nil, slot)
    elseif Config.Inventory == 'qs' then
        exports['qs-inventory']:RemoveItem(src, item, amount, slot, nil)
    elseif Config.Inventory == 'codem' then
        exports['codem-inventory']:RemoveItem(src, item, amount, slot)
    end
end)


