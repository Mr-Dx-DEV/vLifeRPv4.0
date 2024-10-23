local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-whiteboard:changewhiteboard', function(url, room)
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.WBLocations[room] ~= nil and (Config.WBLocations[room].job == false or Player.PlayerData.job.name == Config.WBLocations[room].job) then
        Config.WBLocations[room].currentImage = url
        TriggerClientEvent('qb-whiteboard:changewhiteboardcli', -1, url, room)
    end
end)

QBCore.Functions.CreateCallback('qb-whiteboard:getCurrentImage', function(_, cb)
    local images = {}
    for k,v in pairs(Config.WBLocations) do
        images[k] = v.currentImage
    end
    cb(images)
end)