-- local LsToCayo = {
	-- spawn = {x=-1625.5147705078,y=-3098.7373046875,z=13.944752693176,h=0.0},
	-- runaway1 = {x=-1573.2882080078,y=-3006.8564453125,z=13.988744735718},
	-- runaway2 = {x=-1478.9229736328,y=-3061.1530761719,z=13.945302963257},
	-- runaway3 = {x=-1102.6927490234,y=-3278.5666503906,z=13.969525337219},
	
	-- waitingZone = {x=6894.5751953125,y=-3078.2177734375,z=500.9924926758},
	
	-- coords1 = {x=5639.75390625,y=-4067.2653808594,z=209.5955657959},
	
	-- prepiste = {x=4652.326171875,y=-4434.9467773438,z=48.496124267578},
	-- ralenti1 = {x=4392.8046875,y=-4531.3842773438,z=14.1824145317078},

	-- startPiste = {x=4265.1352539062,y=-4577.9541015625,z=4.1786708831787},
	-- endPiste = {x=4024.3188476562,y=-4666.203125,z=4.1806936264038},
	
	-- postpos= {x=3443.3332519531,y=-4875.0,z=324.49307250977},
	-- planeModel = "nimbus",
	-- seatpos = 6,
	-- seatfree = 7
-- }

function DisplayHelpText(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function loadPedAndPlane(plane,pilot)
	print("loadPedAndPlane")
	RequestModel(GetHashKey(plane))
	cpt = 0 
	timeout = true
    while not HasModelLoaded(GetHashKey(plane)) and timeout do
        Wait(1000)
		RequestModel(GetHashKey(plane))
		cpt = cpt + 1
		if cpt > 50 then timeout = false end
    end
	
	print("cuban800 loaded")
	
	RequestModel(GetHashKey(pilot))
	cpt = 0 
	timeout = true
    while not HasModelLoaded(GetHashKey(pilot)) and timeout do
        Wait(1000)
		RequestModel(GetHashKey(pilot))
		cpt = cpt + 1
		if cpt > 50 then timeout = false end
    end
	print("pilot loaded")
end

--parachute color -1 13
function givePrachute() 
	GiveWeaponToPed(PlayerPedId(), GetHashKey("GADGET_PARACHUTE"), 1, false, true)
	SetPedParachuteTintIndex(PlayerPedId(), math.random(0,7))
	
	SetPlayerHasReserveParachute(PlayerId())
	SetPedReserveParachuteTintIndex(math.random(0,7))
	
	SetPlayerCanLeaveParachuteSmokeTrail(PlayerId(), true)
	
	color = {}
	color.r = math.random(0,255)
	color.g = math.random(0,255)
	color.b = math.random(0,255)
	
	-- print("1-smoke color : "..tostring(color.r).." "..tostring(color.g).." "..tostring(color.b))
	
	SetPlayerParachuteSmokeTrailColor(PlayerId(),color.r,color.g,color.b)
end




function givePrachuteTest() 
	GiveWeaponToPed(PlayerPedId(), GetHashKey("GADGET_PARACHUTE"), 1, false, true)
	SetPedParachuteTintIndex(PlayerPedId(), math.random(0,7))
	
	SetPlayerHasReserveParachute(PlayerId())
	SetPedReserveParachuteTintIndex(math.random(0,7))
	
	SetPlayerCanLeaveParachuteSmokeTrail(PlayerId(), true)
	
	color = {}
	color.r = math.random(0,255)
	color.g = math.random(0,255)
	color.b = math.random(0,255)
	
	-- print("1-smoke color : "..tostring(color.r).." "..tostring(color.g).." "..tostring(color.b))
	
	SetPlayerParachuteSmokeTrailColor(PlayerId(),color.r,color.g,color.b)
	
end



-- RegisterCommand("chute", function(source, args, fullCommand)
	-- givePrachuteTest()
	-- Wait(1000)
	-- ForcePedToOpenParachute(PlayerPedId())
-- end, false)

RegisterNetEvent("Patachute:Jump")
AddEventHandler('Patachute:Jump', function(planeId,pilotId)
	print("received forced jump")
	local plane = NetworkGetEntityFromNetworkId(planeId)
	local pilot = NetworkGetEntityFromNetworkId(pilotId)
	
	
	
	if IsPedInVehicle(PlayerPedId(),plane) then
		SetAmbientVoiceName(pilot, "BRAD")
		PlayAmbientSpeech1(pilot, "GET_OUT_OF_HERE", "SPEECH_PARAMS_FORCE_NORMAL")
			
		TriggerEvent("Patachute:PnjTalk","Pilot: I dont have all the night, now get off !",500)
		
		
		
	end
	Wait(1000)
	if IsPedInAnyPlane(PlayerPedId()) then
		print("error on plane so force jump 2")
		TaskLeaveVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(),false), 4160)
	end
