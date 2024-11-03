


local AllChuteData = {}

RegisterServerEvent('Patachute:AskForARide')
AddEventHandler('Patachute:AskForARide', function(location)
	local dbTXT = ""
	local player = source
	local isFirst = false
	
	
	if AllChuteData[location] == nil then 
		AllChuteData[location] = {} 
		AllChuteData[location]["Players"] = {} 
		AllChuteData[location]["planeId"] = 0
		AllChuteData[location]["pilotId"] = 0
		AllChuteData[location]["step"] = ""
		AllChuteData[location]["owner"] = player
		AllChuteData[location]["full"] = ""
		isFirst = true 
		dbTXT=" first player of the list" 
	end
	
	print("add : "..tostring(player).." to lst: "..tostring(location)..dbTXT)
	AllChuteData[location]["Players"][#AllChuteData[location]["Players"]+1] = player
	if isFirst then
		Citizen.CreateThread(function()
			local localLoc = location
			local localplayer = player
			-- local localLoc = location
			-- local localLoc = location
			AllChuteData[localLoc]["step"] = 0 -- step 0 == lobby
			-- TriggerEvent("Patachute:CheckAlive",localLoc,localplayer)
			Citizen.SetTimeout(WaitingTimeBeforeDeparture, function()
			-- timerFinished[#timerFinished] = true
				print("launch of the plane")
				TriggerClientEvent("Patachute:launchPlane",localplayer,localLoc,AllChuteData[localLoc]["planeId"],AllChuteData[localLoc]["pilotId"])
				
			end)
		end)
		print("create Plane")
		TriggerClientEvent("Patachute:CreatePlane",player,location)
	else
		if AllChuteData[location]["step"] == 0 then
			TriggerClientEvent("Patachute:GoInPlane",player,location,AllChuteData[location]["planeId"],AllChuteData[location]["pilotId"])
		else
			print("pilot déja partie")
			TriggerClientEvent("Patachute:PnjTalk",player,"Sorry the plane have already take off, you have to wait that it return",500)
		end
	end
end)


RegisterServerEvent('Patachute:SendPlaneAndPed')
AddEventHandler('Patachute:SendPlaneAndPed', function(location,planeId,pilotId)
	AllChuteData[location]["planeId"] = planeId
	AllChuteData[location]["pilotId"] = pilotId

end)

RegisterServerEvent('Patachute:ForcedJump')
AddEventHandler('Patachute:ForcedJump', function(location,planeId,pilotId)
	print("ForcedJump for : "..tostring(location))
	for k,v in pairs(AllChuteData[location]["Players"]) do
		print("send to : "..tostring(v))
		TriggerClientEvent("Patachute:Jump",v,planeId,pilotId)
	end
end)

RegisterServerEvent('Patachute:JumpAllowed')
AddEventHandler('Patachute:JumpAllowed', function(location,planeId,pilotId)
	print("msg allowed send for : "..tostring(location))
	for k,v in pairs(AllChuteData[location]["Players"]) do
		print("send to : "..tostring(v))
		TriggerClientEvent("Patachute:Allowed",v,planeId,pilotId)
	end
end)

-- RegisterServerEvent('Patachute:CheckAlive')
-- AddEventHandler('Patachute:CheckAlive', function(location,owner)
	-- Citizen.CreateThread(function()
		-- local localLoc = location
		-- local localplayer = owner
		-- planeId = AllChuteData[localLoc]["planeId"]
		-- pilotId = AllChuteData[localLoc]["pilotId"]
	-- end)
-- end)

RegisterServerEvent('Patachute:FinalState')
AddEventHandler('Patachute:FinalState', function(location,planeId,pilotId)
	local plane = NetworkGetEntityFromNetworkId(planeId)
	local pilot = NetworkGetEntityFromNetworkId(pilotId)
	Citizen.SetTimeout(10000, function()
		DeleteEntity(plane)
		DeleteEntity(pilot)
	end)
	AllChuteData[location]=nil
end)

RegisterServerEvent('Patachute:SendState')
AddEventHandler('Patachute:SendState', function(location,state)
	-- Citizen.CreateThread(function()
	-- local localLoc = location
	-- local localplayer = owner
	AllChuteData[location].step = state
	-- end)
end)

Citizen.CreateThread(function()
	while true do
		Wait(1000)
		for k,v in pairs(AllChuteData) do
		
			-- print("Session active : "..tostring(k).." owner: "..tostring(v.owner).." entityOwner: "..tostring(NetworkGetEntityOwner(NetworkGetEntityFromNetworkId(v.planeId))))
			
			if v.owner ~= NetworkGetEntityOwner(NetworkGetEntityFromNetworkId(v.planeId)) and NetworkGetEntityOwner(NetworkGetEntityFromNetworkId(v.planeId)) ~= 0 then
				v.owner = NetworkGetEntityOwner(NetworkGetEntityFromNetworkId(v.planeId))
				TriggerClientEvent("Patachute:takeControlOfPlane",v.owner,k,v.step,v.planeId,v.pilotId)
			end

		end
	end
end)	
