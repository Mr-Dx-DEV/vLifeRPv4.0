
ESX    = nil
QBCore = nil

if Config.Framework == "qbcore" then
	QBCore = exports[Config.QBCoreName]:GetCoreObject()
elseif Config.Framework == "esx" then
	if Config.IsESXLegacy then
		ESX = exports[Config.ESXLegacyName]:getSharedObject()
	else
		ESX = nil
		CreateThread(function()
			while ESX == nil do
				TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
				Citizen.Wait(0)
			end
		end)
	end
else
	RegisterCommand(Config.TortureSceneCommand, function()
		ToggleTotureKitSpawner()
	end)
end

function Notify(msg, type)
	if (Config.Framework == "qbcore") and (QBCore ~= nil) then
		local notif = (((type == 2) and "error") or "success")
		QBCore.Functions.Notify(msg, notif, 5000)
	elseif (Config.Framework == "esx") and (ESX ~= nil) then
		local notif = (((type == 2) and "~r~") or "~g~")
		ESX.ShowNotification(notif..""..msg)
	else
		local notif = (((type == 2) and "~r~") or "~g~")
		SetNotificationTextEntry('STRING')
		AddTextComponentSubstringPlayerName(notif..""..msg)
		DrawNotification(false, true)
	end
end

RegisterNetEvent("dz-torture:client:Notify", function(msg, type)
	Notify(msg, type)
end)

RegisterNetEvent("dz-torture:client:TotureKitSpawner", function()
	ToggleTotureKitSpawner()
end)

function AddTortureKitItem()
	TriggerServerEvent('dz-torture:server:AddTortureKitItem')
end

function RemoveTortureKitItem()
	TriggerServerEvent('dz-torture:server:RemoveTortureKitItem')
end


