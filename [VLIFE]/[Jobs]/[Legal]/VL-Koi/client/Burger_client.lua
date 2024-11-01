local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}
local onDuty = false
local Targets = {}
local Props = {}

local function jobCheck()
	canDo = true
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') canDo = false end
	return canDo
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then if PlayerData.job.name == "koi" then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	QBCore.Functions.GetPlayerData(function(PlayerData)	PlayerJob = PlayerData.job if PlayerData.job.name == "koi" then onDuty = PlayerJob.onduty end end)
end)
CreateThread(function()
	local bossroles = {}
	for k, v in pairs(QBCore.Shared.Jobs["koi"].grades) do
		if QBCore.Shared.Jobs["koi"].grades[k].isboss == true then
			if bossroles["koi"] ~= nil then
				if bossroles["koi"] > tonumber(k) then bossroles["koi"] = tonumber(k) end
			else bossroles["koi"] = tonumber(k)	end
		end
	end
	for k, v in pairs(Config.Koi.Locations) do
		if Config.Koi.Locations[k].zoneEnable then
			JobLocation = PolyZone:Create(Config.Koi.Locations[k].zones, { name = Config.Koi.Locations[k].label, debugPoly = Config.Koi.Debug })
			JobLocation:onPlayerInOut(function(isPointInside) if not isPointInside and onDuty and PlayerJob.name == "koi" then TriggerServerEvent("QBCore:ToggleDuty") end end)
		end
	end
	for k, v in pairs(Config.Koi.Locations) do
		if Config.Koi.Locations[k].zoneEnable then
			blip = AddBlipForCoord(Config.Koi.Locations[k].blip)
			SetBlipAsShortRange(blip, true)
			SetBlipSprite(blip, 514)
			SetBlipColour(blip, Config.Koi.Locations[k].blipcolor)
			SetBlipScale(blip, 0.5)
			SetBlipDisplay(blip, 6)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString("koi")
			EndTextCommandSetBlipName(blip)
		end
	end
	if Config.Koi.MLO == "GN" then
		Targets["KoiShelf"] = --- Koi
		exports['qb-target']:AddBoxZone("KoiShelf", vector3(-1067.77, -1444.75, -1.42), 2.6, 0.4, { name="KoiShelf", heading = 305, debugPoly=Config.Koi.Debug, minZ=-4.42, maxZ=-0.02, },
			{ options = { { event = "VL-Koi:Stash", icon = "fas fa-box-open", label = "Open Shelves", job = "koi", id = "Shelf" }, },
			distance = 2.0 })



		Targets["KoiStore"] =  --- ATMOS
		exports['qb-target']:AddBoxZone("KoiStore", vector3(-1074.35, -1439.97, -1.42), 1.7, 0.6, { name="KoiStore", heading = 35, debugPoly=Config.Koi.Debug, minZ=-4.02, maxZ=-0.02, },
			{ options = { { event = "VL-Koi:shop", icon = "fas fa-temperature-low", label = "Open Storage", job = "koi" }, },
				distance = 1.5 })

		-- Targets["KoiFish_process"] = --- Koi
		-- exports['qb-target']:AddBoxZone("KoiFish_process", vector3(-1078.54, -1445.23, -1.42), 0.35, 0.55, { name="KoiFish_process", heading = 214, debugPoly=Config.Koi.Debug, minZ=-5.42, maxZ=-1.42, },
		-- 	{ options = { { event = "VL-Koi:Crafting", icon = "fas fa-utensils", label = "Process Your Fish", job = "koi", craftable = CraftingKoi.Fish_process, header = "Prepare Food" }, },
		-- 		distance = 1.5 })



		Targets["KoiChop"] =  --- Koi
		exports['qb-target']:AddBoxZone("KoiChop", vector3(-1077.52, -1448.54, -1.42), 0.3, 0.5, { name="KoiChop", heading = 305, debugPoly=Config.Koi.Debug, minZ=-5.37, maxZ=-1.37, },
			{ options = { { event = "VL-Koi:Crafting", icon = "fas fa-utensils", label = "Chop", job = "koi", craftable = CraftingKoi.Chop, header = "Brake" }, },
				distance = 1.5 })



		Targets["KoiFry"] =  --- Koi
		exports['qb-target']:AddBoxZone("KoiFry", vector3(-1071.63, -1444.52, -1.42), 1.3, 0.8, { name="KoiBlandera", heading = 305, debugPoly=Config.Koi.Debug, minZ=-5.02,  maxZ=-1.02, },
			{ options = { { event = "VL-Koi:Crafting", icon = "fas fa-utensils", label = "Fry", job = "koi", craftable = CraftingKoi.Fry, header = "Brake" }, },
				distance = 1.5 })
		Targets["KoiFry2"] =  --- Koi
		exports['qb-target']:AddBoxZone("KoiFry2", vector3(-1073.61, -1445.96, -1.42), 1.3, 0.8, { name="KoiBlandera", heading = 305, debugPoly=Config.Koi.Debug, minZ=-5.02,  maxZ=-1.02, },
			{ options = { { event = "VL-Koi:Crafting", icon = "fas fa-utensils", label = "Fry", job = "koi", craftable = CraftingKoi.Fry, header = "Brake" }, },
				distance = 1.5 })


		Targets["KoiFish_cooking"] =  --- Koi
		exports['qb-target']:AddBoxZone("KoiFish_cooking", vector3(-1074.22, -1445.12, -1.42), 1.3, 0.9, { name="KoiBlanderb", heading = 305, debugPoly=Config.Koi.Debug, minZ=-5.22, maxZ=-1.22, },
			{ options = { { event = "VL-Koi:Crafting", icon = "fas fa-utensils", label = "Cook", job = "koi", craftable = CraftingKoi.Fish_cooking, header = "Brake" }, },
				distance = 1.5 })




		Targets["KoiFrapper"] =  ----- Koi
		exports['qb-target']:AddBoxZone("KoiFrapper", vector3(-1074.81, -1446.62, -1.42), 0.5, 0.5, { name="KoiFrapper", heading = 305, debugPoly=Config.Koi.Debug,  minZ=-5.22, maxZ=-1.22, },
			{ options = { { event = "VL-Koi:Crafting", icon = "fas fa-hamburger", label = "Prepare your food", job = "koi", craftable = CraftingKoi.Process, header = "Brake" }, },
				distance = 2 })

       --   All Tray1

		Targets["KoiTray1"] =  --- Koi -ub
		exports['qb-target']:AddBoxZone("KoiTray1", vector3(-1068.6, -1460.64, -1.42), 0.8, 1.6, { name="KoiTray1", heading = 347, debugPoly=Config.Koi.Debug,minZ=-5.42, maxZ=-1.42, },
			{ options = { { event = "VL-Koi:Stash", icon = "fas fa-hamburger", label = "Open Tray", id = "Tray3" }, },
				distance = 2.0 })

		Targets["KoiTray2"] =  --- Koi -ub
		exports['qb-target']:AddBoxZone("KoiTray2", vector3(-1065.02, -1455.28, -1.42), 0.8, 1.6, { name="KoiTray2", heading = 305, debugPoly=Config.Koi.Debug, minZ=-5.42, maxZ=-1.42, },
			{ options = { { event = "VL-Koi:Stash", icon = "fas fa-hamburger", label = "Open Tray", id = "Tray3" }, },
				distance = 2.0 })

		Targets["KoiTray3"] =  --- Koi -ub
		exports['qb-target']:AddBoxZone("KoiTray3", vector3(-1067.72, -1467.03, -1.42), 0.8, 1.6, { name="KoiTray3", heading = 28, debugPoly=Config.Koi.Debug, minZ=-5.42, maxZ=-1.42, },
			{ options = { { event = "VL-Koi:Stash", icon = "fas fa-hamburger", label = "Open Tray", id = "Tray3" }, },
				distance = 2.0 })

		Targets["KoiTray4"] =  --- Koi -ub
		exports['qb-target']:AddBoxZone("KoiTray4", vector3(-1062.79, -1471.21, -1.42), 0.8, 1.6, { name="KoiTray4", heading = 251, debugPoly=Config.Koi.Debug,  minZ=-5.32, maxZ=-1.32, },
			{ options = { { event = "VL-Koi:Stash", icon = "fas fa-hamburger", label = "Open Tray", id = "Tray3" }, },
				distance = 2.0 })
		Targets["KoiTray5"] =  --- Koi -ub
		exports['qb-target']:AddBoxZone("KoiTray5", vector3(-1050.81, -1462.82, -1.42), 0.8, 1.6, { name="KoiTray5", heading = 359, debugPoly=Config.Koi.Debug,  minZ=-5.42, maxZ=-1.42, },
			{ options = { { event = "VL-Koi:Stash", icon = "fas fa-hamburger", label = "Open Tray", id = "Tray3" }, },
				distance = 2.0 })
		Targets["KoiTray6"] =  --- Koi -ub
		exports['qb-target']:AddBoxZone("KoiTray6", vector3(-1053.03, -1456.75, -1.42), 0.8, 1.6, { name="KoiTray6", heading = 221, debugPoly=Config.Koi.Debug,  minZ=-5.42, maxZ=-1.42, },
			{ options = { { event = "VL-Koi:Stash", icon = "fas fa-hamburger", label = "Open Tray", id = "Tray3" }, },
				distance = 2.0 })
		Targets["KoiTray7"] =  --- Koi -ub
		exports['qb-target']:AddBoxZone("KoiTray7", vector3(-1058.77, -1453.7, -1.42), 0.8, 1.6, { name="KoiTray7", heading = 83, debugPoly=Config.Koi.Debug,  minZ=-5.42, maxZ=-1.42, },
			{ options = { { event = "VL-Koi:Stash", icon = "fas fa-hamburger", label = "Open Tray", id = "Tray3" }, },
				distance = 2.0 })




		Targets["KoiWash1"] =  --- Handwash
		exports['qb-target']:AddBoxZone("KoiWash1", vector3(-1071.5, -1440.07, -1.42), 0.75, 0.69, { name="KoiWash1", heading = 305, debugPoly=Config.Koi.Debug, minZ=-5.22, maxZ=-1.22, },
			{ options = { { event = "VL-Koi:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", }, },
				distance = 2.0 })

		-- Targets["KoiWash2"] =  --- Handwash
		-- exports['qb-target']:AddBoxZone("-630.31, 222.88, 81.88", vector3(-630.31, 222.88, 81.88), 0.7, 0.5, { name="KoiWash2", heading = 215.0, debugPoly=Config.Koi.Debug, minZ=78.28, maxZ=82.28, },
		-- 	{ options = { { event = "VL-Koi:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", }, },
		-- 		distance = 2.0 })

		-- Targets["KoiWash3"] =  --- Handwash
		-- exports['qb-target']:AddBoxZone("-630.31, 222.88, 81.88", vector3(-621.65, 226.26, 81.88), 0.7, 0.7, { name="KoiWash3", heading = 215.0, debugPoly=Config.Koi.Debug, minZ=78.28, maxZ=82.28, },
		-- 	{ options = { { event = "VL-Koi:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", }, },
		-- 		distance = 2.0 })

		-- Targets["KoiWash4"] =  --- Handwash
		-- exports['qb-target']:AddBoxZone("-621.59, 227.24, 81.88", vector3(-621.59, 227.24, 81.88), 0.7, 0.7, { name="KoiWash4", heading = 215.0, debugPoly=Config.Koi.Debug, minZ=78.08, maxZ=82.08, },
		-- 	{ options = { { event = "VL-Koi:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", }, },
		-- 		distance = 2.0 })





		Targets["KoiCharge"] =  --- Koi
		exports['qb-target']:AddCircleZone("KoiCharge", vector3(-1034.72, -1484.26, 4.58), 0.25, { name="KoiCharge", debugPoly=Config.Koi.Debug, useZ=true, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "koi",}, },
				distance = 2.0 })


		Targets["KoiClockin"] =  ---  Koi on duty/off Duty
		exports['qb-target']:AddBoxZone("KoiClockin", vector3(-1034.77, -1483.35, 4.58), 0.5, 0.35, { name="KoiClockin", heading = 313, debugPoly=Config.Koi.Debug, minZ=0.78, maxZ=4.78, },
			{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = "Toggle Duty", job = "koi" },},
				distance = 2.0 })

		Targets["KoiBossmenu"] =  ---  Koi Bossmenu
		exports['qb-target']:AddBoxZone("KoiBossmenu", vector3(-1054.45, -1441.56, -1.38), 0.4, 0.45, { name="KoiBossmenu", heading = 34, debugPoly=Config.Koi.Debug, minZ=-5.18,  maxZ=-1.18, },
				{ options = {{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = "Open Bossmenu", job = bossroles, },},
			distance = 2.0 })
	end
