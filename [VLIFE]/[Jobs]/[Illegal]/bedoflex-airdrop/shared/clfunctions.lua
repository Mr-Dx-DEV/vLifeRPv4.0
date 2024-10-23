bedoflex.ClientCallbacks = {}

bedoflex.GetCore = function()
    local Core = nil
    if bedoflex.Framework == "oldqb" then
        while Core == nil do
            TriggerEvent("QBCore:GetObject", function(obj) Core = obj end)    
            Wait(200)
        end
    elseif bedoflex.Framework == "qb" then
        while Core == nil do
            Core = exports['qb-core']:GetCoreObject()
            Wait(200)
        end
    elseif bedoflex.Framework == "esx" then
        while Core == nil do
            TriggerEvent('esx:getSharedObject', function(obj) Core = obj end)
		    Wait(200)
        end
    elseif bedoflex.Framework == "newesx" then
        while Core == nil do
            Core = exports['es_extended']:getSharedObject()
            Wait(200)
        end
    else
        CreateThread(function()
            while true do
                print("^1[bedoflex-airdrop]^0 Framework not selected corretly.")
                Wait(5000)
            end
        end)
        return nil
    end
    return Core
end

bedoflex.CreateClientCallback = function(name, cb)
    bedoflex.ClientCallbacks[name] = cb
end

bedoflex.CheckJobType = function(jobType)
    local state = false
    for k, alowedJobType in pairs(bedoflex.IgnoredJobTypes) do
        if alowedJobType == jobType then
            state = true
            break
        end
    end
    return state
end
bedoflex.Notify = function(message, type) -- types -> error | info | success
    if bedoflex.Framework == "qb" or bedoflex.Framework == "oldqb" then
        TriggerEvent("QBCore:Notify", message, type)
    elseif bedoflex.Framework == "esx" or bedoflex.Framework == "newesx" then
        TriggerEvent('esx:showNotification', message, type, 5000)
    end
end
bedoflex.CheckJobName = function(jobName)
    local state = false
    for k, allowedJobName in pairs(bedoflex.IgnoredJobNames) do
        if allowedJobName == jobName then
            state = true
            break
        end
    end
    return state
end

bedoflex.ReviveFunction = function() -- clside
    if bedoflex.Framework == "qb" or bedoflex.Framework == "oldqb" then
        TriggerEvent("hospital:client:Revive")
    elseif bedoflex.Framework == "esx" or bedoflex.Framework == "newesx" then
        TriggerEvent("esx_ambulancejob:revive")
    end
end

bedoflex.CanOpenCrate = function(Core)
    if bedoflex.Framework == "qb" or bedoflex.Framework == "oldqb" then
        local pData = Core.Functions.GetPlayerData() 
        if not pData.metadata.isdead and not pData.metadata.inlaststand and not pData.metadata.kelepce and not pData.metadata.pkelepce then
            return true
        else
            return false
        end
    elseif bedoflex.Framework == "esx" or bedoflex.Framework == "newesx" then
        if not isDeadESX then
            return true
        else
            return false
        end
    end
end

bedoflex.IsAllowed = function(jobData)
    local Allowed = true
    if bedoflex.JobTypeCheck then
        if bedoflex.Framework == "qb" then
            if bedoflex.CheckJobType(jobData.type) then
                Allowed = false
            end
        else
            print("^1[bedoflex-airdrop] ^0Selected framework doesn't support job types.")
        end
    end
    if bedoflex.JobNameCheck then
        if bedoflex.CheckJobName(jobData.name) then
            Allowed = false
        end
    end
    if not bedoflex.JobNameCheck and not bedoflex.JobTypeCheck then
        Allowed = true
    end
    print("isallowed", Allowed)
    return Allowed
end

bedoflex.Progressbar = function(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    if GetResourceState('progressbar') ~= 'started' then 
        CreateThread(function()
            while true do
                print('^1[bedoflex-airdrop]^0 Progressbar needs to be started in order for bedoflex.Progressbar to work') 
                Wait(5000)
            end
        end)
        return
    end
    exports['progressbar']:Progress({
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
    }, function(cancelled)
        if not cancelled then
            if onFinish then
                onFinish()
            end
        else
            if onCancel then
                onCancel()
            end
        end
    end)
end