end)

RegisterNetEvent("Patachute:Allowed")
AddEventHandler('Patachute:Allowed', function(planeId,pilotId)
	print("received Allowed")
	local plane = NetworkGetEntityFromNetworkId(planeId)
	local pilot = NetworkGetEntityFromNetworkId(pilotId)
	if IsPedInVehicle(PlayerPedId(),plane) then
		SetAmbientVoiceName(pilot, "BRAD")
		PlayAmbientSpeech1(pilot, "GET_OUT_OF_HERE", "SPEECH_PARAMS_FORCE_NORMAL")
		TriggerEvent("Patachute:PnjTalk","Pilot: All is clear now, you can jump !",500)
	end
end)


RegisterNetEvent("Patachute:CreatePlane")
AddEventHandler('Patachute:CreatePlane', function(loc)
	local d = airport[loc]
	-- DoScreenFadeOut(50)
	-- while not IsScreenFadedOut() do
		-- Citizen.Wait(0)
	-- end
	loadPedAndPlane(d.planeModel,d.pilotModel)
	
	local plane = CreateVehicle(GetHashKey(d.planeModel),d.spawn.x,d.spawn.y,d.spawn.z,d.spawn.h,true,true)
	local pilot = CreatePedInsideVehicle(plane,5,GetHashKey(d.pilotModel),-1,true,true)
	SetEntityInvincible(pilot,true)
	SetEntityInvincible(plane,true)
	
	SetEntityAsMissionEntity(plane,true,true)
	SetVehicleEngineOn(plane, true, true, true)
	SetEntityProofs(plane, true, true, true, true, true, true, true, false)
	SetVehicleHasBeenOwnedByPlayer(plane, true)
	SetBlockingOfNonTemporaryEvents(pilot, true)
		
		
	SetVehicleDoorsLockedForAllPlayers(plane,true)
	SetVehicleDoorsLocked(plane, 2)
	SetVehicleDoorsLocked(plane, 4)
		
	Wait(100)	
	local totSeat = GetVehicleNumberOfPassengers(plane)
	-- retval --[[ integer ]] =
	totSeat = GetVehicleModelNumberOfSeats(GetHashKey(d.planeModel))
		-- modelHash --[[ Hash ]]
	-- ))
	local freeSeat = -5
	for i = -1,totSeat-2 do
		print("i:"..tostring(i).."/"..tostring(totSeat))
		local ped = GetPedInVehicleSeat(plane,i)
		if ped == 0 then freeSeat = i break end
		
	end
	
	if freeSeat ~= -5 then
		SetPedIntoVehicle(PlayerPedId(),plane,freeSeat)
		print("set in seat")
	else
		print("no free seat")
		TriggerEvent("Patachute:PnjTalk","Parachutise: Sorry their no free seat for this flight.",500)
	end
	print("plane : "..tostring(plane).." nid: "..tostring(NetworkGetNetworkIdFromEntity(plane)).." ped: "..tostring(pilot).." nid: "..tostring(NetworkGetNetworkIdFromEntity(pilot)))
	TriggerServerEvent("Patachute:SendPlaneAndPed",loc,NetworkGetNetworkIdFromEntity(plane),NetworkGetNetworkIdFromEntity(pilot))
	
	TriggerEvent("Patachute:PnjTalk","Pilot: Hi ! We will take off soon, we are just waiting the Go from the air traffic control",500)
	
	-- SetVehicleDoorsLockedForAllPlayers(plane,true)
		
end)

RegisterNetEvent("Patachute:PnjTalk")
AddEventHandler('Patachute:PnjTalk', function(text,timew)

	
	PnjTalk(text,timew)
end)

