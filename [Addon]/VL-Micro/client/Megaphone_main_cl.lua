local prop = "v_ilev_fos_mic"

local Submix = {}
local Effects = {
    ["megaphone"] = {
        [`default`] = 1,
        [`freq_low`] = 1250.0,
        [`freq_hi`] = 8500.0,
    },
    ["microphone"] = {
        [`default`] = 1,
        [`fudge`] = 0.5,
    },
    ["carmicrophone"] = {
        [`default`] = 1,
        [`freq_low`] = 1250.0,
        [`freq_hi`] = 8500.0,
        [`fudge`] = 0.5,
        [`rm_mix`] = 19.0,
    },
}

local effectFilter = {}

RegisterNetEvent("jay-audio:client:playerJoined", function(newMix)
    Submix = newMix
end)

CreateThread(function()
    for effect, mix in pairs(Effects) do
        effectFilter[effect] = CreateAudioSubmix(effect)
        SetAudioSubmixEffectRadioFx(effectFilter[effect], 0)
        for hash, value in pairs(mix) do
            SetAudioSubmixEffectParamInt(effectFilter[effect], 0, hash, data)
        end
        AddAudioSubmixOutput(effectFilter[effect], 0)
    end

    if Submix and #Submix > 0 then
        for source, effect in pairs(Submix) do
            MumbleSetSubmixForServerId(source, effectFilter[effect])
        end
    end
end)

RegisterNetEvent('jay-audio:client:updateSubmix', function(state, source, effect)
    if state then
        MumbleSetSubmixForServerId(source, effectFilter[effect])
    else
        MumbleSetSubmixForServerId(source, -1)
    end
end)

function string.starts(String,Start)    
    return string.sub(String,1,string.len(Start))==Start 
end
CreateThread(function()
    for k, v in pairs(Config.MicrophoneZones) do
        exports["ps-zones"]:CreateBoxZone("microphone_"..v.name, v.coords, v.length, v.width, v.data)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(7)
        inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        for k,v in ipairs(Config.MicrophoneZones) do
            if v.spawnProp then
                local dist = #(pos - v.coords)
                if dist <= 150.0 then
                    if v.obj == nil then
                        local obj = CreateObject(GetHashKey(prop), vector3(v.coords.x, v.coords.y, v.coords.z - 1.0), false)
                        if v.data.heading ~= nil then
                            SetEntityHeading(obj, v.heading)
                        end
                        FreezeEntityPosition(obj, true)
                        v.obj = obj
                    end
                else
                    if v.obj then
                        DeleteEntity(v.obj)
                        v.obj = nil
                    end
                end
            end
        end

		if not inRange then
			Citizen.Wait(500)
		end
	end
end)
RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "microphone_") then
        TriggerServerEvent("jay-audio:server:addSubmix", "microphone")
        exports["pma-voice"]:overrideProximityRange(ZoneData.range, true)
    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "microphone_") then
        TriggerServerEvent("jay-audio:server:removeSubmix")
        exports["pma-voice"]:clearProximityOverride()
    end
end)

AddEventHandler('onResourceStop', function(resource)
	if (GetCurrentResourceName() ~= resource) then return end
    for k, v in pairs(Config.MicrophoneZones) do
        if v.obj then
            DeleteEntity(v.obj)
            v.obj = nil
        end
    end
end)