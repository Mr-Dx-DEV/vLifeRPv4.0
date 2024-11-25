local StartedChop = false
local DropOffCoords = nil
local LicensePlate = nil
local vehicle = nil
local cooldown = false
local VehicleBlipToScrap = false
local GarageLocation = nil
local StartedScrappingRun = false
local StartedJob = false
local AllConfigCars = 0
DisableAllControlActionsBool = false
Stollenvehicle = 0
TakingToGarage = false
VehicleToStore = nil
SetTracker = false
if Config.UseSharedVehicleCars and Framework == "QBCore" then
else
    for _, _ in pairs(Config.VehicleList) do
        AllConfigCars = AllConfigCars + 1
    end
end

local VehicleParts = {
	{Part = Config.LangT["FrontDriverWheel"],	    Index = "wheel_lf",     coords = false,	    Removed = false},
	{Part = Config.LangT["BackDriverWheel"],	    Index = "wheel_lr",     coords = false,		Removed = false},
    {Part = Config.LangT["PassengerBackWheel"],	    Index = "wheel_rr",	    coords = false,	    Removed = false},
	{Part = Config.LangT["PassengerFrontWheel"],	Index = "wheel_rf",     coords = false,		Removed = false},
    {Part = Config.LangT["Hood"],			        Index = "overheat",     coords = false,	    Removed = false},
    {Part = Config.LangT["FrontDriverDoor"],	    Index = "door_dside_f", coords = false,	    Removed = false},
	{Part = Config.LangT["BackDriverDoor"],	        Index = "door_dside_r", coords = false,	    Removed = false},
    {Part = Config.LangT["Trunk"],			        Index = "boot",         coords = false,     Removed = false},
	{Part = Config.LangT["PassengerFrontDoor"],	    Index = "door_pside_f", coords = false,	    Removed = false},
	{Part = Config.LangT["PassengerBackDoor"],	    Index = "door_pside_r", coords = false,	    Removed = false},
}

local function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

local function DeleteBlips()
    if DoesBlipExist(blip) then
        RemoveBlip(blip)
    end
    if DoesBlipExist(blip2) then
        RemoveBlip(blip2)
    end
    if DoesBlipExist(GarageBlip) then
        RemoveBlip(GarageBlip)
    end
end

local function CreateBlip(x, y)
    DeleteBlips()
    if Config.Debug then
        SetNewWaypoint(x, y)
    end
    x = x + math.random(-75.0, 75.0)
    y = y + math.random(-75.0, 75.0)
    blip = AddBlipForRadius(x, y, 0.0, 100.0)
    SetBlipSprite(blip,9)
    SetBlipColour(blip,49)
    SetBlipAlpha(blip,75)
end

local function FinishDropOffBlip()
	DeleteBlips()
	blip2 = AddBlipForCoord(DropOffCoords.x, DropOffCoords.y, DropOffCoords.z)
    SetBlipSprite(blip2, Config.ChopBlip)
    SetBlipColour(blip2, Config.ChopBlipColor)
    SetBlipAlpha(blip2, 200)
    SetBlipDisplay(blip2, 4)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Chop Location")
    EndTextCommandSetBlipName(blip2)
end

local function TakeToGarageBlip()
	DeleteBlips()
	GarageBlip = AddBlipForCoord(GarageLocation.x, GarageLocation.y, GarageLocation.z)
    SetBlipSprite(GarageBlip, Config.DropOffBlip)
    SetBlipColour(GarageBlip, Config.DropOffBlipColor)
    SetBlipAlpha(GarageBlip, 200)
    SetBlipDisplay(GarageBlip, 4)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Garage")
    EndTextCommandSetBlipName(GarageBlip)
end

