local function GetStreetAndZone(coords)
    local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    return street .. ", " .. zone
end

function GetPlayerGender()
    local gender = 'Female'
    if IsPedMale(PlayerPedId()) then
        gender = 'Male'
    end
    return gender
end

local function GetPlayerHeading()
    return GetEntityHeading(PlayerPedId())
end

local function CustomAlert(data)
    local coords = data.coords or vector3(0.0, 0.0, 0.0)
    if data.job then job = data.job end
    local gender = GetPlayerGender()
    if not data.gender then gender = nil end


    local dispatchData = {
        message = data.message or '',                          -- Title of the alert
        codeName = data.dispatchCode or 'NONE',                -- Unique name for each alert
        code = data.code or '10-80',                           -- Code that is displayed before the title
        icon = data.icon or 'fas fa-question',                 -- Icon that is displaed after the title
        priority = data.priority or 2,                         -- Changes color of the alert ( 1 = red, 2 = default )
        coords = coords,                                       -- Coords of the player
        gender = gender,                                       -- Gender of the player
        street = GetStreetAndZone(coords),                     -- Street of the player
        camId = data.camId or nil,                             -- Cam ID ( for heists )
        color = data.firstColor or nil,                        -- Color of the vehicle
        callsign = data.callsign or nil,                       -- Callsigns
        name = data.name or nil,                               -- Name of either officer/ambulance or a player
        vehicle = data.model or nil,                           -- Vehicle name
        plate = data.plate or nil,                             -- Vehicle plate
        alertTime = data.alertTime or nil,                     -- How long it stays on the screen in seconds
        doorCount = data.doorCount or nil,                     -- How many doors on vehicle
        automaticGunfire = data.automaticGunfire or false,     -- Automatic Gun or not
        alert = {
            radius = data.radius or 0,                         -- Radius around the blip
            recipientList = job,                               -- job
            sprite = data.sprite or 1,                         -- Sprite of the blip
            color = data.color or 1,                           -- Color of the blip
            scale = data.scale or 0.5,                         -- Scale of the blip
            length = data.length or 2,                         -- How long it stays on the map
            sound = data.sound or 'Lose_1st',                  -- Alert sound
            sound2 = data.sound2 or 'GTAO_FM_Events_Soundset', -- Alert sound
            offset = data.offset or 'false',                   -- Blip / radius offset
            flash = data.flash or 'false'                      -- Blip flash
        },
        jobs = { 'police' },
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('CustomAlert', CustomAlert)
ProvideExport('CustomAlert', 'ps-dispatch', CustomAlert)

local function VehicleTheft()
    local coords = GetEntityCoords(PlayerPedId())
    local data = exports['rcore_dispatch']:GetPlayerData()

    local dispatchData = {
        message = 'Vehicle Theft',
        codeName = 'vehicletheft',
        code = '10-35',
        icon = 'fas fa-car-burst',
        priority = 2,
        coords = coords,
        street = GetStreetAndZone(coords),
        heading = GetPlayerHeading(),
        vehicle = data.vehicle_label,
        plate = data.vehicle_plate,
        color = data.vehicle_colour,
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('VehicleTheft', VehicleTheft)
ProvideExport('VehicleTheft', 'ps-dispatch', VehicleTheft)

local function Shooting()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Discharge of a firearm',
        codeName = 'shooting',
        code = '10-11',
        icon = 'fas fa-gun',
        priority = 2,
        coords = coords,
        street = GetStreetAndZone(coords),
        gender = GetPlayerGender(),
        weapon = GetWeaponName(),
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('Shooting', Shooting)
ProvideExport('Shooting', 'ps-dispatch', Shooting)

local function Hunting()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Possible Hunting Violation',
        codeName = 'hunting',
        code = '10-13',
        icon = 'fas fa-gun',
        priority = 2,
        weapon = GetWeaponName(),
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('Hunting', Hunting)
ProvideExport('Hunting', 'ps-dispatch', Hunting)

local function VehicleShooting()
    local coords = GetEntityCoords(PlayerPedId())
    local data = exports['rcore_dispatch']:GetPlayerData()

    local dispatchData = {
        message = 'Shots Fired from Vehicle',
        codeName = 'vehicleshots',
        code = '10-60',
        icon = 'fas fa-gun',
        priority = 2,
        coords = coords,
        weapon = GetWeaponName(),
        street = GetStreetAndZone(coords),
        heading = GetPlayerHeading(),
        vehicle = data.vehicle_label,
        plate = data.vehicle_plate,
        color = data.vehicle_colour,
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('VehicleShooting', VehicleShooting)
ProvideExport('VehicleShooting', 'ps-dispatch', VehicleShooting)

local function SpeedingVehicle()
    local coords = GetEntityCoords(PlayerPedId())
    local data = exports['rcore_dispatch']:GetPlayerData()

    local dispatchData = {
        message = 'Reckless driving',
        codeName = 'speeding',
        code = '10-11',
        icon = 'fas fa-car',
        priority = 2,
        coords = coords,
        street = GetStreetAndZone(coords),
        heading = GetPlayerHeading(),
        vehicle = data.vehicle_label,
        plate = data.vehicle_plate,
        color = data.vehicle_colour,
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('SpeedingVehicle', SpeedingVehicle)
ProvideExport('SpeedingVehicle', 'ps-dispatch', SpeedingVehicle)

local function Fight()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Fight in progress',
        codeName = 'fight',
        code = '10-10',
        icon = 'fas fa-hand-fist',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('Fight', Fight)
ProvideExport('Fight', 'ps-dispatch', Fight)

local function PrisonBreak()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Prison Break In Progress',
        codeName = 'prisonbreak',
        code = '10-90',
        icon = 'fas fa-vault',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('PrisonBreak', PrisonBreak)
ProvideExport('PrisonBreak', 'ps-dispatch', PrisonBreak)

local function StoreRobbery(camId)
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Store Robbery',
        codeName = 'storerobbery',
        code = '10-90',
        icon = 'fas fa-store',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        camId = camId,
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('StoreRobbery', StoreRobbery)
ProvideExport('StoreRobbery', 'ps-dispatch', StoreRobbery)

local function FleecaBankRobbery(camId)
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Fleeca Bank Robbery',
        codeName = 'bankrobbery',
        code = '10-90',
        icon = 'fas fa-vault',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        camId = camId,
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('FleecaBankRobbery', FleecaBankRobbery)
ProvideExport('FleecaBankRobbery', 'ps-dispatch', FleecaBankRobbery)

local function PaletoBankRobbery(camId)
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Paleto Bank Robbery',
        codeName = 'paletobankrobbery',
        code = '10-90',
        icon = 'fas fa-vault',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        camId = camId,
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('PaletoBankRobbery', PaletoBankRobbery)
ProvideExport('PaletoBankRobbery', 'ps-dispatch', PaletoBankRobbery)

local function PacificBankRobbery(camId)
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Pacific Bank Robbery',
        codeName = 'pacificbankrobbery',
        code = '10-90',
        icon = 'fas fa-vault',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        camId = camId,
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('PacificBankRobbery', PacificBankRobbery)
ProvideExport('PacificBankRobbery', 'ps-dispatch', PacificBankRobbery)

local function VangelicoRobbery(camId)
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Vangelico Robbery',
        codeName = 'vangelicorobbery',
        code = '10-90',
        icon = 'fas fa-gem',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        camId = camId,
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('VangelicoRobbery', VangelicoRobbery)
ProvideExport('VangelicoRobbery', 'ps-dispatch', VangelicoRobbery)

local function HouseRobbery()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'House Robbery',
        codeName = 'houserobbery',
        code = '10-90',
        icon = 'fas fa-house',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('HouseRobbery', HouseRobbery)
ProvideExport('HouseRobbery', 'ps-dispatch', HouseRobbery)

local function YachtHeist()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Yacht Heist',
        codeName = 'yachtheist',
        code = '10-65',
        icon = 'fas fa-house',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('YachtHeist', YachtHeist)
ProvideExport('YachtHeist', 'ps-dispatch', YachtHeist)
ProvideExport('DrugSale', 'ps-dispatch', DrugSale)

local function SuspiciousActivity()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Suspicious Activity',
        codeName = 'susactivity',
        code = '10-66',
        icon = 'fas fa-tablets',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('SuspiciousActivity', SuspiciousActivity)
ProvideExport('SuspiciousActivity', 'ps-dispatch', SuspiciousActivity)

local function CarJacking(vehicle)
    local coords = GetEntityCoords(PlayerPedId())
    local data = exports['rcore_dispatch']:GetVehicleData()

    local dispatchData = {
        message = 'Car Jacking',
        codeName = 'carjack',
        code = '10-35',
        icon = 'fas fa-car',
        priority = 2,
        coords = coords,
        street = GetStreetAndZone(coords),
        heading = GetPlayerHeading(),
        vehicle = data.vehicle_label,
        plate = data.vehicle_plate,
        color = data.vehicle_colour,
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('CarJacking', CarJacking)
ProvideExport('CarJacking', 'ps-dispatch', CarJacking)

local function InjuriedPerson()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Person is injured',
        codeName = 'civdown',
        code = '10-69',
        icon = 'fas fa-face-dizzy',
        priority = 1,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = 10,
        jobs = { 'ambulance' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('InjuriedPerson', InjuriedPerson)
ProvideExport('InjuriedPerson', 'ps-dispatch', InjuriedPerson)

local function DeceasedPerson()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Civilian Bled Out',
        codeName = 'civdead',
        code = '10-69',
        icon = 'fas fa-skull',
        priority = 1,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = 10,
        jobs = { 'ambulance' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('DeceasedPerson', DeceasedPerson)
ProvideExport('DeceasedPerson', 'ps-dispatch', DeceasedPerson)

local function OfficerDown()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Officer is down',
        codeName = 'officerdown',
        code = '10-99',
        icon = 'fas fa-skull',
        priority = 1,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        name = FRAMEWORK.GetPlayerName() .. ' ' .. FRAMEWORK.GetPlayerLastname(),
        alertTime = 10,
        jobs = { 'ambulance', 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('OfficerDown', OfficerDown)
ProvideExport('OfficerDown', 'ps-dispatch', OfficerDown)

RegisterNetEvent('ps-dispatch:client:officerdown', function() OfficerDown() end)

local function OfficerBackup()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Officer needs backup',
        codeName = 'officerbackup',
        code = '10-32',
        icon = 'fas fa-skull',
        priority = 1,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        name = FRAMEWORK.GetPlayerName() .. ' ' .. FRAMEWORK.GetPlayerLastname(),
        alertTime = 10,
        jobs = { 'ambulance', 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('OfficerBackup', OfficerBackup)
ProvideExport('OfficerBackup', 'ps-dispatch', OfficerBackup)

RegisterNetEvent('ps-dispatch:client:officerbackup', function() OfficerBackup() end)

local function OfficerInDistress()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Officer in distress',
        codeName = 'officerdistress',
        code = '10-99',
        icon = 'fas fa-skull',
        priority = 1,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        name = FRAMEWORK.GetPlayerName() .. ' ' .. FRAMEWORK.GetPlayerLastname(),
        alertTime = 10,
        jobs = { 'ambulance', 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('OfficerInDistress', OfficerInDistress)
ProvideExport('OfficerInDistress', 'ps-dispatch', OfficerInDistress)

local function ambulanceDown()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'ambulance Down',
        codeName = 'ambulancedown',
        code = '10-99',
        icon = 'fas fa-skull',
        priority = 1,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        name = FRAMEWORK.GetPlayerName() .. ' ' .. FRAMEWORK.GetPlayerLastname(),
        alertTime = 10,
        jobs = { 'ambulance', 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('ambulanceDown', ambulanceDown)
ProvideExport('ambulanceDown', 'ps-dispatch', ambulanceDown)

RegisterNetEvent('ps-dispatch:client:ambulancedown', function() ambulanceDown() end)

local function Explosion()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Explosion Reported',
        codeName = 'explosion',
        code = '10-80',
        icon = 'fas fa-fire',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('Explosion', Explosion)
ProvideExport('Explosion', 'ps-dispatch', Explosion)

local function PhoneCall(message, anonymous, job, type)
    local coords = GetEntityCoords(PlayerPedId())

    if IsCallAllowed(message) then
        PhoneAnimation()

        local dispatchData = {
            message = anonymous and 'Incoming Anonymous Call' or 'Incoming Call',
            codeName = type == '311' and '311call' or '911call',
            code = type,
            icon = 'fas fa-phone',
            priority = 2,
            coords = coords,
            name = anonymous and 'Anonymous' or (FRAMEWORK.GetPlayerName() .. ' ' .. FRAMEWORK.GetPlayerLastname()),
            number = anonymous and 'Hidden Number',
            information = message,
            street = GetStreetAndZone(coords),
            alertTime = nil,
            jobs = job
        }

        TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
    end
end

--- @param data string -- Message
--- @param type string -- What type of emergency
--- @param anonymous boolean -- Is the call anonymous
RegisterNetEvent('ps-dispatch:client:sendEmergencyMsg', function(data, type, anonymous)
    local jobs = { ['911'] = { 'police' }, ['311'] = { 'ambulance' } }

    PhoneCall(data, anonymous, jobs[type], type)
end)


local function ArtGalleryRobbery()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Art Gallery Robbery',
        codeName = 'artgalleryrobbery',
        code = '10-90',
        icon = 'fas fa-brush',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }
    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('ArtGalleryRobbery', ArtGalleryRobbery)
ProvideExport('ArtGalleryRobbery', 'ps-dispatch', ArtGalleryRobbery)

local function HumaneRobbery()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Humane Labs Robbery',
        codeName = 'humanelabsrobbery',
        code = '10-90',
        icon = 'fas fa-flask-vial',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }
    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('HumaneRobbery', HumaneRobbery)
ProvideExport('HumaneRobbery', 'ps-dispatch', HumaneRobbery)

local function TrainRobbery()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Train Robbery',
        codeName = 'trainrobbery',
        code = '10-90',
        icon = 'fas fa-train',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }
    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('TrainRobbery', TrainRobbery)
ProvideExport('TrainRobbery', 'ps-dispatch', TrainRobbery)

local function VanRobbery()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Security Van Robbery',
        codeName = 'vanrobbery',
        code = '10-90',
        icon = 'fas fa-van-shuttle',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }
    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('VanRobbery', VanRobbery)
ProvideExport('VanRobbery', 'ps-dispatch', VanRobbery)

local function UndergroundRobbery()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Underground Robbery',
        codeName = 'undergroundrobbery',
        code = '10-90',
        icon = 'fas fa-person-rays',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }
    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('UndergroundRobbery', UndergroundRobbery)
ProvideExport('UndergroundRobbery', 'ps-dispatch', UndergroundRobbery)

local function DrugBoatRobbery()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = '"Suspicious Boat',
        codeName = 'drugboatrobbery',
        code = '10-65',
        icon = 'fas fa-ship',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('DrugBoatRobbery', DrugBoatRobbery)
ProvideExport('DrugBoatRobbery', 'ps-dispatch', DrugBoatRobbery)

local function UnionRobbery()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Union Depository Robbery',
        codeName = 'unionrobbery',
        code = '10-90',
        icon = 'fas fa-truck-field',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('UnionRobbery', UnionRobbery)
ProvideExport('UnionRobbery', 'ps-dispatch', UnionRobbery)

local function CarBoosting(vehicle)
    local coords = GetEntityCoords(PlayerPedId())
    local data = exports['rcore_dispatch']:GetVehicleData()

    local dispatchData = {
        message = 'Car Boosting In Progress',
        codeName = 'carboosting',
        code = '10-50',
        icon = 'fas fa-car',
        priority = 2,
        coords = coords,
        street = GetStreetAndZone(coords),
        heading = GetPlayerHeading(),
        vehicle = data.vehicle_label,
        plate = data.vehicle_plate,
        color = data.vehicle_colour,
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('CarBoosting', CarBoosting)
ProvideExport('CarBoosting', 'ps-dispatch', CarBoosting)

local function SignRobbery()
    local coords = GetEntityCoords(PlayerPedId())

    local dispatchData = {
        message = 'Sign Robbery',
        codeName = 'signrobbery',
        code = '10-10',
        icon = 'fab fa-artstation',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'police' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('SignRobbery', SignRobbery)
ProvideExport('SignRobbery', 'ps-dispatch', SignRobbery)