RegisterNetEvent("Patachute:launchPlane")
AddEventHandler('Patachute:launchPlane', function(loc,planeId,pilotId)
	local d = airport[loc]
	local plane = NetworkGetEntityFromNetworkId(planeId)
	local pilot = NetworkGetEntityFromNetworkId(pilotId)
	print("launchPlane")
	
	givePrachute()
	if NetworkHasControlOfEntity(plane) then
		print("start step 1")
		TaskVehicleDriveToCoord(pilot, plane, d.runaway1.x, d.runaway1.y, d.runaway1.z, 5.0, 0, GetEntityModel(plane), 786603, 2.0)
		local runAway1Achieved = false
		while not runAway1Achieved and NetworkHasControlOfEntity(plane) do
			Wait(250)
			-- print("Vdist1 : "..tostring(Vdist(GetEntityCoords(plane),vector3(d.runaway1.x, d.runaway1.y, d.runaway1.z))))
			if Vdist(GetEntityCoords(plane),vector3(d.runaway1.x, d.runaway1.y, d.runaway1.z)) < 10.0 then
				runAway1Achieved = true
			end
		end
		print("RunAway1 done")
		TriggerServerEvent("Patachute:SendState",loc,1)
	end
	
	if NetworkHasControlOfEntity(plane) then
		print("start step 2")
		TaskVehicleDriveToCoord(pilot, plane, d.runaway2.x, d.runaway2.y, d.runaway2.z, 5.0, 0, GetEntityModel(plane), 786603, 2.0)
		local runAway2Achieved = false
		while not runAway2Achieved and NetworkHasControlOfEntity(plane) do
			Wait(250)
			-- print("Vdist1 : "..tostring(Vdist(GetEntityCoords(plane),vector3(d.runaway2.x, d.runaway2.y, d.runaway2.z))))
			if Vdist(GetEntityCoords(plane),vector3(d.runaway2.x, d.runaway2.y, d.runaway2.z)) < 10.0 then
				runAway2Achieved = true
			end
		end
		print("RunAway2 done")
		TriggerServerEvent("Patachute:SendState",loc,2)
	end
	
	if NetworkHasControlOfEntity(plane) then
		print("start step 3")
		TaskVehicleDriveToCoord(pilot, plane, d.runaway3.x, d.runaway3.y, d.runaway3.z, 8.0, 0, GetEntityModel(plane), 786603, 2.0)
		local runAway3Achieved = false
		local cptVitesse = 0 
		while not runAway3Achieved and NetworkHasControlOfEntity(plane) do
			
			cptVitesse = cptVitesse + 1
			TaskVehicleDriveToCoord(pilot, plane, d.runaway3.x, d.runaway3.y, d.runaway3.z, 9.0+cptVitesse, 0, GetEntityModel(plane), 786603, 2.0)
			Wait(750)
			-- print("Vdist1 : "..tostring(Vdist(GetEntityCoords(plane),vector3(d.runaway3.x, d.runaway3.y, d.runaway3.z))).." speed: "..tostring(9.0+cptVitesse))
			if Vdist(GetEntityCoords(plane),vector3(d.runaway3.x, d.runaway3.y, d.runaway3.z)) < 35.0 then
				runAway3Achieved = true
			end
		end
		print("RunAway3 done")
		TriggerServerEvent("Patachute:SendState",loc,3)
		ControlLandingGear(plane,1)
	end
	
	
	if NetworkHasControlOfEntity(plane) then
		print("start step 4")
		TaskPlaneMission(pilot, plane, 0, 0, d.post.x, d.post.y, d.post.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.post.h,2500.0,150.0)
		-- TaskPlaneMission(pilot, plane, d.post.x, d.post.y, d.post.z, 8.0, 0, GetEntityModel(plane), 786603, 2.0)
		local postAchieved = false
		local cptVitesse = 0 
		while not postAchieved and NetworkHasControlOfEntity(plane) do
			
			cptVitesse = cptVitesse + 3
			TaskPlaneMission(pilot, plane, 0, 0, d.post.x, d.post.y, d.post.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.post.h,2500.0,150.0)
			-- TaskPlaneMission(pilot, plane, d.post.x, d.post.y, d.post.z, 9.0+cptVitesse, 0, GetEntityModel(plane), 786603, 2.0)
			Wait(750)
			-- print("Vdist1 : "..tostring(Vdist(GetEntityCoords(plane),vector3(d.runaway3.x, d.runaway3.y, d.runaway3.z))).." speed: "..tostring(9.0+cptVitesse))
			if Vdist(GetEntityCoords(plane),vector3(d.post.x, d.post.y, d.post.z)) < 50.0 then
				postAchieved = true
			end
		end
		print("postAchieved done")
		TriggerServerEvent("Patachute:SendState",loc,4)
	end
	
	if NetworkHasControlOfEntity(plane) then
		print("start step 5")
		TaskPlaneMission(pilot, plane, 0, 0, d.predrop.x, d.predrop.y, d.predrop.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.predrop.h,2500.0,150.0)
		-- TaskPlaneMission(pilot, plane, d.post.x, d.post.y, d.post.z, 8.0, 0, GetEntityModel(plane), 786603, 2.0)
		local predropAchieved = false
		local cptVitesse = 0 
		while not predropAchieved and NetworkHasControlOfEntity(plane) do
			
			cptVitesse = cptVitesse + 3
			TaskPlaneMission(pilot, plane, 0, 0, d.predrop.x, d.predrop.y, d.predrop.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.predrop.h,2500.0,150.0)
			-- TaskPlaneMission(pilot, plane, d.post.x, d.post.y, d.post.z, 9.0+cptVitesse, 0, GetEntityModel(plane), 786603, 2.0)
			Wait(750)
			-- print("Vdist1 : "..tostring(Vdist(GetEntityCoords(plane),vector3(d.runaway3.x, d.runaway3.y, d.runaway3.z))).." speed: "..tostring(9.0+cptVitesse))
			if Vdist(GetEntityCoords(plane),vector3(d.predrop.x, d.predrop.y, d.predrop.z)) < 50.0 then
				predropAchieved = true
			end
		end
		print("predropAchieved done")
		TriggerServerEvent("Patachute:SendState",loc,5)
	end
	
	
	if NetworkHasControlOfEntity(plane) then
		print("start step 6")
		TaskPlaneMission(pilot, plane, 0, 0, d.drop1.x, d.drop1.y, d.drop1.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.drop1.h,2500.0,150.0)
		-- TaskPlaneMission(pilot, plane, d.drop1.x, d.drop1.y, d.drop1.z, 8.0, 0, GetEntityModel(plane), 786603, 2.0)
		local drop1Achieved = false
		local cptVitesse = 0 
		while not drop1Achieved and NetworkHasControlOfEntity(plane) do
			
			cptVitesse = cptVitesse + 3
			TaskPlaneMission(pilot, plane, 0, 0, d.drop1.x, d.drop1.y, d.drop1.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.drop1.h,2500.0,150.0)
			-- TaskPlaneMission(pilot, plane, d.drop1.x, d.drop1.y, d.drop1.z, 9.0+cptVitesse, 0, GetEntityModel(plane), 786603, 2.0)
			Wait(750)
			-- print("Vdist1 : "..tostring(Vdist(GetEntityCoords(plane),vector3(d.runaway3.x, d.runaway3.y, d.runaway3.z))).." speed: "..tostring(9.0+cptVitesse))
			if Vdist(GetEntityCoords(plane),vector3(d.drop1.x, d.drop1.y, d.drop1.z)) < 50.0 then
				drop1Achieved = true
			end
		end
		print("drop1Achieved done")
		TriggerServerEvent("Patachute:SendState",loc,6)
		TriggerServerEvent("Patachute:JumpAllowed",loc,NetworkGetNetworkIdFromEntity(plane),NetworkGetNetworkIdFromEntity(pilot))
		SetVehicleDoorsLockedForAllPlayers(plane,false)
		SetVehicleDoorsLocked(plane, 0)
	end
	-- ClearPedTasks(pilot)
	if NetworkHasControlOfEntity(plane) then
		print("start step 7")
		TaskPlaneMission(pilot, plane, 0, 0, d.drop2.x, d.drop2.y, d.drop2.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.drop2.h,1000.0,150.0)
		-- TaskPlaneMission(pilot, plane, d.drop1.x, d.drop1.y, d.drop1.z, 8.0, 0, GetEntityModel(plane), 786603, 2.0)
		local drop2Achieved = false
		local cptVitesse = 0 
		while not drop2Achieved and NetworkHasControlOfEntity(plane) do
			
			cptVitesse = cptVitesse + 3
			TaskPlaneMission(pilot, plane, 0, 0, d.drop2.x, d.drop2.y, d.drop2.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.drop2.h,1000.0,150.0)
			-- TaskPlaneMission(pilot, plane, d.drop1.x, d.drop1.y, d.drop1.z, 9.0+cptVitesse, 0, GetEntityModel(plane), 786603, 2.0)
			Wait(750)
			-- print("Vdist1 : "..tostring(Vdist(GetEntityCoords(plane),vector3(d.runaway3.x, d.runaway3.y, d.runaway3.z))).." speed: "..tostring(9.0+cptVitesse))
			if Vdist(GetEntityCoords(plane),vector3(d.drop2.x, d.drop2.y, d.drop2.z)) < 50.0 then
				drop2Achieved = true
			end
		end
		print("drop2Achieved done")
		TriggerServerEvent("Patachute:SendState",loc,7)
		TriggerServerEvent("Patachute:ForcedJump",loc,NetworkGetNetworkIdFromEntity(plane),NetworkGetNetworkIdFromEntity(pilot))
	end
	
	if NetworkHasControlOfEntity(plane) then
		TriggerServerEvent("Patachute:FinalState",loc,NetworkGetNetworkIdFromEntity(plane),NetworkGetNetworkIdFromEntity(pilot))
		print("start step 8")
		TaskPlaneMission(pilot, plane, 0, 0, d.exitcoors.x, d.exitcoors.y, d.exitcoors.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.exitcoors.h,1000.0,150.0)
		-- TaskPlaneMission(pilot, plane, d.drop1.x, d.drop1.y, d.drop1.z, 8.0, 0, GetEntityModel(plane), 786603, 2.0)
		local exitcoorsAchieved = false
		local cptVitesse = 0 
		while not exitcoorsAchieved and NetworkHasControlOfEntity(plane) do
			
			cptVitesse = cptVitesse + 3
			TaskPlaneMission(pilot, plane, 0, 0, d.exitcoors.x, d.exitcoors.y, d.exitcoors.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.exitcoors.h,1000.0,150.0)
			-- TaskPlaneMission(pilot, plane, d.drop1.x, d.drop1.y, d.drop1.z, 9.0+cptVitesse, 0, GetEntityModel(plane), 786603, 2.0)
			Wait(750)
			-- print("Vdist1 : "..tostring(Vdist(GetEntityCoords(plane),vector3(d.runaway3.x, d.runaway3.y, d.runaway3.z))).." speed: "..tostring(9.0+cptVitesse))
			if Vdist(GetEntityCoords(plane),vector3(d.exitcoors.x, d.exitcoors.y, d.exitcoors.z)) < 50.0 then
				exitcoorsAchieved = true
			end
		end
		print("exitcoorsAchieved done")
		
	end
end)





