local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem('armor', function(source)
    TriggerClientEvent('GM:client:UseArmor', source)
end)

QBCore.Functions.CreateUseableItem('armorplate', function(source)
    TriggerClientEvent('GM:client:UseArmorPlate', source)
end)



RegisterNetEvent('consumables:server:useHeavyArmor', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, 'heavyarmor', 1, false, 'consumables:server:useHeavyArmor') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['heavyarmor'], 'remove')
    TriggerClientEvent('hospital:server:SetArmor', source, 100)
    SetPedArmour(GetPlayerPed(source), 100)
end)

RegisterNetEvent('GM:server:useArmor', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, 'armor', 1, false, 'GM:server:useArmor') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['armor'], 'remove')
    TriggerClientEvent('hospital:server:SetArmor', source, 40)
    SetPedArmour(GetPlayerPed(source), 40)
end)

RegisterNetEvent('GM:server:useArmorPlate', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local ped = GetPlayerPed(source)
    local currentArmor = GetPedArmour(ped)
    local newArmor = math.min(currentArmor + 20, 100)

    if not Player then return end
    if not exports['qb-inventory']:RemoveItem(source, 'armorplate', 1, false, 'GM:server:useArmorPlate') then return end
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['armorplate'], 'remove')
    SetPedArmour(ped, newArmor)
    TriggerClientEvent('hospital:server:SetArmor', source, newArmor)
end)