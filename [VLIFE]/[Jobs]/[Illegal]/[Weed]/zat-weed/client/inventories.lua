local QBCore = nil

Citizen.CreateThread(function() 
    if Config.Framework == "qb" then
        QBCore = exports[Config.FrameworkPseudo]:GetCoreObject()
    end
end)

RegisterNetEvent("zat-weed:client:OpenWeedTable", function(data)
    local id = GetModelIdFromEntity(data.entity)
    if Config.Inventory == "qb" or Config.Inventory == "ps" or Config.Inventory == "ak47" then
        if Config.UseNew then
            TriggerServerEvent('zat-weed:server:openinventory', "WeedStorage_"..id, 300000, data.slots)
        else
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "WeedStorage_"..id, {
                maxweight = 300000,
                slots = data.slots,
            })
            TriggerEvent("inventory:client:SetCurrentStash", "WeedStorage_"..id)
        end
    elseif Config.Inventory == "ox" then
        if exports.ox_inventory:openInventory('stash', "WeedStorage_" .. id) == false then
            TriggerServerEvent("zat-weed:server:CreateStash", "WeedStorage_" .. id, "WeedStorage_".. id, data.slots, 300000, false, false, false)
            exports.ox_inventory:openInventory('stash', "WeedStorage_" .. id)
        end
    elseif Config.Inventory == 'origen' then
        TriggerServerEvent('zat-weed:server:RegisterStashOrigen', "WeedStorage_" .. id, data.slots, 300000)
    elseif Config.Inventory == "qs" then
        exports['qs-inventory']:RegisterStash("WeedStorage_" .. id, data.slots, 300000) 
    elseif Config.Inventory == "ak47" then
        TriggerServerEvent('zat-weed:server:CreateInventoryAK47', "WeedStorage_" .. id, data.slots, 300000)
    end
end)

RegisterNetEvent("zat-weed:client:OpenStash", function(data)
    local id = GetModelIdFromEntity(data.entity)
    if Config.Inventory == "qb" or  Config.Inventory == "ps" or Config.Inventory == "ak47" then
        if Config.UseNew then
            TriggerServerEvent('zat-weed:server:openinventory', "RackDryer_"..id, 300000, data.slots)
        else
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "RackDryer_"..id, {
                maxweight = 300000,
                slots = data.slots,
            })
            TriggerEvent("inventory:client:SetCurrentStash", "RackDryer_"..id)
        end
    elseif Config.Inventory == "ox" then
        if exports.ox_inventory:openInventory('stash', "RackDryer_" .. id) == false then
            TriggerServerEvent("zat-weed:server:CreateStash", "RackDryer_" .. id, "RackDryer_"..id, data.slots, 300000, false, false, false)
            exports.ox_inventory:openInventory('stash', "RackDryer_" .. id)
        end
    elseif Config.Inventory == 'origen' then
        TriggerServerEvent('zat-weed:server:RegisterStashOrigen', "RackDryer_" .. id, data.slots, 300000)
    elseif Config.Inventory == "qs" then
        exports['qs-inventory']:RegisterStash("RackDryer_" .. id, data.slots, 300000) 
    elseif Config.Inventory == "ak47" then
        TriggerServerEvent('zat-weed:server:CreateInventoryAK47', "RackDryer_" .. id, data.slots, 300000)
    end
end)

Citizen.CreateThread(function() 
    Locales = GetLocales()
    if Config.Inventory == "ox" then
        exports.ox_inventory:displayMetadata({
            purity    = "Purity",
            genetics  = "Genetics",
            drylevel  = "Dry" 
        })
    end
end)

function HasItem(name)
    if Config.Framework == 'qb' then
        return QBCore.Functions.HasItem(name)
    else
        if Config.Inventory == 'qb' then
            return QBCore.Functions.HasItem(name)
        elseif Config.Inventory == 'ox' then
            local count = exports.ox_inventory:Search('count', name)
            if count <= 0 then
                return false
            else
                return true
            end
        elseif Config.Inventory == 'qs' then
            local count = exports['qs-inventory']:Search(name)
            if count <= 0 then
                return false
            else
                return true
            end
        elseif Config.Inventory == 'ak47' then
            local retval = exports['ak47_inventory']:HasItems({
                name = 1
            })
            return retval
        end
    end
end