local function DrawText3Ds(x, y, z, text)
    if Config.DrawtextStyle == "Purupe&White" then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        SetDrawOrigin(x,y,z, 0)
        DrawText(0.0, 0.0)
        local factor = (string.len(text)) / 370
        DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 90)
        ClearDrawOrigin()
    else
        local coords = vector3(x, y, z)
        local onScreen, worldX, worldY = World3dToScreen2d(coords.x, coords.y, coords.z)
        local camCoords = GetGameplayCamCoord()
        local scale = 200 / (GetGameplayCamFov() * #(camCoords - coords))
        if onScreen then
            SetTextScale(1.0, 0.5 * scale)
            SetTextFont(4)
            SetTextColour(255, 255, 255, 255)
            SetTextEdge(2, 0, 0, 0, 150)
            SetTextProportional(1)
            SetTextOutline()
            SetTextCentre(1)
            BeginTextCommandDisplayText("STRING")
            AddTextComponentSubstringPlayerName(text)
            EndTextCommandDisplayText(worldX, worldY)
        end
    end
end

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

local function PugLoadModel(model)
    if HasModelLoaded(model) then return end
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end

local function PugGetClosestVehicle(coords)
    local ped = PlayerPedId()
    local vehicles = GetGamePool('CVehicle')
    local closestDistance = -1
    local closestVehicle = -1
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    for i = 1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = #(vehicleCoords - coords)

        if closestDistance == -1 or closestDistance > distance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end
    return closestVehicle, closestDistance
end

function PugSpawnVehicle(model, cb, coords, isnetworked, teleportInto)
    local ped = PlayerPedId()
    model = type(model) == 'string' and GetHashKey(model) or model
    if not IsModelInCdimage(model) then return end
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    isnetworked = isnetworked == nil or isnetworked
    PugLoadModel(model)
    local veh = CreateVehicle(model, coords.x, coords.y, coords.z, coords.w, isnetworked, false)
    local netid = NetworkGetNetworkIdFromEntity(veh)
    SetVehicleHasBeenOwnedByPlayer(veh, true)
    SetNetworkIdCanMigrate(netid, true)
    SetVehicleNeedsToBeHotwired(veh, false)
    SetVehRadioStation(veh, 'OFF')
    SetVehicleFuelLevel(veh, 100.0)
    SetModelAsNoLongerNeeded(model)
    if teleportInto then TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1) end
    if cb then cb(veh) end
end

local function Refresh()
    for k, _ in pairs(VehicleParts) do
        VehicleParts[k].Removed = false
    end
    SetTracker = false
	vehicle = nil
	StartedChop = false
    StartedJob = false
    TakingToGarage = false
    StartedScrappingRun = false
    Stollenvehicle = nil
    DeleteBlips()
end

local function ChopDownStolenVehicle()
	local ped = PlayerPedId()
	vehicle = GetVehiclePedIsIn(ped, false)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if GetVehicleNumberPlateText(veh) ~= LicensePlate then
        ChoppingNotify(Config.LangT["WrongVehicle"], 'error')
	else 
        ChoppingNotify(Config.LangT["Removeall"])
        for k, _ in pairs(VehicleParts) do 
            local pos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, VehicleParts[k].Index))
            VehicleParts[k].coords = pos
        end
        StartedChop = true
        TriggerEvent("Pug:client:StartChoppingLoopStart")
        TaskLeaveVehicle(PlayerPedId(), vehicle, 1)
		DeleteBlips()
    end
end

RegisterNetEvent("Pug:client:DisableKeysChopping", function()
    DisableAllControlActionsBool = true
    while true do
        Wait(0)
        if DisableAllControlActionsBool then
            DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 188, true) -- up arrow
            DisableControlAction(0, 187, true) -- down Arrow
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, 21,true) -- disable sprint
            DisableControlAction(0, 30, true) -- disable moving forward
            DisableControlAction(0, 31, true) -- disable moving backwards
            DisableControlAction(0, 19, true) -- Third Eye
			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?
			DisableControlAction(0, 288, true) -- Disable radial menu
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(2, 36, true) -- Disable going stealth
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
        else
            break
        end
    end
end)

