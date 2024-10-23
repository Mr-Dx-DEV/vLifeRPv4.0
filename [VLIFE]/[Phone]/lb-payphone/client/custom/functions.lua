function Notify(desc, errType)
    if Config.NotificationSystem == "ox_lib" and lib then
        lib.notify({
            title = L("payphone"),
            description = desc,
            type = errType
        })
    elseif Config.NotificationSystem == "default" then
        BeginTextCommandThefeedPost("STRING")
        AddTextComponentSubstringPlayerName(desc)
        EndTextCommandThefeedPostMessagetext("CHAR_BLOCKED", "CHAR_BLOCKED", true, 1, L("payphone"), "")
    elseif Config.Framework == "esx" then
        TriggerEvent("esx:showNotification", desc)
    elseif Config.Framework == "qb" then
        TriggerEvent("QBCore:Notify", desc)
    elseif Config.Framework == "custom" then
        TriggerEvent("chat:addMessage", {
            color = {255, 0, 0},
            multiline = true,
            args = {L("payphone"), desc}
        })
    end
end

RegisterNetEvent("payphone:notify", Notify)

---Check if a ped is wearing heels
---@param ped number
---@return boolean wearingHeels
function IsWearingHeels(ped)
	if GetEntityModel(ped) == `mp_m_freemode_01` then -- if it's a male ped it can't wear heels
		return false
	end

	local shoes = GetPedDrawableVariation(ped, 6)
	local componentHash = GetHashNameForComponent(ped, 6, shoes, GetPedTextureVariation(ped, 6))

	if componentHash == 0 then
		return shoes == 0 or (shoes >= 6 and shoes <= 8) or shoes == 12 or shoes == 14
	end

	return DoesShopPedApparelHaveRestrictionTag(componentHash, `HIGH_HEELS`, 0)
end

function LoadAnimDict(animDict)
    RequestAnimDict(animDict)

    while not HasAnimDictLoaded(animDict) do
        Wait(0)
    end

    return animDict
end

function LoadModel(model)
    RequestModel(model)

    while not HasModelLoaded(model) do
        Wait(0)
    end

    return model
end