end)

RegisterNetEvent('VL-Koi:washHands', function(data)
    QBCore.Functions.Progressbar('washing_hands', 'Washing hands', 900, false, true, {disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = false, },
		{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		TriggerEvent('QBCore:Notify', "You've washed your hands!", 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled", 'error')
    end, data.icon)
end)

RegisterNetEvent('VL-Koi:Crafting:MakeItem', function(data)
	QBCore.Functions.TriggerCallback('VL-Koi:Crafting:get', function(amount)
		if not amount then TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error') else TriggerEvent('VL-Koi:Crafting:ItemProgress', data) end
	end, data.item, data.craft)
end)

RegisterNetEvent('VL-Koi:client:GrabBag', function(data)
	QBCore.Functions.Progressbar('making_food', "Grabbing Empty Murder Bag", 2000, false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle", flags = 8, },
	{}, {}, function()
		TriggerServerEvent("VL-Koi:server:GrabBag")
		ClearPedTasks(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		ClearPedTasks(PlayerPedId())
	end, "murderbag")
end)

RegisterNetEvent('VL-Koi:Crafting:ItemProgress', function(data)
	if data.header == "Drinks Dispenser" then
		bartext = "Pouring "..QBCore.Shared.Items[data.item].label
		bartime = 3500
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
		animflag = 8
	elseif data.header == "Food Cabinet" then
		bartext = "Receiving "..QBCore.Shared.Items[data.item].label
		bartime = 3500
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
		animflag = 8
	elseif data.item == "slicedpotato" or data.item == "slicedonion" then
		bartext = "Slicing "..QBCore.Shared.Items[data.item].label
		bartime = 3000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
		animflag = 3
	elseif data.item == "cheesewrap" or data.item == "chickenwrap" then
		bartext = "Preparing "..QBCore.Shared.Items[data.item].label
		bartime = 8000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
		animflag = 8
	elseif data.header == "Deep Fat Fryer" then
		bartext = "Frying "..QBCore.Shared.Items[data.item].label
		bartime = 5000
		animDictNow = "mp_arresting"
		animNow = "a_uncuff"
		animflag = 8
	elseif data.header == "Brake" then
		bartext = "Cooking "..QBCore.Shared.Items[data.item].label
		bartime = 3500
		animDictNow = "amb@prop_human_bbq@male@base"
		animNow = "base"
		animflag = 8
	elseif data.header == "Prepare Food" then
		bartext = "Preparing "..QBCore.Shared.Items[data.item].label
		bartime = 3500
		animDictNow = "mini@repair"
		animNow = "fixing_a_ped"
		animflag = 8
	else
		bartext = "Preparing "..QBCore.Shared.Items[data.item].label
		bartime = 3500
		animDictNow = "mini@repair"
		animNow = "fixing_a_ped"
		animflag = 8
	end
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = animDictNow, anim = animNow, flags = animflag, },
	{}, {}, function()
		TriggerServerEvent('VL-Koi:Crafting:GetItem', data.item, data.craft)
		TriggerEvent("VL-Koi:Crafting", data)
		ClearPedTasks(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		ClearPedTasks(PlayerPedId())
	end, data.item)
end)

RegisterNetEvent('VL-Koi:Stash', function(data, id)
	if id then -- If it has a bag ID then open the limited stash
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "koi_"..id, { maxweight = 50000, slots = 10, })
		TriggerEvent("inventory:client:SetCurrentStash", "koi_"..id)
	else
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "koi_"..data.id)
		TriggerEvent("inventory:client:SetCurrentStash", "koi_"..data.id)
	end
end)

