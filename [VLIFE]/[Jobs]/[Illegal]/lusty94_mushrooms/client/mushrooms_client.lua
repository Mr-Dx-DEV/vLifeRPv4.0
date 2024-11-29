local QBCore = exports['qb-core']:GetCoreObject()
local mushroomPlants, mushroomBlips = {}, {}
local busy, mushroomTablePlaced = false, false
local NotifyType = Config.CoreSettings.Notify.Type
local TargetType = Config.CoreSettings.Target.Type
local InvType = Config.CoreSettings.Inventory.Type
local EvidenceEvent = Config.CoreSettings.EventNames.Evidence



--notification function
local function SendNotify(msg,type,time,title)
    if NotifyType == nil then print("Lusty94_Mushrooms: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Mushrooms" end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print("Notification Sent With No Message.") return end
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(msg,type,time)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(title, msg, time, type, true)
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, msg)
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(title, msg, type, time)
    elseif NotifyType == 'ox' then
        lib.notify({ title = title, description = msg, type = type, duration = time})
    elseif NotifyType == 'custom' then
        --insert your custom notification function here
    end
end


--supplies ped
CreateThread(function()
    for k, v in pairs(Config.Peds) do
        if v.useped then
            lib.requestModel(v.model, 5000)
            mushroomPeds = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z-1, v.coords.w, false, false)
            FreezeEntityPosition(mushroomPeds, true)
            SetEntityInvincible(mushroomPeds, true)
            SetBlockingOfNonTemporaryEvents(mushroomPeds, true)
			if v.playanim then
            	TaskStartScenarioInPlace(mushroomPeds, v.scenario, 0, v.playanim)
			end
            if TargetType == 'qb' then
				exports['qb-target']:AddTargetEntity(mushroomPeds, { options = { { type = "client", event = "lusty94_mushrooms:client:openSuppliesShop", icon = v.targeticon, label = v.targetlabel,} }, distance = v.targetdistance })
			elseif TargetType == 'ox' then
				exports.ox_target:addLocalEntity(mushroomPeds, { { name = 'mushroomPeds', icon = v.targeticon, label = v.targetlabel, event = 'lusty94_mushrooms:client:openSuppliesShop', distance = v.targetdistance} })
			end
			if v.useblip then
				v.blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
				SetBlipSprite(v.blip, v.id)
				SetBlipDisplay(v.blip, 4)
				SetBlipScale(v.blip, v.scale)
				SetBlipColour(v.blip, v.colour)
				SetBlipAsShortRange(v.blip, true)
				BeginTextCommandSetBlipName('STRING')
				AddTextComponentString(v.title)
				EndTextCommandSetBlipName(v.blip)
			end
        end
    end
end)


-- Function to remove all blips from a table
function clearBlips(blipTable)
    for _, blip in pairs(blipTable) do
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    for k, _ in pairs(blipTable) do
        blipTable[k] = nil
    end
end






----------------------------< MUSHROOM PLANTS >----------------------------------

--respawns plants every 30 mins
CreateThread(function()
    while true do
        Wait(Config.CoreSettings.Timers.RespawnShrooms) -- waits 30 minutes DONT TOUCH THIS EDIT THE TIMER CONFIG SIDE
        for _, v in pairs(mushroomPlants) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) SetEntityAsNoLongerNeeded(v) end
        mushroomPlants = {}
        Wait(2500) -- wait 2.5 seconds before spawning new plants
        spawnMushrooms() -- spawns new plants
    end
end)


