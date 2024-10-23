
ESX    = nil
QBCore = nil

if (Config.Framework == "qbcore") then
	QBCore = exports[Config.QBCoreName]:GetCoreObject()
	
	QBCore.Functions.CreateUseableItem(Config.TortureKitItem, function(source)
		local src = source
		TriggerClientEvent('dz-torture:client:TotureKitSpawner', src)
	end)
elseif (Config.Framework == "esx") then
	if Config.IsESXLegacy then
		ESX = exports[Config.ESXLegacyName]:getSharedObject()
	else
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	end
	
	ESX.RegisterUsableItem(Config.TortureKitItem, function(source)
		local src = source
		TriggerClientEvent('dz-torture:client:TotureKitSpawner', src)
	end)
end

RegisterNetEvent('dz-torture:server:AddTortureKitItem', function()
	local src = source
	if (Config.Framework == "qbcore") and (QBCore ~= nil) then
		local Player = QBCore.Functions.GetPlayer(src)
		Player.Functions.AddItem(Config.TortureKitItem, 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.TortureKitItem], "add", 1)
	elseif (Config.Framework == "esx") and (ESX ~= nil) then
		local Player = ESX.GetPlayerFromId(src)
		Player.addInventoryItem(Config.TortureKitItem, 1)
	end
end)

RegisterNetEvent('dz-torture:server:RemoveTortureKitItem', function()
	local src = source
	if (Config.Framework == "qbcore") and (QBCore ~= nil) then
		local Player = QBCore.Functions.GetPlayer(src)
		Player.Functions.RemoveItem(Config.TortureKitItem, 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.TortureKitItem], "remove", 1)
	elseif (Config.Framework == "esx") and (ESX ~= nil) then
		local Player = ESX.GetPlayerFromId(src)
		Player.removeInventoryItem(Config.TortureKitItem, 1)
	end
end)