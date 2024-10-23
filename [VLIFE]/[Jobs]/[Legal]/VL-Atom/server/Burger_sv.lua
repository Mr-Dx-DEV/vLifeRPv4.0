local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	for k, v in pairs(CraftingAtoms) do 
		for i = 1, #v do
			for l, b in pairs(v[i]) do
				if not QBCore.Shared.Items[l] and l ~= "amount" then print("Crafting: Missing Item from QBCore.Shared.Items: '"..l.."'") end
				if type(b) == "table" then 
					for j, c in pairs(b) do	if not QBCore.Shared.Items[j] then print("Crafting: Missing Item from QBCore.Shared.Items: '"..j.."'") end end end end end end
	for i = 1, #Config.Atoms.Items.items do
		if not QBCore.Shared.Items[Config.Atoms.Items.items[i].name] then print("Store: Missing Item from QBCore.Shared.Items: '"..Config.Atoms.Items.items[i].name.."'") end
	end
	if not QBCore.Shared.Jobs["atoms"] then print("Error: Job role not found - 'atoms'") end
end)

RegisterServerEvent("VL-Atoms:server:GrabBag", function()
	local src = source local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["murderbag"], "add", 1)
	Player.Functions.AddItem("murderbag", 1, false, { ["id"] = math.random(1, 9999999) })
end)

---Crafting 
RegisterServerEvent('VL-Atoms:Crafting:GetItem', function(ItemMake, craftable)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	--This grabs the table from client and removes the item requirements
	if craftable["amount"] then amount = craftable["amount"] else amount = 1 end
	for k,v in pairs(craftable[ItemMake]) do
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(k)], "remove", v) 
		Player.Functions.RemoveItem(tostring(k), v)
		if Config.Atoms.Debug then print("Removing "..tostring(k)) end
	end
	--This should give the item, while the rest removes the requirements
	Player.Functions.AddItem(ItemMake, amount)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ItemMake], "add", amount)
	if Config.Atoms.Debug then print("Giving Player "..tostring(ItemMake).." x"..amount) end
end)

---ITEM REQUIREMENT CHECKS
QBCore.Functions.CreateCallback('VL-Atoms:Crafting:get', function(source, cb, item, craftable)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local hasitem = true
	local testtable = {}
	for k, v in pairs(craftable[item]) do testtable[k] = false end
	for k,v in pairs(craftable[item]) do
		if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(k) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(k).amount >= v then
			testtable[k] = true if Config.Atoms.Debug then print(k.." (x"..v..") found") end
		end
	end
	for k, v in pairs(testtable) do
		if not v then hasitem = false if Config.Atoms.Debug then print(QBCore.Shared.Items[k].label.." NOT found") end end
	end
	Wait(0)
	cb(hasitem)
end)