--new method to spawn multiple plants anywhere via config location
--[[ function spawnMushrooms()
	for k,v in pairs(Config.Mushrooms) do
		lib.requestModel(Config.CoreSettings.Props.Mushrooms.Name, 5000)
		mushroomObjects = CreateObject(Config.CoreSettings.Props.Mushrooms.Name, v.coords.x, v.coords.y, v.coords.z - 1, false, true, false) -- if plants floating or too low edit the -1 value on the Z axis
		SetEntityHeading(mushroomObjects, v.coords.w + math.random(1, 359))
		SetModelAsNoLongerNeeded(mushroomObjects)
		FreezeEntityPosition(mushroomObjects, true)
		mushroomPlants[#mushroomPlants+1] = mushroomObjects
		local shroomBlip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
        SetBlipSprite(shroomBlip, 106)
        SetBlipDisplay(shroomBlip, 4)
        SetBlipScale(shroomBlip, 0.5)
        SetBlipColour(shroomBlip, 5)
        SetBlipAsShortRange(shroomBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Barley")
        EndTextCommandSetBlipName(shroomBlip)
        mushroomBlips[mushroomObjects] = shroomBlip
		if TargetType == 'qb' then
			exports['qb-target']:AddTargetEntity(mushroomObjects, { options = { { item = v.item, type = "client", event = "lusty94_mushrooms:client:PickMushroom", icon = v.icon, label = v.label, }, }, distance = v.distance })
		elseif TargetType == 'ox' then
			exports.ox_target:addLocalEntity(mushroomObjects, ({ name = 'mushroomObjects', items = v.item, label = v.label, icon = v.icon, event = 'lusty94_mushrooms:client:PickMushroom', distance = v.distance, }))
		end
	end
end
 ]]
 function spawnMushrooms()
	for k, v in pairs(Config.Mushrooms) do
		lib.requestModel(Config.CoreSettings.Props.Mushrooms.Name, 5000)
		mushroomObjects = CreateObject(Config.CoreSettings.Props.Mushrooms.Name, v.coords.x, v.coords.y, v.coords.z - 1, false, true, false) -- if plants floating or too low edit the -1 value on the Z axis
		SetEntityHeading(mushroomObjects, v.coords.w + math.random(1, 359))
		SetModelAsNoLongerNeeded(mushroomObjects)
		FreezeEntityPosition(mushroomObjects, true)
		mushroomPlants[#mushroomPlants+1] = mushroomObjects

		-- Remove the blip creation section
		--[[
		local shroomBlip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
		SetBlipSprite(shroomBlip, 106)
		SetBlipDisplay(shroomBlip, 4)
		SetBlipScale(shroomBlip, 0.5)
		SetBlipColour(shroomBlip, 5)
		SetBlipAsShortRange(shroomBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Barley")
		EndTextCommandSetBlipName(shroomBlip)
		mushroomBlips[mushroomObjects] = shroomBlip
		]]

		if TargetType == 'qb' then
			exports['qb-target']:AddTargetEntity(mushroomObjects, { options = { { item = v.item, type = "client", event = "lusty94_mushrooms:client:PickMushroom", icon = v.icon, label = v.label, }, }, distance = v.distance })
		elseif TargetType == 'ox' then
			exports.ox_target:addLocalEntity(mushroomObjects, ({ name = 'mushroomObjects', items = v.item, label = v.label, icon = v.icon, event = 'lusty94_mushrooms:client:PickMushroom', distance = v.distance, }))
		end
	end
end




RegisterNetEvent("lusty94_mushrooms:client:PickMushroom", function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID    
	for i=1, #mushroomPlants, 1 do
		if #(coords - GetEntityCoords(mushroomPlants[i])) <= 2 then -- if increasing target distance for props then make sure to increase this number also
			nearbyObject, nearbyID = mushroomPlants[i], i
		end
	end   
	if nearbyObject then
		if IsPedOnFoot(playerPed) then
			if busy then
				SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
				return
			else
				local success = lib.skillCheck({'easy', 'easy', 'easy'}, {'e'})
				if success then
					busy = true
					LockInventory(true)
					if lib.progressCircle({ 
						duration = Config.CoreSettings.Timers.Pick, 
						label = Config.Language.ProgressBar.PickMushrooms, 
						position = 'bottom', 
						useWhileDead = false, 
						canCancel = true, 
						disable = { car = true, move = true, },
						anim = { dict = Config.Animations.PickMushrooms.AnimDict, clip = Config.Animations.PickMushrooms.Anim, flag = Config.Animations.PickMushrooms.Flags,}, 
						prop = { model = 'prop_cs_trowel', bone = 18905, pos = vec3(0.12, 0.0, 0.02), rot = vec3(76.0, 188.0, 34.0), }, 
					}) then
						local chance = Config.CoreSettings.Chances.Pick
						if chance >= math.random(1,100) then
							TriggerServerEvent('lusty94_mushrooms:server:PickMushrooms')
						else
							SendNotify(Config.Language.Notifications.NothingFoundName, 'error', 2000)
						end
						if mushroomBlips[nearbyObject] then
							RemoveBlip(mushroomBlips[nearbyObject])
							mushroomBlips[nearbyObject] = nil
						end
						SetEntityAsMissionEntity(nearbyObject, false, true)
						DeleteObject(nearbyObject)
						mushroomPlants[nearbyID] = nil
						busy = false
						LockInventory(false)
						FreezeEntityPosition(PlayerPed, false)
					else 
						busy = false
						LockInventory(false)
						FreezeEntityPosition(PlayerPed, true)
						SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
					end
				else
					SendNotify(Config.Language.Notifications.FailedName, 'error', 2000)
				end
			end
		else
			SendNotify(Config.Language.Notifications.NotOnFootName, 'error', 2000)
		end
	else
		SendNotify(Config.Language.Notifications.TooFarAway, 'error', 2000)
	end
end)



---------------------------------< PROCESSING TABLE >--------------------------------

--place processing table
RegisterNetEvent('lusty94_mushrooms:client:openProcessingTable', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward)
    local TableProp = Config.CoreSettings.Props.ProcessingTable.Name
	if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
		return
    else
		if mushroomTablePlaced then
            SendNotify(Config.Language.Notifications.PropErrorName, 'error', 2000)
			return
		end
		busy = true
        LockInventory(true)
		if lib.progressCircle({ 
			duration = 5000, 
			label = Config.Language.ProgressBar.PlaceProcessingTable, 
			position = 'bottom', 
			useWhileDead = false, 
			canCancel = true, 
			disable = { car = true, move = true, }, 
			anim = { dict = Config.Animations.PlaceProcessingTable.AnimDict, clip = Config.Animations.PlaceProcessingTable.Anim, flag = Config.Animations.PlaceProcessingTable.Flags, }, 
		}) then
            lib.requestModel(TableProp, 5000)
            mushroomTableProp = CreateObject(TableProp, x, y, z, true, false, true)
            PlaceObjectOnGroundProperly(mushroomTableProp)
            SetEntityAsMissionEntity(mushroomTableProp)
            FreezeEntityPosition(mushroomTableProp, true)
			SetEntityHeading(mushroomTableProp, GetEntityHeading(playerPed))
            if TargetType == 'qb' then
                exports['qb-target']:AddTargetEntity(mushroomTableProp, {  options = { 
					{ action = function() lib.showContext('MainMenuMushroom') end, type = 'client', icon = Config.CoreSettings.Props.ProcessingTable.IconOpen, label =  Config.CoreSettings.Props.ProcessingTable.LabelOpen, }, 
					{ event = 'lusty94_mushroom:client:DeleteProcessingTable', type = 'client', icon = Config.CoreSettings.Props.ProcessingTable.IconRemove, label = Config.CoreSettings.Props.ProcessingTable.LabelRemove, },
				}, distance = Config.CoreSettings.Props.ProcessingTable.Distance })
            elseif TargetType == 'ox' then
                exports.ox_target:addLocalEntity(mushroomTableProp, { 
					{ name = 'mushroomTableProp', icon = Config.CoreSettings.Props.ProcessingTable.IconOpen, label =  Config.CoreSettings.Props.ProcessingTable.LabelOpen, onSelect = function() lib.showContext('MainMenuMushroom') end, distance = Config.CoreSettings.Props.ProcessingTable.Distance},
					{ name = 'mushroomTableProp', icon = Config.CoreSettings.Props.ProcessingTable.IconRemove, label = Config.CoreSettings.Props.ProcessingTable.LabelRemove, event = 'lusty94_mushroom:client:DeleteProcessingTable', distance = Config.CoreSettings.Props.ProcessingTable.Distance} 
				})
            end
            mushroomTablePlaced = true
            busy = false
            LockInventory(false)
        else
            busy = false
			LockInventory(false)
            SendNotify(Config.Language.Notifications.CancelledName, 'error', 3000)
        end
	end
end)

--delete processing table prop
function delete_prop(model)
    if DoesEntityExist(model) then
        DeleteEntity(model)
    end
end


-- delete processing table
RegisterNetEvent('lusty94_mushroom:client:DeleteProcessingTable', function()
    if mushroomTableProp then
		if TargetType == 'qb' then 
			exports['qb-target']:RemoveTargetEntity(mushroomTableProp, 'mushroomTableProp') 
		elseif TargetType == 'ox' then 
			exports.ox_target:removeLocalEntity(mushroomTableProp, 'mushroomTableProp') 
		end
        delete_prop(mushroomTableProp)
        mushroomTableProp = nil
        mushroomTablePlaced = false
    end
end)

--dry raw mushroom
RegisterNetEvent("lusty94_mushrooms:client:DryMushroom", function()
	local playerPed = PlayerPedId()
    if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
        return
    else
        local input = lib.inputDialog('Dry Mushrooms', {
            {
                type = 'input',
                placeholder = 'How much do you want to dry?',
                disabled = true,
                icon = 'arrow-right',
            },
            {
                type = 'slider',
                required = true,
                default = 1,
                min = 1,
                max = 5, -- edit maximum allowed amount to process at once here
            },
        })
        if input then
            if input and tonumber(input[2]) > 0 then
                local amount = tonumber(input[2])
                QBCore.Functions.TriggerCallback('lusty94_mushrooms:get:RawMushroomItems', function(HasItems)  
                    if HasItems then
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.ProcessRaw * amount,
                                label = Config.Language.ProgressBar.DryMushrooms,
                                position = 'bottom',
                                useWhileDead = false,
                                canCancel = true,
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags,}, 
                            }) then
                                local chance = Config.CoreSettings.Chances.Process
								if chance >= math.random(1,100) then
									TriggerServerEvent('lusty94_mushrooms:server:DryMushroom', amount)
								else
									SendNotify(Config.Language.Notifications.ProcessFailedName, 'error', 2000)
								end
								busy = false
								LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.FailedName, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.NotEnoughName, 'error', 2000)
                    end
                end, amount)
            else
                SendNotify(Config.Language.Notifications.InvalidAmountName, 'error', 2000)
            end
        else
            SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
        end
	end
