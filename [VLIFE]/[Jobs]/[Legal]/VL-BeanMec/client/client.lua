local QBCore = exports[Config.Core]:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports[Config.Core]:GetCoreObject() end)

local Targets, Props, Blips, CraftLock, alcoholCount = {}, {}, {}, false, 0
PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job if PlayerData.job.onduty then if PlayerData.job.name == Config.Locations[1].job then TriggerServerEvent("QBCore:ToggleDuty") end end end) end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)
AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job if PlayerData.job.onduty then if PlayerData.job.name == Config.Locations[1].job then TriggerServerEvent("QBCore:ToggleDuty") end end end)
end)


CreateThread(function()
	local loc = Config.Locations[1]
	local bossroles = {}
	if not QBCore.Shared.Jobs[loc.job] then print("^1Error^7: ^1Stopping Script^7. ^2Can't find the job ^7'^6"..loc.job.."^7' ^2in ^6QBCore^7.^6Shared^7.^6Jobs^7") return end
	for grade in pairs(QBCore.Shared.Jobs[loc.job].grades) do
		if QBCore.Shared.Jobs[loc.job].grades[grade].isboss == true then
			if bossroles[loc.job] then
				if bossroles[loc.job] > tonumber(grade) then bossroles[loc.job] = tonumber(grade) end
			else bossroles[loc.job] = tonumber(grade) end
		end
	end
	if loc.zoneEnable then
		JobLocation = PolyZone:Create(loc.zones, { name = loc.label, debugPoly = Config.Debug })
		JobLocation:onPlayerInOut(function(isPointInside)
			if PlayerJob.name == loc.job then
				if loc.autoClock and loc.autoClock.enter then if isPointInside and not onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
				if loc.autoClock and loc.autoClock.exit then if not isPointInside and onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
			end
		end)
	end

	if Config.Locations[1].blip then makeBlip({ coords = loc.blip, sprite = loc.blipsprite, col = loc.blipcolor, scale = loc.blipscale, disp = loc.blipdiosp, category = loc.blipcat, name = loc.label }) end

	Targets["BeanWash"] =
					exports['qb-target']:AddBoxZone("BeanWash", vec3(123.73, -1039.24, 29.28-0.5), 1.2, 0.6, { name="BeanWash", heading = 340.0, debugPoly=Config.Debug, minZ=28.88, maxZ=29.68 },
						{ options = { { event = "jim-beanmachine:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], job = v.job, coords = vec3(123.73, -1039.24, 29.28) }, }, distance = 1.5 })
				Targets["BeanCounter"] =
					exports['qb-target']:AddBoxZone("BeanCounter", vec3(120.54, -1040.74, 29.28-1), 0.6, 0.4, { name="BeanCounter", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=30.08 },
						{ options = { { event = "jim-beanmachine:Stash", icon = "fas fa-mug-saucer", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "Counter", coords = vec3(120.54, -1040.74, 29.28) }, }, distance = 2.0 })
				Targets["BeanCounter2"] =
					exports['qb-target']:AddBoxZone("BeanCounter2", vec3(121.85, -1037.08, 29.28-1), 0.6, 0.4, { name="BeanCounter2", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=30.08},
						{ options = { { event = "jim-beanmachine:Stash", icon = "fas fa-mug-saucer", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "Counter2", coords = vec3(121.85, -1037.08, 29.28) }, }, distance = 2.0 })

				Targets["BeanReceipt"] =
					exports['qb-target']:AddBoxZone("BeanReceipt", vec3(120.73, -1040.09, 29.28), 0.6, 0.6, { name="BeanReceipt", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
						{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/fc/TheBeanMachine-GTA4-logo.png width=100px></p>"
						} }, distance = 2.0 })
				Targets["BeanReceipt2"] =
					exports['qb-target']:AddBoxZone("BeanReceipt2",vec3(122.0, -1036.51, 29.28), 0.6, 0.6, { name="BeanReceipt2", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
						{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/fc/TheBeanMachine-GTA4-logo.png width=100px></p>"
						} }, distance = 2.0 })

				Targets["BeanFridge"] =
					exports['qb-target']:AddBoxZone("BeanFridge", vec3(124.51, -1037.97, 29.28), 0.85, 0.6, { name="BeanFridge", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=30.08 },
						{ options = { {  event = "jim-beanmachine:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_storage"], job = v.job, shop = Config.FoodItems, shopname = "BeanFridge", coords = vec3(124.51, -1037.97, 29.28) }, }, distance = 1.5 })
				Targets["BeanFridge2"] =
					exports['qb-target']:AddBoxZone("BeanFridge2", vec3(123.5, -1040.74, 29.28), 0.9, 0.6, { name="BeanFridge2", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=30.08 },
						{ options = { {  event = "jim-beanmachine:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_storage"], job = v.job, shop = Config.FoodItems, shopname = "BeanFridge2", coords = vec3(123.5, -1040.74, 29.28) }, }, distance = 1.5 })

				Targets["BeanDrink"] =
					exports['qb-target']:AddBoxZone("BeanDrink", vec3(124.56, -1036.88, 29.28), 0.7, 0.4, { name="BeanDrink", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
						{ options = { { event = "jim-beanmachine:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_coffee"], job = v.job, craftable = Crafting.Drinks, header = Loc[Config.Lan].menu["drink_menu"], coords = vec3(124.56, -1036.88, 29.28) }, }, distance = 2.0 })
				Targets["BeanDrink2"] =
					exports['qb-target']:AddBoxZone("BeanDrink2", vec3(122.93, -1041.68, 29.28), 0.7, 0.6, { name="BeanDrink2", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
						{ options = { { event = "jim-beanmachine:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_coffee"], job = v.job, craftable = Crafting.Drinks, header = Loc[Config.Lan].menu["drink_menu"], coords = vec3(122.93, -1041.68, 29.28) }, }, distance = 2.0 })

				Targets["BeanSlush"] =x
					exports['qb-target']:AddBoxZone("BeanSlush", vec3(126.07, -1036.59, 29.28), 0.6, 0.6, { name="BeanSlush", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=30.08 },
						{ options = { { event = "jim-beanmachine:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].targetinfo["prepare_slush"], job = v.job, craftable = Crafting.Slush, header = Loc[Config.Lan].menu["slush_menu"], coords = vec3(126.07, -1036.59, 29.28) }, }, distance = 2.0 })

				Targets["BeanSoda"] =
					exports['qb-target']:AddBoxZone("BeanSoda", vec3(123.56, -1042.75, 29.28), 0.6, 1.4, { name="BeanSoda", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
						{ options = { { event = "jim-beanmachine:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["grab_soda"], job = v.job, shop = Config.SodaItems, shopname = "BeanSoda", coords = vec3(123.56, -1042.75, 29.28) }, }, distance = 2.0 })

				Targets["BeanDonut"] =
					exports['qb-target']:AddBoxZone("BeanDonut", vec3(121.4, -1038.43, 29.28), 1.45, 0.6, { name="BeanDonut", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=29.88 },
						{ options = { { event = "jim-beanmachine:Shop", icon = "fas fa-circle-dot", label = Loc[Config.Lan].targetinfo["grab_food"], job = v.job, shop = Config.DesertItems, shopname = "BeanDonut", coords = vec3(121.4, -1038.43, 29.28) },
									{ event = "jim-beanmachine:Stash", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_stash"], job = v.job, stash = "LegionStash", coords = vec3(121.4, -1038.43, 29.28) }, }, distance = 2.0 })

				Targets["BeanClockin"] =
					exports['qb-target']:AddBoxZone("BeanClockin", vec3(126.94, -1035.84, 29.28), 1.2, 0.2, { name="BeanClockin", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=31.28 },
						{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = v.job },
									{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
									}, distance = 2.0 })
	
end)

RegisterNetEvent('jim-catcafe:washHands', function(data)
	if progressBar({ label = Loc[Config.Lan].progressbar["progress_washing"], time = 5000, cancel = true, dict = "mp_arresting", anim = "a_uncuff", flag = 8, icon = "fas fa-hand-holding-droplet" }) then
		triggerNotify(nil, Loc[Config.Lan].success["washed_hands"], 'success')
	else
		TriggerEvent('inventory:client:busy:status', false) triggerNotify(nil, Loc[Config.Lan].error["cancel"], 'error')
	end
	ClearPedTasks(PlayerPedId())
end)

--[[ CRAFTING ]]--
RegisterNetEvent('jim-catcafe:Crafting:MakeItem', function(data)
	if not CraftLock then CraftLock = true else return end
	local bartime = 5000
	if (data.amount and data.amount ~= 1) then data.craft["amount"] = data.amount
		for k, v in pairs(data.craft[data.item]) do	data.craft[data.item][k] *= data.amount	end
		bartime *= data.amount bartime *= 0.9
	end
	if data.header == Loc[Config.Lan].menu["header_coffee"] then animDictNow = "mp_ped_interaction" animNow = "handshake_guy_a"
	elseif data.header == Loc[Config.Lan].menu["header_hob"] then animDictNow = "amb@prop_human_bbq@male@base" animNow = "base"
	elseif data.header == Loc[Config.Lan].menu["header_oven"] then animDictNow = "amb@prop_human_bbq@male@base" animNow = "base"
	elseif data.header == Loc[Config.Lan].menu["header_chop"] then animDictNow = "anim@heists@prison_heiststation@cop_reactions" animNow = "cop_b_idle"
	else animDictNow = "amb@prop_human_parking_meter@male@idle_a" animNow = "idle_a" end
	if progressBar({ label = Loc[Config.Lan].progressbar["progress_make"]..QBCore.Shared.Items[data.item].label, time = bartime, cancel = true, dict = animDictNow, anim = animNow, flag = 1, icon = data.item }) then
		CraftLock = false
		TriggerServerEvent('jim-catcafe:Crafting:GetItem', data.item, data.craft)
		Wait(500)
		TriggerEvent("jim-catcafe:Crafting", data)
	else
		CraftLock = false
		TriggerEvent('inventory:client:busy:status', false)
	end
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('jim-catcafe:Crafting', function(data)
	if CraftLock then return end
	if not jobCheck() then return end
	local Menu = {}
	if Config.Menu == "qb" then
		Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
		Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "" } }
	end
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = QBCore.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				local disable = false
				local checktable = {}
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 0 or b == 1 then number = "" else number = " x"..b end
					if not QBCore.Shared.Items[l] then print("^3Error^7: ^2Script can't find ingredient item in QB-Core items.lua - ^1"..l.."^7") return end
					if Config.Menu == "ox" then text = text..QBCore.Shared.Items[l].label..number.."\n" end
					if Config.Menu == "qb" then text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>" end
					settext = text
					checktable[l] = HasItem(l, b)
				end
				for _, v in pairs(checktable) do if v == false then disable = true break end end
				if not disable then setheader = setheader.." ✔️" end
				local event = "jim-catcafe:Crafting:MakeItem"
                if Config.MultiCraft then event = "jim-catcafe:Crafting:MultiCraft" end
				Menu[#Menu + 1] = {
					disabled = disable,
					icon = "nui://"..Config.img..QBCore.Shared.Items[tostring(k)].image,
					header = setheader, txt = settext, --qb-menu
					title = setheader, description = settext, -- ox_lib
					event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header, }, -- ox_lib
					params = { event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header, } } -- qb-menu
				}
				settext, setheader = nil
			end
		end
	end
	if Config.Menu == "ox" then	exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu })	exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then	exports['qb-menu']:openMenu(Menu) end
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-catcafe:Crafting:MultiCraft', function(data)
    local success = Config.MultiCraftAmounts local Menu = {}
    for k in pairs(success) do success[k] = true
        for l, b in pairs(data.craft[data.item]) do
            local has = HasItem(l, (b * k)) if not has then success[k] = false break else success[k] = true end
		end end
    if Config.Menu == "qb" then Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true } end
	Menu[#Menu + 1] = { icon = "fas fa-arrow-left", title = Loc[Config.Lan].menu["back"], header = "", txt = Loc[Config.Lan].menu["back"], params = { event = "jim-catcafe:Crafting", args = data }, event = "jim-catcafe:Crafting", args = data }
	for k in pairsByKeys(success) do
		Menu[#Menu + 1] = {
			disabled = not success[k],
			icon = "nui://"..Config.img..QBCore.Shared.Items[data.item].image, header = QBCore.Shared.Items[data.item].label.." [x"..k.."]", title = QBCore.Shared.Items[data.item].label.." [x"..k.."]",
			event = "jim-catcafe:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k },
			params = { event = "jim-catcafe:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k } }
		}
	end
	if Config.Menu == "ox" then	exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu })	exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then	exports['qb-menu']:openMenu(Menu) end
end)

--[[STASH SHOPS]]--
RegisterNetEvent('jim-catcafe:Stash', function(data)
	if data.job and not jobCheck() then return end
	if Config.Inv == "ox" then exports.ox_inventory:openInventory('stash', "Catcafe_"..data.stash)
	else TriggerEvent("inventory:client:SetCurrentStash", "Catcafe_"..data.stash)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "Catcafe_"..data.stash) end
	lookEnt(data.coords)
end)
RegisterNetEvent('jim-catcafe:Shop', function(data)
	if not jobCheck() then return end
	local event = "inventory:server:OpenInventory"
	if Config.JimShop then event = "jim-shops:ShopOpen"
	elseif Config.Inv == "ox" then  exports.ox_inventory:openInventory('shop', { type = 'catcafeShop' }) end
	TriggerServerEvent(event, "shop", "catcafeShop", Config.Items)
	lookEnt(data.coords)
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
		exports['qb-menu']:closeMenu()
	end
end)