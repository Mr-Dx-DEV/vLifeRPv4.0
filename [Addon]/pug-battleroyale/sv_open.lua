local QBCore = exports[Config.CoreName]:GetCoreObject()

for k, v in pairs(Config.RoyaleLoot) do
	QBCore.Functions.CreateUseableItem(v.name, function(source, item)
		local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1) then
			TriggerClientEvent('Pug:client:UseRoyaleItem', source, item)
		end
	end)
end
QBCore.Functions.CreateUseableItem('pug_vr', function(source, item)
    if Config.HasPaintball then
        TriggerClientEvent('Pug:client:ViewBattleGameMenus', source, item)
    else
        TriggerClientEvent('Pug:client:ViewBattleRoyale', source, item)
    end
end)
RegisterServerEvent('Pug:server:BothVRGamesMenus', function()
    if Config.HasPaintball then
        TriggerClientEvent('Pug:client:ViewBattleGameMenus', source)
    else
        TriggerClientEvent('Pug:client:ViewBattleRoyale', source)
    end
end)
RegisterServerEvent('Pug:server:SaveRoyaleItems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local CitizenId = Player.PlayerData.citizenid
	local PlayerItems = Player.PlayerData.items
	local Result = MySQL.query.await('SELECT * FROM pug_paintball WHERE citizenid = ?', {CitizenId})
	if Result[1] then
		if Config.Debug then
			print(Result[1].gameitems, 'data table')
		end
		if Result[1].gameitems == "nothing" then
			MySQL.update('UPDATE pug_paintball SET gameitems = ? WHERE citizenid = ?', { json.encode(PlayerItems), CitizenId })
		end
	else
		if Config.Debug then
			print('data table not found')
		end
		MySQL.insert.await('INSERT INTO pug_paintball (citizenid, gameitems, kills, deaths, wins) VALUES (?,?,?,?,?)', {
			CitizenId, json.encode(PlayerItems), 0, 0, 0
		})
	end
	Wait(200)
	if GetResourceState("ox_inventory") == 'started' then
		exports.ox_inventory:ClearInventory(src)
	else
		Player.Functions.ClearInventory(src)
	end
	if Config.Debug then
		print('clearing ' .. src)
	end
end)
RegisterServerEvent('Pug:server:GiveRoyaleItems', function(Bool)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local CitizenId = Player.PlayerData.citizenid
	local Result = MySQL.query.await('SELECT * FROM pug_paintball WHERE citizenid = ?', {CitizenId})
	if Result[1] then
		Wait(1000)
		if Config.Debug then
			print(Result[1].gameitems, 'data table2')
		end
		if Result[1].gameitems == "nothing" then
		else
			if json.decode(Result[1].gameitems) ~= nil then
				for k, v in pairs(json.decode(Result[1].gameitems)) do
					if tostring(string.lower(Config.InventoryType)) == "qb-inventory" then
						exports["qb-inventory"]:AddItem(src, v.name, v.amount, false, v.info)
					elseif tostring(string.lower(Config.InventoryType)) == "lj-inventory" then
						exports["lj-inventory"]:AddItem(src, v.name, v.amount, false, v.info)
					elseif tostring(string.lower(Config.InventoryType)) == "ps-inventory" then
						exports["ps-inventory"]:AddItem(src, v.name, v.amount, false, v.info)
					elseif tostring(string.lower(Config.InventoryType)) == "ox_inventory" then 
						local ox_inventory = exports.ox_inventory
						ox_inventory:AddItem(src, v.name, v.count, v.metadata, v.slot)
					elseif tostring(string.lower(Config.InventoryType)) == "qs-inventory" then 
						exports['qs-inventory']:AddItem(src, v.name, v.count, v.slot, v.info)
					elseif tostring(string.lower(Config.InventoryType)) == "codem-inventory" then
						exports['codem-inventory']:AddItem(src, v.name, v.amount, v.slot, v.info)
					elseif tostring(string.lower(Config.InventoryType)) == "tgiann-inventory" then
						exports["tgiann-inventory"]:AddItem(src, v.name, v.amount, v.slot, v.info)
					else
						Player.AddItem(v.name, v.amount, false, v.info)
					end
				end
			else
				print"^3 YOUR ITEMS ARE NOT SAVING PROPERLY, THIS IS AN INVENTORY ISSUE. RAISE A TICKET IN THE ^1PUG-DEVELOPMENT DISCORD ^3FOUND IN THE README"
				print("^1 YOU MUST DELETE ALL OF THE TABLES WITH NULL DATA IN THEM FROM THE PUG_PAINTBALL DATABASE TABLE. INVENTORY BEING USED IS " .. Config.InventoryType)
			end
			Wait(500)
			if Bool then
				if tostring(string.lower(Config.InventoryType)) == "qs-inventory" then 
					exports['qs-inventory']:RemoveItem(src, "radio", 1)
				end
			end
			MySQL.update('UPDATE pug_paintball SET gameitems = ? WHERE citizenid = ?', { "nothing", CitizenId })
		end
	end
end)