end)

--make magic mushrooms
RegisterNetEvent("lusty94_mushrooms:client:MakeMagicMushrooms", function()
	local playerPed = PlayerPedId()
    if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
        return
    else
        local input = lib.inputDialog('Magic Mushrooms', {
            {
                type = 'input',
                placeholder = 'How much do you want to make?',
                disabled = true,
                icon = 'arrow-right',
            },
            {
                type = 'slider',
                required = true,
                default = 1,
                min = 1,
                max = 5, -- edit maximum allowed amount to process at once here
            },
        })
        if input then
            if input and tonumber(input[2]) > 0 then
                local amount = tonumber(input[2])
                QBCore.Functions.TriggerCallback('lusty94_mushrooms:get:MagicMushroomItems', function(HasItems)  
                    if HasItems then
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.ProcessMagic * amount,
                                label = Config.Language.ProgressBar.MakeMagicMushrooms,
                                position = 'bottom',
                                useWhileDead = false,
                                canCancel = true,
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags,}, 
                            }) then
                                local chance = Config.CoreSettings.Chances.Process
								if chance >= math.random(1,100) then
									TriggerServerEvent('lusty94_mushrooms:server:MakeMagicMushrooms', amount)
								else
									SendNotify(Config.Language.Notifications.ProcessFailedName, 'error', 2000)
								end
								busy = false
								LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.FailedName, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.NotEnoughName, 'error', 2000)
                    end
                end, amount)
            else
                SendNotify(Config.Language.Notifications.InvalidAmountName, 'error', 2000)
            end
        else
            SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
        end
	end
