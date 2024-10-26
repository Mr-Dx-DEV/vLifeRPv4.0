-- If you use qb-phone add client.lua this event (For bill notify)
--[[ RegisterNetEvent('qb-phone:client:bill-notif', function(text)
    SendNUIMessage({
        action = "PhoneNotification",
        PhoneNotify = {
            title = "Bank",
            text = text,
            icon = "fas fa-university",
            color = "#ff002f",
            timeout = 3500,
        },
    })
end) ]]


-- If you use ox-inventory please add this codes in modules/items/client.lua
--[[

Item('kankart', function(data, slot)
    local metadata = slot.metadata
	if metadata and metadata.kankartdata then
        TriggerEvent("wert-ambulancejob:use-blood-card", metadata.kankartdata)
    else
        print("Blood Card Not Have Data Please Buy A New Card!")
    end
end)

Item('emptysyringe', function(data, slot)
    TriggerEvent('wert-ambulancejob:take-blood')
end)

Item('xray', function(data, slot)
    local metadata = slot.metadata
	if metadata and metadata.plan and metadata.hasta then
        TriggerServerEvent("wert-ambulancejob:server:ox-inventory-use-xray", metadata.plan, metadata.hasta)
    else
        print("Xray Display Not Have Data Please Make A New!")
    end
end)

Item('mri', function(data, slot)
    local metadata = slot.metadata
	if metadata and metadata.plan and metadata.hasta then
        TriggerServerEvent("wert-ambulancejob:server:ox-inventory-use-mri", metadata.plan, metadata.hasta)
    else
        print("MRI Display Not Have Data Please Make A New!")
    end
end)

]]

local MyZones = {} -- Dont touch this!
local UseTarget = true -- # If u want use target set true | true or false
local headerDrawn = false
local listen = false
local CurrentInteraction = nil
local garageOne = BoxZone:Create(vector3(326.07, -588.53, 28.8), 6.0, 19.0, {
    name="park1",
    heading=340,
    debugPoly=Config.DebugPoly,
    minZ = 27.5,
    maxZ = 31.8,
})
local garageTwo = BoxZone:Create(vector3(318.63, -571.96, 28.8), 18.2, 9.8, {
    name="park2",
    heading=340,
    debugPoly=Config.DebugPoly,
    minZ = 27.5,
    maxZ = 31.8,
})
local EmsBloodPackageInfos = {
    Coord = vector3(311.74, -565.86, 43.28),
    Lenght = 1.2,
    Width = 0.8,
    Heading = 340,
    Minz = 42.28,
    Maxz = 44.28,
    Distance = 1.5
}
local EmsBloodBankInfos = {
    Coord = vector3(309.95, -560.44, 43.28),
    Lenght = 0.8,
    Width = 0.8,
    Heading = 340,
    Minz = 42.28,
    Maxz = 44.28,
    Distance = 1.5
}

-- No target specific positions
local NoTargetCoffeMachinePositions = {
    -- vector3(x, y, z)
}
local NoTargetWaterCoolerPositions = {
    -- vector3(x, y, z)
}

-- No target interaction keys
local NoTargetInteractionKey = 38
local NoTargetInteractionKeyText = 'E'
local NoTargetSecondInteractionKey = 47
local NoTargetSecondInteractionKeyText = 'G'
local MyCore = nil

if not UseTarget then MyCore = exports['qb-core']:GetCoreObject() end

local function LibLoadModel(model)
    if HasModelLoaded(model) then return end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
end