RegisterNetEvent('VL-Koi:shop', function()
	if not jobCheck() then return end
	local event = "inventory:server:OpenInventory"
	TriggerServerEvent(event, "shop", "koi", Config.Koi.Items)
end)

RegisterNetEvent('VL-Koi:Crafting', function(data)
	if not jobCheck() then return end
	local Menu = {}
	Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
	Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "VL-Koi:client:Menu:Close" } }
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = "<img src=nui://"..Config.Koi.img..QBCore.Shared.Items[k].image.." width=35px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				if Config.Koi.CheckMarks then
					local p = promise.new()
					QBCore.Functions.TriggerCallback('VL-Koi:Crafting:get', function(cb) p:resolve(cb) end, k, data.craftable[i])
					if Citizen.Await(p) then setheader = setheader.." ✅" end
				end
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
					settext = text
				end
				Menu[#Menu + 1] = { icon = k, header = setheader, txt = settext, params = { event = "VL-Koi:Crafting:MakeItem", args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } } }
				settext, setheader = nil
			end Wait(0)
		end
	end
	exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('VL-Koi:client:Drink', function(itemName)
	if itemName == "bscoke" then  TriggerEvent('animations:client:EmoteCommandStart', {"bscoke"})
	elseif itemName == "bscoffee" then TriggerEvent('animations:client:EmoteCommandStart', {"bscoffee"})
	elseif itemName == "milk" then TriggerEvent('animations:client:EmoteCommandStart', {"milk"})
	elseif itemName == "milkshake" then TriggerEvent('animations:client:EmoteCommandStart', {"glass"}) end
    QBCore.Functions.Progressbar("drink_something", "Drinking "..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
		TriggerServerEvent('xMBurger:Server:Drink', itemName, 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
		if Config.Koi.RewardItem == itemName then
			local prize = Config.Koi.RewardPool[math.random(1, #Config.Koi.RewardPool)]
			TriggerServerEvent("QBCore:Server:AddItem", prize, 1)
			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[prize], "add", 1)
		end
	end, function() -- Cancel
	    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, itemName)
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k, v in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
	for k, v in pairs(Props) do DeleteEntity(Props[k]) end
end)