RegisterNetEvent("Patachute:takeControlOfPlane")
AddEventHandler('Patachute:takeControlOfPlane', function(loc,step,planeId,pilotId)
	local d = airport[loc]
	local plane = NetworkGetEntityFromNetworkId(planeId)
	local pilot = NetworkGetEntityFromNetworkId(pilotId)
	print("takeControlOfPlane")
	
	if step < 1 and NetworkHasControlOfEntity(plane) then
		print("start step 1")
		TaskVehicleDriveToCoord(pilot, plane, d.runaway1.x, d.runaway1.y, d.runaway1.z, 5.0, 0, GetEntityModel(plane), 786603, 2.0)
		local runAway1Achieved = false
		while not runAway1Achieved and NetworkHasControlOfEntity(plane) do
			Wait(250)
			-- print("Vdist1 : "..tostring(Vdist(GetEntityCoords(plane),vector3(d.runaway1.x, d.runaway1.y, d.runaway1.z))))
			if Vdist(GetEntityCoords(plane),vector3(d.runaway1.x, d.runaway1.y, d.runaway1.z)) < 10.0 then
				runAway1Achieved = true
			end
		end
		print("RunAway1 done")
		TriggerServerEvent("Patachute:SendState",loc,1)
	end
	
	
	
	if step < 2 and NetworkHasControlOfEntity(plane) then
		print("start step 2")
		TaskVehicleDriveToCoord(pilot, plane, d.runaway2.x, d.runaway2.y, d.runaway2.z, 5.0, 0, GetEntityModel(plane), 786603, 2.0)
		local runAway2Achieved = false
		while not runAway2Achieved and NetworkHasControlOfEntity(plane) do
			Wait(250)
			-- print("Vdist1 : "..tostring(Vdist(GetEntityCoords(plane),vector3(d.runaway2.x, d.runaway2.y, d.runaway2.z))))
			if Vdist(GetEntityCoords(plane),vector3(d.runaway2.x, d.runaway2.y, d.runaway2.z)) < 10.0 then
				runAway2Achieved = true
			end
		end
		print("RunAway2 done")
		TriggerServerEvent("Patachute:SendState",loc,2)
	end
	
	
	
	if step < 3 and NetworkHasControlOfEntity(plane) then
		print("start step 3")
		TaskVehicleDriveToCoord(pilot, plane, d.runaway3.x, d.runaway3.y, d.runaway3.z, 8.0, 0, GetEntityModel(plane), 786603, 2.0)
		local runAway3Achieved = false
		local cptVitesse = 0 
		while not runAway3Achieved and NetworkHasControlOfEntity(plane) do
			
			cptVitesse = cptVitesse + 1
			TaskVehicleDriveToCoord(pilot, plane, d.runaway3.x, d.runaway3.y, d.runaway3.z, 9.0+cptVitesse, 0, GetEntityModel(plane), 786603, 2.0)
			Wait(750)
			-- print("Vdist1 : "..tostring(Vdist(GetEntityCoords(plane),vector3(d.runaway3.x, d.runaway3.y, d.runaway3.z))).." speed: "..tostring(9.0+cptVitesse))
			if Vdist(GetEntityCoords(plane),vector3(d.runaway3.x, d.runaway3.y, d.runaway3.z)) < 35.0 then
				runAway3Achieved = true
			end
		end
		print("RunAway3 done")
		TriggerServerEvent("Patachute:SendState",loc,3)
		ControlLandingGear(plane,1)
	end
	
	
	if step < 4 and NetworkHasControlOfEntity(plane) then
		print("start step 4")
		TaskPlaneMission(pilot, plane, 0, 0, d.post.x, d.post.y, d.post.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.post.h,2500.0,150.0)
		local postAchieved = false
		local cptVitesse = 0 
		while not postAchieved and NetworkHasControlOfEntity(plane) do
			
			cptVitesse = cptVitesse + 3
			TaskPlaneMission(pilot, plane, 0, 0, d.post.x, d.post.y, d.post.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.post.h,2500.0,150.0)
			Wait(750)
			if Vdist(GetEntityCoords(plane),vector3(d.post.x, d.post.y, d.post.z)) < 50.0 then
				postAchieved = true
			end
		end
		print("postAchieved done")
		TriggerServerEvent("Patachute:SendState",loc,4)
	end
	
	
	if step < 5 and NetworkHasControlOfEntity(plane) then
		print("start step 5")
		TaskPlaneMission(pilot, plane, 0, 0, d.predrop.x, d.predrop.y, d.predrop.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.predrop.h,2500.0,150.0)
		local predropAchieved = false
		local cptVitesse = 0 
		while not predropAchieved and NetworkHasControlOfEntity(plane) do
			
			cptVitesse = cptVitesse + 3
			TaskPlaneMission(pilot, plane, 0, 0, d.predrop.x, d.predrop.y, d.predrop.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.predrop.h,2500.0,150.0)
			Wait(750)
			if Vdist(GetEntityCoords(plane),vector3(d.predrop.x, d.predrop.y, d.predrop.z)) < 50.0 then
				predropAchieved = true
			end
		end
		print("predropAchieved done")
		TriggerServerEvent("Patachute:SendState",loc,5)
	end
	
	
	if step < 6 and NetworkHasControlOfEntity(plane) then
		print("start step 6")
		TaskPlaneMission(pilot, plane, 0, 0, d.drop1.x, d.drop1.y, d.drop1.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.drop1.h,2500.0,150.0)
		local drop1Achieved = false
		local cptVitesse = 0 
		while not drop1Achieved and NetworkHasControlOfEntity(plane) do
			
			cptVitesse = cptVitesse + 3
			TaskPlaneMission(pilot, plane, 0, 0, d.drop1.x, d.drop1.y, d.drop1.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.drop1.h,2500.0,150.0)
			Wait(750)
			if Vdist(GetEntityCoords(plane),vector3(d.drop1.x, d.drop1.y, d.drop1.z)) < 50.0 then
				drop1Achieved = true
			end
		end
		print("drop1Achieved done")
		TriggerServerEvent("Patachute:SendState",loc,6)
		TriggerServerEvent("Patachute:JumpAllowed",loc,NetworkGetNetworkIdFromEntity(plane),NetworkGetNetworkIdFromEntity(pilot))
		SetVehicleDoorsLockedForAllPlayers(plane,false)
		SetVehicleDoorsLocked(plane, 0)
	end
	
	
	if step < 7 and NetworkHasControlOfEntity(plane) then
		print("start step 7")
		TaskPlaneMission(pilot, plane, 0, 0, d.drop2.x, d.drop2.y, d.drop2.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.drop2.h,1000.0,150.0)
		local drop2Achieved = false
		local cptVitesse = 0 
		while not drop2Achieved and NetworkHasControlOfEntity(plane) do
			cptVitesse = cptVitesse + 3
			TaskPlaneMission(pilot, plane, 0, 0, d.drop2.x, d.drop2.y, d.drop2.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.drop2.h,1000.0,150.0)
			Wait(750)
			if Vdist(GetEntityCoords(plane),vector3(d.drop2.x, d.drop2.y, d.drop2.z)) < 50.0 then
				drop2Achieved = true
			end
		end
		print("drop2Achieved done")
		TriggerServerEvent("Patachute:SendState",loc,7)
		TriggerServerEvent("Patachute:ForcedJump",loc,NetworkGetNetworkIdFromEntity(plane))
	end
	
	
	if step < 8 and NetworkHasControlOfEntity(plane) then
		TriggerServerEvent("Patachute:FinalState",loc,NetworkGetNetworkIdFromEntity(plane),NetworkGetNetworkIdFromEntity(pilot))
		print("start step 8")
		TaskPlaneMission(pilot, plane, 0, 0, d.exitcoors.x, d.exitcoors.y, d.exitcoors.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.exitcoors.h,1000.0,150.0)
		local exitcoorsAchieved = false
		local cptVitesse = 0 
		while not exitcoorsAchieved and NetworkHasControlOfEntity(plane) do
			cptVitesse = cptVitesse + 3
			TaskPlaneMission(pilot, plane, 0, 0, d.exitcoors.x, d.exitcoors.y, d.exitcoors.z, 6, GetVehicleModelMaxSpeed(GetEntityModel(plane))/2,0,d.exitcoors.h,1000.0,150.0)
			Wait(750)
			if Vdist(GetEntityCoords(plane),vector3(d.exitcoors.x, d.exitcoors.y, d.exitcoors.z)) < 50.0 then
				exitcoorsAchieved = true
			end
		end
		print("exitcoorsAchieved done")
		
	end
end)