end)

--make overdose cure
RegisterNetEvent("lusty94_mushrooms:client:MakeOverDoseCure", function()
	local playerPed = PlayerPedId()
    if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
        return
    else
        local input = lib.inputDialog('Overdose Cure', {
            {
                type = 'input',
                placeholder = 'How much do you want to make?',
                disabled = true,
                icon = 'arrow-right',
            },
            {
                type = 'slider',
                required = true,
                default = 1,
                min = 1,
                max = 5, -- edit maximum allowed amount to process at once here
            },
        })
        if input then
            if input and tonumber(input[2]) > 0 then
                local amount = tonumber(input[2])
                QBCore.Functions.TriggerCallback('lusty94_mushrooms:get:OverDoseCureItems', function(HasItems)  
                    if HasItems then
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.CreateCure * amount,
                                label = Config.Language.ProgressBar.CreateOverDoseCure,
                                position = 'bottom',
                                useWhileDead = false,
                                canCancel = true,
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags,}, 
                            }) then
                                local chance = Config.CoreSettings.Chances.Process
								if chance >= math.random(1,100) then
									TriggerServerEvent('lusty94_mushrooms:server:MakeOverdoseCure', amount)
								else
									SendNotify(Config.Language.Notifications.ProcessFailedName, 'error', 2000)
								end
								busy = false
								LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.FailedName, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.NotEnoughName, 'error', 2000)
                    end
                end, amount)
            else
                SendNotify(Config.Language.Notifications.InvalidAmountName, 'error', 2000)
            end
        else
            SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
        end
	end
