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
        if PlayerData.job.onduty then if PlayerData.job.name == "atoms" then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end) 
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	QBCore.Functions.GetPlayerData(function(PlayerData)	PlayerJob = PlayerData.job if PlayerData.job.name == "atoms" then onDuty = PlayerJob.onduty end end)
end)

CreateThread(function()
	local bossroles = {}
	for k, v in pairs(QBCore.Shared.Jobs["atoms"].grades) do
		if QBCore.Shared.Jobs["atoms"].grades[k].isboss == true then
			if bossroles["atoms"] ~= nil then
				if bossroles["atoms"] > tonumber(k) then bossroles["atoms"] = tonumber(k) end
			else bossroles["atoms"] = tonumber(k)	end
		end
	end
	for k, v in pairs(Config.Atoms.Locations) do
		if Config.Atoms.Locations[k].zoneEnable then
			JobLocation = PolyZone:Create(Config.Atoms.Locations[k].zones, { name = Config.Atoms.Locations[k].label, debugPoly = Config.Atoms.Debug })
			JobLocation:onPlayerInOut(function(isPointInside) if not isPointInside and onDuty and PlayerJob.name == "atoms" then TriggerServerEvent("QBCore:ToggleDuty") end end)	
		end
	end
	for k, v in pairs(Config.Atoms.Locations) do
		if Config.Atoms.Locations[k].zoneEnable then
			blip = AddBlipForCoord(Config.Atoms.Locations[k].blip)	
			SetBlipAsShortRange(blip, true)
			SetBlipSprite(blip, 76)
			SetBlipColour(blip, Config.Atoms.Locations[k].blipcolor)
			SetBlipScale(blip, 0.7)
			SetBlipDisplay(blip, 6)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString("Up-Atoms")
			EndTextCommandSetBlipName(blip)
		end
	end
	if Config.Atoms.MLO == "GN" then
		Targets["AtomsShelf"] = --- ATOMS
		exports['qb-target']:AddBoxZone("AtomsShelf", vector3(91.61, 288.75, 110.21), 2.2, 1, { name="AtomsShelf", heading = 25, debugPoly=Config.Atoms.Debug, minZ = 109.21, maxZ = 111.61, }, 
			{ options = { { event = "VL-Atoms:Stash", icon = "fas fa-box-open", label = "Open Shelves", job = "atoms", id = "Shelf" }, },
			distance = 2.0 })		
								
		Targets["AtomFridge"] = --- ATMOS
		exports['qb-target']:AddBoxZone("AtomFridge", vector3(95.25, 288.57, 110.21), 1.4, 0.8, { name="AtomFridge", heading = 341, debugPoly=Config.Atoms.Debug, minZ = 109.21, maxZ = 111.61, }, 
			{ options = { { event = "VL-Atoms:Stash", icon = "fas fa-temperature-low", label = "Open Fridge", job = "atoms", id = "Fridge" }, },
				distance = 1.5 })
		
		Targets["AtomStore"] =  --- ATMOS
		exports['qb-target']:AddBoxZone("AtomStore", vector3(93.71, 288.18, 110.21), 0.8, 1.4, { name="AtomStore", heading = 340, debugPoly=Config.Atoms.Debug, minZ = 109.21, maxZ = 111.61, }, 
			{ options = { { event = "VL-Atoms:shop", icon = "fas fa-temperature-low", label = "Open Storage", job = "atoms" }, },
				distance = 1.5 })
		
		Targets["AtomGrill"] = --- Atoms
		exports['qb-target']:AddBoxZone("AtomGrill", vector3(93.95, 291.81, 110.21), 1.5, 1, { name="AtomGrill", heading = 340, debugPoly=Config.Atoms.Debug, minZ = 109.21, maxZ = 110.61, }, 
			{ options = { { event = "VL-Atoms:Crafting", icon = "fas fa-fire", label = "Use Burger Grill", job = "atoms", craftable = CraftingAtoms.Grill, header = "Grill" }, },
				distance = 1.5 })
		
		Targets["AtomFryer"] =  --- Atoms
		exports['qb-target']:AddBoxZone("AtomFryer", vector3(92.98, 292.2, 110.21), 1.4, 1, { name="AtomFryer", heading = 340, debugPoly=Config.Atoms.Debug, minZ = 109.21, maxZ = 110.61, }, 
			{ options = { { event = "VL-Atoms:Crafting", icon = "fas fa-temperature-high", label = "Use Deep Fryer", job = "atoms", craftable = CraftingAtoms.Fryer, header = "Deep Fat Fryer" }, },
				distance = 1.5 })
		
		Targets["AtomChop"] =  --- Atoms
		exports['qb-target']:AddBoxZone("AtomChop", vector3(96.85, 293.24, 110.21), 1.2, 1, { name="AtomChop", heading = 340, debugPoly=Config.Atoms.Debug, minZ = 109.21, maxZ = 111.01, }, 
			{ options = { { event = "VL-Atoms:Crafting", icon = "fas fa-utensils", label = "Use Chopping Board", job = "atoms", craftable = CraftingAtoms.ChopBoard, header = "Chopping Board" }, },
				distance = 1.5 })		
		
		Targets["AtomPrepare"] =  ----- AToms 
		exports['qb-target']:AddBoxZone("AtomPrepare", vector3(93.04, 290.78, 110.21), 1.0, 1.8, { name="AtomPrepare", heading = 340, debugPoly=Config.Atoms.Debug, minZ = 109.21, maxZ = 110.81, }, 
			{ options = { { event = "VL-Atoms:Crafting", icon = "fas fa-hamburger", label = "Prepare Food", job = "atoms", craftable = CraftingAtoms.Prepare, header = "Prepare Food" }, },
				distance = 1.5 })	
				
		Targets["AtomDrink"] =  ---- AToms
		exports['qb-target']:AddBoxZone("AtomDrink", vector3(92.95, 287.44, 110.21), 1.85, 0.6, { name="AtomDrink", heading = 250, debugPoly=Config.Atoms.Debug, minZ = 110.21, maxZ = 111.21, }, 
			{ options = { { event = "VL-Atoms:Crafting", icon = "fas fa-mug-hot", label = "Prepare Drinks", job = "atoms", craftable = CraftingAtoms.Drink, header = "Drinks Dispenser" }, },
				distance = 1.5 })
		
		Targets["AtomTray3"] =  --- Atoms
		exports['qb-target']:AddBoxZone("AtomTray3", vector3(89.19, 288.17, 110.21), 0.6, 0.4, { name="AtomTray3", heading = 25, debugPoly=Config.Atoms.Debug, minZ = 109.81, maxZ = 110.41, }, 
			{ options = { { event = "VL-Atoms:Stash", icon = "fas fa-hamburger", label = "Open Tray", id = "Tray3" }, },
				distance = 2.0 })
		
		Targets["AtomWash4"] =  --- Atoms
		exports['qb-target']:AddBoxZone("BWash4", vector3(-1198.57, -887.54, 14.0), 0.6, 0.6, { name="AtomWash4", heading = 215.0, debugPoly=Config.Atoms.Debug, minZ = 13.2, maxZ = 14.6, }, 
			{ options = { { event = "VL-Atoms:washHands", icon = "fas fa-hand-holding-water", label = "Wash Your Hands", }, },
				distance = 2.0 })
		
		
		Targets["AtomReceipt3"] =  --- Atoms
		exports['qb-target']:AddCircleZone("AtomReceipt3", vector3(89.16, 288.83, 110.21),0.45, { name="AtomReceipt3", debugPoly=Config.Atoms.Debug, useZ=true, },
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "atoms",}, },
				distance = 2.0 })
		
		Targets["AtomClockin"] =  --- Atmos
		exports['qb-target']:AddBoxZone("AtomClockin", vector3(88.22, 298.0, 110.21), 0.4, 1.8, { name="AtomClockin", heading = 340, debugPoly=Config.Atoms.Debug, minZ = 110.01, maxZ = 111.21, }, 
			{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = "Toggle Duty", job = "atoms" },}, 
				distance = 2.0 })					
	end	
