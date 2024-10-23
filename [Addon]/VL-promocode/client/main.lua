local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('VL-promocodes:client:opengarageselector', function(result, args)
	local args = {
		selectedgarage = 'altapp',
		result = result,
		args = args
	}
    TriggerServerEvent("VL-promocodes:server:redeemvehicle", args)
end)
