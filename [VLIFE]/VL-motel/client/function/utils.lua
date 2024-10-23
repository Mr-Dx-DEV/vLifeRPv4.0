KeyBind = 38 -- E
SpawnedPed = {}
PedZones = {}
Display = false

function Anim()
	lib.requestAnimDict("anim@heists@keycard@")
	TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 48, 0, false, false, false)
	Wait(550)
	ClearPedTasks(PlayerPedId())
end

function SpawnPed(motel)
	if SpawnedPed[motel] then
		return
	end
	local coords = Config.Motel[motel].rent.coords
	lib.requestModel("a_m_m_business_01")
	local ped = CreatePed(1, joaat("a_m_m_business_01"), coords.x, coords.y, coords.z - 1.0, coords.w, false, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetPedCanPlayAmbientAnims(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD_FACILITY", 0, true)
	SpawnedPed[motel] = ped

	if Config.Target.ped then
		if PedZones[motel] then
		else
			PedZones[motel] = SetupTarget(nil, "ped", {
				[1] = {
					motel = motel,
					room = nil,
				},
				[2] = {
					ped = ped,
				},
			})
		end
	else
		if PedZones[motel] then
			PedZones[motel]:remove()
		end

		local function OnEnter()
			ShowDrawtext(locale("info_enter", Config.Motel[motel].label))
		end

		local function OnExit()
			HideDrawtext()
		end

		local function Inside()
			if IsControlJustPressed(0, KeyBind) then
				ToggleMenu(true, motel)
			end
		end

		PedZones[motel] = SetupZone({
			name = ("motel:%s"):format(motel),
			coords = coords.xyz,
			rotation = coords.w,
			size = vec3(2, 2, 2),
		}, {
			enter = OnEnter,
			exit = OnExit,
			inside = Inside,
		})
	end
end

function RemovePed(motel)
	if not SpawnedPed[motel] then
		return
	end
	DeletePed(SpawnedPed[motel])
	SpawnedPed[motel] = nil
	if PedZones[motel] then
		if Config.Target.ped then
		else
			PedZones[motel]:remove()
		end
		PedZones[motel] = nil
	end
end

function StartAnimate()
	while Display do
		Wait(100)
	end
end

function ShowDrawtext(text)
	lib.showTextUI(text, {
		position = "left-center",
	})
end

function HideDrawtext()
	lib.hideTextUI()
end

function ToggleMenu(bool, motel)
	if bool then
		local roomname = GetPlayerRoom(motel)
		SendNUIMessage({
			action = "toggle",
			data = {
				status = true,
				motel = motel,
				user = {
					name = Functions.GetName(),
					license = Functions.GetLicense(),
					citizenid = GetResourceState("qb-core"):match("start") and PlayerData.citizenid or nil,
					isowner = IsMotelOwner(motel),
					roomname = roomname and roomname.room,
				},
			},
		})
		SetNuiFocus(true, true)
		NearestMotel = motel
		Display = true
	else
		SendNUIMessage({
			action = "toggle",
			data = {
				status = false,
			},
		})
		SetNuiFocus(false, false)
		Display = false
	end
end

---@param text string
---@param type? 'default' | 'success' | 'error'
function Notification(text, type)
	exports['notifications']:Notify(text, type)
end

function SendPhoneMail(sender, subject, message)
	TriggerServerEvent("qb-phone:server:sendNewMail", {
		sender = sender,
		subject = subject,
		message = message,
		button = {},
	})
end

function OpenOutfitMenu()
	TriggerEvent("qb-clothing:client:openOutfitMenu")
end

function StartMinigame()
	local success = lib.skillCheck(
		{ "easy", "easy", { areaSize = 60, speedMultiplier = 2 }, "medium" },
		{ "w", "a", "s", "d" }
	)
	return success
end

function RaidAnimation()
	lib.requestAnimDict("missheistfbi3b_ig7")
	TaskPlayAnim(PlayerPedId(), "missheistfbi3b_ig7", "lift_fibagent_loop", 8.0, 1.0, -1, 1, 0, false, false, false)
end

function LockPickAnim()
	lib.requestAnimDict("missheistfbisetup1")
	TaskPlayAnim(PlayerPedId(), "missheistfbisetup1", "hassle_intro_loop_f", 8.0, 1.0, -1, 1, 0, false, false, false)
end

RegisterNetEvent("lazy-motel:client:sendNewMail", function(sender, subject, message)
	SendPhoneMail(sender, subject, message)
end)

RegisterNUICallback("get-locale", function(_, cb)
	local lang = GetConvar('ox:locale', 'en')
	local locales = LoadResourceFile(GetCurrentResourceName(), ('locales/%s.json'):format(lang))
	cb(locales)
end)
