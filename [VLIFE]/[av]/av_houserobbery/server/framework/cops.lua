CreateThread(function()
    while Config.Framework == "ESX" do
        Wait(5 * 60 * 1000) -- Check cops every 5 minutes
        local cops = 0
        for k, v in pairs(Config.PoliceJobName) do
            local xPlayers = ESX.GetExtendedPlayers('job', k)
            cops += #xPlayers
        end
        TriggerClientEvent('police:SetCopCount',-1,cops)
    end
end)