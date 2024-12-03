onlineCops = 0

function isCop()
    local PlayerJob = GetJob()
    for _, name in pairs(Config.PoliceJobs) do
        if PlayerJob.name == name or PlayerJob.type == name then
            return true
        end
    end
    return false
end

RegisterNetEvent("av_runs:sendDispatch", function(vehicle)
    -- Your dispatch event/export goes here:
    -- This example is only for ps-dispatch (make sure to read the docs first)
    dbug("Dispatch triggered")
    if GetResourceState("ps-dispatch") ~= "missing" then
        exports['ps-dispatch']:VehicleShooting(vehicle)
    end
end)

RegisterNetEvent('police:SetCopCount', function(amount) -- This event is triggered from qb-policejob server
    onlineCops = amount
end)

local myBlips = {}
RegisterNetEvent('av_runs:vehBlip', function(coords,name) -- Vehicle blip
    if not isCop() then return end
    if myBlips and myBlips[name] then
        RemoveBlip(myBlips[name])
        myBlips[name] = nil
    end
    myBlips[name] = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(myBlips[name], 225)
    SetBlipScale(myBlips[name], 0.6)
    SetBlipColour(myBlips[name], 1)
    SetBlipAlpha(myBlips[name], 200)
end)

RegisterNetEvent("av_runs:wipeBlip", function(name)
    if myBlips and myBlips[name] then
        RemoveBlip(myBlips[name])
    end
end)