RegisterNetEvent("Patachute:GoInPlane")
AddEventHandler('Patachute:GoInPlane', function(loc,planeId,pilotId)
	local d = airport[loc]
	local plane = NetworkGetEntityFromNetworkId(planeId)
	local pilot = NetworkGetEntityFromNetworkId(pilotId)
	print("launchPlane")
	
	
	TriggerEvent("Patachute:PnjTalk","Pilot: Hi ! We will take off soon, we are just waiting the Go from the air traffic control",500)
	local totSeat = GetVehicleNumberOfPassengers(plane)
	
	totSeat = GetVehicleModelNumberOfSeats(GetHashKey(d.planeModel))
	local freeSeat = -5
	for i = -1,totSeat-2 do
		print("i:"..tostring(i).."/"..tostring(totSeat))
		local ped = GetPedInVehicleSeat(plane,i)
		if ped == 0 then freeSeat = i break end
		
	end
	if freeSeat ~= -5 then
		SetPedIntoVehicle(PlayerPedId(),plane,freeSeat)
		givePrachute()
		print("set in seat")
		Wait(1000)
		if not IsPedInVehicle(PlayerPedId(),plane) then
			local freeSeat = -5
			for i = -1,totSeat-2 do
				print("i:"..tostring(i).."/"..tostring(totSeat))
				local ped = GetPedInVehicleSeat(plane,i)
				if ped == 0 then freeSeat = i break end
				SetPedIntoVehicle(PlayerPedId(),plane,freeSeat)
			end
		end
	else
		print("no free seat")
	end
end)

