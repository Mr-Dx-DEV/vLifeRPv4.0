local QBCore = exports['qb-core']:GetCoreObject()

-------- Bunnyhop
--[[ CreateThread(function()
    while true do
        Wait(100)
        local ped = PlayerPedId()
        if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
            local chance_result = math.random()
            --You can change the chance as you want! Just changed 0.2!
            if chance_result < 0.2 then
                Wait(600)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
                QBCore.Functions.Notify('You are too tired!', 'error', 2500)
                SetPedToRagdoll(ped, 5000, 1, 2)
            else
                Wait(2000)
            end
        end
    end
end)
 ]]
------- Livery Command
RegisterCommand("livery", function(source, args, rawCommand)
    local livery = tonumber(args[1])
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
        
    if PlayerData.job.name == "police" or PlayerData.job.name == "ambulance" or PlayerData.job.name == "bcso" and PlayerData.job.onduty then
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsUsing(ped)
            local liveryCount = GetVehicleLiveryCount(vehicle)
            if liveryCount > 0 then
                if livery <= liveryCount - 1 then 
                    SetVehicleLivery(vehicle, livery)
                    QBCore.Functions.Notify("Vehicle Livery Changed", "success", 5000)
                else
                    QBCore.Functions.Notify("Invalid Livery Number", "error", 5000)
                end
            else
                QBCore.Functions.Notify("This Vehicle Has No Liveries", "error", 5000)
            end
        else
            QBCore.Functions.Notify("You Must Be In A Vehicle To Change Liveries", "error", 5000)
        end
    else
        QBCore.Functions.Notify("This Command Is For Emergency Services", "error", 5000)
    end
end)

--- Boat Anchor

RegisterNetEvent('boat:client:anchor', function()
    local currVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    if currVeh ~= 0 then
        local vehModel = GetEntityModel(currVeh)
        if vehModel ~= nil and vehModel ~= 0 then
            if DoesEntityExist(currVeh) then
                if IsThisModelABoat(vehModel) or IsThisModelAJetski(vehModel) or IsThisModelAnAmphibiousCar(vehModel) or IsThisModelAnAmphibiousQuadbike(vehModel) then
                    if IsBoatAnchoredAndFrozen(currVeh) then
						QBCore.Functions.Notify('Retrieving Anchor', 'success')
                        Wait(9000)
						QBCore.Functions.Notify('Anchor Disabled', 'primary')
                        SetBoatAnchor(currVeh, false)
                        SetBoatFrozenWhenAnchored(currVeh, false)
                        SetForcedBoatLocationWhenAnchored(currVeh, false)
                    elseif not IsBoatAnchoredAndFrozen(currVeh) and CanAnchorBoatHere(currVeh) and GetEntitySpeed(currVeh) < 3 then
                        SetEntityAsMissionEntity(currVeh,false,true)
						QBCore.Functions.Notify('Dropping Anchor', 'primary')
                        Wait(5000)
						QBCore.Functions.Notify('Anchor Enabled', 'success')
                        SetBoatAnchor(currVeh, true)
                        SetBoatFrozenWhenAnchored(currVeh, true)
                        SetForcedBoatLocationWhenAnchored(currVeh, true)
                    end
                end
            end
        end
    end
end)


---- Emergency Vehicle Kick ----

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local ped = GetPlayerPed(-1)
        PlayerData = QBCore.Functions.GetPlayerData()
        
        if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
            if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' then
               
                TaskLeaveVehicle(ped,vehicle,0)
                QBCore.Functions.Notify("You are not allowed to drive this vehicle.", "error")
            end
	end
   end
end)
