local QBCore = exports["qb-core"]:GetCoreObject()

local isSpeedSet = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		
		while not IsPedInAnyVehicle(PlayerPedId(), false)
		do
			Citizen.Wait(2500)
		end

		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local currentSpeed = GetEntitySpeed(vehicle)

		if (currentSpeed == 0) then
			Citizen.Wait(2000)
		end

		if vehicle ~= nil then
			isSpeedSet = false
			setSpeed(vehicle)
		end
		
		while isSpeedSet and IsPedInAnyVehicle(PlayerPedId(), false) do
			local currentVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			if currentVeh ~= vehicle then
				setSpeed(currentVeh)
			end
			Citizen.Wait(2500)
		end
	end
end)

function setSpeed(vehicle)
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local closestVehicle = QBCore.Functions.GetClosestVehicle(coords)
	local vehicleModel = GetEntityModel(closestVehicle)
	local vehicleDisplayName = nil

	for k, v in pairs(QBCore.Shared.Vehicles) do
	  if v.hash == vehicleModel then
	    vehicleDisplayName = v.model
	    break
	  end
	end

	if not vehicleDisplayName then
	  vehicleDisplayName = GetDisplayNameFromVehicleModel(vehicleModel)
	end

	print(vehicleDisplayName)

	if (vehicleClass ~= 16) or (vehicleClass ~= 15) then
		local speed = Config.maxSpeed;
		if Config.useCategories then
			-- speed = Config.Categories[vehicleClass + 1].maxSpeed;
			if QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'pdm' then -- pdm
				print('speed cap: pdm')
				speed = Config.pdm
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'silver' then -- imports
				print('speed cap: silver')
				speed = Config.Silver
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'edm' then -- edm
				print('speed cap: edm')
				speed = Config.edm	
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'gold' then -- 1o1
				print('speed cap: gold')
				speed = Config.Gold
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'goldtune' then -- 1o1
				print('speed cap: gold tune')
				speed = Config.GoldTune
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'diamond' then -- super car 1o1
				print('speed cap: diamond')
				speed = Config.Diamond
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'diamondtune' then 
				print('speed cap: diamond tune')
				speed = Config.DiamondTune
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'nonsportsbike' then 
				print('speed cap: nonsportsbike')
				speed = Config.NonSportsBike
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'sportsbike' then 
				print('speed cap: sportsbike')
				speed = Config.SportsBike
			
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'police2' then
				print('speed cap: police2')
				speed = Config.Police2
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'police' then
				print('speed cap: police')
				speed = Config.police
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'ems' then
				print('speed cap: ems')
				speed = Config.EMS
			elseif QBCore.Shared.Vehicles[vehicleDisplayName].shop == 'ems2' then 
				print('speed cap: ems2')
				speed = Config.EMS2
			else
				print('speed cap: UNDEFINED VEHICLE (USING PDM SPEED)')
				speed = Config.Bronze
			end
		end
		if Config.kmh then
			speed = speed / Config.kmhValue
		else
			speed = speed / Config.mphValue
		end

		SetVehicleMaxSpeed(vehicle, speed)
		isSpeedSet = true
	end
end