end)

RegisterNetEvent('VL-Atoms:washHands', function(data)
    QBCore.Functions.Progressbar('washing_hands', 'Washing hands', 5000, false, true, {disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = false, }, 
		{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()  
		TriggerEvent('QBCore:Notify', "You've washed your hands!", 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled", 'error')
    end, data.icon)
end)

RegisterNetEvent('VL-Atoms:Crafting:MakeItem', function(data)
	QBCore.Functions.TriggerCallback('VL-Atoms:Crafting:get', function(amount) 
		if not amount then TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error') else TriggerEvent('VL-Atoms:Crafting:ItemProgress', data) end		
	end, data.item, data.craft)
end)

RegisterNetEvent('VL-Atoms:client:GrabBag', function(data)
	QBCore.Functions.Progressbar('making_food', "Grabbing Empty Murder Bag", 2000, false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = false, }, 
	{ animDict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle", flags = 8, },
	{}, {}, function()  
		TriggerServerEvent("VL-Atoms:server:GrabBag")
		ClearPedTasks(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		ClearPedTasks(PlayerPedId())
	end, "murderbag")
end)

RegisterNetEvent('VL-Atoms:Crafting:ItemProgress', function(data)
	if data.header == "Drinks Dispenser" then
		bartext = "Pouring "..QBCore.Shared.Items[data.item].label
		bartime = 3000
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
		animflag = 8
	elseif data.header == "Food Cabinet" then
		bartext = "Receiving "..QBCore.Shared.Items[data.item].label
		bartime = 3000
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"	
		animflag = 8
	elseif data.item == "slicedpotato" or data.item == "slicedonion" then
		bartext = "Slicing "..QBCore.Shared.Items[data.item].label
		bartime = 2500
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
		animflag = 3
	elseif data.item == "cheesewrap" or data.item == "chickenwrap" then
		bartext = "Preparing "..QBCore.Shared.Items[data.item].label
		bartime = 5000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
		animflag = 8
	elseif data.header == "Deep Fat Fryer" then
		bartext = "Frying "..QBCore.Shared.Items[data.item].label
		bartime = 5000
		animDictNow = "mp_arresting"
		animNow = "a_uncuff"
		animflag = 8
	elseif data.header == "Grill" then
		bartext = "Cooking "..QBCore.Shared.Items[data.item].label
		bartime = 5000
		animDictNow = "amb@prop_human_bbq@male@base"
		animNow = "base"
		animflag = 8
	elseif data.header == "Prepare Food" then
		bartext = "Preparing "..QBCore.Shared.Items[data.item].label
		bartime = 5000
		animDictNow = "mini@repair"
		animNow = "fixing_a_ped"			
		animflag = 8
	else 
		bartext = "Preparing "..QBCore.Shared.Items[data.item].label
		bartime = 6000
		animDictNow = "mini@repair"
		animNow = "fixing_a_ped"			
		animflag = 8
	end
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, }, 
	{ animDict = animDictNow, anim = animNow, flags = animflag, },
	{}, {}, function()  
		TriggerServerEvent('VL-Atoms:Crafting:GetItem', data.item, data.craft)
		TriggerEvent("VL-Atoms:Crafting", data)
		ClearPedTasks(PlayerPedId())
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		ClearPedTasks(PlayerPedId())
	end, data.item)
end)

RegisterNetEvent('VL-Atoms:Stash', function(data, id)
	if id then -- If it has a bag ID then open the limited stash
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "atoms_"..id, { maxweight = 50000, slots = 10, })
		TriggerEvent("inventory:client:SetCurrentStash", "atoms_"..id)
	else
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "atoms_"..data.id) 
		TriggerEvent("inventory:client:SetCurrentStash", "atoms_"..data.id)
	end