local function FinishChopAnimation(Part, Animation, BarText1, BarText2, Prop, PropPos, iPart)
    VehicleParts[iPart].Removed = true
    local ped = PlayerPedId()
    TriggerEvent("Pug:client:DisableKeysChopping")
    if Part == "overheat" then
        Wait(1600)
    end
    if Part == "wheel_lf" or Part == "wheel_lr" or Part == "wheel_rf" or Part == "wheel_rr" then
        TriggerEvent('InteractSound_CL:PlayOnOne', "impactdrill", 0.15)
    end
    if Animation == "mechanic3" then
        loadAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        TaskPlayAnim(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 2.0, 2.0, 4400, 0, 0, false, false, false)
    elseif Animation == "mechanic" then
        loadAnimDict("mini@repair")
        TaskPlayAnim(ped, "mini@repair", "fixing_a_ped", 2.0, 2.0, 4400, 51, 0, false, false, false)
    end
    ChoppingNotify(BarText1, 'success')
    Wait(4400)
    ClearPedTasks(ped)
    if BarText2 then
        ChoppingNotify(BarText2, 'success')
        TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_WELDING', 0, true)
        Wait(4000)
    end
    if Prop then
        local DoorId = nil
        if Part == "door_dside_f" then DoorId = 0 elseif Part == "door_dside_r" then DoorId = 2 elseif Part == "door_pside_f" then DoorId = 1 elseif Part == "door_pside_r" then DoorId = 3 elseif Part == "overheat" then DoorId = 4 end
        if DoorId then
            SetVehicleDoorBroken(vehicle,DoorId,true)
        end
        ClearPedTasksImmediately(ped)
        ItemProp = CreateObject(GetHashKey(Prop), 0, 0, 0, true, true, true)  
        AttachEntityToEntity(ItemProp, ped, GetPedBoneIndex(ped, 60309), PropPos.x, PropPos.y, PropPos.z, PropPos.x2, PropPos.y2, PropPos.z2, true, true, false, true, 1, true)
        loadAnimDict("anim@heists@box_carry@")
        TaskPlayAnim(ped, "anim@heists@box_carry@", "idle", 2.0, 2.0, 3000, 51, 0, false, false, false)
        DisableAllControlActionsBool = false
        if Part == "wheel_lf" then
            -- SetVehicleTyreBurst(vehicle, 0, true, 1000.0)
            -- Wait(1000)
            -- SetVehicleTyreBurst(vehicle, 0, false, 1000.0)
            BreakOffVehicleWheel(vehicle, 0, true, true, true, false)
        elseif Part == "wheel_lr" then
            -- SetVehicleTyreBurst(vehicle, 4, true, 1000.0)
            -- Wait(1000)
            -- SetVehicleTyreBurst(vehicle, 4, false, 1000.0)
            BreakOffVehicleWheel(vehicle, 2, true, true, true, false)
        elseif Part == "wheel_rf" then
            -- SetVehicleTyreBurst(vehicle, 1, true, 1000.0)
            -- Wait(1000)
            -- SetVehicleTyreBurst(vehicle, 1, false, 1000.0)
            BreakOffVehicleWheel(vehicle, 1, true, true, true, false)
        elseif Part == "wheel_rr" then 
            -- SetVehicleTyreBurst(vehicle, 5, true, 1000.0)
            -- Wait(1000)
            -- SetVehicleTyreBurst(vehicle, 5, false, 1000.0)
            BreakOffVehicleWheel(vehicle, 3, true, true, true, false)
        end
        Wait(2000)
        ClearPedTasks(ped)
        DetachEntity(ItemProp, 1, true)
        DeleteEntity(ItemProp)
        DeleteObject(ItemProp)
        SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
        ItemProp = nil
    end
    if Part == "boot" then
        SetVehicleDoorBroken(vehicle,5,true)
        DisableAllControlActionsBool = false
    end
    ChoppingNotify(Config.LangT["Finished"], 'success')
    TriggerServerEvent('Pug:Criminals:server:GivePart', Part)
end

local function ChopAnimation(iPart)
	if VehicleParts[iPart].Index == "wheel_lf" or VehicleParts[iPart].Index == "wheel_lr" or VehicleParts[iPart].Index == "wheel_rf" or VehicleParts[iPart].Index == "wheel_rr" then
        local PropPos = {
            x = 0.00,
            y = 0.2,
            z = 0.30,
            x2 = -125.0,
            y2 = 100.0,
            z2 = 0.0,
        }
        FinishChopAnimation(VehicleParts[iPart].Index, "mechanic3", Config.LangT["WheelBar"], false, "imp_prop_impexp_tyre_01b", PropPos, iPart)
	elseif VehicleParts[iPart].Index == "door_dside_f" or VehicleParts[iPart].Index == "door_dside_r" or VehicleParts[iPart].Index == "door_pside_f" or VehicleParts[iPart].Index == "door_pside_r"  then
        local PropPos = {
            x = 0.17,
            y = -0.15,
            z = 0.9,
            x2 = -115.0,
            y2 = 180.0,
            z2 = -21.0,
        }
        local Index = 0
        if VehicleParts[iPart].Index == "door_dside_r" then
            Index = 2
        elseif VehicleParts[iPart].Index == "door_pside_f" then
            Index = -1
        elseif VehicleParts[iPart].Index == "door_pside_r" then
            Index = 1
        end
		TaskOpenVehicleDoor(PlayerPedId(), vehicle,3000,Index,10)
        Wait(500)
        FinishChopAnimation(VehicleParts[iPart].Index, "mechanic", Config.LangT["DoorBar1"], Config.LangT["DoorBar2"], "imp_prop_impexp_car_door_04a", PropPos, iPart)
	elseif VehicleParts[iPart].Index == "boot" then
        local PropPos = {
            x = 0.18,
            y = -0.07,
            z = 0.25,
            x2 = -210.10,
            y2 = 110.0,
            z2 = 0.0,
        }
		SetVehicleDoorOpen(vehicle, 5, false, true)
        Wait(2400)
        FinishChopAnimation(VehicleParts[iPart].Index, "mechanic", Config.LangT["TrunkBar1"], Config.LangT["TrunkBar2"], "imp_prop_impexp_trunk_01a", PropPos, iPart)
	elseif VehicleParts[iPart].Index == "overheat" then
        local PropPos = {
            x = 0.51,
            y = 0.17,
            z = 0.07,
            x2 = -50.0,
            y2 = 290.0,
            z2 = 0.0,
        }
		SetVehicleDoorOpen(vehicle, 4, false, true)
		FinishChopAnimation(VehicleParts[iPart].Index, "mechanic", Config.LangT["HoodBar1"], Config.LangT["HoodBar2"], "imp_prop_impexp_bonnet_02a", PropPos, iPart)
	end
