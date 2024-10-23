local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true

local menuOpen = false
local wasOpen = false
local spawnedWeed = 0
local weedPlants = {}

local isPickingUp, isProcessing, isProcessing2 = false, false, false

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
	CheckCoords()
	Wait(1000)
	local coords = GetEntityCoords(PlayerPedId())
	if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedField.coords, true) < 1000 then
		SpawnWeedPlants()
	end
end)

function CheckCoords()
	CreateThread(function()
		while true do
			local coords = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedField.coords, true) < 1000 then
				SpawnWeedPlants()
			end
			Wait(1 * 60000)
		end
	end)
end

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		CheckCoords()
	end
end)

local promptDisplayed = false -- Track whether the prompt is currently displayed

CreateThread(function() -- weed
    while true do
        Wait(10)

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local nearbyObject, nearbyID = nil, nil
        local closestDist = 1.0

        -- Find the closest weed plant
        for i = 1, #weedPlants do
            local weedCoords = GetEntityCoords(weedPlants[i])
            local dist = GetDistanceBetweenCoords(coords, weedCoords, false)
            if dist < closestDist then
                nearbyObject, nearbyID = weedPlants[i], i
                closestDist = dist
            end
        end

        if nearbyObject and IsPedOnFoot(playerPed) then
            -- Show the interaction prompt if not already displayed
            if not promptDisplayed then
                exports['onex-interaction']:showMidContext('E', 'Pickup Cannabis')
                promptDisplayed = true
            end
            
            -- Draw the 3D text above the weed plant
           -- DrawText3D(GetEntityCoords(nearbyObject).x, GetEntityCoords(nearbyObject).y, GetEntityCoords(nearbyObject).z + 1.0, 'Press ~g~[E]~w~ to pickup Cannabis', 0.4)

            if IsControlJustReleased(0, 38) and not isPickingUp then
                isPickingUp = true
                exports['onex-interaction']:hideMidContext() -- Hide prompt immediately
                TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
                QBCore.Functions.Progressbar("search_register", "Picking up Cannabis..", 3000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                    disableInventory = true,
                }, {}, {}, {}, function() -- Progressbar done
                    ClearPedTasks(playerPed)

                    -- Ensure the object exists and then delete
                    if DoesEntityExist(nearbyObject) then
                        DeleteObject(nearbyObject)
                        SetEntityAsNoLongerNeeded(nearbyObject) -- Mark as no longer needed
                    end

                    -- Remove from the list and update count
                    table.remove(weedPlants, nearbyID)
                    spawnedWeed = spawnedWeed - 1

                    TriggerServerEvent('VL-WeedPick:pickedUpCannabis')
                    isPickingUp = false
                end, function() -- Progressbar cancel
                    ClearPedTasks(playerPed)
                    isPickingUp = false
                end)
            end
        else
            -- Hide the prompt if no weed plants are nearby and prompt is displayed
            if promptDisplayed then
                exports['onex-interaction']:hideMidContext()
                promptDisplayed = false
            end
            Wait(500) -- Increase wait time if no nearby weed plants
        end
    end
end)

function DrawText3D(x, y, z, text, scale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = 500 / (1 + GetGameplayCamRelativePitch())
    local scale = scale or 0.35

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end


AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        DeleteWeedPlants()
    end
end)


function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(0)
    end
end

function SpawnWeedPlants()
    LoadModel(GetHashKey('prop_weed_02'))
    while spawnedWeed < 20 do
        Wait(1)
        local weedCoords = GenerateWeedCoords()

        -- Debugging: Print the generated coordinates
        --print("Generated Weed Coordinates: ", weedCoords)

        -- Use CreateObject to spawn the object
        local obj = CreateObject(GetHashKey('prop_weed_02'), weedCoords.x, weedCoords.y, weedCoords.z, true, true, false)

        -- Check if the object was created successfully
        if DoesEntityExist(obj) then
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)

            -- Debugging: Print when the object is successfully placed
            --print("Weed object spawned and placed: ", obj)

            table.insert(weedPlants, obj)
            spawnedWeed = spawnedWeed + 1
        else
            --print("Failed to create object at: ", weedCoords)
        end
    end
    Wait(45 * 60000)
end

function DeleteWeedPlants()
    for _, obj in ipairs(weedPlants) do
        if DoesEntityExist(obj) then
            DeleteEntity(obj)
        end
    end
    weedPlants = {}  -- Clear the table
    spawnedWeed = 0  -- Reset the counter
end



function ValidateWeedCoord(plantCoord)
	if spawnedWeed > 0 then
		local validate = true

		for k, v in pairs(weedPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.WeedField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateWeedCoords()
	while true do
		Wait(1)

		local weedCoordX, weedCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-10, 10)

		Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-10, 10)

		weedCoordX = Config.CircleZones.WeedField.coords.x + modX
		weedCoordY = Config.CircleZones.WeedField.coords.y + modY

		local coordZ = GetCoordZWeed(weedCoordX, weedCoordY)
		local coord = vector3(weedCoordX, weedCoordY, coordZ)

		if ValidateWeedCoord(coord) then
			return coord
		end
	end
end

