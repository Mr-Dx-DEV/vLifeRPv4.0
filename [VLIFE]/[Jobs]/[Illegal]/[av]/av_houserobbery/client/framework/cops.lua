copsOnline = 0

RegisterNetEvent('police:SetCopCount', function(count)
    copsOnline = count
end)

function IsCop()
    local myJob = GetJob().name
    return Config.PoliceJobName[myJob]
end

function callCops()
    -- Your dispatch event/export goes here:

end