end


function GetStollenvehicle()
    return Stollenvehicle
end

RegisterNetEvent("Pug:client:RunDropOffChopLoop", function(coords)
    while true do
        Wait(3)
        if StartedScrappingRun then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dis = #(pos - vector3(coords.x, coords.y, coords.z))
            if dis <= 8 then
                if dis <= 8 and IsPedInAnyVehicle(ped) and not StartedChop then
                    DrawText3Ds(coords.x, coords.y, coords.z, Config.LangT["chop"])
                    if IsControlJustPressed(0, 38) then
                        ChopDownStolenVehicle()
                        break
                    end
                end
            else
                Wait(700)
            end
        else
            break
        end
    end
end)

local function findVehFromPlateAndLocate(plate)
    local gameVehicles = GetGamePool('CVehicle')
    for i = 1, #gameVehicles do
        local vehicle = gameVehicles[i]
        if DoesEntityExist(vehicle) then
            if GetVehicleNumberPlateText(vehicle) == plate then
                return true
            end
        end
    end
end

RegisterNetEvent("Pug:client:BeginChoppingRun", function(vehicle, x ,y, z, w, LicensePlate)
    while VehicleBlipToScrap do
        Wait(5)
        if VehicleBlipToScrap then
            local pos = GetEntityCoords(PlayerPedId())
            local dist = #(pos - vector3(Config.VehicleCoords[randomCoords].x, Config.VehicleCoords[randomCoords].y, Config.VehicleCoords[randomCoords].z))
            if dist <= 60 then
                if findVehFromPlateAndLocate(LicensePlate) then 
                    Wait(2)
                else
                    Wait(1000)
                    local coords = vector4(x, y, z, w)
                    PugSpawnVehicle(vehicle, function(veh)
                        Stollenvehicle = veh
                        SetEntityHeading(veh, coords.w)
                        SetVehicleEngineOn(veh, false, false)
                        SetVehicleOnGroundProperly(veh)
                        SetVehicleNeedsToBeHotwired(veh, false)
                        SetVehicleColours(veh, 0, 0)
                        SetVehicleNumberPlateText(veh, LicensePlate)
                        SetVehicleFuelLevel(veh, 100.0)
                        for i = 0, 5 do
                            SetVehicleDoorShut(veh, i, true)
                        end
                    end, coords, true)
                    Wait(1000)
                end -- this if the vehicles spawn like crazy and scuff out
            end
            Wait(1)
            if dist <= 4 then
                local ped = PlayerPedId()
                local entering = GetVehiclePedIsTryingToEnter(PlayerPedId())
                local VehPedIn = GetVehiclePedIsIn(PlayerPedId())
                if entering ~= 0 then
                    if Config.SetVehiclesLocked then
                        SetVehicleDoorsLocked(entering, 2)
                    end
                end
                local model = GetDisplayNameFromVehicleModel(GetEntityModel(entering))
                if Config.UseSharedVehicleCars then
                    if Framework == "QBCore" then
                        model = FWork.Shared.Vehicles[VehicleToStore]["name"]
                    end
                end
                if math.random(1,100) <= Config.ChancePoliceAraCalled then
                    if string.lower(tostring(model)) == "carnotfound" then
                        model = VehicleToStore
                    end
                    CallPoliceForCarJack(LicensePlate, model, Stollenvehicle)
                end
                if Stollenvehicle ~= nil then
                    if Config.SetVehiclesLocked then
                        SetVehicleDoorsLocked(Stollenvehicle, 2)
                    end
                end
                Wait(5000)
                ChoppingNotify(Config.LangT["FoundVehicle"], 'success')
                Wait(10000)
                ChoppingNotify(Config.LangT["DropOff"], 'primary')
                TakeToGarageBlip()
                SetNewWaypoint(GarageLocation.x, GarageLocation.y)
                TakingToGarage = true
                TriggerEvent("Pug:client:TakeCarToGarageLoop")
                VehicleBlipToScrap = false
            end
        else
            break
        end
    end
end)