end)



-------------------------< CONSUMPTION >--------------------------

-- Function to spawn an angry ped
local function SpawnAngryPed(playerCoords)
	local playerPed = PlayerPedId()
    local pedModel = 's_m_m_movspace_01' -- change ped model here
    local pedCoords = vector3(playerCoords.x + math.random(-40, 40), playerCoords.y + math.random(-40, 40), playerCoords.z)  -- Adjust the range as needed
	lib.requestModel(pedModel, 5000)
    local ped = CreatePed(1, pedModel, pedCoords, 0.0, true, false)	
    SetPedRelationshipGroupHash(ped, GetHashKey("HATES_PLAYER"))  -- Set the ped to hate the player
	TaskGoToEntity(ped, playerPed, 10000, 100, 10, 0, 0)
    SetEntityAsNoLongerNeeded(ped)   
	
end

-- Function to take magic mushrooms trip
local function TakeMushrooms()
	local playerPed = PlayerPedId()
	local timer = Config.DrugSettings.Effects.EffectsTimer
	local StressEvent = Config.CoreSettings.EventNames.Stress
	local playerCoords = GetEntityCoords(playerPed)
    local shouldSpawnAngryPed = math.random(1, 100) <= Config.DrugSettings.Effects.SpawnChance  -- chance (adjust as needed)  
	Wait(2500)
	if Config.DrugSettings.Effects.UseSound then
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.DrugSettings.Effects.SoundName, 0.8)
    end   
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(2000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(3000) 
	SetTimecycleModifier('spectator5')
	SetPedMotionBlur(playerPed, true) 
    if IsPedRunning(playerPed) then
        SetPedToRagdoll(playerPed, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
	TriggerEvent(EvidenceEvent, "widepupils", 300)
	AddArmourToPed(playerPed, Config.DrugSettings.Effects.ArmourGained)
	SetEntityHealth(playerPed, GetEntityHealth(playerPed) + Config.DrugSettings.Effects.HealthGained)
	TriggerServerEvent(StressEvent, Config.DrugSettings.Effects.StressReduced)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	Wait(2000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	Wait(1000)
	DoScreenFadeOut(1000)
	Wait(2500)
	if Config.DrugSettings.Effects.UseTeleport then
		local chance = math.random(1,100)
		local chance2 = Config.DrugSettings.Effects.TeleportChance
		if chance <= chance2 then
			SetEntityCoords(playerPed, Config.DrugSettings.Effects.TeleportLocation['x'], Config.DrugSettings.Effects.TeleportLocation['y'], Config.DrugSettings.Effects.TeleportLocation['z'], true, true, false, false )
		end
	end
	RequestAnimDict(Config.Animations.DrugEffects.AnimDict)
    while not HasAnimDictLoaded(Config.Animations.DrugEffects.AnimDict) do
        Wait(1000)
    end
	TaskPlayAnim(playerPed, Config.Animations.DrugEffects.AnimDict, Config.Animations.DrugEffects.Anim, 1.0, -1.0, 1.0, 11, Config.Animations.DrugEffects.Flags, 0, 0, 0)
	SetEntityInvincible(playerPed, true)
	Wait(2500)
	DoScreenFadeIn(1500)
	if Config.DrugSettings.Effects.SpawnPed then 
		if shouldSpawnAngryPed then
			SpawnAngryPed(playerCoords)
		end
	end
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(timer)
	SendNotify(Config.Language.Notifications.DrugEffectsName, 'error', 2000)
	Wait(2000)
	ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    SetRunSprintMultiplierForPlayer(playerPed, 1.0)
    StopGameplayCamShaking(playerPed, true)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)
	SetEntityInvincible(playerPed, false)
	ClearPedTasks(playerPed)
	if Config.DrugSettings.Effects.OverDose then
		SendNotify(Config.Language.Notifications.OverDoseWarningName, 'error', 2000)
		TriggerServerEvent('lusty94_mushrooms:server:OverDose')
	end 
end

-- function to take death cap trip
local function TakeDeathCaps()
	local playerPed = PlayerPedId()
	local graveyardCoords = Config.DrugSettings.Effects.GraveLocation
	SetFlash(0, 0, 500, 7000, 500)
	Wait(2500)
	SetFlash(0, 0, 500, 7000, 500)
	SetTimecycleModifier('spectator5')
	SetPedMotionBlur(playerPed, true) 
    if IsPedRunning(playerPed) then
        SetPedToRagdoll(playerPed, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
	TriggerEvent(EvidenceEvent, "widepupils", 300)
	SendNotify(Config.Language.Notifications.BadTripName, 'error', 2000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	Wait(2500)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(2500) 
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	DoScreenFadeOut(2500)
	Wait(3000)
	SetEntityCoords(playerPed, graveyardCoords.x, graveyardCoords.y, graveyardCoords.z, true, true, false, false )
	SetEntityHealth(playerPed, 0) -- change the health the player is set with -- SET TO 0 SO THEY DIE IF HAVING A BBAD TRIP
	Wait(1000)
	DoScreenFadeIn(2500)
	SetFlash(0, 0, 500, 7000, 500)
    StopGameplayCamShaking(playerPed, true)
	SetFlash(0, 0, 500, 7000, 500)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)
	SetFlash(0, 0, 500, 7000, 500)
	ClearTimecycleModifier()
	StopGameplayCamShaking(playerPed, true)
	ClearPedTasks(playerPed)
	if Config.DrugSettings.Effects.OverDose then
		TriggerServerEvent('lusty94_mushrooms:server:OverDose')
	end
end



-- Take Magic Mushrooms
RegisterNetEvent('lusty94_mushrooms:client:TakeMagicMushrooms', function()
	if busy then
		SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
	else
		QBCore.Functions.TriggerCallback('lusty94_mushrooms:get:TakeMagicMushrooms', function(HasItems)  
			if HasItems then
				busy = true
				LockInventory(true)
				if lib.progressCircle({ 
					duration = Config.CoreSettings.Timers.Take, 
					label = Config.Language.ProgressBar.TakeDrugs, 
					position = 'bottom', 
					useWhileDead = false, 
					canCancel = true, 
					disable = { car = true, move = false, }, 
					anim = { dict = Config.Animations.TakeDrugs.AnimDict, clip = Config.Animations.TakeDrugs.Anim, flag = Config.Animations.TakeDrugs.Flags,},
				}) then
					TriggerServerEvent('lusty94_mushrooms:server:TakeMagicMushrooms')
					busy = false
					LockInventory(false)
					if Config.DrugSettings.Effects.Enabled then
						TakeMushrooms()
					end
				else 
					busy = false
					LockInventory(false)
					SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
				end
			else
				SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
			end
		end)
	end
end)




-- overdose
RegisterNetEvent('lusty94_mushrooms:client:OverDose', function()
	local playerPed = PlayerPedId()
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	DoScreenFadeOut(2000)
	Wait(2000)
	SetEntityHealth(playerPed, GetEntityHealth(playerPed) - Config.DrugSettings.Effects.HealthRemoved)
	Wait(2000)
	DoScreenFadeIn(2000)
	SendNotify(Config.Language.Notifications.OverDosedName, 'error', 2000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	SetFlash(0, 0, 500, 7000, 500)
	StopGameplayCamShaking(playerPed, true)
end)

-- Take overdose cure
RegisterNetEvent('lusty94_mushrooms:client:TakeOverDoseCure', function()
	if busy then
		SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
	else
		QBCore.Functions.TriggerCallback('lusty94_mushrooms:get:TakeOverDoseCure', function(HasItems)  
			if HasItems then
				busy = true
				LockInventory(true)
				if lib.progressCircle({ 
					duration = Config.CoreSettings.Timers.Take, 
					label = Config.Language.ProgressBar.TakeOverDoseCure, 
					position = 'bottom', 
					useWhileDead = false, 
					canCancel = true, 
					disable = { car = true, move = false, },  
					anim = { dict = Config.Animations.TakeDrugs.AnimDict, clip = Config.Animations.TakeDrugs.Anim, flag = Config.Animations.TakeDrugs.Flags,},
				}) then
					TriggerServerEvent('lusty94_mushrooms:server:CureOverDose')
					busy = false
					LockInventory(false)
				else 
					busy = false
					LockInventory(false)
					SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
				end
			else
				SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
			end
		end)
	end
end)

-- Take death cap mushrooms
RegisterNetEvent('lusty94_mushrooms:client:TakeDeathCapMushroom', function()
	local TripChance = Config.DrugSettings.Effects.DeathCapTripChance
	if busy then
		SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
	else
		QBCore.Functions.TriggerCallback('lusty94_mushrooms:get:DeathcapMushroom', function(HasItems)  
			if HasItems then
				busy = true
				LockInventory(true)
				if lib.progressCircle({ 
					duration = Config.CoreSettings.Timers.Take, 
					label = Config.Language.ProgressBar.TakeDeathCap, 
					position = 'bottom', 
					useWhileDead = false, 
					canCancel = true, 
					disable = { car = true, move = false, },  
					anim = { dict = Config.Animations.TakeDrugs.AnimDict, clip = Config.Animations.TakeDrugs.Anim, flag = Config.Animations.TakeDrugs.Flags,},
				}) then
					TriggerServerEvent('lusty94_mushrooms:server:TakeDeathCapMushrooms')
					busy = false
					LockInventory(false)
					if Config.DrugSettings.Effects.Enabled then
						if TripChance >= math.random(1,100) then
							TakeMushrooms()
						else
							TakeDeathCaps()
						end
					end
				else 
					busy = false
					LockInventory(false)
					SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
				end
			else
				SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
			end
		end)
	end
end)


-- open supplies shop
AddEventHandler("lusty94_mushrooms:client:openSuppliesShop", function()
	if InvType == 'qb'then
		TriggerServerEvent('lusty94_mushrooms:server:SupplyShop')
	elseif InvType == 'ox' then
		exports.ox_inventory:openInventory('shop',{ type = 'MushroomSupplyStore' })
	end
end)



-- function to lock inventory to prevent exploits
function LockInventory(toggle)
	if toggle then
        LocalPlayer.state:set("inv_busy", true, true)
    else 
        LocalPlayer.state:set("inv_busy", false, true)
    end
end

--function to display item images for ox_lib menu
function ItemImage(img)
	if InvType == 'ox' then
		return "nui://ox_inventory/web/images/".. img.. '.png'
	elseif InvType == 'qb' then
		return "nui://qb-inventory/html/images/".. QBCore.Shared.Items[img].image
	end
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for _, v in pairs(mushroomPlants) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) end
		mushroomPlants = {}
		delete_prop(mushroomTableProp)
        mushroomTableProp = nil
        mushroomTablePlaced = false
		busy = false
		LockInventory(false)
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(mushroomObjects, 'mushroomObjects') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(mushroomObjects, 'mushroomObjects') end
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(mushroomPeds, 'mushroomPeds') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(mushroomPeds, 'mushroomPeds') end
		DeletePed(mushroomPeds)
		print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Mushrooms V2.0.1 Stopped Successfully ^5--<^3!^5>--^7')
	end
end)


--dont touch
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
		spawnMushrooms()
    end
end)

--dont touch
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    for _, v in pairs(mushroomPlants) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) end
	mushroomPlants = {}
	spawnMushrooms()
end)