function GetCoordZWeed(x, y)
	local groundCheckHeights = { 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0, 40.0, 50.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 31.85
end

CreateThread(function()
    while QBCore == nil do
        Wait(200)
    end

    while true do
        Wait(10)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedProcessing.coords, true) < 5 then
            DrawMarker(2, Config.CircleZones.WeedProcessing.coords.x, Config.CircleZones.WeedProcessing.coords.y, Config.CircleZones.WeedProcessing.coords.z - 0.2, 0, 0, 0, 0, 0, 0, 0.3, 0.2, 0.15, 255, 0, 0, 100, 0, 0, 0, true, 0, 0, 0)

            if not isProcessing and GetDistanceBetweenCoords(coords, Config.CircleZones.WeedProcessing.coords, true) < 1 then
                QBCore.Functions.DrawText3D(Config.CircleZones.WeedProcessing.coords.x, Config.CircleZones.WeedProcessing.coords.y, Config.CircleZones.WeedProcessing.coords.z, 'Press ~g~[E]~w~ to Process')
            end

            if IsControlJustReleased(0, 38) and not isProcessing then
                isProcessing = true  -- Set processing to true to prevent overlapping processing

                -- Check for cannabis
                local hasWeed = false
                local hasBag = false

                -- Use ox_inventory to check for items
                local weedCount = exports.ox_inventory:Search('count', 'cannabis')
                local bagCount = exports.ox_inventory:Search('count', 'empty_weed_bag')

                if weedCount > 0 then
                    hasWeed = true
                end

                if bagCount > 0 then
                    hasBag = true
                end

                if hasWeed and hasBag then
                    QBCore.Functions.GetPlayerData(function(PlayerData)
                        local isDead = PlayerData.metadata['isdead'] or false
                        local isHandcuffed = PlayerData.metadata['handcuffed'] or false
                        local isInLastStand = PlayerData.metadata['inlaststand'] or false
                        if isDead or isHandcuffed or isInLastStand then
                            QBCore.Functions.Notify('Are you a God?', 'error')
                        else
                            Processweed()
                        end
                    end)
                elseif hasWeed then
					QBCore.Functions.Notify('You don\'t have enough plastic bags.', 'error')
				elseif hasBag then
					QBCore.Functions.Notify('You don\'t have enough cannabis.', 'error')
                else
                    QBCore.Functions.Notify('You don\'t have enough cannabis and plastic bags.', 'error')
                end

                isProcessing = false  -- Reset processing status after the checks
            end
        else
            Wait(500)
        end
    end
end)


function Processweed()
	isProcessing = true
	local playerPed = PlayerPedId()

	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	SetEntityHeading(PlayerPedId(), 108.06254)

	QBCore.Functions.Progressbar("search_register", "Trying to Process..", 30000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		disableInventory = true,
	}, {}, {}, {}, function()
	 TriggerServerEvent('VL-WeedPick:processweed')

		local timeLeft = Config.Delays.WeedProcessing / 1000

		while timeLeft > 0 do
			Wait(1000)
			timeLeft = timeLeft - 1

			if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.WeedProcessing.coords, false) > 4 then
				TriggerServerEvent('VL-WeedPick:cancelProcessing')
				break
			end
		end
		ClearPedTasks(PlayerPedId())
	end, function()
		ClearPedTasks(PlayerPedId())
	end) -- Cancel

	isProcessing = false
end

CreateThread(function()
	while QBCore == nil do
		Wait(200)
	end
	while true do
		Wait(10)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.DrugDealer.coords, true) < 5 then
			DrawMarker(2, Config.CircleZones.DrugDealer.coords.x, Config.CircleZones.DrugDealer.coords.y, Config.CircleZones.DrugDealer.coords.z - 0.2 , 0, 0, 0, 0, 0, 0, 0.3, 0.2, 0.15, 255, 0, 0, 100, 0, 0, 0, true, 0, 0, 0)


			if not isProcessing2 and GetDistanceBetweenCoords(coords, Config.CircleZones.DrugDealer.coords, true) <1 then
				QBCore.Functions.DrawText3D(Config.CircleZones.DrugDealer.coords.x, Config.CircleZones.DrugDealer.coords.y, Config.CircleZones.DrugDealer.coords.z, 'Press ~g~[E]~w~ to Sell')
			end

			if IsControlJustReleased(0, 38) and not isProcessing2 then
				local hasWeed2 = false
				local hasBag2 = false
				local s3 = false

				QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
					hasWeed2 = result
					hasBag2 = result
					s3 = true

				end, 'weed_bag')

				while(not s3) do
					Wait(100)
				end


				if (hasWeed2) then
					SellDrug()
				elseif (hasWeed2) then
					QBCore.Functions.Notify('You dont have enough plastic bags.', 'error')
				elseif (hasBag2) then
					QBCore.Functions.Notify('You dont have enough cannabis.', 'error')
				else
					QBCore.Functions.Notify('You dont have enough weed bags to sell.', 'error')
				end
			end
		else
			Wait(500)
		end
	end
end)

function SellDrug()
	isProcessing2 = true
	local playerPed = PlayerPedId()

	--
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	SetEntityHeading(PlayerPedId(), 108.06254)

	QBCore.Functions.Progressbar("search_register", "Trying to Sell..", 1500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		disableInventory = true,
	}, {}, {}, {}, function()
	 TriggerServerEvent('VL-WeedPick:selld')

		local timeLeft = Config.Delays.WeedProcessing / 1000

		while timeLeft > 0 do
			Wait(500)
			timeLeft = timeLeft - 1

			if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.WeedProcessing.coords, false) > 4 then
				break
			end
		end
		ClearPedTasks(PlayerPedId())
	end, function()
		ClearPedTasks(PlayerPedId())
	end) -- Cancel

	isProcessing2 = false
end
