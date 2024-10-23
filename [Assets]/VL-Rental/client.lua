local QBCore = GetResourceState('qb-core') == 'started' and exports['qb-core']:GetCoreObject()
local ESX = GetResourceState('es_extended') == 'started' and exports.es_extended:getSharedObject()

local ped = {}
Citizen.CreateThread(function()
    for k, v in pairs(Config.locations) do 
        if v.ped then 
            RequestModel(Config.pedmodel)
            while not HasModelLoaded(Config.pedmodel) do
                Wait(10)
            end
            ped[k] = CreatePed(4, Config.pedmodel, v.coords.x, v.coords.y, v.coords.z, v.coords.w, false, true)
            if Config.scenario then 
                TaskStartScenarioInPlace(ped[k], Config.scenario, 0, true)
            end
            SetEntityCoordsNoOffset(ped[k], v.coords.x, v.coords.y, v.coords.z, false, false, false, true)
            Wait(100)
            FreezeEntityPosition(ped[k], true)
            SetEntityInvincible(ped[k], true)
            SetBlockingOfNonTemporaryEvents(ped[k], true)
        end 

        if not v.ped then 
            if Config.qbtarget then 
                exports['qb-target']:AddBoxZone(k, v.coords, v.length, v.width, {
                    name = k,
                    heading = v.coords.w,
                    debugPoly = false,
                    minZ = v.coords.z,
                    maxZ = v.coords.z
                }, {
                    options = {
                        {
                            icon = 'fas fa-car',
                            label = 'Rent Vehicle',
                            action = function()
                                TriggerEvent('VL-Rentals:client:rentVehicle', k)
                            end

                        },
                    },
                    distance = 2.0
                })
            elseif Config.oxtarget then 
                local menu_options = {
                    {
                        name = 'rental_ped',
                        icon = 'fas fa-car',
                        label = 'Rent Vehicle',
                        onSelect = function()
                            TriggerEvent('VL-Rentals:client:rentVehicle', k)
                        end
                    },
                }
                exports.ox_target:addBoxZone({
                    coords = v.coords, 
                    size = v.size,
                    rotation = v.coords.w,
                    debug = v.debug,
                    options = menu_options
                })
            end
        else 
            if Config.qbtarget then 
                exports['qb-target']:AddTargetEntity(ped[k], {
                    options = {
                        {
                            icon = 'fas fa-car',
                            label = 'Rent Vehicle',
                            action = function()
                                TriggerEvent('VL-Rentals:client:rentVehicle', k)
                            end,
                        },
                    },
                    distance = 2.0
                })
            elseif Config.oxtarget then 
                local options = {
                    {
                        name = 'rental_ped',
                        icon = 'fas fa-car',
                        label = 'Rent Vehicle',
                        onSelect = function()
                            TriggerEvent('VL-Rentals:client:rentVehicle', k)
                        end
                    },
                }
                exports.ox_target:addLocalEntity(ped[k], options)
                
            end
        end
    end


        
end)

RegisterNetEvent('VL-Rentals:client:rentVehicle', function(k)

    local menu_options = {}

    for location, info in pairs(Config.locations) do 
        if location == k then 
            for vehicle, details in pairs(info.vehicles) do 
                table.insert(menu_options, {
                    title = vehicle:gsub("^%l", string.upper),
                    image = details.image,
                    description = '$' .. details.price,
                    onSelect = function()
                        TriggerServerEvent('VL-Rentals:server:MoneyAmounts', vehicle, details.price, location)
                    end
                })
            end
        end
    end 

    lib.registerContext({
        id = 'vehicle_rental',
        title = 'Vehicle Rental',
        options = menu_options,
    })

    lib.showContext('vehicle_rental')
end)

RegisterNetEvent('VL-Rentals:client:SpawnVehicle', function(vehiclename, location)
    local player = PlayerPedId()
    local vehicle = GetHashKey(vehiclename)
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Wait(10)
    end
    local rental = CreateVehicle(vehicle, Config.locations[location].vehiclespawncoords.x, Config.locations[location].vehiclespawncoords.y, Config.locations[location].vehiclespawncoords.z, Config.locations[location].vehiclespawncoords.w, true, false)
    local plate = GetVehicleNumberPlateText(rental)
    SetVehicleOnGroundProperly(rental)
    TaskWarpPedIntoVehicle(player, rental, -1) 
    SetVehicleEngineOn(vehicle, true, true)
    TriggerServerEvent('VL-Rentals:server:RentVehicle', vehiclename, plate)

    -- give keys 
    if QBCore then 
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
    end
        
    SetModelAsNoLongerNeeded(vehicle)
end)