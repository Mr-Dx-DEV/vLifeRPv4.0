CreateThread(function()
    if Config.Framework == "qb" then
        QBCore = exports['qb-core']:GetCoreObject()
    end
    if Config.Framework == "esx" then
        ESX = exports['es_extended']:getSharedObject()
    end
    if Config.Inventory == "ox_inventory" then
        exports.ox_inventory:displayMetadata("quality", Lang['quality'])
    end
end)
