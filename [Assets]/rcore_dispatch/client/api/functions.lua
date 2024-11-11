-- Place here custom alerts, the system allows the following alert types:
-- 'alert': Normal alert
-- 'car_robbery': Car robbery alert with text and coords automatically sent
-- 'bank_robbery': Bank robbery alert with text and coords automatically sent (bank robbery can be used also for another types of heists like train heist etc, it is just used internally by the resource to track stats)
-- 'shop_robbery': Shop robbery alert with text and coords automatically sent

-- The 'code' is just an string and the priority can be:
-- 'low' | 'normal' | 'high'

function RGBToHex(r, g, b)
    local function componentToHex(c)
        local hex = string.format('%02X', c)
        return hex
    end
    local hex = '#' .. componentToHex(r) .. componentToHex(g) .. componentToHex(b)
    return hex
end

if GetResourceState('screenshot-basic') ~= 'started' then
    CL_CONFIG.CarRobberyPicture = false
    dbg.warning('Screenshot-basic resource is not started, disabling car robbery picture')
end

---A car robbery function used as an example
function carRobbery()
    local text = 'A car model %s painted in %s has been stolen in my position by a %s! Police come please!!'
    local data = exports['rcore_dispatch']:GetPlayerData()
    local ped = data.ped
    if not IsPedInAnyVehicle(ped) then return end
    local model_form = data.vehicle_data.model_form
    text = string.format(text, model_form, data.vehicle_data.dispatch_color, data.sex)
    local coords = data.coords
    if CL_CONFIG.CarRobberyPicture then
        exports['screenshot-basic']:requestScreenshotUpload(CL_CONFIG.CarRobberyPictureWebhook, "files[]",
            function(data)
                local image = json.decode(data)
                if not image.attachments[1] then return end
                local data = {
                    code = '10-64',
                    default_priority = 'low',
                    coords = coords,
                    job = 'police',
                    text = text,
                    image = image.attachments[1].proxy_url,
                    type = 'car_robbery',
                    blip_time = 5, -- Minimum 5 minutes
                    blip = {
                        sprite = 56,
                        colour = 3,
                        scale = 0.7,
                        text = 'Car theft'
                    }
                }
                TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
            end)
    else
        local data = {
            code = '10-64',
            default_priority = 'low',
            coords = coords,
            job = 'police',
            text = text,
            type = 'car_robbery',
            blip = {
                sprite = 56,
                colour = 3,
                scale = 0.7,
                text = 'Car theft',
                flashes = false,
                radius = 0
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    end
end

RegisterCommand('vehrob', carRobbery)


--[[ function AskForRescue()
    if not GLOBALS.CHARACTER.IS_ALLOWED then return end
    local text = 'A %s officer is in need of assistance, please come as fast as possible.'
    local data = exports['rcore_dispatch']:GetPlayerData()
    text = text:format(data.sex)
    local coords = data.coords
    local data = {
        code = '10-13 - Officer in distress ',
        default_priority = 'high',
        coords = coords,
        job = GLOBALS.CHARACTER.JOB,
        text = text,
        sos = true,
        type = 'alerts',
        blip = {
            sprite = 84,
            colour = 3,
            scale = 0.7,
            flashes = true,
            text = '10-13 - Officer in distress',
        }
    }
    TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
end

RegisterCommand('rescue', AskForRescue) ]]

---A shop robbery function used as an example
function shopRobbery()
    local data = GetPlayerData()
    local text = ('Hello, they are robbing a store here in %s! Please come as fast as possible.'):format(data.street)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local data = {
        code = '10-64',
        default_priority = 'medium',
        coords = coords,
        job = 'police',
        text = text,
        type = 'shop_robbery',
        blip_time = 20,
        blip = {
            sprite = 84,
            colour = 3,
            scale = 0.7,
            text = 'Shop robbery'
        }
    }
    TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
end

---A bank robbery function used as an example
function bankRobbery()
    local data = GetPlayerData()
    local text = ('Hello, they are robbing a bank here in %s! Please come as fast as possible.'):format(data.street)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local data = {
        code = '10-64',
        default_priority = 'high',
        coords = coords,
        job = 'police',
        text = text,
        type = 'bank_robbery',
        blip_time = 20,
        blip = {
            sprite = 84,
            colour = 3,
            scale = 0.7,
            text = 'Bank robbery'
        }
    }
    TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
end

---Function to send an alert
---@param args string
---@param job string | table
function PrepareAlert(args, job, provData, blip)
    if not args then
        -- Notify
        return
    end
    local text = args
    if not text then return end
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local data = {
        code = provData.code,
        default_priority = provData.default_priority,
        coords = coords,
        job = job,
        sos = provData.sos or nil,
        text = text,
        type = 'alerts',
        blip_time = provData.blip_time or 15,
        custom_sound = provData.custom_sound or nil,
        blip = blip or {
            sprite = 58,
            colour = 3,
            scale = 0.7
        }
    }
    TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
end

---Function to send an alert related with drugs
---@param text string
---@param blip_text string
---@param options table | nil {code: string, priority: string, job: string | table, sprite: number, colour: number, scale: number, blip_time: number}
function DrugSale(text, blip_text, options)
    local data = {
        code = options and options.code or '320',
        default_priority = options and options.priority or 'medium',
        coords = GetEntityCoords(PlayerPedId()),
        job = options and options.job or 'police',
        text = text or 'Someone is selling drugs in this position, please come as fast as possible.',
        type = 'alerts',
        blip_time = options and options.blip_time or 15,
        blip = {
            sprite = options and options.sprite or 140,
            colour = options and options.colour or 2,
            scale = options and options.scale or 0.7,
            text = blip_text or 'Drug sale'
        }
    }
    TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
end

exports('DrugSale', DrugSale)
exports('BankRobbery', bankRobbery)
exports('ShopRobbery', shopRobbery)

--[[ RegisterCommand('test1', function()
    local data = exports['rcore_dispatch']:GetPlayerData()
    TriggerServerEvent('rcore_dispatch:server:sendAlert', {
        code = '10-45',
        default_priority = 'high',
        coords = data.coords,
        job = 'ambulance',
        text = 'An injured ' .. data.sex .. ' requires assistance at ' .. data.street,
        type = 'alerts',
        blip_time = 5,
        image = 'https://i.pinimg.com/originals/55/95/be/5595bec877bf313f00c028494b68c1e7.jpg',
        custom_sound = './externalpanic.ogg',
        blip = {
            sprite = 153,
            colour = 3,
            scale = 1.2,
            text = 'Injured Person',
            flashes = true,
            radius = 0,
        }
    })
end) ]]

RegisterNetEvent('rcore_dispatch:client:shopRobbery', shopRobbery)
RegisterNetEvent('rcore_dispatch:client:bankRobbery', bankRobbery)

function Notify(text)
    AddTextEntry('rcore_notify2', text)
    BeginTextCommandThefeedPost('rcore_notify2')
    EndTextCommandThefeedPostTicker(false)
end

RegisterCommand('setunit', function(source, args)
    local unit = table.concat(args, ' ')
    if GLOBALS.CHARACTER.IS_ALLOWED and unit then
        TriggerServerEvent('rcore_dispatch:server:actionTriggered', 'change_unit', GLOBALS.CHARACTER.ID, unit)
    end
end)

RegisterCommand('toggle_disp', function()
    if GLOBALS.CHARACTER.IS_ALLOWED then
        GLOBALS.CHARACTER.IS_AVAILABLE = not GLOBALS.CHARACTER.IS_AVAILABLE
        TriggerServerEvent('rcore_dispatch:server:actionTriggered', 'toggle_available')
        local string_av = 'You are now available'
        if not GLOBALS.CHARACTER.IS_AVAILABLE then
            string_av = 'You are not available'
        end
        Notify(string_av)
    end
end)

function DisableDisplayControlActions()
    DisableControlAction(0, 1, true)   -- disable mouse look
    DisableControlAction(0, 2, true)   -- disable mouse look
    DisableControlAction(0, 3, true)   -- disable mouse look
    DisableControlAction(0, 4, true)   -- disable mouse look
    DisableControlAction(0, 5, true)   -- disable mouse look
    DisableControlAction(0, 6, true)   -- disable mouse look
    DisableControlAction(0, 263, true) -- disable melee
    DisableControlAction(0, 264, true) -- disable melee
    DisableControlAction(0, 257, true) -- disable melee
    DisableControlAction(0, 140, true) -- disable melee
    DisableControlAction(0, 141, true) -- disable melee
    DisableControlAction(0, 142, true) -- disable melee
    DisableControlAction(0, 143, true) -- disable melee
    DisableControlAction(0, 177, true) -- disable escape
    DisableControlAction(0, 200, true) -- disable escape
    DisableControlAction(0, 199, true)
    DisableControlAction(0, 202, true) -- disable escape
    DisableControlAction(0, 322, true) -- disable escape
    DisableControlAction(0, 245, true) -- disable chat
    DisableControlAction(0, 200, true) -- disable escape
    DisableControlAction(0, 202, true) -- disable chat
    DisableControlAction(0, 177, true) -- disable chat
    DisableControlAction(0, 30, true)
    DisableControlAction(0, 31, true)
    DisableControlAction(0, 32, true)
    DisableControlAction(0, 33, true)
    DisableControlAction(0, 241, true)
    DisableControlAction(0, 242, true)
    DisableControlAction(0, 332, true)
    DisableControlAction(0, 333, true)
    DisableControlAction(0, 334, true)
    DisableControlAction(0, 335, true)
    DisableControlAction(0, 336, true)
    DisableControlAction(0, 12, true)
    DisableControlAction(0, 13, true)
    DisableControlAction(0, 14, true)
    DisableControlAction(0, 15, true)
    DisableControlAction(0, 16, true)
    DisableControlAction(0, 17, true)
    DisableControlAction(0, 19, true)
    DisableControlAction(0, 27, true)
    DisableControlAction(0, 50, true)
    DisableControlAction(0, 85, true)
    DisableControlAction(0, 96, true)
    DisableControlAction(0, 97, true)
    DisableControlAction(0, 99, true)
    DisableControlAction(0, 115, true)
    DisableControlAction(0, 180, true)
    DisableControlAction(0, 181, true)
    DisableControlAction(0, 198, true)
end

-- Function used to move on /config_switch command
function DisableDisplayControlActionsOnConfig()
    DisableControlAction(0, 1, true)   -- disable mouse look
    DisableControlAction(0, 2, true)   -- disable mouse look
    DisableControlAction(0, 3, true)   -- disable mouse look
    DisableControlAction(0, 4, true)   -- disable mouse look
    DisableControlAction(0, 5, true)   -- disable mouse look
    DisableControlAction(0, 6, true)   -- disable mouse look
    DisableControlAction(0, 263, true) -- disable melee
    DisableControlAction(0, 264, true) -- disable melee
    DisableControlAction(0, 257, true) -- disable melee
    DisableControlAction(0, 140, true) -- disable melee
    DisableControlAction(0, 141, true) -- disable melee
    DisableControlAction(0, 142, true) -- disable melee
    DisableControlAction(0, 143, true) -- disable melee
    DisableControlAction(0, 177, true) -- disable escape
    DisableControlAction(0, 200, true) -- disable escape
    DisableControlAction(0, 199, true)
    DisableControlAction(0, 202, true) -- disable escape
    DisableControlAction(0, 322, true) -- disable escape
    DisableControlAction(0, 245, true) -- disable chat
    DisableControlAction(0, 200, true) -- disable escape
    DisableControlAction(0, 202, true) -- disable chat
    DisableControlAction(0, 177, true) -- disable chat
    DisableControlAction(0, 241, true)
    DisableControlAction(0, 242, true)
    DisableControlAction(0, 332, true)
    DisableControlAction(0, 333, true)
    DisableControlAction(0, 334, true)
    DisableControlAction(0, 335, true)
    DisableControlAction(0, 336, true)
    DisableControlAction(0, 12, true)
    DisableControlAction(0, 13, true)
    DisableControlAction(0, 14, true)
    DisableControlAction(0, 15, true)
    DisableControlAction(0, 16, true)
    DisableControlAction(0, 17, true)
    DisableControlAction(0, 19, true)
    DisableControlAction(0, 27, true)
    DisableControlAction(0, 50, true)
    DisableControlAction(0, 85, true)
    DisableControlAction(0, 96, true)
    DisableControlAction(0, 97, true)
    DisableControlAction(0, 99, true)
    DisableControlAction(0, 115, true)
    DisableControlAction(0, 180, true)
    DisableControlAction(0, 181, true)
    DisableControlAction(0, 198, true)
end

RegisterCommand('remove_alerts', function()
    RemoveAllAlertsNUI()
end)

function IsPlayerInNonGunshotArea()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    for _, v in pairs(CL_CONFIG.GunshotAlerts.areas) do
        if #(coords - v.coords) <= v.radius then
            return true
        end
    end
    return false
end

function IsJobWhitelisted()
    local job = GLOBALS.CHARACTER.JOB
    for _, v in pairs(CL_CONFIG.GunshotAlerts.whitelisted_jobs) do
        if v == job then
            return true
        end
    end
    return false
end

function ThereIsPedNear()
    local ped = PlayerPedId()
    if CL_CONFIG.GunshotAlerts.near_peds.enabled == false then return true end
    local peds = GetGamePool('CPed')
    local coords = GetEntityCoords(ped)
    for k, v in pairs(peds) do
        if v ~= ped and not IsPedAPlayer(v) then
            local pedCoords = GetEntityCoords(v)
            if #(coords - pedCoords) <= CL_CONFIG.GunshotAlerts.near_peds.distance then
                return true
            end
        end
    end
    return false
end

local shooting = false

CreateThread(function()
    while true and CL_CONFIG.GunshotAlerts.enabled do
        local ped = PlayerPedId()
        local owns_weapon, weapon = GetCurrentPedWeapon(ped)
        if not owns_weapon then
            Wait(800)
        end
        if IsPedShooting(ped) and not CL_CONFIG.GunshotAlerts.whitelisted_weapons[weapon] and not IsPedCurrentWeaponSilenced(ped) then
            if not shooting and ThereIsPedNear() and not IsPlayerInNonGunshotArea() and not IsJobWhitelisted() then
                shooting = true
                local pedType = ''
                if IsPedMale(ped) then
                    pedType = 'male'
                else
                    pedType = 'woman'
                end
                local weapon_name = CL_CONFIG.GunshotAlerts.labels[weapon]
                if not weapon_name then
                    weapon_name = 'unknown weapon'
                end
                local text = ('Hello, a %s is shooting with a %s in my position, please come as fast as possible.')
                    :format(
                        pedType,
                        weapon_name
                    )
                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                local data = {
                    code = '10-54',
                    default_priority = 'high',
                    coords = coords,
                    job = 'police',
                    text = text,
                    type = 'alerts',
                    blip = {
                        sprite = 84,
                        colour = 3,
                        scale = 0.7
                    }
                }
                TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
                SetTimeout(20000, function()
                    shooting = false
                end)
            end
        end
        Wait(0)
    end
end)

function GetPlayerData()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local street = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(street)
    local zone = GetNameOfZone(coords.x, coords.y, coords.z)
    local zoneName = GetLabelText(zone)
    local sex = ''
    if GetEntityModel(ped) == `mp_m_freemode_01` then
        sex = 'male'
    else
        sex = 'woman'
    end
    local isPlayerInVehicle = IsPedInAnyVehicle(ped)
    local data = {
        ped = ped,
        coords = coords,
        street_1 = streetName,
        zone = zoneName,
        sex = sex,
        street = streetName .. ', ' .. zoneName,
        street_2 = zoneName,
        player_in_vehicle = isPlayerInVehicle,
    }
    if isPlayerInVehicle then
        local vehicle = GetVehiclePedIsIn(ped, false)
        local model = GetEntityModel(vehicle)
        local model_string = GetDisplayNameFromVehicleModel(model)
        local model_form = model_string:sub(1, 1):upper() .. model_string:sub(2):lower()
        local r, g, b = GetVehicleColor(vehicle)
        local speed = GetEntitySpeed(vehicle) * 3.6
        local plate = GetVehicleNumberPlateText(vehicle)
        local heading = GetEntityHeading(vehicle)
        local heading_text = ''
        if heading >= 0 and heading <= 90 then
            heading_text = 'North'
        elseif heading > 90 and heading <= 180 then
            heading_text = 'East'
        elseif heading > 180 and heading <= 270 then
            heading_text = 'South'
        elseif heading > 270 and heading <= 360 then
            heading_text = 'West'
        end
        if CL_CONFIG.UsingMilesPerHour then
            speed = GetEntitySpeed(vehicle) * 2.236936
        end
        data.vehicle_data = {
            model = model,
            vehicle_entity = vehicle,
            model_string = model_string,
            model_form = model_form,
            heading = heading_text,
            vehicle_plate = plate,
            color = RGBToHex(r, g, b),
            dispatch_color = '/' .. RGBToHex(r, g, b) .. [[\]],
            speed = string.format("%.2f", speed) .. ' km/h'
        }
        data.vehicle = vehicle
        data.vehicle_label = model_form
        data.vehicle_colour = '/' .. RGBToHex(r, g, b) .. [[\]]
        data.speed = string.format("%.2f", speed) .. ' km/h'
        data.heading = heading_text
        data.vehicle_plate = plate
        data.unique_id = 'you_found_this_easter_egg, congrats!'
    end
    return data
end

exports('GetPlayerData', GetPlayerData)

CreateThread(function()
    local prev_vehicle = nil
    while CL_CONFIG.AutoCarRobbery do
        local player_ped = PlayerPedId()
        prev_vehicle = nil
        local veh = GetVehiclePedIsTryingToEnter(player_ped)
        if DoesEntityExist(veh) then
            local driver = GetPedInVehicleSeat(veh, -1)
            local job = GLOBALS.CHARACTER.JOB
            local is_police = false
            if CONFIG.JOBS[job] then
                is_police = CONFIG.JOBS[job].Ispolice
            end
            if driver ~= 0 and not IsPedAPlayer(driver) and veh ~= prev_vehicle and not is_police then
                prev_vehicle = veh
                local timeout = GetGameTimer() + 8000
                local send_alert = true
                while not IsPedSittingInVehicle(player_ped, veh) do
                    if GetGameTimer() > timeout then
                        send_alert = false
                        dbg.info('Timeout reached')
                        break
                    end
                    Wait(0)
                end
                if IsPedSittingInVehicle(player_ped, veh) and send_alert then
                    dbg.info('Sending auto car robbery alert')
                    ExecuteCommand('vehrob')
                end
            end
        else
            Wait(500)
        end
        Wait(0)
    end
end)

CreateThread(function()
    while CL_CONFIG.AutoCarRobbery do
        local sleep = 500
        local ped = PlayerPedId()
        local can_be_stolen = false

        if IsPedGettingIntoAVehicle(ped) then
            sleep = 100
            local vehicle = GetVehiclePedIsTryingToEnter(ped)
            if vehicle ~= 0 then
                local lockStatus = GetVehicleDoorLockStatus(vehicle)
                if lockStatus == 7 then
                    can_be_stolen = true
                    while lockStatus == 7 do
                        Wait(0)
                        lockStatus = GetVehicleDoorLockStatus(vehicle)
                    end
                else
                    can_be_stolen = false
                end
                if lockStatus == 1 then
                    Wait(5000)
                end
                if can_be_stolen and lockStatus == 1 then
                    ExecuteCommand('vehrob')
                    can_be_stolen = false
                end
            end
        end
        Wait(sleep)
    end
end)

exports('ToggleSwitchboard', ToggleSwitchboard)

local is_in_pause = false
local current_status = false
CreateThread(function()
    while true do
        Wait(700)
        if IsPauseMenuActive() then
            if not is_in_pause then
                current_status = GLOBALS.UTILS.SWITCHBOARD_OPENED
                ToggleSwitchboard(false)
            end
            is_in_pause = true
        else
            if is_in_pause then
                if current_status then
                    ToggleSwitchboard(true)
                end
            end
            is_in_pause = false
        end
        if not GLOBALS.CHARACTER.IS_ALLOWED then
            Wait(1500)
        end
    end
end)

RegisterCommand('emit', function(source, args)
    if GLOBALS.CHARACTER.IS_ALLOWED then
        local unit = table.concat(args, ' ')
        ChangeRadioModeNUI({
            type = 'specific_radio',
            unit = unit
        })
    end
end)

RegisterCommand('reset_emit', function()
    if GLOBALS.CHARACTER.IS_ALLOWED then
        ChangeRadioModeNUI({
            type = 'global_radio'
        })
    end
end)

---Function used by dispatch to create a blip
---@param data table
---@return number
function CreateDispatchBlip(data)
    local blip = nil
    if data.alert.blip.radius ~= nil and data.alert.blip.radius > 0 then
        blip = AddBlipForRadius(data.alert.coords.x, data.alert.coords.y, data.alert.coords.z, data.alert.blip
            .radius + 0.0)
        SetBlipColour(blip, data.alert.blip.colour or 1)
        SetBlipAlpha(blip, 80)
    else
        blip = AddBlipForCoord(data.alert.coords.x, data.alert.coords.y, data.alert.coords.z)
        SetBlipDisplay(blip, 4)
        SetBlipSprite(blip, data.alert.blip.sprite or 0)
        local scale = data.alert.blip.scale or 0.7
        SetBlipScale(blip, scale + 0.0)
    end
    SetBlipColour(blip, data.alert.blip.colour or 1)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(data.alert.blip.text or _U('ALERT'))
    EndTextCommandSetBlipName(blip)
    SetBlipFlashes(blip, data.alert.blip.flashes or false)
    SetBlipFlashInterval(blip, 500)
    return blip
end

function ChangeCallsign(callsign)
    TriggerServerEvent('rcore_dispatch:server:changeCallsign', callsign)
end

exports('ChangeCallsign', ChangeCallsign)

function RemoveCallsign()
    TriggerServerEvent('rcore_dispatch:server:removeCallsign')
end

exports('RemoveCallsign', RemoveCallsign)

function GetCallsign()
    return GLOBALS.CHARACTER.CALLSIGN
end

exports('GetCallsign', GetCallsign)

RegisterCommand('silent', function()
    SendReactMessage('TOGGLE_SILENT')
end)

RegisterCommand('setcallsign', function(source, args)
    local callsign = table.concat(args, ' ')
    ChangeCallsign(callsign)
end)

RegisterCommand('removecallsign', function()
    RemoveCallsign()
end)
