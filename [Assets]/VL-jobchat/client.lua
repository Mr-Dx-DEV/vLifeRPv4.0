local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-jobchat:client:ambulance', function(src, fname, lname, phone, msg)
    PlayerJob = QBCore.Functions.GetPlayerData().job
    onDuty = PlayerJob.onduty
    if onDuty and PlayerJob.name == 'ambulance' then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.3vw;  margin: 0.2vw; background-color: rgba(190, 90, 15, 0.8); border-radius: 4px;"><i style="font-size:15px;color:grey"></i> <b><font color="#ffffff">311 | ({0}) {1} |{2} # {3} : <font color="white">{4}</font></div>',
            args = { src, fname, lname, phone, msg }
        })
    end
end)

RegisterNetEvent('qb-jobchat:client:police', function(src, fname, lname, phone, msg)
    PlayerJob = QBCore.Functions.GetPlayerData().job
    onDuty = PlayerJob.onduty
    if onDuty and PlayerJob.name == 'police' then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.3vw;  margin: 0.2vw; background-color: rgba(150, 40, 15, 0.8); border-radius: 4px;"><i style="font-size:15px;color:grey"></i> <b><font color="#ffffff">911 | Los Santos Police Department | ({0}) -> {1} |{2} # {3} : <font color="white">{4}</font></div>',
            args = { source, fname, lname, phone, msg }
        })
    end
end)