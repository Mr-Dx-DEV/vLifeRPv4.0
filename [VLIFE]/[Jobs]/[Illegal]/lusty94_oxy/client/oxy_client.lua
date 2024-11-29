local QBCore = exports['qb-core']:GetCoreObject()
local NotifyType = Config.CoreSettings.Notify.Type
local TargetType = Config.CoreSettings.Target.Type
local PoliceType = Config.CoreSettings.Police.Type
local InvType = Config.CoreSettings.Inventory.Type
local deliveryStarted, deliveryActive, deliveryCompleted, saleActive, saleStarted, saleCompleted, healing = false, false, false, false, false, false, false
local deliveryPed, deliveryBlip, saleBlip, salePed = nil, nil, nil, nil
local deliveryCounter, saleCounter = 0, 0


--notification function
local function SendNotify(msg,type,time,title)
    if NotifyType == nil then print("Lusty94_Oxy: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Oxy" end
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
    end
end

--police alert
function alertPoliceOxy()
	if PoliceType == 'qb' then
		TriggerServerEvent('police:server:policeAlert', 'Suspicious Activity Reported')
	elseif PoliceType == 'ps' then
		exports['ps-dispatch']:SuspiciousActivity()
	elseif PoliceType == 'custom' then
		--insert your own code for police notifications here
	end
end


----------------------------< SUSPCIOUS PACKAGE DELIVERY >-----------------------
--create delivery blip
function createDeliveryBlip(coords)
	deliveryBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(deliveryBlip, 51)
    SetBlipScale(deliveryBlip, 0.7)
    SetBlipColour(deliveryBlip, 2)
    SetBlipAsShortRange(deliveryBlip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Delivery Location")
    EndTextCommandSetBlipName(deliveryBlip)
    SetNewWaypoint(coords.x, coords.y)
end

-- mission start ped
CreateThread(function()
    local pedModels = Config.InteractionLocations.PedModels[math.random(#Config.InteractionLocations.PedModels)]
    local coords = Config.InteractionLocations.StartLocations[math.random(#Config.InteractionLocations.StartLocations)]
    local targetIcon = Config.InteractionLocations.PedTargets.Icon
    local targetLabel = Config.InteractionLocations.PedTargets.Label
    local targetDist = Config.InteractionLocations.PedTargets.Distance
    lib.requestModel(pedModels, 5000)
    missionPed = CreatePed(0, pedModels, coords.x, coords.y, coords.z - 1, true, false)
    SetEntityHeading(missionPed, coords.w)
    FreezeEntityPosition(missionPed, true)
    SetEntityInvincible(missionPed, true)
    SetBlockingOfNonTemporaryEvents(missionPed, true)
    TaskStartScenarioInPlace(missionPed, 'WORLD_HUMAN_SMOKING', true)
    if TargetType == 'qb' then
		exports['qb-target']:AddTargetEntity(missionPed, { options = { 
            { type = "client", event = "lusty94_oxy:client:StartDelivery", icon = targetIcon, label = targetLabel, },
        }, distance = targetDistance })
	elseif TargetType == 'ox' then
		exports.ox_target:addLocalEntity(missionPed, { 
            { name = 'deliveryPed', icon = targetIcon, label = targetLabel, event = 'lusty94_oxy:client:StartDelivery', distance = targetDistance, }, 
        })
	end
    if Config.StartPedBlip then
        pedBlip = AddBlipForCoord(coords)
        SetBlipSprite(pedBlip, 66)
        SetBlipDisplay(pedBlip, 4)
        SetBlipScale(pedBlip, 0.6)
        SetBlipColour(pedBlip, 2)
        SetBlipAsShortRange(pedBlip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString('Suspicious Package Delivery')
        EndTextCommandSetBlipName(pedBlip)
    end
end)

--create random delivery ped
function createDeliveryPed(coords)
	local randomModel = Config.InteractionLocations.DeliveryModels[math.random(#Config.InteractionLocations.DeliveryModels)]
    local targetIcon = Config.InteractionLocations.DeliveryTargets.Icon
    local targetLabel = Config.InteractionLocations.DeliveryTargets.Label
    local targetDist = Config.InteractionLocations.DeliveryTargets.Distance
    lib.requestModel(randomModel, 5000)
	deliveryPed = CreatePed(5, randomModel, coords.x, coords.y, coords.z-1, coords.w, true, true)
	ClearPedTasks(deliveryPed)
    ClearPedSecondaryTask(deliveryPed)
    TaskSetBlockingOfNonTemporaryEvents(deliveryPed, true)
    SetPedFleeAttributes(deliveryPed, 0, 0)
	FreezeEntityPosition(deliveryPed, true)
    SetEntityInvincible(deliveryPed, true)
	if TargetType == 'qb' then
		exports['qb-target']:AddTargetEntity(deliveryPed, { options = { 
            { type = "client", item = "suspiciouspackage", event = "lusty94_oxy:client:deliverSuspiciousPackage", icon = targetIcon, label = targetLabel, },
        }, distance = targetDistance })
	elseif TargetType == 'ox' then
		exports.ox_target:addLocalEntity(deliveryPed, { 
            { name = 'deliveryPed', items = 'suspiciouspackage', icon = targetIcon, label = targetLabel, event = 'lusty94_oxy:client:deliverSuspiciousPackage', distance = targetDistance, },
        })
	end
end

--create random delivery location
function createDeliveryLocation()
	deliveryActive = true
    if deliveryCounter == Config.InteractionLocations.Settings.MaxDelivery then
        SendNotify(Config.Language.Notifications.AllDeliveredName, 'success', 5000)
        busy = false
        deliveryStarted = false
        deliveryCounter = 0
    else
        SendNotify(Config.Language.Notifications.DeliveryRequestName, 'success', 5000)
        deliveryCounter += 1
        local randomDeliveryLocation = Config.InteractionLocations.DeliveryLocations[math.random(#Config.InteractionLocations.DeliveryLocations)]
        createDeliveryBlip(randomDeliveryLocation)
        deliveryLocation = CircleZone:Create(randomDeliveryLocation.xyz, 50.0, { name = "deliveryLocation", debugPoly = Config.DebugZones })
        deliveryLocation:onPlayerInOut(function(isPointInside, point)
            if isPointInside then
                if deliveryPed == nil then
                    createDeliveryPed(randomDeliveryLocation)
                end
            end
        end)
    end
end

--start delivery mission
function startDelivery()
	if deliveryStarted then
        return
    end
    TriggerServerEvent('lusty94_oxy:server:GetDeliveryPackage')
	deliveryStarted = true
	SendNotify(Config.Language.Notifications.LocationSentName, 'success', 5000)
	while deliveryStarted do
		Wait(5000) -- wait 5 seconds before checking
		if not deliveryActive then
			Wait(5000) -- wait 5 seconds before making a new delivery location
			createDeliveryLocation()
		end
	end
end

--delete delivery ped
function deleteDeliveryPed()
	FreezeEntityPosition(deliveryPed, false)
	TaskSetBlockingOfNonTemporaryEvents(deliveryPed, false)
	ClearPedTasks(deliveryPed)
	TaskWanderStandard(deliveryPed, 10.0, 10)
	SetPedAsNoLongerNeeded(deliveryPed)
    SetEntityInvincible(deliveryPed, false)
    Wait(2000)
	DeletePed(deliveryPed)
	deliveryPed = nil
end


--start delivery mission
RegisterNetEvent("lusty94_oxy:client:StartDelivery", function()
    local playerPed = PlayerPedId()
    if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
        return
    else
        if deliveryStarted then
            SendNotify(Config.Language.Notifications.AlreadyStartedName, 'error', 5000)
            return
        end
        QBCore.Functions.TriggerCallback('lusty94_oxy:server:StartDelivery', function(canStart)
            if canStart then
                busy = true
                LockInventory(true)
                FreezeEntityPosition(playerPed, true)
                local dict = Config.Animations.StartDelivery.Player.Dict
                local anim = Config.Animations.StartDelivery.Player.Anim
                local flags = Config.Animations.StartDelivery.Player.Flag
                local prop = Config.Animations.StartDelivery.Player.Prop
                local bone = Config.Animations.StartDelivery.Player.Bone
                local pos = Config.Animations.StartDelivery.Player.Pos
                local rot = Config.Animations.StartDelivery.Player.Rot
                lib.requestAnimDict(dict, 5000)
                local playerCoords = GetEntityCoords(playerPed)
                moneyProp = CreateObject(prop, playerCoords, true, false, false)
                AttachEntityToEntity(moneyProp, playerPed, GetPedBoneIndex(playerPed, bone), pos, rot, true, true, false, false, 1, true)
                TaskPlayAnim(playerPed, dict, anim, 2.0, -1.0, 1.0, 11, flags, 0, 0, 0)
                Wait(1000)
                DeleteObject(moneyProp)
                ClearPedTasks(playerPed)
                local pedDict = Config.Animations.StartDelivery.Ped.Dict
                local pedAnim = Config.Animations.StartDelivery.Ped.Anim
                local pedFlags = Config.Animations.StartDelivery.Ped.Flag
                local pedProp = Config.Animations.StartDelivery.Ped.Prop
                local pedBone = Config.Animations.StartDelivery.Ped.Bone
                local pedPos = Config.Animations.StartDelivery.Ped.Pos
                local pedRot = Config.Animations.StartDelivery.Ped.Rot
                lib.requestAnimDict(pedDict, 5000)
                local coords = GetEntityCoords(missionPed)
                box = CreateObject(pedProp, coords, true, false, false)
                AttachEntityToEntity(box, missionPed, GetPedBoneIndex(missionPed, pedBone), pedPos, pedRot, true, true, false, false, 1, true)
                TaskPlayAnim(missionPed, pedDict, pedAnim, 2.0, -1.0, 1.0, 11, pedFlags, 0, 0, 0)
                Wait(1000)
                DeleteObject(box)            
                ClearPedTasksImmediately(missionPed)
                FreezeEntityPosition(playerPed, false)
                busy = false
                LockInventory(false)
                startDelivery()
            end
        end)
    end
end)


--deliver suspicious package
RegisterNetEvent('lusty94_oxy:client:deliverSuspiciousPackage', function()
    local playerPed = PlayerPedId()
    if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
        return
    else
        QBCore.Functions.TriggerCallback('lusty94_oxy:get:GetPackage', function(package)
            if package then
                if deliveryCompleted then 
                    return 
                end
                if #(GetEntityCoords(playerPed) - GetEntityCoords(deliveryPed)) < 2.0 then
                    busy = true
                    LockInventory(true)
                    deliveryCompleted = true
                    FreezeEntityPosition(playerPed, true)
                    PlayAmbientSpeech1(deliveryPed, 'GENERIC_HI', 'SPEECH_PARAMS_STANDARD')
                    if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(deliveryPed) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(deliveryPed, 'deliveryPed') end
                    local dict = Config.Animations.DeliverPackage.Player.Dict
                    local anim = Config.Animations.DeliverPackage.Player.Anim
                    local flags = Config.Animations.DeliverPackage.Player.Flag
                    local prop = Config.Animations.DeliverPackage.Player.Prop
                    local bone = Config.Animations.DeliverPackage.Player.Bone
                    local pos = Config.Animations.DeliverPackage.Player.Pos
                    local rot = Config.Animations.DeliverPackage.Player.Rot
                    lib.requestAnimDict(dict, 5000)
                    local coords = GetEntityCoords(playerPed)
                    local boxProp = CreateObject(prop, coords, true, false, false)
                    AttachEntityToEntity(boxProp, playerPed, GetPedBoneIndex(playerPed, bone), pos, rot, true, true, false, false, 1, true)
                    TaskPlayAnim(playerPed, dict, anim, 2.0, -1.0, 1.0, 11, flags, 0, 0, 0)
                    Wait(1000)
                    local pedDict = Config.Animations.DeliverPackage.Ped.Dict
                    local pedAnim = Config.Animations.DeliverPackage.Ped.Anim
                    local pedFlags = Config.Animations.DeliverPackage.Ped.Flag
                    local pedProp = Config.Animations.DeliverPackage.Ped.Prop
                    local pedBone = Config.Animations.DeliverPackage.Ped.Bone
                    local pedPos = Config.Animations.DeliverPackage.Ped.Pos
                    local pedRot = Config.Animations.DeliverPackage.Ped.Rot
                    lib.requestAnimDict(pedDict, 5000)
                    local deliveryPedCoords = GetEntityCoords(deliveryPed)
                    local pills = CreateObject(pedProp, deliveryPedCoords, true, false, false)
                    AttachEntityToEntity(pills, deliveryPed, GetPedBoneIndex(deliveryPed, pedBone), pedPos, pedRot, true, true, false, false, 1, true)
                    TaskPlayAnim(deliveryPed, pedDict, pedAnim, 2.0, -1.0, 1.0, 11, pedFlags, 0, 0, 0)
                    RemoveBlip(deliveryBlip)
                    deliveryBlip = nil
                    PlayAmbientSpeech1(deliveryPed, "Generic_Thanks", "Speech_Params_Force_Shouted_Clear")
                    TriggerServerEvent('lusty94_oxy:server:deliveryReward')
                    if math.random(100) <= Config.InteractionLocations.PoliceSettings.CallChance then
                        alertPoliceOxy()
                        SendNotify(Config.Language.Notifications.SomeoneSawName, 'error', 5000)
                    end
                    LockInventory(false)
                    deliveryLocation:destroy()
                    Wait(1000)
                    DeleteObject(boxProp)
                    DeleteObject(pills)
                    ClearPedTasks(deliveryPed)
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                    deliveryActive = false
                    deliveryCompleted = false
                    deleteDeliveryPed()
                end
            else
                ClearPedTasks(playerPed)
                SendNotify(Config.Language.Notifications.MissingItemsName, 'error', 5000)
            end
        end)
    end
end)


---------------------------< CONSUME OXY >------------------------------------
-- heal player
function healPlayer()
    local playerPed = PlayerPedId()
    if not healing then
        healing = true
    else
        return
    end
    local amount = 10 -- dont touch
    while amount > 0 do
        Wait(1000)
        amount -= 1
        SetEntityHealth(playerPed, GetEntityHealth(playerPed) + 10) -- change 10 to the amount of health oxy gives you each tick
    end
    healing = false
end

--take oxy
RegisterNetEvent('lusty94_oxy:client:TakeOxy', function(itemName)
    local playerPed = PlayerPedId()
    QBCore.Functions.TriggerCallback('lusty94_oxy:get:Oxy', function(oxyItem)  
        if oxyItem then
            local animDict = 'mp_player_intdrink'
            local anim = 'loop_bottle'
            local flags = 49
            local prop = 'prop_cs_pills'
            local bone = 18905
            local pos = vec3(0.13, 0.03, 0.0)
            local rot = vec3(80.0, 398.0, 167.0)
            busy = true
            LockInventory(true)
            if lib.progressCircle({ 
                duration = 5000, 
                label = Config.Language.ProgressBar.Consume, 
                position = 'bottom', 
                useWhileDead = false, 
                canCancel = true, 
                disable = { car = false, move = false,}, 
                anim = { dict = animDict, clip = anim, flag = flags,},
                prop = { model = prop, bone = bone, pos = pos, rot = rot,},
            }) then 
                TriggerServerEvent('lusty94_oxy:server:RemoveOxy')
                ClearPedBloodDamage(playerPed)
                busy = false
                LockInventory(false)
                healPlayer() 
            else
                busy = false
                LockInventory(false)
                SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
            end
        else
            SendNotify(Config.Language.Notifications.MissingItemsName, 'error', 5000)
        end
    end)
end)


--------------------------------< SELL OXY >--------------------------------

--create sale blip
function createSaleBlip(saleCoords)
	saleBlip = AddBlipForCoord(saleCoords.x, saleCoords.y, saleCoords.z)
    SetBlipSprite(saleBlip, 51)
    SetBlipScale(saleBlip, 0.7)
    SetBlipColour(saleBlip, 2)
    SetBlipAsShortRange(saleBlip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Sale Location")
    EndTextCommandSetBlipName(saleBlip)
    SetNewWaypoint(saleCoords.x, saleCoords.y)
end

--create random sale ped
function createSalePed(saleCoords)
	local saleModel = Config.InteractionLocations.SaleModels[math.random(#Config.InteractionLocations.SaleModels)]
    local targetIcon = Config.InteractionLocations.SaleTargets.Icon
    local targetLabel = Config.InteractionLocations.SaleTargets.Label
    local targetDist = Config.InteractionLocations.SaleTargets.Distance
    lib.requestModel(saleModel, 5000)
	salePed = CreatePed(5, saleModel, saleCoords.x, saleCoords.y, saleCoords.z-1, saleCoords.w, true, true)
	ClearPedTasks(salePed)
    ClearPedSecondaryTask(salePed)
    TaskSetBlockingOfNonTemporaryEvents(salePed, true)
    SetPedFleeAttributes(salePed, 0, 0)
	FreezeEntityPosition(salePed, true)
    SetEntityInvincible(salePed, true)
	if TargetType == 'qb' then
		exports['qb-target']:AddTargetEntity(salePed, { options = { 
            { type = "client", item = "oxy", event = "lusty94_oxy:client:sellOxy", icon = targetIcon, label = targetLabel, },
        }, distance = targetDistance })
	elseif TargetType == 'ox' then
		exports.ox_target:addLocalEntity(salePed, { 
            { name = 'salePed', items = 'oxy', icon = targetIcon, label = targetLabel, event = 'lusty94_oxy:client:sellOxy', distance = targetDistance, },
        })
	end
end

--create random delivery location
function createSaleLocation()
	saleActive = true
	SendNotify(Config.Language.Notifications.SaleName, 'success', 5000)
	saleCounter += 1
	local randomSaleLocation = Config.InteractionLocations.SaleLocations[math.random(#Config.InteractionLocations.SaleLocations)]
	createSaleBlip(randomSaleLocation)
	saleLocation = CircleZone:Create(randomSaleLocation.xyz, 50.0, { name = "saleLocation", debugPoly = Config.DebugZones })
	saleLocation:onPlayerInOut(function(isPointInside, point)
		if isPointInside then
			if salePed == nil then
				createSalePed(randomSaleLocation)
			end
		end
	end)
end

--start delivery mission
function startSale()
    if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
    else
        QBCore.Functions.TriggerCallback('lusty94_oxy:get:Oxy', function(oxyItem)  
            if oxyItem then
                if saleStarted then
                    return
                end
                busy = true
                LockInventory(true)
                local phoneDict = Config.Animations.TextClients.Player.Dict
                local phoneAnim = Config.Animations.TextClients.Player.Anim
                local phoneFlag = Config.Animations.TextClients.Player.Flag
                local phoneProp = Config.Animations.TextClients.Player.Prop
                local phoneBone = Config.Animations.TextClients.Player.Bone
                local phonePos = Config.Animations.TextClients.Player.Pos
                local phoneRot = Config.Animations.TextClients.Player.Rot
                if lib.progressCircle({ 
                    duration = 5000, 
                    label = Config.Language.ProgressBar.TextCustomers, 
                    position = 'bottom', 
                    useWhileDead = false, 
                    canCancel = true, 
                    disable = { car = false, move = false, }, 
                    anim = { dict = phoneDict, clip = phoneAnim, flag = phoneFlag,}, 
                    prop = { model = phoneProp, bone = phoneBone, pos = phonePos, rot = phoneRot,}, 
                }) then 
                    saleStarted = true
                    SendNotify(Config.Language.Notifications.LocationSentName, 'success', 5000)
                    busy = false
                    LockInventory(false)
                    while saleStarted do
                        Wait(5000)
                        if not saleActive then
                            Wait(5000) -- wait 5 seconds before making a new sale location                
                            createSaleLocation()
                        end
                    end
                else 
                    busy = false
                    LockInventory(false)
                    SendNotify(Config.Language.Notifications.CancelledName, 'error', 5000)
                end

            else
                SendNotify(Config.Language.Notifications.MissingItemsName, 'error', 5000)
            end
        end)
    end 
end

--delete sale ped
function deleteSalePed()
	FreezeEntityPosition(salePed, false)
	TaskSetBlockingOfNonTemporaryEvents(salePed, false)
	ClearPedTasks(salePed)
	TaskWanderStandard(salePed, 10.0, 10)
	SetPedAsNoLongerNeeded(salePed)
    SetEntityInvincible(salePed, false)
    Wait(2000)
	DeletePed(salePed)
	salePed = nil
end

--start selling 
RegisterNetEvent("lusty94_oxy:client:StartSelling", function()
    if saleStarted then
            SendNotify(Config.Language.Notifications.SellingErrorName, 'error', 5000)
        return
    end
    QBCore.Functions.TriggerCallback('lusty94_oxy:server:StartSelling', function(canSell)
        if canSell then
            startSale()
            busy = false
            LockInventory(false)
        else
            busy = false
            LockInventory(false)
        end
    end)
end)




--sell oxy
RegisterNetEvent('lusty94_oxy:client:sellOxy', function()
    local playerPed = PlayerPedId()
    if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
    else
        QBCore.Functions.TriggerCallback('lusty94_oxy:get:Oxy', function(oxyItem)  
            if oxyItem then
                if saleCompleted then 
                    return 
                end
                if #(GetEntityCoords(playerPed) - GetEntityCoords(salePed)) < 2.0 then
                    busy = true
                    LockInventory(true)
                    saleCompleted = true
                    PlayAmbientSpeech1(salePed, 'GENERIC_HI', 'SPEECH_PARAMS_STANDARD')
                    if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(salePed) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(salePed, 'salePed') end
                    FreezeEntityPosition(playerPed, true)
                    local playerDict = Config.Animations.SellOxy.Player.Dict
                    local playerAnim = Config.Animations.SellOxy.Player.Anim
                    local playerFlag = Config.Animations.SellOxy.Player.Flag
                    local playerProp = Config.Animations.SellOxy.Player.Prop
                    local playerBone = Config.Animations.SellOxy.Player.Bone
                    local playerPos = Config.Animations.SellOxy.Player.Pos
                    local playerRot = Config.Animations.SellOxy.Player.Rot
                    lib.requestAnimDict(playerDict, 5000)
                    local coords = GetEntityCoords(playerPed)
                    pillsProp = CreateObject(playerProp, coords, true, false, false)
                    AttachEntityToEntity(pillsProp, playerPed, GetPedBoneIndex(playerPed, playerBone), playerPos, playerRot, true, true, false, false, 1, true)
                    TaskPlayAnim(playerPed, playerDict, playerAnim, 2.0, -1.0, 1.0, 11, playerFlag, 0, 0, 0)
                    Wait(1000)
                    RemoveBlip(saleBlip)
                    saleBlip = nil        
                    if math.random(1,100) <= Config.InteractionLocations.Settings.SaleChance then
                        TriggerServerEvent('lusty94_oxy:server:sellOxy')
                        PlayAmbientSpeech1(salePed, "Generic_Thanks", "Speech_Params_Force_Shouted_Clear")
                        local sellerCoords = GetEntityCoords(salePed)
                        local pedDict = Config.Animations.SellOxy.Ped.Dict
                        local pedAnim = Config.Animations.SellOxy.Ped.Anim
                        local pedFlags = Config.Animations.SellOxy.Ped.Flag
                        local pedProp = Config.Animations.SellOxy.Ped.Prop
                        local pedBone = Config.Animations.SellOxy.Ped.Bone
                        local pedPos = Config.Animations.SellOxy.Ped.Pos
                        local pedRot = Config.Animations.SellOxy.Ped.Rot
                        cashProp = CreateObject(pedProp, coords, true, false, false)
                        lib.requestAnimDict(pedDict, 5000)
                        AttachEntityToEntity(cashProp, salePed, GetPedBoneIndex(salePed, pedBone), pedPos, pedRot, true, true, false, false, 1, true)
                        TaskPlayAnim(salePed, pedDict, pedAnim, 2.0, -1.0, 1.0, 11, pedFlags, 0, 0, 0)
                    else
                        PlayAmbientSpeech1(salePed, "GENERIC_INSULT_HIGH", "Speech_Params_Force_Shouted_Clear")
                        SendNotify(Config.Language.Notifications.SaleFailedName, 'error', 5000)
                        if math.random(1,100) <= Config.InteractionLocations.PoliceSettings.CallChance then
                            alertPoliceOxy()
                        end
                    end
                    saleLocation:destroy()
                    if saleCounter == Config.InteractionLocations.Settings.MaxSales then
                        SendNotify(Config.Language.Notifications.NoMoreRequestsName, 'error', 5000)
                        saleStarted = false
                        saleCounter = 0
                    end
                    Wait(1000)
                    DeleteObject(cashProp)
                    DeleteObject(pillsProp)
                    ClearPedTasks(salePed)
                    ClearPedTasks(playerPed)
                    busy = false
                    LockInventory(false)
                    FreezeEntityPosition(playerPed, false)
                    saleActive = false
                    saleCompleted = false
                    deleteSalePed()
                end
            else
                ClearPedTasks(playerPed)
                SendNotify(Config.Language.Notifications.MissingItemsName, 'error', 5000)
            end
        end)
    end
end)








---------------------------< DONT TOUCH >-----------------------

-- function to lock inventory to prevent exploits
function LockInventory(toggle) -- big up to jim for how to do this
	if toggle then
        LocalPlayer.state:set("inv_busy", true, true)
    else 
        LocalPlayer.state:set("inv_busy", false, true)
    end
end




--dont touch
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        deliveryStarted = false
        deliveryActive = false
        deliveryCompleted = false
        deliveryCounter = 0
        saleStarted = false
        saleActive = false
        saleCompleted = false
        saleCounter = 0
        busy = false
        LockInventory(false)
        if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(deliveryPed) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(deliveryPed, 'deliveryPed') end
        if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(salePed) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(salePed, 'salePed') end
        if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(missionPed) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(missionPed, 'missionPed') end
        DeletePed(missionPed)               
        if DoesEntityExist(salePed) then DeletePed(salePed) end
        if DoesEntityExist(deliveryPed) then DeletePed(deliveryPed) end         
        print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Oxy V2.0.2 Stopped Successfully ^5--<^3!^5>--^7')
	end
end)