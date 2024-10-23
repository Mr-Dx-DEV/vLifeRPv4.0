local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('GM:client:UseArmor', function()
    if GetPedArmour(PlayerPedId()) >= 1 then
        QBCore.Functions.Notify('You already have enough armor on! Use Armour Plate!', 'error')
        return
    end
    QBCore.Functions.Progressbar('use_armor', 'Putting on the body armour...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('GM:server:useArmor')
    end)
end)

RegisterNetEvent('GM:client:UseArmorPlate', function()
    local currentArmor = GetPedArmour(PlayerPedId())

     if currentArmor <= 1 then
        QBCore.Functions.Notify('You need an armor to use an armor plate!', 'error')
        return
    end

    if currentArmor >= 100 then
        QBCore.Functions.Notify('Your armor is already full!', 'error')
        return
    end

    QBCore.Functions.Progressbar('use_armorplate', 'Putting on Armor Plate', 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "clothingtie",
        anim = "try_tie_positive_a",
        flags = 49,
    }, {}, {}, function() -- Done
        ClearPedTasks(PlayerPedId()) -- Stop the animation after finishing the action
        TriggerServerEvent('GM:server:useArmorPlate')
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId()) -- Stop the animation if the player cancels
    end)
end)

--[[ RegisterNetEvent('consumables:client:UseHeavyArmor', function()
    if GetPedArmour(PlayerPedId()) == 100 then
        QBCore.Functions.Notify(Lang:t('consumables.armor_full'), 'error')
        return
    end
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    QBCore.Functions.Progressbar('use_heavyarmor', Lang:t('consumables.heavy_armor_progress'), 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if not Config.Disable.vestDrawable then
            if PlayerData.charinfo.gender == 0 then
                currVest = GetPedDrawableVariation(ped, 9)
                currVestTexture = GetPedTextureVariation(ped, 9)
                if GetPedDrawableVariation(ped, 9) == 7 then
                    SetPedComponentVariation(ped, 9, 19, GetPedTextureVariation(ped, 9), 2)
                else
                    SetPedComponentVariation(ped, 9, 5, 2, 2)
                end
            else
                currVest = GetPedDrawableVariation(ped, 30)
                currVestTexture = GetPedTextureVariation(ped, 30)
                SetPedComponentVariation(ped, 9, 30, 0, 2)
            end
        end
        TriggerServerEvent('consumables:server:useHeavyArmor')
    end)
end) ]]