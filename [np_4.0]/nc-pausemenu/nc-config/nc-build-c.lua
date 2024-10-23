local nc_menu_enabled = true
local QBCore = exports['qb-core']:GetCoreObject()

RegisterKeyMapping("nc-pausemenu:show", "", "keyboard", "ESCAPE")

RegisterCommand('nc-pausemenu:show', function ()
    local playerPed = PlayerPedId()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        -- Check if the player is dead, handcuffed, or in last stand
        local isDead = PlayerData.metadata['isdead'] or false
        local isHandcuffed = PlayerData.metadata['handcuffed'] or false
        local isInLastStand = PlayerData.metadata['inlaststand'] or false

        if not IsPauseMenuActive() and not IsNuiFocused() and not isDead and not isHandcuffed and not isInLastStand then
            if nc_menu_enabled then
                nc_pausemenu_show()
            end
        else
            if isDead then
                print('Cannot open pause menu while dead.')
            elseif isHandcuffed then
                print('Cannot open pause menu while handcuffed.')
            elseif isInLastStand then
                print('Cannot open pause menu while in last stand.')
            end
        end
    end)
end, false)



function nc_pausemenu_hide()
    StopScreenEffect(nc_config.nc_blur)
 --   DisableIdleCamera(false)
	SetNuiFocus(false, false)
	SetNuiFocusKeepInput(false)
	SendNUIMessage({
		type = "hide",
		toggle = false,
	});
end

RegisterNetEvent('nc-pausemenu:hide')
AddEventHandler('nc-pausemenu:hide', function()
	nc_pausemenu_hide()
end)

RegisterNetEvent('nc-pausemenu:disable')
AddEventHandler('nc-pausemenu:disable', function()
	nc_menu_enabled = false
end)

RegisterNetEvent('nc-pausemenu:enable')
AddEventHandler('nc-pausemenu:enable', function()
	nc_menu_enabled = true
end)

function nc_call_logout()
	TriggerEvent('qb-multicharacter:start')
end