local function LoadNpcDoctors()
    for doctorId, item in pairs(Config.NpcDoctors) do
        local model = `s_m_m_doctor_01`
        LibLoadModel(model)
        local hospitalped = CreatePed(1, model, item.coord.x, item.coord.y, item.coord.z - 1.0, item.coord.w, false, true)
        SetBlockingOfNonTemporaryEvents(hospitalped, true)
        SetPedDiesWhenInjured(hospitalped, false)
        SetPedCanPlayAmbientAnims(hospitalped, true)
        SetPedCanRagdollFromPlayerImpact(hospitalped, false)
        SetEntityInvincible(hospitalped, true)
        FreezeEntityPosition(hospitalped, true)
        Wait(100)
        if UseTarget then
            exports["qb-target"]:AddTargetEntity(hospitalped, {
                options = {
                    {
                        place = "NpcDoctor",
                        icon = "fas fa-stethoscope",
                        label = item.name .. " Doctor",
                        action = function() TriggerEvent('wert-ambulancejob:client:npc-doctor-menu', item.name) end,
                    },
                },
                distance = 4.0
            })
        else
            local zoneName = doctorId .. '_npcdoctorzone'
            MyZones[#MyZones+1] = CircleZone:Create(vector3(item.coord.x, item.coord.y, item.coord.z), 2.0, {name = zoneName, useZ = true, data = {index = doctorId, npcdoctor = doctorId}})
        end
    end
end

local function LoadElevators()
    for k, v in pairs(Config.ElevatorInfos) do
        if UseTarget then
            exports['qb-target']:AddBoxZone(k.."EMSElevator", v.Coord, v.Lenght, v.Width, {
                name = k.."EMSElevator",
                heading = v.Heading,
                debugPoly = Config.DebugPoly,
                minZ = v.Minz,
                maxZ = v.Maxz,
            }, {
                options = {
                    {
                        type = "client",
                        place = "Hospital",
                        icon = "fas fa-door-open",
                        label = "Elevator",
                        action = function(entity)
                            TriggerEvent("wert-ambulancejob:use-elevator", k)
                        end,
                    },
                },
                distance = v.Distance
            })
        else
            local zoneName = k .. '_elevatorzoneamb'
            MyZones[#MyZones+1] = CircleZone:Create(v.Coord, 2.0, {name = zoneName, useZ = true, data = {index = k, elevator = k}})
        end
    end
end

local function LoadGarages() -- If Config.GarageEnabled
    for garageId, garageData in pairs(Config.GarageNpcInfos) do
        for k, v in pairs(Config.GarageNpcInfos[garageId]) do
            LibLoadModel(v.hash)
            local garageped = CreatePed(1, v.hash, v.coord.x, v.coord.y, v.coord.z - 1.0, v.coord.w, false, true)
            SetBlockingOfNonTemporaryEvents(garageped, true)
            SetPedDiesWhenInjured(garageped, false)
            SetPedCanPlayAmbientAnims(garageped, true)
            SetPedCanRagdollFromPlayerImpact(garageped, false)
            SetEntityInvincible(garageped, true)
            FreezeEntityPosition(garageped, true)
            if UseTarget then
                exports["qb-target"]:AddTargetEntity(garageped, {
                    options = {
                        {
                            place = "WertGarageAmbulance",
                            icon = "fas fa-warehouse",
                            label = "Garage attendant",
                            job = "ambulance",
                            action = function(entity) TriggerEvent("wert-ambulancejob:client:garage-menu", garageId, k) end,
                        },
                    },
                    distance = 1.5
                })
            else
                local zoneName = garageId .. '_garagezoneamb'
                MyZones[#MyZones+1] = CircleZone:Create(vector3(v.coord.x, v.coord.y, v.coord.z), 2.0, {name = zoneName, useZ = true, data = {index = garageId, garage = k}})
            end
        end
        
    end
    garageOne:onPlayerInOut(function(isPointInside)
        if isPointInside then
            if IsPedInAnyVehicle(PlayerPedId()) then
                if not headerDrawn then
                    headerDrawn = true
                    exports['qb-menu']:showHeader({
                        {
                            header = 'Store vehicle',
                            icon = 'fas fa-door-open',
                            params = {
                                event = 'wert-ambulancejob:client:store-vehicle',
                            }
                        },
                    })
                end
            end
        else
            if headerDrawn then
                headerDrawn = false
                exports['qb-menu']:closeMenu()
            end
        end
    end)
    garageTwo:onPlayerInOut(function(isPointInside)
        if isPointInside then
            if IsPedInAnyVehicle(PlayerPedId()) then
                if not headerDrawn then
                    headerDrawn = true
                    exports['qb-menu']:showHeader({
                        {
                            header = 'Store vehicle',
                            icon = 'fas fa-door-open',
                            params = {
                                event = 'wert-ambulancejob:client:store-vehicle',
                            }
                        },
                    })
                end
            end
        else
            if headerDrawn then
                headerDrawn = false
                exports['qb-menu']:closeMenu()
            end
        end
    end)
end

local function LoadTargetInfosTable()
    exports['qb-target']:AddBoxZone("EMSWertAmbulanceDuty", Config.TargetInfos["EMSWertAmbulanceDuty"].Coord, Config.TargetInfos["EMSWertAmbulanceDuty"].Lenght, Config.TargetInfos["EMSWertAmbulanceDuty"].Width, {
        name="EMSWertAmbulanceDuty",
        heading=Config.TargetInfos["EMSWertAmbulanceDuty"].Heading,
        debugPoly=Config.DebugPoly,
        minZ = Config.TargetInfos["EMSWertAmbulanceDuty"].Minz,
        maxZ = Config.TargetInfos["EMSWertAmbulanceDuty"].Maxz,
        }, {
            options = {
                {
                    type = "client",
                    event = "wert-ambulancejob:duty-action",
                    place = "Hospital",
                    icon = "far fa-clipboard",
                    label = "On duty / Off duty",
                    job = "ambulance",
                },
            },
        distance = Config.TargetInfos["EMSWertAmbulanceDuty"].Distance
    })
    exports['qb-target']:AddBoxZone("EMSWertAmbulanceComputer", Config.TargetInfos["EMSWertAmbulanceComputer"].Coord, Config.TargetInfos["EMSWertAmbulanceComputer"].Lenght, Config.TargetInfos["EMSWertAmbulanceComputer"].Width, {
        name="EMSWertAmbulanceComputer",
        heading=Config.TargetInfos["EMSWertAmbulanceComputer"].Heading,
        debugPoly=Config.DebugPoly,
        minZ = Config.TargetInfos["EMSWertAmbulanceComputer"].Minz,
        maxZ = Config.TargetInfos["EMSWertAmbulanceComputer"].Maxz,
        }, {
            options = {
                {
                    type = "client",
                    event = "wert-ambulancejob:patient-save",
                    place = "Hospital",
                    icon = "fas fa-floppy-disk",
                    label = "Patient registration system",
                    job = "ambulance",
                },
                {
                    type = "client",
                    event = "wert-ambulancejob:ambulance-bill",
                    place = "Hospital",
                    icon = "fas fa-money-bill",
                    label = "Bill player",
                    job = "ambulance",
                },
            },
        distance = Config.TargetInfos["EMSWertAmbulanceComputer"].Distance
    })
    -- Armory, Stash Targets
    exports['qb-target']:AddBoxZone("EMSWertArmoryStash", Config.TargetInfos["EMSWertArmoryStash"].Coord, Config.TargetInfos["EMSWertArmoryStash"].Lenght, Config.TargetInfos["EMSWertArmoryStash"].Width, {
        name="EMSWertArmoryStash",
        heading=Config.TargetInfos["EMSWertArmoryStash"].Heading,
        debugPoly=Config.DebugPoly,
        minZ = Config.TargetInfos["EMSWertArmoryStash"].Minz,
        maxZ = Config.TargetInfos["EMSWertArmoryStash"].Maxz,
        }, {
            options = {
                {
                    type = "client",
                    event = "wert-ambulancejob:open-shop",
                    place = "Hospital",
                    icon = "fas fa-dolly",
                    label = "Armory",
                    job = "ambulance",
                },
                {
                    type = "client",
                    event = "wert-ambulancejob:open-stash",
                    place = "Hospital",
                    icon = "fas fa-box",
                    label = "Stash",
                    job = "ambulance",
                },
            },
        distance = Config.TargetInfos["EMSWertArmoryStash"].Distance
    })
    -- Boss Menu Targets
    exports['qb-target']:AddBoxZone("EMSWertBossMenu", Config.TargetInfos["EMSWertBossMenu"].Coord, Config.TargetInfos["EMSWertBossMenu"].Lenght, Config.TargetInfos["EMSWertBossMenu"].Width, {
        name="EMSWertBossMenu",
        heading=Config.TargetInfos["EMSWertBossMenu"].Heading,
        debugPoly=Config.DebugPoly,
        minZ = Config.TargetInfos["EMSWertBossMenu"].Minz,
        maxZ = Config.TargetInfos["EMSWertBossMenu"].Maxz,
        }, {
            options = {
                {
                    type = "client",
                    event = Config.TargetInfos["EMSWertBossMenu"].Event,
                    place = "Hospital",
                    icon = Config.TargetInfos["EMSWertBossMenu"].Icon,
                    label = Config.TargetInfos["EMSWertBossMenu"].Label,
                    job = "ambulance",
                },
            },
        distance = Config.TargetInfos["EMSWertBossMenu"].Distance
    })
    -- MRI Targets
    exports['qb-target']:AddBoxZone("EMSWertMrComputer", Config.TargetInfos["EMSWertMrComputer"].Coord, Config.TargetInfos["EMSWertMrComputer"].Lenght, Config.TargetInfos["EMSWertMrComputer"].Width, {
        name="EMSWertMrComputer",
        heading=Config.TargetInfos["EMSWertMrComputer"].Heading,
        debugPoly=Config.DebugPoly,
        minZ = Config.TargetInfos["EMSWertMrComputer"].Minz,
        maxZ = Config.TargetInfos["EMSWertMrComputer"].Maxz,
        }, {
            options = {
                {
                    type = "client",
                    event = Config.TargetInfos["EMSWertMrComputer"].Event,
                    place = "Hospital",
                    icon = Config.TargetInfos["EMSWertMrComputer"].Icon,
                    label = Config.TargetInfos["EMSWertMrComputer"].Label,
                    job = "ambulance",
                },
            },
        distance = Config.TargetInfos["EMSWertMrComputer"].Distance
    })
    exports['qb-target']:AddBoxZone("EMSWertMrDesk", Config.TargetInfos["EMSWertMrDesk"].Coord, Config.TargetInfos["EMSWertMrDesk"].Lenght, Config.TargetInfos["EMSWertMrDesk"].Width, {
        name="EMSWertMrDesk",
        heading=Config.TargetInfos["EMSWertMrDesk"].Heading,
        debugPoly=Config.DebugPoly,
        minZ = Config.TargetInfos["EMSWertMrDesk"].Minz,
        maxZ = Config.TargetInfos["EMSWertMrDesk"].Maxz,
        }, {
            -- Don't tuch
            options = {
                {
                    type = "client",
                    place = "Hospital",
                    icon = "fas fa-bed",
                    label = "MR Desk",
                    action = function(entity)
                        TriggerEvent("wert-ambulancejob:mr", "yat")
                    end,
                    canInteract = function(entity)
                        if not yatakta then return true else return false end
                    end,
                },
                {
                    type = "client",
                    place = "Hospital",
                    icon = "fas fa-bed",
                    label = "Get Up",
                    action = function(entity)
                        TriggerEvent("wert-ambulancejob:mr", "kalk")
                    end,
                    canInteract = function(entity)
                        if yatakta then return true else return false end
                    end,
                },
            },
        distance = Config.TargetInfos["EMSWertMrDesk"].Distance
    })
    -- Xray Targets
    exports['qb-target']:AddBoxZone("EMSWertXrayComputer", Config.TargetInfos["EMSWertXrayComputer"].Coord, Config.TargetInfos["EMSWertXrayComputer"].Lenght, Config.TargetInfos["EMSWertXrayComputer"].Width, {
        name="EMSWertXrayComputer",
        heading=Config.TargetInfos["EMSWertXrayComputer"].Heading,
        debugPoly=Config.DebugPoly,
        minZ = Config.TargetInfos["EMSWertXrayComputer"].Minz,
        maxZ = Config.TargetInfos["EMSWertXrayComputer"].Maxz,
        }, {
            options = {
                {
                    type = "client",
                    event = Config.TargetInfos["EMSWertXrayComputer"].Event,
                    place = "Hospital",
                    icon = Config.TargetInfos["EMSWertXrayComputer"].Icon,
                    label = Config.TargetInfos["EMSWertXrayComputer"].Label,
                    job = "ambulance",
                },
            },
        distance = Config.TargetInfos["EMSWertXrayComputer"].Distance
    })
    exports['qb-target']:AddBoxZone("EMSWertXrayDesk", Config.TargetInfos["EMSWertXrayDesk"].Coord, Config.TargetInfos["EMSWertXrayDesk"].Lenght, Config.TargetInfos["EMSWertXrayDesk"].Width, {
        name="EMSWertXrayDesk",
        heading=Config.TargetInfos["EMSWertXrayDesk"].Heading,
        debugPoly=Config.DebugPoly,
        minZ = Config.TargetInfos["EMSWertXrayDesk"].Minz,
        maxZ = Config.TargetInfos["EMSWertXrayDesk"].Maxz,
        }, {
            options = {
                {
                    type = "client",
                    place = "Hospital",
                    icon = "fas fa-bed",
                    label = "XRAY Desk",
                    action = function(entity)
                        TriggerEvent("wert-ambulancejob:xray", "yat")
                    end,
                    canInteract = function(entity)
                        if not yatakta then return true else return false end
                    end,
                },
                {
                    type = "client",
                    place = "Hospital",
                    icon = "fas fa-bed",
                    label = "Get Up",
                    action = function(entity)
                        TriggerEvent("wert-ambulancejob:xray", "kalk")
                    end,
                    canInteract = function(entity)
                        if yatakta then return true else return false end
                    end,
                },
            },
            distance = Config.TargetInfos["EMSWertXrayDesk"].Distance
        })

    exports['qb-target']:AddBoxZone('EMSBloodCard', Config.TargetInfos["EMSBloodCard"].Coord, Config.TargetInfos["EMSBloodCard"].Lenght, Config.TargetInfos["EMSBloodCard"].Width, {
        name='EMSBloodCard',
        heading=Config.TargetInfos["EMSBloodCard"].Heading,
        debugPoly=Config.DebugPoly,
        minZ = Config.TargetInfos["EMSBloodCard"].Minz,
        maxZ = Config.TargetInfos["EMSBloodCard"].Maxz,
        }, {
            options = {
                {
                    type = 'client',
                    event = Config.TargetInfos["EMSBloodCard"].Event,
                    icon = Config.TargetInfos["EMSBloodCard"].Icon,
                    label = Config.TargetInfos["EMSBloodCard"].Label,
                },
            },
        distance = 1.5
    })
    exports["qb-target"]:AddTargetModel(`prop_coffee_mac_02`, {
        options = {
            {
                type = "client",
                event = "wert-ambulancejob:make-coffee",
                place = "Hospital",
                icon = "fas fa-beer-mug-empty",
                label = "Coffe Machine",
            },
        },
        distance = 1.5
    })
    exports["qb-target"]:AddTargetModel(`prop_watercooler`, {
        options = {
            {
                type = "client",
                event = "wert-ambulancejob:sebil",
                place = "Hospital",
                icon = "fas fa-droplet",
                label = "Water Cooler",
            },
        },
        distance = 1.5
    })
    exports['qb-target']:AddBoxZone('EMSBloodPackaged', EmsBloodPackageInfos.Coord, EmsBloodPackageInfos.Lenght, EmsBloodPackageInfos.Width, {
        name = 'EMSBloodPackaged',
        heading = EmsBloodPackageInfos.Heading,
        debugPoly = Config.DebugPoly,
        minZ = EmsBloodPackageInfos.Minz,
        maxZ = EmsBloodPackageInfos.Maxz,
    }, {
        options = {
            {
                type = 'client',
                icon = 'fa-solid fa-droplet',
                label = 'Packaged blood',
                item = 'bloodtube',
                action = function(entity)
                    TriggerServerEvent('wert-ambulancejob:kan-paket')
                end,
            },
        },
        distance = EmsBloodPackageInfos.Distance
    })
    exports['qb-target']:AddBoxZone('EMSBloodBank', EmsBloodBankInfos.Coord, EmsBloodBankInfos.Lenght, EmsBloodBankInfos.Width, {
        name = 'EMSBloodBank',
        heading = EmsBloodBankInfos.Heading,
        debugPoly = Config.DebugPoly,
        minZ = EmsBloodBankInfos.Minz,
        maxZ = EmsBloodBankInfos.Maxz,
    }, {
        options = {
            {
                type = 'client',
                icon = 'fa-solid fa-server',
                label = 'Load blood in the bank',
                item = 'bloodbag',
                action = function(entity)
                    TriggerServerEvent('wert-ambulancejob:kan-load-bank')
                end,
            },
            {
                type = 'client',
                icon = 'fa-solid fa-hand-holding-heart',
                label = 'Take blood in the bank',
                event = 'wert-ambulancejob:take-blood-in-bank'
            },
        },
        distance = EmsBloodBankInfos.Distance
    })
end

local function LoadNoTargetInfos()
    for name, data in pairs(Config.TargetInfos) do MyZones[#MyZones+1] = CircleZone:Create(data.Coord, data.Distance, {name = name, useZ = true, data = {index = name}}) end
    MyZones[#MyZones+1] = CircleZone:Create(EmsBloodPackageInfos.Coord, EmsBloodPackageInfos.Distance, {name = 'EMSBloodPackaged', useZ = true, data = {index = 'EMSBloodPackaged'}})
    MyZones[#MyZones+1] = CircleZone:Create(EmsBloodBankInfos.Coord, EmsBloodBankInfos.Distance, {name = 'EMSBloodBank', useZ = true, data = {index = 'EMSBloodBank'}})
    for i=1, #NoTargetCoffeMachinePositions do MyZones[#MyZones+1] = CircleZone:Create(NoTargetCoffeMachinePositions[i], 2.0, {name = i..'_ambcoffemachine', useZ = true, data = {index = i, coffemachine = i}}) end
    for i=1, #NoTargetWaterCoolerPositions do MyZones[#MyZones+1] = CircleZone:Create(NoTargetWaterCoolerPositions[i], 2.0, {name = i..'_ambcoolermachine', useZ = true, data = {index = i, watercooler = i}}) end
end

local function StartNoTargetThread()
    if CurrentInteraction.secondActive then
        CreateThread(function()
            local index = CurrentInteraction.index
            while listen do
                if IsControlJustPressed(0, NoTargetInteractionKey) then
                    if index == "EMSWertAmbulanceComputer" then
                        TriggerEvent('wert-ambulancejob:patient-save')
                    elseif index == "EMSWertArmoryStash" then
                        TriggerEvent("wert-ambulancejob:open-shop")
                    elseif index == "EMSBloodBank" then
                        QBCore.Functions.TriggerCallback('wert-ambulancejob:server:has-item', function(result)
                            if result then
                                TriggerServerEvent('wert-ambulancejob:kan-load-bank')
                            else
                                QBCore.Functions.Notify('You are not have blood bag!', 'error')
                            end
                        end, 'bloodbag')
                    end
                end
                if IsControlJustPressed(0, NoTargetSecondInteractionKey) then
                    if index == "EMSWertAmbulanceComputer" then
                        TriggerEvent('wert-ambulancejob:ambulance-bill')
                    elseif index == "EMSWertArmoryStash" then
                        TriggerEvent("wert-ambulancejob:open-stash")
                    elseif index == "EMSBloodBank" then
                        TriggerEvent('wert-ambulancejob:take-blood-in-bank')
                    end
                end
                Wait(1)
            end
        end)
    else
        CreateThread(function()
            while listen do
                if IsControlJustPressed(0, NoTargetInteractionKey) then
                    if CurrentInteraction then
                        if CurrentInteraction.coffemachine then
                            TriggerEvent('wert-ambulancejob:make-coffee')
                        elseif CurrentInteraction.watercooler then
                            TriggerEvent('wert-ambulancejob:sebil')
                        elseif CurrentInteraction.garage then
                            TriggerEvent("wert-ambulancejob:client:garage-menu", CurrentInteraction.index, CurrentInteraction.garage)
                        elseif CurrentInteraction.npcdoctor then
                            local item = Config.NpcDoctors[CurrentInteraction.npcdoctor]
                            TriggerEvent('wert-ambulancejob:client:npc-doctor-menu', item.name)
                        elseif CurrentInteraction.elevator then
                            TriggerEvent("wert-ambulancejob:use-elevator", CurrentInteraction.elevator)
                        else
                            local index = CurrentInteraction.index
                            if index == "EMSWertAmbulanceDuty" then
                                TriggerEvent("wert-ambulancejob:duty-action")
                            elseif index == "EMSWertBossMenu" then
                                TriggerEvent(Config.TargetInfos["EMSWertBossMenu"].Event)
                            elseif index == "EMSWertMrComputer" then
                                TriggerEvent(Config.TargetInfos["EMSWertMrComputer"].Event)
                            elseif index == "EMSWertMrDesk" then
                                if yatakta then
                                    TriggerEvent("wert-ambulancejob:mr", "kalk")
                                    exports['qb-core']:DrawText('['..NoTargetInteractionKeyText..'] MR Desk', 'left')
                                else
                                    TriggerEvent("wert-ambulancejob:mr", "yat")
                                    exports['qb-core']:DrawText('['..NoTargetInteractionKeyText..'] Get Up', 'left')
                                end
                            elseif index == "EMSWertXrayComputer" then
                                TriggerEvent(Config.TargetInfos["EMSWertXrayComputer"].Event)
                            elseif index == "EMSWertXrayDesk" then
                                if yatakta then
                                    TriggerEvent("wert-ambulancejob:xray", "kalk")
                                    exports['qb-core']:DrawText('['..NoTargetInteractionKeyText..'] XRAY Desk', 'left')
                                else
                                    TriggerEvent("wert-ambulancejob:xray", "yat")
                                    exports['qb-core']:DrawText('['..NoTargetInteractionKeyText..'] Get Up', 'left')
                                end
                            elseif index == "EMSBloodCard" then
                                TriggerEvent(Config.TargetInfos["EMSBloodCard"].Event)
                            elseif index == "EMSBloodPackaged" then
                                QBCore.Functions.TriggerCallback('wert-ambulancejob:server:has-item', function(result)
                                    if result then
                                        TriggerServerEvent('wert-ambulancejob:kan-paket')
                                    else
                                        QBCore.Functions.Notify('You are not have blood tube!', 'error')
                                    end
                                end, 'bloodtube')
                            end
                        end
                    else print('Invalid Int. Act.') end
                end
                Wait(1)
            end
        end)
    end
end

-- # Events

RegisterNetEvent('wert-ambulancejob:client:open-custom-stash', function()
    exports.ox_inventory:openInventory('stash', 'ambulancestashwe')
end)

RegisterNetEvent('wert-ambulancejob:client:open-custom-shop', function()
    exports.ox_inventory:openInventory('shop', { id = 1 , type = 'ambulancearmorywe'})
end)

-- # Threads

CreateThread(function()
    Wait(1000)
    if UseTarget then LoadTargetInfosTable() else LoadNoTargetInfos() end
    LoadElevators()
    LoadNpcDoctors()
    if Config.GarageEnabled then LoadGarages() end
    if not UseTarget then
        local comboZone = ComboZone:Create(MyZones, { name = 'ambNoTargetCombo', debugPoly = Config.DebugPoly })
        comboZone:onPlayerInOut(function(isPointInside, _, zone)
            if isPointInside then
                if not listen then
                    local allow = true
                    local displayText = ''
                    local secondActive = false
                    if zone.data.coffemachine then
                        displayText = '['..NoTargetInteractionKeyText..'] Coffe Machine'
                    elseif zone.data.watercooler then
                        displayText = '['..NoTargetInteractionKeyText..'] Water Cooler'
                    elseif zone.data.garage then
                        displayText = '['..NoTargetInteractionKeyText..'] Garage Attendant'
                        local my_job = MyCore.Functions.GetPlayerData().job.name
                        if my_job ~= 'ambulance' then allow = false end
                    elseif zone.data.npcdoctor then
                        local item = Config.NpcDoctors[zone.data.npcdoctor]
                        displayText = '['..NoTargetInteractionKeyText..'] '..item.name..' Doctor'
                    elseif zone.data.elevator then
                        displayText = '['..NoTargetInteractionKeyText..'] Elevator'
                    else
                        local index = zone.data.index
                        local my_job = MyCore.Functions.GetPlayerData().job.name
                        if index ~= "EMSWertMrDesk" and index ~= "EMSWertXrayDesk" and my_job ~= 'ambulance' then allow = false end
                        if allow then
                            if index == "EMSWertAmbulanceComputer" or index == "EMSWertArmoryStash" or index == "EMSBloodBank" then
                                secondActive = true
                                if index == "EMSWertAmbulanceComputer" then
                                    displayText = '['..NoTargetInteractionKeyText..'] Patient registration system | ['..NoTargetSecondInteractionKeyText..'] Bill player'
                                elseif index == "EMSWertArmoryStash" then
                                    displayText = '['..NoTargetInteractionKeyText..'] Armory | ['..NoTargetSecondInteractionKeyText..'] Stash'
                                elseif index == "EMSBloodBank" then
                                    displayText = '['..NoTargetInteractionKeyText..'] Load blood in the bank | ['..NoTargetSecondInteractionKeyText..'] Take blood in the bank'
                                end
                            else
                                if index == "EMSWertAmbulanceDuty" then
                                    displayText = '['..NoTargetInteractionKeyText..'] On duty / Off duty'
                                elseif index == "EMSWertBossMenu" then
                                    displayText = '['..NoTargetInteractionKeyText..'] ' .. Config.TargetInfos["EMSWertBossMenu"].Label
                                elseif index == "EMSWertMrComputer" then
                                    displayText = '['..NoTargetInteractionKeyText..'] ' .. Config.TargetInfos["EMSWertMrComputer"].Label
                                elseif index == "EMSWertMrDesk" then
                                    if yatakta then
                                        displayText = '['..NoTargetInteractionKeyText..'] Get Up'
                                    else
                                        displayText = '['..NoTargetInteractionKeyText..'] MR Desk'
                                    end
                                elseif index == "EMSWertXrayComputer" then
                                    displayText = '['..NoTargetInteractionKeyText..'] ' .. Config.TargetInfos["EMSWertXrayComputer"].Label
                                elseif index == "EMSWertXrayDesk" then
                                    if yatakta then
                                        displayText = '['..NoTargetInteractionKeyText..'] Get Up'
                                    else
                                        displayText = '['..NoTargetInteractionKeyText..'] XRAY Desk'
                                    end
                                elseif index == "EMSBloodCard" then
                                    displayText = '['..NoTargetInteractionKeyText..'] ' .. Config.TargetInfos["EMSBloodCard"].Label
                                elseif index == "EMSBloodPackaged" then
                                    displayText = '['..NoTargetInteractionKeyText..'] Packaged blood'
                                end
                            end
                        end
                    end
                    if allow then
                        CurrentInteraction = zone.data
                        CurrentInteraction.secondActive = secondActive
                        listen = true
                        StartNoTargetThread()
                        exports['qb-core']:DrawText(displayText, 'left')
                    end
                end
            else
                if listen then
                    listen = false
                    CurrentInteraction = nil
                    exports['qb-core']:HideText()
                end
            end
        end)
    end
end)