Citizen.CreateThread(function() 
    if Config.Framework == "qb" then
        QBCore = exports[Config.FrameworkPseudo]:GetCoreObject()
    elseif Config.Framework == 'esx' then
        ESX = exports['es_extended']:getSharedObject()
    end
end)

Citizen.CreateThread(function() 
    if Config.Inventory == "qb" or Config.Inventory == "ps" then
        -- POTS
        for k, v in pairs(Config.Pots) do 
            QBCore.Functions.CreateUseableItem(k, function(source, item)
                local src = source
                local Player = QBCore.Functions.GetPlayer(src)
                if Player.Functions.GetItemByName(item.name) ~= nil then
                    TriggerClientEvent("zat-farming:client:UseItem", src, item.name, v.model, 'pots')
                    -- Remove Item
                    Player.Functions.RemoveItem(item.name, 1)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove")
                end
            end)
        end
        -- LAMPS
        for k, v in pairs(Config.Lights) do 
            QBCore.Functions.CreateUseableItem(k, function(source, item)
                local src = source
                local Player = QBCore.Functions.GetPlayer(src)
                if Player.Functions.GetItemByName(item.name) ~= nil then
                    TriggerClientEvent("zat-farming:client:UseItem", src, item.name, v.model, 'lights')
                    -- Remove Item
                    Player.Functions.RemoveItem(item.name, 1)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove")
                end
            end)
        end
        -- TOOLS
        for k, v in pairs(Config.Tools) do 
            QBCore.Functions.CreateUseableItem(k, function(source, item)
                local src = source
                local Player = QBCore.Functions.GetPlayer(src)
                if Player.Functions.GetItemByName(item.name) ~= nil then
                    TriggerClientEvent("zat-farming:client:UseItem", src, item.name, v.model, 'tools')
                    -- Remove Item
                    Player.Functions.RemoveItem(item.name, 1)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove")
                end
            end)
        end  
        -- Water Can
        for k, v in pairs(Config.Items['water']) do 
            QBCore.Functions.CreateUseableItem(v.name, function(source, item)
                local src = source
                local Player = QBCore.Functions.GetPlayer(src)
                if Player.Functions.GetItemByName(item.name) ~= nil then
                    if item.info.water == nil then
                        item.info.water = 0
                    end
                    if item.info.water == 0 then
                        -- Remove Item
                        TriggerClientEvent('zat-farming:client:FillWater', src, item)
                    else
                        NotifyServerFramework(src, _U('farm_alfo'))
                    end
                end
            end)
        end  
        -- Moonshine
        QBCore.Functions.CreateUseableItem(Config.MoonshineItem.pack, function(source, item)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if Player.Functions.GetItemByName(item.name) ~= nil then
                if item.info.purity == nil then
                    item.info.purity = 0
                end
                GiveItem(src, Config.MoonshineItem.name, Config.MoonshineItem.amount, item.info)
                Player.Functions.RemoveItem(item.name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove")
            end
        end)
        QBCore.Functions.CreateUseableItem(Config.MoonshineItem.name, function(source, item)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if Player.Functions.GetItemByName(item.name) ~= nil then
                TriggerClientEvent('zat-farming:client:StartEffect', src, item)
                Player.Functions.RemoveItem(item.name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove")
            end
        end)
    end
end)