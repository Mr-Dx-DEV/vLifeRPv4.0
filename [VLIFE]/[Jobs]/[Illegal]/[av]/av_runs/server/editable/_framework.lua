CreateThread(function()
    local boosting = GetResourceState("av_boosting")
    if Config.Framework == "qb" then
        QBCore = exports['qb-core']:GetCoreObject()
        if boosting ~= "started" then
            QBCore.Functions.CreateUseableItem(Config.HackingDevice, function(source, item)
                TriggerClientEvent('av_boosting:trackerMinigame',source)
            end)
        end
    end
    if Config.Framework == "esx" then
        ESX = exports['es_extended']:getSharedObject()
        if boosting ~= "started" then
            ESX.RegisterUsableItem(Config.HackingDevice, function(source, item)
                TriggerClientEvent('av_boosting:trackerMinigame',source)
            end)
        end
    end
end)

AddEventHandler("QBCore:Server:PlayerLoaded", function(Player)
    init(Player.PlayerData.source)
end)

AddEventHandler("esx:onPlayerJoined", function(Player)
    local src = Player
    if not src then src = source end
    init(src)
end)