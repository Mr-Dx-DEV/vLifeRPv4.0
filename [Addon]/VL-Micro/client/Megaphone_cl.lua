QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

local holdingMega = false
local prop = nil

local function EnableSubmix()
    SetAudioSubmixEffectRadioFx(0, 0)
    SetAudioSubmixEffectParamInt(0, 0, `default`, 1)
    SetAudioSubmixEffectParamFloat(0, 0, `freq_low`, 1250.0)
    SetAudioSubmixEffectParamFloat(0, 0, `freq_hi`, 8500.0)
    SetAudioSubmixEffectParamFloat(0, 0, `fudge`, 0.5)
    SetAudioSubmixEffectParamFloat(0, 0, `rm_mix`, 19.0)
end exports("EnableSubmix", EnableSubmix)

local function DisableSubmix()
    SetAudioSubmixEffectRadioFx(0, 0)
end exports("DisableSubmix", DisableSubmix)

local inWater = false
CreateThread(function()
    while true do
        Wait(100)
        ped = PlayerPedId()
        if IsPedSwimmingUnderWater(ped) then
            if not inWater then
                EnableSubmix()
                inWater = true
            end
        else
            if inWater then
                DisableSubmix()
                inWater = false
            end
        end
    end
end)

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

local function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Wait(10)
    end
end
function AddPropToPlayerAndAnim(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
    loadAnimDict("amb@world_human_mobile_film_shocking@female@base")
    local Player = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(Player))
    if not HasModelLoaded(prop1) then
        LoadPropDict(prop1)
    end
    prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(prop1)
    TaskPlayAnim(Player, "amb@world_human_mobile_film_shocking@female@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    if holdingMega then
        local _HasMegaphone = false
        for _, item in pairs(val.items) do
            if item.name == "megaphone" then
                _HasMegaphone = true
                break
            end
        end
        if not _HasMegaphone then
            holdingMega = false
            ClearPedTasksImmediately(PlayerPedId())
            exports["pma-voice"]:clearProximityOverride()
        end
    end
end)

RegisterNetEvent("megaphone:Toggle", function()
    if not holdingMega then
        holdingMega = true
        CreateThread(function()
            while holdingMega do
                Wait(1000)
                if not IsEntityPlayingAnim(PlayerPedId(),"amb@world_human_mobile_film_shocking@female@base", "base", 3) and holdingMega then
                    holdingMega = false
                    ClearPedTasksImmediately(PlayerPedId())
                    TriggerServerEvent("jay-audio:server:removeSubmix")
                    exports["pma-voice"]:clearProximityOverride()
                    DeleteEntity(prop)
                end
            end
        end)
        AddPropToPlayerAndAnim("prop_megaphone_01", 28422, 0.0, 0.0, 0.0, 0.0, 0.0, 80.0)
        TriggerServerEvent("jay-audio:server:addSubmix", "megaphone")
        exports["pma-voice"]:overrideProximityRange(50.0, true)
    else
        holdingMega = false
        ClearPedTasksImmediately(PlayerPedId())
        DeleteEntity(prop)
        exports["pma-voice"]:clearProximityOverride()
        TriggerServerEvent("jay-audio:server:removeSubmix")
    end
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
  end)

---- Car megaphone
local function CheckPlayer()
    local Player = PlayerPedId()
    local getVehiclePedIsIn = GetVehiclePedIsIn(Player, false) > 0 and GetVehiclePedIsIn(Player, false) or
        0 -- Get the vehicle the ped is in, if is > than 0 means the player is in a vehicle
    if getVehiclePedIsIn == 0 then return end
    local vehicleClass = GetVehicleClass(getVehiclePedIsIn) == 18 and true or false --get the class of it
    if not vehicleClass then
      return
    end
    return vehicleClass
  end

  --https://cookbook.fivem.net/2020/01/06/using-the-new-console-key-bindings/
  RegisterCommand('+Megaphone', function()
    if not PlayerData.job then PlayerData = QBCore.Functions.GetPlayerData() end
    if (PlayerData.job.name == "police" or PlayerData.job.name == "bcso") and CheckPlayer() then
      TriggerServerEvent("jay-audio:server:addSubmix", "megaphone")
      exports["pma-voice"]:overrideProximityRange(30.0, true)
      QBCore.Functions.Notify('Megaphone on', 'success')
    end
  end, false)

  RegisterCommand('-Megaphone', function()
    if not PlayerData.job then PlayerData = QBCore.Functions.GetPlayerData() end
    if (PlayerData.job.name == "police" or PlayerData.job.name == "bcso") and CheckPlayer() then
      TriggerServerEvent("jay-audio:server:removeSubmix")
      exports["pma-voice"]:clearProximityOverride()
      QBCore.Functions.Notify('Megaphone off', 'error')
    end
  end, false)

  RegisterKeyMapping('+Megaphone', 'Talk on the Megaphone', 'keyboard', 'N')