RegisterNetEvent('Pug:Criminals:JobStart', function()
    if not StartedJob then
        StartedJob = true
        if Config.UseSharedVehicleCars and Framework == "QBCore" then
            randomVeh = math.random(1, Config.VehicleList)
            if Config.Debug then
                print(randomVeh, 'random vehicle')
            end
            randomCoords = math.random(1, #Config.VehicleCoords)
            local num = 0
            for k, _ in pairs(FWork.Shared.Vehicles) do
                num = num + 1
                if num == randomVeh then
                    if FWork.Shared.Vehicles[k]["shop"] == "boat" or FWork.Shared.Vehicles[k]["shop"] == "air" or FWork.Shared.Vehicles[k]["shop"] == "police" then
                        if FWork.Shared.Vehicles[k]["shop"] == "police" then
                            if SetTracker then
                                SetTracker = false
                            else
                                SetTracker = true
                                if Config.Debug then
                                    print'start tracker'
                                end
                                TriggerEvent("Pug:client:DoChopTrackerLoop")
                            end
                            if math.random(1, 100) <= Config.GetCopCarChanceIfLandsOnCopCar then
                                VehicleToStore = k
                            else
                                VehicleToStore = k
                                if Config.Debug then
                                    print(VehicleToStore, 'first')
                                end
                                while FWork.Shared.Vehicles[VehicleToStore]["shop"] == "boat" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "air" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "police" do 
                                    Wait(100)
                                    if Config.Debug then
                                        print(print(VehicleToStore, 'was this'))
                                    end
                                    if FWork.Shared.Vehicles[VehicleToStore]["shop"] == "boat" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "air" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "police" then
                                        for i, _ in pairs(FWork.Shared.Vehicles) do
                                            VehicleToStore = i
                                            if FWork.Shared.Vehicles[VehicleToStore]["shop"] == "boat" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "air" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "police" then
                                                if Config.Debug then
                                                    print(VehicleToStore, 'changed to this')
                                                end
                                            else
                                                if Config.Debug then
                                                    print(VehicleToStore, 'changed to this')
                                                end
                                                break
                                            end
                                        end
                                    else
                                        break
                                    end
                                end
                            end
                        else
                            VehicleToStore = k
                            while FWork.Shared.Vehicles[VehicleToStore]["shop"] == "boat" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "air" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "police" do 
                                Wait(100)
                                if Config.Debug then
                                    print(print(VehicleToStore, 'was this'))
                                end
                                if FWork.Shared.Vehicles[VehicleToStore]["shop"] == "boat" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "air" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "police" then
                                    for i, _ in pairs(FWork.Shared.Vehicles) do
                                        VehicleToStore = i
                                        if FWork.Shared.Vehicles[VehicleToStore]["shop"] == "boat" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "air" or FWork.Shared.Vehicles[VehicleToStore]["shop"] == "police" then
                                            if Config.Debug then
                                                print(VehicleToStore, 'changed to this')
                                            end
                                        else
                                            if Config.Debug then
                                                print(VehicleToStore, 'changed to this')
                                            end
                                            break
                                        end
                                    end
                                else
                                    break
                                end
                            end
                        end
                    else
                        VehicleToStore = k
                    end
                    if FWork.Shared.Vehicles[VehicleToStore]["category"] == "A Class" or FWork.Shared.Vehicles[VehicleToStore]["category"] == "Motorcycle +" or FWork.Shared.Vehicles[VehicleToStore]["category"] == "S Class" then
                        if SetTracker then
                            SetTracker = false
                        else
                            SetTracker = true
                            TriggerEvent("Pug:client:DoChopTrackerLoop")
                        end
                    end
                end
            end
        else
            randomVeh = math.random(1, AllConfigCars)
            local num2 = 0
            for k, _ in pairs(Config.VehicleList) do
                num2 = num2 + 1
                if num2 == randomVeh then
                    VehicleToStore = k
                    break
                end
            end
            randomCoords = math.random(1, #Config.VehicleCoords)
            if Config.Debug then
                print(randomVeh, 'random vehicle #')
                print(VehicleToStore, 'random vehicle name')
            end
            if Config.VehicleList[VehicleToStore].tracker then
                if Config.Debug then
                    print'tracker sent'
                end
                SetTracker = true
                TriggerEvent("Pug:client:DoChopTrackerLoop")
            end
        end
        Wait(200)
        SpawnVehicle(VehicleToStore, Config.VehicleCoords[randomCoords].x, Config.VehicleCoords[randomCoords].y, Config.VehicleCoords[randomCoords].z, Config.VehicleCoords[randomCoords].w)
    else
        ChoppingNotify(Config.LangT["StartedChop"], 'error')
    end
end)
function cooldownCheck()
    return cooldown
end

RegisterNetEvent("Pug:client:GotInStoredVehicleTimeToScrap", function(Plate)
    local randomLoc = math.random(1,#Config.DeliveryCoords)
    LicensePlate = Plate
    DropOffCoords = vector4(Config.DeliveryCoords[randomLoc].x, Config.DeliveryCoords[randomLoc].y, Config.DeliveryCoords[randomLoc].z, Config.DeliveryCoords[randomLoc].w)
    StartedScrappingRun = true
    TriggerEvent("Pug:client:RunDropOffChopLoop",DropOffCoords)
    FinishDropOffBlip()
end)

function SpawnVehicle(vehicle, x ,y, z, w)
    if GetGarageLocation() ~= nil then
        GarageLocation = GetGarageLocation()
        local coords = vector4(x, y, z, w)
        Wait(200)
        PugSpawnVehicle(vehicle, function(veh)
            Stollenvehicle = veh
            SetEntityHeading(veh, coords.w)
            SetVehicleEngineOn(veh, false, false)
            SetVehicleOnGroundProperly(veh)
            SetVehicleNeedsToBeHotwired(veh, false)
            SetVehicleColours(veh, 0, 0)
            SetVehicleFuelLevel(veh, 100.0)
            for i = 0, 5 do
                SetVehicleDoorShut(veh, i, true)
            end
            LicensePlate = GetVehicleNumberPlateText(veh)
            ChoppingNotify(Config.LangT["EmailNotification"], 'success')
            ClearPedTasksImmediately(PlayerPedId())
            Wait(math.random(10000,25000))
            PlaySound(-1, "slow", "SHORT_PLAYER_SWITCH_SOUND_SET", 0, 0, 1)
            local model = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
            if Config.UseSharedVehicleCars then
                if Framework == "QBCore" then
                    model = FWork.Shared.Vehicles[VehicleToStore]["name"]
                end
            end
            if string.lower(tostring(model)) == "carnotfound" then
                model = VehicleToStore
            end
            ChoppingEmail(model, LicensePlate)
            VehicleBlipToScrap = true
            CreateBlip(coords.x, coords.y)
            TriggerEvent("Pug:client:BeginChoppingRun", vehicle, x ,y, z, w, LicensePlate)
            Wait(Config.CoolDown * 60000)
            if not Stollenvehicle then
                SetTracker = false
                VehicleBlipToScrap = false
                Stollenvehicle = 0
                if DoesBlipExist(blip) then
                    RemoveBlip(blip)
                end
                if DoesBlipExist(blip2) then
                    RemoveBlip(blip2)
                end
            end
            StartedJob = false
        end, coords, true)
    end
end

RegisterNetEvent("Pug:client:StartChoppingLoopStart", function()
    local RemovedCarPart = false
    local DrawnText = false
    local NearestDraw = "start"
	while StartedChop do
		Wait(0)
		if StartedChop then
			FreezeEntityPosition(vehicle,true)
			for k, _ in pairs(VehicleParts) do
				if not VehicleParts[k].Removed and DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(-1)) then
                    if NearestDraw == k or NearestDraw == "start" then
                        if VehicleParts[k].coords.x == 0.0 then
                        else
                            NearestDraw = k
                            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), VehicleParts[k].coords.x, VehicleParts[k].coords.y, VehicleParts[k].coords.z, true ) < 1.5 then
                                DrawText3Ds(VehicleParts[k].coords.x,VehicleParts[k].coords.y,VehicleParts[k].coords.z,Config.LangT["RemoveAll"]..VehicleParts[k].Part)
                                if(IsControlJustPressed(1, 38)) then
                                    ClearPedTasksImmediately(PlayerPedId())
                                    local WalkToCoords = vector3(VehicleParts[k].coords.x, VehicleParts[k].coords.y, VehicleParts[k].coords.z)
                                    if VehicleParts[k].Index == "wheel_lf" or VehicleParts[k].Index == "wheel_lr" or VehicleParts[k].Index == "wheel_rf" or VehicleParts[k].Index == "wheel_rr" then
                                        if #(GetEntityCoords(PlayerPedId()) - vector3(VehicleParts[k].coords.x, VehicleParts[k].coords.y, VehicleParts[k].coords.z)) >= 0.9 then
                                            TaskGoToCoordAnyMeans(PlayerPedId(), vector3(VehicleParts[k].coords.x, VehicleParts[k].coords.y, VehicleParts[k].coords.z), 1.0, 0, 0, 786603, 0xbf800000)
                                            Wait(500)
                                            ClearPedTasks(PlayerPedId())
                                        end
                                        TaskTurnPedToFaceCoord(PlayerPedId(), WalkToCoords)
                                        Wait(800)
                                        ClearPedTasks(PlayerPedId())
                                        ChopAnimation(k)
                                        NearestDraw = "start"
                                    else
                                        TaskTurnPedToFaceCoord(PlayerPedId(), WalkToCoords)
                                        Wait(800)
                                        ClearPedTasksImmediately(PlayerPedId())
                                        ChopAnimation(k)
                                        NearestDraw = "start"
                                    end
                                end
                                if not RemovedCarPart then
                                    RemovedCarPart = true
                                end
                            end
                        end
                    end
				end
			end
			if GetVehiclePedIsIn(GetPlayerPed(-1)) == vehicle and RemovedCarPart then
                if not DrawnText then
                    DrawTextChopping(Config.LangT["destroy"])
                    DrawnText = true
                end
                if IsControlJustPressed(1, 38) then
                    HideDrawTextChopping()
                    TriggerEvent("Pug:client:DisableKeysChopping")
                    loadAnimDict("mini@repair")
                    TaskPlayAnim(PlayerPedId(), 'mini@repair' ,'fixing_a_ped' ,8.0, -8.0, 10000, 51, 0, false, false, false)
                    ChoppingNotify(Config.LangT["Destroying"]..' in', 'success')
                    Wait(1000)
                    ChoppingNotify(Config.LangT["3"], 'error')
                    Wait(1000)
                    ChoppingNotify(Config.LangT["2"], 'error')
                    Wait(1000)
                    ChoppingNotify(Config.LangT["1"], 'error')
                    ClearPedTasks(PlayerPedId())
                    TaskLeaveVehicle(PlayerPedId(), vehicle, 1)
                    Wait(1500)
                    StartedScrappingRun = false
                    DisableAllControlActionsBool = false
                    Wait(1000)
                    TriggerEvent("FullyDeleteChoppingVehicle", vehicle)
                    RemovedCarPart = false
                    local payy = math.random(Config.PayForScrappingCarMin, Config.PayForScrappingCarMax)
                    FullyChoppedVehicleFunction(payy)
                    DropOffCoords = nil
                    Refresh()
                    -- - local luck = math.random(1, 4) -- This is for my personal server (ignore this)
                    -- TriggerServerEvent("Pug:server:GiveCriminalRep", luck) -- This is for my personal server (ignore this)
                    -- TriggerServerEvent("Pug:server:GiveGroupMoney", payy) -- This is for my personal server (ignore this)
                    break
                end
            else
                if DrawnText then
                    HideDrawTextChopping()
                    DrawnText = false
                end
			end
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(-1)),DropOffCoords.x, DropOffCoords.y, DropOffCoords.z,true) > 50 and StartedChop then
                TriggerEvent("FullyDeleteChoppingVehicle", vehicle)
                Refresh()
                ChoppingNotify(Config.LangT["LeftVehicle"], 'error')
                break
			end
        else
            break
		end
	end