local vendortab = {}
local markerRotate = 0
Citizen.CreateThread(function()
	while true do
		Wait(0)
		for k,v in pairs(airport) do
				local pedcoords = {}
				pedcoords.x,pedcoords.y,pedcoords.z = table.unpack(GetEntityCoords(PlayerPedId()))
				
				if #(vector3(v.vendorCoords.x, v.vendorCoords.y, v.vendorCoords.z) - vector3(pedcoords.x,pedcoords.y,pedcoords.z)) < 100.0 then
					if v.enableVendor == false then
						markerRotate = markerRotate + 1.0
						if markerRotate > 360.0 then markerRotate = 0 end
						DrawMarker(40, v.vendorCoords.x, v.vendorCoords.y,v.vendorCoords.z,0, 0,   0,   0,   0,    0+markerRotate,  2.01, 2.01,    2.01, 50, 250,   50,128, 1, 0, 0,0)
					else
						if not DoesEntityExist(vendortab[k]) then
							RequestModel(GetHashKey(v.vendorModel))
							cpt = 0 
							timeout = true
							while not HasModelLoaded(GetHashKey(v.vendorModel)) and timeout do
								Wait(1000)
								RequestModel(GetHashKey(v.vendorModel))
								cpt = cpt + 1
								if cpt > 50 then timeout = false end
							end
							vendortab[k] = CreatePed(5,GetHashKey(v.vendorModel),v.vendorCoords.x, v.vendorCoords.y, v.vendorCoords.z-1.0,0,false,true)
							GiveWeaponToPed(vendortab[k], GetHashKey("GADGET_PARACHUTE"), 1, false, true)
							SetPedGadget(vendortab[k],GetHashKey("GADGET_PARACHUTE"), true)
							SetEntityInvincible(vendortab[k],true)
							SetBlockingOfNonTemporaryEvents(vendortab[k], true)
							SetEntityHeading(vendortab[k], v.vendorCoords.h)
							FreezeEntityPosition(vendortab[k],true)
							
						end
					end
					
					if #(vector3(v.vendorCoords.x, v.vendorCoords.y, v.vendorCoords.z) - vector3(pedcoords.x,pedcoords.y,pedcoords.z)) < 1.5 then
						DisplayHelpText(trad[Lang].Ask)
						if IsControlJustReleased(1, 51) then
							TriggerServerEvent("Patachute:AskForARide",k)
						end
					end
				else
					DeleteEntity(vendortab[k])
				end
		end
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(airport) do
		local blip = AddBlipForCoord(v.vendorCoords.x, v.vendorCoords.y, v.vendorCoords.z)
		SetBlipSprite(blip, v.blip.id)
		SetBlipColour(blip, v.blip.color)
		SetBlipScale(blip, v.blip.size)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(tostring(v.blip.blipname))
		EndTextCommandSetBlipName(blip)
	end
end)