end)

RegisterNetEvent('VL-Atoms:shop', function()
	if not jobCheck() then return end
	local event = "inventory:server:OpenInventory"
	TriggerServerEvent(event, "shop", "atoms", Config.Atoms.Items)
end)

RegisterNetEvent('VL-Atoms:Crafting', function(data)
	if not jobCheck() then return end
	local Menu = {}
	Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
	Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "VL-Atoms:client:Menu:Close" } }
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = "<img src=nui://"..Config.Atoms.img..QBCore.Shared.Items[k].image.." width=35px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				if Config.Atoms.CheckMarks then
					local p = promise.new()
					QBCore.Functions.TriggerCallback('VL-Atoms:Crafting:get', function(cb) p:resolve(cb) end, k, data.craftable[i])
					if Citizen.Await(p) then setheader = setheader.." ✅" end
				end
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
					settext = text
				end
				Menu[#Menu + 1] = { icon = k, header = setheader, txt = settext, params = { event = "VL-Atoms:Crafting:MakeItem", args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } } }
				settext, setheader = nil
			end Wait(0)
		end
	end
	exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('VL-Atoms:client:Drink', function(itemName)
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
		if Config.Atoms.RewardItem == itemName then 
			local prize = Config.Atoms.RewardPool[math.random(1, #Config.Atoms.RewardPool)]
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