end)

local function round(x)
    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

RegisterNetEvent("Pug:client:TakeCarToGarageLoop", function()
    TriggerEvent("Pug:client:ShowHealthUI")
    local Ped = PlayerPedId()
	while TakingToGarage do
		Wait(100)
		if TakingToGarage then
            if #(GetEntityCoords(PlayerPedId()) - vector3(GarageLocation.x, GarageLocation.y, GarageLocation.z)) < 5.0 then
                if IsPedInAnyVehicle(Ped) then
                    local BodyHealth = GetVehicleBodyHealth(Stollenvehicle)
                    local PlayerCar = GetVehiclePedIsIn(Ped)
                    if PlayerCar == Stollenvehicle then
                        if not SetTracker then
                            TriggerServerEvent("Pug:server:StoreStolenCarInGarage", VehicleToStore, round(BodyHealth), LicensePlate, Stollenvehicle)
                            StartedJob = false
                            TakingToGarage = false
                            Stollenvehicle = 0
                            VehicleToStore = nil
                            GarageLocation = nil
                            SetTracker = false
                            DeleteBlips()
                            SetVehicleForwardSpeed(PlayerCar, 0)
                            ChoppingNotify(Config.LangT["StoringVehicle"], 'success')
                            TriggerEvent("Pug:client:DisableKeysChopping")
                            Wait(7000)
                            DisableAllControlActionsBool = false
                        else
                            ChoppingNotify(Config.LangT["LoseHeat"], 'error')
                            Wait(15000)
                        end
                    end
                end
			end
            Wait(20)
            if Stollenvehicle == 0 then

            else
                local VehCoords = GetEntityCoords(Stollenvehicle)
                if GetDistanceBetweenCoords(GetEntityCoords(Ped), VehCoords.x, VehCoords.y, VehCoords.z,true) > 150.0 then
                    TriggerEvent("FullyDeleteChoppingVehicle", vehicle)
                    Refresh()
                    ChoppingNotify(Config.LangT["LeftVehicle"], 'error')
                end
            end
        else
            TakingToGarage = false
            break
		end
	end
end)