CurrentOpacity = 150
CurrentTextOpacity = 255

function DrawAdvancedText(x,y,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextScale(sc, sc)
	SetTextJustification(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text) --99 char max
	DrawText(x, y-0.015)
end

function PnjTalk(text,timeaff)
	print("PnjTalk")
	local cpt = 0
	while cpt < timeaff do
		Wait(0)
		cpt = cpt + 1
		-- print("cpt :"..tostring(cpt))
		DrawRect(0.5, 0.92, 0.40, 0.07, 0, 0, 0, CurrentOpacity)
		DrawRect(0.5, 0.965, 0.40, 0.0025, 180, 180, 180, CurrentOpacity)
		if string.len(text) > 99 then
			splittext1 = string.sub(text,0,98)
			splittext2 = string.sub(text,99)
			DrawAdvancedText(0.5, 0.91, 0.4, tostring(splittext1), 255, 255, 255, CurrentTextOpacity, 6, 0)
			DrawAdvancedText(0.5, 0.93, 0.4, tostring(splittext2), 255, 255, 255, CurrentTextOpacity, 6, 0)
		else
			DrawAdvancedText(0.5, 0.92, 0.4, tostring(text), 255, 255, 255, CurrentTextOpacity, 6, 0)
		end
	end
end


--RegisterCommand("bla", function(source, args, fullCommand)
--	print("blabla")
--	 
--	 -- A_M_M_GENERICMALE_01_WHITE_MINI_01 = GET_OUT_OF_THE_CAR
--	Citizen.CreateThread(function()
--		print("a")
--		RequestModel(GetHashKey("a_m_m_skidrow_01"))
--		cpt = 0 
--		timeout = true
--		while not HasModelLoaded(GetHashKey("a_m_m_skidrow_01")) and timeout do
--			Wait(1000)
--			RequestModel(GetHashKey("a_m_m_skidrow_01"))
--			cpt = cpt + 1
--			if cpt > 50 then timeout = false end
--		end
--		
--		print("b")
--		for i=1,300 do
--			local pilot = CreatePed(5,GetHashKey("a_m_m_skidrow_01"),GetEntityCoords(PlayerPedId())+1.0,0,true,true)
--			SetAmbientVoiceName(pilot, "BRAD")
--			PlayAmbientSpeech1(pilot, "GET_OUT_OF_HERE", "SPEECH_PARAMS_FORCE_NORMAL")
--			print("ped")
--			Wait(10)
--			
--		end
--		
--		print("b")
--	end)
--end, false)

-- Citizen.CreateThread(function()
	-- while true do
		-- Wait(0)
		-- for k,v in pairs(airport) do
			-- for k1,v1 in pairs(v) do
				-- if type(v1) == "table" then
					-- if k =="SandyShores" then
					-- DrawMarker(0, v1.x, v1.y,v1.z,0, 0,   0,   0,   0,    0,  50.01,50.01,    50.01, 250, 50,   50,128, 0, 0, 0,0)
					-- else
					-- DrawMarker(0, v1.x, v1.y,v1.z,0, 0,   0,   0,   0,    0,  50.01,50.01,    50.01, 50, 250,   50,128, 0, 0, 0,0)
					-- end
				-- end
			-- end
		-- end
	-- end
-- end)