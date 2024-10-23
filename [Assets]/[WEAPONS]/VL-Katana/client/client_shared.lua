local QBCore = nil

if Config.framework == "qb-core" then
    QBCore = exports[Config.framework]:GetCoreObject()
else
    -- custom framework or different framework stuff here
end

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
	PlayerData = val
    checkInvForKatanas(PlayerData.items)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    checkInvForKatanas(PlayerData.items)
end)

RegisterNetEvent("weapons:ResetHolster", function() -- qbcore related
    equippedWeapon = nil
    PlayerData = QBCore.Functions.GetPlayerData()
    checkInvForKatanas(PlayerData.items)
end)

RegisterNetEvent('ox_inventory:clearWeapons', function()
    equippedWeapon = nil
    PlayerData = QBCore.Functions.GetPlayerData()
    checkInvForKatanas(PlayerData.items)
end)

RegisterNetEvent('ox_inventory:disarm', function()
    equippedWeapon = nil
    PlayerData = QBCore.Functions.GetPlayerData()
    checkInvForKatanas(PlayerData.items)
end)

RegisterNetEvent('ox_inventory:useWeapon', function(weaponData)
    local ped = PlayerPedId()
    if not weaponData then
        equippedWeapon = nil
        PlayerData = QBCore.Functions.GetPlayerData()
        checkInvForKatanas(PlayerData.items)
    else
        local weaponName = string.lower(tostring(weaponData.name))
        if weaponName == equippedWeapon then
            equippedWeapon = nil
            PlayerData = QBCore.Functions.GetPlayerData()
            checkInvForKatanas(PlayerData.items)
        else
            if string.find(weaponName, "katana") then
                equippedWeapon = weaponName
                PlayerData = QBCore.Functions.GetPlayerData()
                checkInvForKatanas(PlayerData.items)
            end
        end
    end
end)

RegisterNetEvent('inventory:client:UseWeapon', function(weaponData, shootbool) -- qbcore related
    local ped = PlayerPedId()
    local weaponName = tostring(weaponData.name)
    if weaponName == equippedWeapon then
        equippedWeapon = nil
        PlayerData = QBCore.Functions.GetPlayerData()
        checkInvForKatanas(PlayerData.items)
    else
        if string.find(weaponName, "katana") then
            equippedWeapon = weaponName
            PlayerData = QBCore.Functions.GetPlayerData()
            checkInvForKatanas(PlayerData.items)
        end
    end
end)

AddEventHandler("onResourceStart", function(res)
    if res ~= GetCurrentResourceName() then return end

    if Config.framework == "qb-core" then
        Wait(1000)
        PlayerData = QBCore.Functions.GetPlayerData()
        checkInvForKatanas(PlayerData.items)
    end
end)