RegisterNetEvent("Pug:client:ShowHealthUI", function()
    local Ped = PlayerPedId()
	while TakingToGarage do
        Wait(2)
        if TakingToGarage then
            if IsPedInAnyVehicle(Ped) then
                local Health = GetVehicleBodyHealth(Stollenvehicle)
                local cost = round(1000 - round(Health))
                local RepairPrice = round(cost * Config.VehicleRepairMultiplier)
                local PyCar = GetVehiclePedIsIn(Ped)
                if PyCar == Stollenvehicle then
                    if RepairPrice == 5 then
                        RepairPrice = 0
                    end
                    Draw2DText("Repair Cost: ~r~ $"..RepairPrice.." ~w~", 4, {255, 255, 255}, 0.4, 0.50, 0.888 + 0.050)
                    Draw2DText("Body health: "..round(Health), 4, {255, 255, 255}, 0.4, 0.50, 0.888 + 0.075)
                end
                if #(GetEntityCoords(PlayerPedId()) - vector3(GarageLocation.x, GarageLocation.y, GarageLocation.z)) < 25.0 then
                    DrawMarker(1, GarageLocation.x, GarageLocation.y, GarageLocation.z-1, 0.1, 0.0, 0.0, 0, 0.0, 0.0, 2.5, 2.5, 2.5, Config.DrawMarkerColor.R, Config.DrawMarkerColor.G, Config.DrawMarkerColor.B, 200, false, true, 2, false, false, false, false)
                end
            end
        else
            TakingToGarage = false
            break
        end
    end
end)

