if Config.Framework == "QBCore" then
    QBCore = exports["qb-core"]:GetCoreObject()
elseif Config.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
end

function GetJob()
    if Config.Framework == "ESX" then
        PlayerJob = ESX.GetPlayerData().job
    else
        QBCore.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
        end)
    end
    return PlayerJob
end