RegisterNetEvent("Pug:client:DoChopTrackerLoop", function()
    local Ped = PlayerPedId()
	while SetTracker do
        Wait(12000)
        if SetTracker then
            if IsPedInAnyVehicle(Ped) then
                local PyCar = GetVehiclePedIsIn(Ped)
                if PyCar == Stollenvehicle then
                    if TakingToGarage then
                        if VehicleToStore ~= nil then
                            TriggerEvent('InteractSound_CL:PlayOnOne', "Shop", 0.1)
                            local model = GetDisplayNameFromVehicleModel(GetEntityModel(VehicleToStore))
                            if Config.UseSharedVehicleCars then
                                if Framework == "QBCore" then
                                    model = FWork.Shared.Vehicles[VehicleToStore]["name"]
                                end
                            end
                            if string.lower(tostring(model)) == "carnotfound" then
                                model = VehicleToStore
                            end
                            TriggerServerEvent("Pug:Server:AddChopTrackerBlip", GetEntityCoords(Ped), model,LicensePlate)
                        end
                    else
                        break
                    end
                end
            end
        else
            break
        end
    end
end)

RegisterNetEvent("FullyDeleteChoppingVehicle", function(vehicle)
    local entity = nil
    if vehicle then
        entity = vehicle
    else
        entity = PugGetClosestVehicle()
    end
    local ped = PlayerPedId()
    if IsEntityAMissionEntity(entity) then
        Citizen.Trace("BEFORE: Entity IS a mission entity")
    else
        Citizen.Trace("BEFORE: Entity IS NOT a mission entity")
    end


    NetworkRequestControlOfEntity(entity)

    local timeout = 2000
    while timeout > 0 and not NetworkHasControlOfEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end

    SetEntityAsMissionEntity(entity, true, true)

    local timeout = 2000
    while timeout > 0 and not IsEntityAMissionEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end

    if IsEntityAMissionEntity(entity) then
        Citizen.Trace("Entity IS a mission entity")
    else
        Citizen.Trace("Entity IS NOT a mission entity")
    end

    Citizen.Trace("Owner of entity: "..GetPlayerServerId(NetworkGetEntityOwner(entity)))
    Citizen.Trace("NETID of entity: "..NetworkGetNetworkIdFromEntity(entity))

    if NetworkHasControlOfEntity(entity) then
        Citizen.Trace("Entity IS in my control")
    else
        Citizen.Trace("Entity IS NOT in my control")
    end

    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )

    if ( DoesEntityExist( entity ) ) then 
        Citizen.Trace("Entity FAILED to delete! If you see this please contact a developer!")	
        DeleteEntity(entity)
        if ( DoesEntityExist( entity ) ) then 
            Citizen.Trace("Entity FAILED to delete on attempt 2! If you see this please contact a developer!")            
            return false
        else 
            return true
        end
    else 
        return true
    end 
end)

function DoCutScene(RouteBucket)
    TriggerServerEvent("Pug:server:CrimGarageToggleBucket", RouteBucket)
    DoScreenFadeOut(1000)
    Wait(3000)
    SetEntityVisible(PlayerPedId(),false)
    local ped1 = PlayerPedId()
    RequestCutscene("impexp_int_l1", 8) -- Usually 8.
    while not (HasCutsceneLoaded()) do
        Wait(0)
    end
    SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
    RegisterEntityForCutscene(ped1, 'MP_1', 0, 0, 64)
    Wait(200)
    SetEntityCoords(ped1, vector3(971.0, -2987.14, -39.65))
    SetEntityHeading(ped1, 185.06)
end