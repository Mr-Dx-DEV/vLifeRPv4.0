local QBCore = nil
local props = {}
Citizen.CreateThread(function() 
    if Config.Framework == "qb" then
        QBCore = exports[Config.FrameworkPseudo]:GetCoreObject()
    end
end)

local function LoadModel(model)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(GetHashKey(model)) do Wait(1) end
end

function checkPotPB(entity)
    local items = GetFarmingItems()
    if Config.Framework == "qb" then
        QBCore.Functions.Progressbar('check_pot', _U('farm_lgad'), 1500, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            checkPot(entity, items)
        end, function() -- Cancel
            NotifyFramework(_U('farm_canc'))
        end)
    elseif Config.Framework == "esx" then
        ESX.Progressbar(_U('farm_lgad'), 1500,{
                FreezePlayer = true, 
                animation ={},
            onFinish = function()
                checkPot(entity, items)
            end, onCancel = function()
                NotifyFramework(_U('farm_canc'))
            end
        })
    end  
end

function PlantSeed(item, crate)
    local ped = PlayerPedId()
    RequestAnimDict('amb@medic@standing@kneel@base')
    RequestAnimDict('anim@gangops@facility@servers@bodysearch@')
    while 
        not HasAnimDictLoaded('amb@medic@standing@kneel@base') or
        not HasAnimDictLoaded('anim@gangops@facility@servers@bodysearch@')
    do 
        Wait(0) 
    end
    TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
    TaskPlayAnim(ped, 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
    if Config.Framework == "qb" then
        QBCore.Functions.Progressbar("planting_farm_seed", _U('farm_plas'), 1500, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            PlaceSeedInsideProp(item, crate)
            ClearPedTasks(ped)
            RemoveAnimDict('amb@medic@standing@kneel@base')
            RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
        end, function() -- Cancel
            NotifyFramework(_U('farm_canc'))
            ClearPedTasks(ped)
            RemoveAnimDict('amb@medic@standing@kneel@base')
            RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
        end)
    elseif Config.Framework == "esx" then
        ESX.Progressbar(_U('farm_plas'), 1500,{
                FreezePlayer = true, 
                animation ={},
            onFinish = function()
                PlaceSeedInsideProp(item, crate)
                ClearPedTasks(ped)
                RemoveAnimDict('amb@medic@standing@kneel@base')
                RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
            end, onCancel = function()
                NotifyFramework(_U('farm_canc'))
                ClearPedTasks(ped)
                RemoveAnimDict('amb@medic@standing@kneel@base')
                RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
            end
        })
    end  
end

function WaterPlant(item, crate, slot)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local model = `prop_wateringcan`
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local created_object = CreateObject(model, coords.x, coords.y, coords.z, true, true, true)
    AttachEntityToEntity(created_object, ped, GetPedBoneIndex(ped, 28422), 0.4, 0.1, 0.0, 90.0, 180.0, 0.0, true, true, false, true, 1, true)
    if Config.Framework == "qb" then
        QBCore.Functions.Progressbar('farming_water', 'Wattering Plant...', 6000, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'weapon@w_sp_jerrycan',
            anim = 'fire',
            flags = 1,
        }, {}, {}, function()
            TriggerServerEvent('zat-farming:server:GiveWater', crate.id, slot, item)
            ClearPedTasks(ped)
            DeleteEntity(created_object)
        end, function()
            ClearPedTasks(ped)
            DeleteEntity(created_object)
            NotifyFramework(_U('farm_canc'))
        end)
    elseif Config.Framework == "esx" then
        ESX.Progressbar('Wattering Plant...', 6000,{
            FreezePlayer = true, 
            animation ={
                type = "anim",
                dict = "weapon@w_sp_jerrycan", 
                lib ="fire"
            },
        onFinish = function()
            TriggerServerEvent('zat-farming:server:GiveWater', crate.id, slot, item)
            ClearPedTasks(ped)
            DeleteEntity(created_object)
        end, onCancel = function()
            ClearPedTasks(ped)
            DeleteEntity(created_object)
            NotifyFramework(_U('farm_canc'))
        end
        })
    end
end

function FertisePlant(item, crate, slot)
    local ped = PlayerPedId()
    RequestAnimDict('amb@medic@standing@kneel@base')
    RequestAnimDict('anim@gangops@facility@servers@bodysearch@')
    while 
        not HasAnimDictLoaded('amb@medic@standing@kneel@base') or
        not HasAnimDictLoaded('anim@gangops@facility@servers@bodysearch@')
    do 
        Wait(0) 
    end
    TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
    TaskPlayAnim(ped, 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
    if Config.Framework == "qb" then
        QBCore.Functions.Progressbar("planting_farm_seed", _U('farm_ferp'), 1500, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('zat-farming:server:GiveSoil', crate.id, slot, item)
            ClearPedTasks(ped)
            RemoveAnimDict('amb@medic@standing@kneel@base')
            RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
        end, function() -- Cancel
            NotifyFramework(_U('farm_canc'))
            ClearPedTasks(ped)
            RemoveAnimDict('amb@medic@standing@kneel@base')
            RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
        end)
    elseif Config.Framework == "esx" then
        ESX.Progressbar(_U('farm_ferp'), 1500,{
                FreezePlayer = true, 
                animation ={},
            onFinish = function()
                TriggerServerEvent('zat-farming:server:GiveSoil', crate.id, slot, item)
                ClearPedTasks(ped)
                RemoveAnimDict('amb@medic@standing@kneel@base')
                RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
            end, onCancel = function()
                NotifyFramework(_U('farm_canc'))
                ClearPedTasks(ped)
                RemoveAnimDict('amb@medic@standing@kneel@base')
                RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
            end
        })
    end  
end

function Harvest(id, index)
    local ped = PlayerPedId()
    RequestAnimDict('amb@medic@standing@kneel@base')
    RequestAnimDict('anim@gangops@facility@servers@bodysearch@')
    while 
        not HasAnimDictLoaded('amb@medic@standing@kneel@base') or
        not HasAnimDictLoaded('anim@gangops@facility@servers@bodysearch@')
    do 
        Wait(0) 
    end
    TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
    TaskPlayAnim(ped, 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
    if Config.Framework == "qb" then
        QBCore.Functions.Progressbar("harvest_farm_seed", _U('farm_harv'), 1500, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('zat-farming:server:Harvest', id, index)
            ClearPedTasks(ped)
            RemoveAnimDict('amb@medic@standing@kneel@base')
            RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
        end, function() -- Cancel
            NotifyFramework(_U('farm_canc'))
            ClearPedTasks(ped)
            RemoveAnimDict('amb@medic@standing@kneel@base')
            RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
        end)
    elseif Config.Framework == "esx" then
        ESX.Progressbar(_U('farm_harv'), 1500,{
                FreezePlayer = true, 
                animation ={},
            onFinish = function()
                TriggerServerEvent('zat-farming:server:Harvest', id, index)
                ClearPedTasks(ped)
                RemoveAnimDict('amb@medic@standing@kneel@base')
                RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
            end, onCancel = function()
                NotifyFramework(_U('farm_canc'))
                ClearPedTasks(ped)
                RemoveAnimDict('amb@medic@standing@kneel@base')
                RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
            end
        })
    end  
end

function Destroy(id, index)
    local ped = PlayerPedId()
    RequestAnimDict('amb@medic@standing@kneel@base')
    RequestAnimDict('anim@gangops@facility@servers@bodysearch@')
    while 
        not HasAnimDictLoaded('amb@medic@standing@kneel@base') or
        not HasAnimDictLoaded('anim@gangops@facility@servers@bodysearch@')
    do 
        Wait(0) 
    end
    TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
    TaskPlayAnim(ped, 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
    if Config.Framework == "qb" then
        QBCore.Functions.Progressbar("destroy_farm_seed", _U('farm_dest'), 1500, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('zat-farming:server:Destroy', id, index)
            ClearPedTasks(ped)
            RemoveAnimDict('amb@medic@standing@kneel@base')
            RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
        end, function() -- Cancel
            NotifyFramework(_U('farm_canc'))
            ClearPedTasks(ped)
            RemoveAnimDict('amb@medic@standing@kneel@base')
            RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
        end)
    elseif Config.Framework == "esx" then
        ESX.Progressbar( _U('farm_dest'), 1500,{
                FreezePlayer = true, 
                animation ={},
            onFinish = function()
                TriggerServerEvent('zat-farming:server:Destroy', id, index)
                ClearPedTasks(ped)
                RemoveAnimDict('amb@medic@standing@kneel@base')
                RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
            end, onCancel = function()
                NotifyFramework(_U('farm_canc'))
                ClearPedTasks(ped)
                RemoveAnimDict('amb@medic@standing@kneel@base')
                RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
            end
        })
    end  
end

function Clone(id, index)
    local ped = PlayerPedId()
    RequestAnimDict('amb@medic@standing@kneel@base')
    RequestAnimDict('anim@gangops@facility@servers@bodysearch@')
    while 
        not HasAnimDictLoaded('amb@medic@standing@kneel@base') or
        not HasAnimDictLoaded('anim@gangops@facility@servers@bodysearch@')
    do 
        Wait(0) 
    end
    TaskPlayAnim(ped, 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
    TaskPlayAnim(ped, 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
    if Config.Framework == "qb" then
        QBCore.Functions.Progressbar("clone_farm_seed", _U('farm_clos'), 1500, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('zat-farming:server:Clone', id, index)
            ClearPedTasks(ped)
            RemoveAnimDict('amb@medic@standing@kneel@base')
            RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
        end, function() -- Cancel
            NotifyFramework(_U('farm_canc'))
            ClearPedTasks(ped)
            RemoveAnimDict('amb@medic@standing@kneel@base')
            RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
        end)
    elseif Config.Framework == "esx" then
        ESX.Progressbar(_U('farm_clos'), 1500,{
                FreezePlayer = true, 
                animation ={},
            onFinish = function()
                TriggerServerEvent('zat-farming:server:Clone', id, index)
                ClearPedTasks(ped)
                RemoveAnimDict('amb@medic@standing@kneel@base')
                RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
            end, onCancel = function()
                NotifyFramework(_U('farm_canc'))
                ClearPedTasks(ped)
                RemoveAnimDict('amb@medic@standing@kneel@base')
                RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
            end
        })
    end  
end

function StartEffect(value, type, effect, periode)
    local ped = PlayerPedId()
    local model = 'prop_moonshine_bootle'
    local dict  = 'amb@world_human_drinking@beer@male@idle_a'
    local anim  = 'idle_c'
    local bone  = 28422
    LoadModel(model)
    local prop = CreateObject(GetHashKey(model), 0.0, 0.0, 0.0,true,true,true)
    table.insert(props, prop)
    AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, bone), 0.0, 0.0, 0.06, 0.0, 15.0, 0.0, true, true, false, true, 1, true)  
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do 
        Wait(0) 
    end
    TaskPlayAnim(ped, dict, anim, 1.0, 1.0, 1500, 50, 0, 0, 0, 0)

    if Config.Framework == "qb" then
        QBCore.Functions.Progressbar("drink_moonshine", _U('farm_trmo'), 1500, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            DeleteEntity(prop)
            SetEntityAsNoLongerNeeded(prop)
            AfterEffect(value, type, effect, periode)
        end, function() -- Cancel
            DestroyAllProps()
            NotifyFramework(_U('farm_canc'))
        end)
    elseif Config.Framework == "esx" then
        ESX.Progressbar(_U('farm_trmo'), 1500,{
                FreezePlayer = true, 
                animation ={},
            onFinish = function()
                DestroyAllProps()
                AfterEffect(value, type, effect, periode)
            end, onCancel = function()
                DeleteEntity(prop)
                SetEntityAsNoLongerNeeded(prop)
                NotifyFramework(_U('farm_canc'))
            end
        })
    end 
end

function AfterEffect(value, type, effect, periode)
    if type == 'stress' then
        StartScreenEffect(effect, 3.0 , 0)
        TriggerServerEvent('hud:server:RelieveStress', value)
        Citizen.Wait(3000)
        StopScreenEffect(effect)
    elseif type == 'stamina' then
        StartScreenEffect(effect, (periode * 1.0) , 0)
        local stamina = periode
        while stamina > 0 do
            RestorePlayerStamina(PlayerId(), (value * 0.1))
            stamina = stamina - 1
            Citizen.Wait(1000)
        end
        StopScreenEffect(effect)
    elseif type == 'sprint' then
        StartScreenEffect(effect, (periode * 1.0) , 0)
        SetRunSprintMultiplierForPlayer(PlayerId(), (1.0 + (value*0.01)))
        Citizen.Wait(periode * 1000)
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        StopScreenEffect(effect)
    elseif type == 'health' then
        StartScreenEffect(effect, 3.0 , 0)
        local health = GetEntityHealth(PlayerPedId())
        SetEntityHealth(PlayerPedId(), (health + value))
        Citizen.Wait(3000)
        StopScreenEffect(effect)
    elseif type == 'armor' then
        StartScreenEffect(effect, 3.0 , 0)
        local armor = GetPedArmour(PlayerPedId())
        SetPedArmour(PlayerPedId(), (armor + value))
        Citizen.Wait(3000)
        StopScreenEffect(effect)
    end
end

function FillWater(item)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local model = `prop_wateringcan`
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local created_object = CreateObject(model, coords.x, coords.y, coords.z, true, true, true)
    AttachEntityToEntity(created_object, ped, GetPedBoneIndex(ped, 28422), 0.4, 0.1, 0.0, 90.0, 180.0, 0.0, true, true, false, true, 1, true)
    if Config.Framework == "qb" then
        QBCore.Functions.Progressbar('farming_water', _U('farm_fiwa'), 6000, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'weapon@w_sp_jerrycan',
            anim = 'fire',
            flags = 1,
        }, {}, {}, function()
            TriggerServerEvent('zat-farming:server:FillWater', item)
            ClearPedTasks(ped)
            DeleteEntity(created_object)
        end, function()
            ClearPedTasks(ped)
            DeleteEntity(created_object)
            NotifyFramework(_U('farm_canc'))
        end)
    elseif Config.Framework == "esx" then
        ESX.Progressbar(_U('farm_fiwa'), 6000,{
            FreezePlayer = true, 
            animation ={
                type = "anim",
                dict = "weapon@w_sp_jerrycan", 
                lib ="fire"
            },
        onFinish = function()
            TriggerServerEvent('zat-farming:server:FillWater', item)
            ClearPedTasks(ped)
            DeleteEntity(created_object)
        end, onCancel = function()
            ClearPedTasks(ped)
            DeleteEntity(created_object)
            NotifyFramework(_U('farm_canc'))
        end
        })
    end
end

function WaterTap()
    local ped = PlayerPedId()
    local dict = 'mini@repair'
    local anim = 'fixing_a_ped'
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do 
        Wait(0) 
    end
    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 1, 0, false, false, false)
    if Config.Framework == "qb" then
        QBCore.Functions.Progressbar("water_tap", _U('farm_gewt'), 1500, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('zat-farming:server:GiveItem', 'farm_water_tap', 100) -- 100 is the quality
            ClearPedTasks(ped)
            RemoveAnimDict('amb@medic@standing@kneel@base')
        end, function() -- Cancel
            NotifyFramework(_U('farm_canc'))
        end)
    elseif Config.Framework == "esx" then
        ESX.Progressbar(_U('farm_gewt'), 1500,{
                FreezePlayer = true, 
                animation ={},
            onFinish = function()
                TriggerServerEvent('zat-farming:server:GiveItem', 'farm_water_tap', 100) -- 100 is the quality
                ClearPedTasks(ped)
                RemoveAnimDict('amb@medic@standing@kneel@base')
            end, onCancel = function()
                NotifyFramework(_U('farm_canc'))
            end
        })
    end  
end

RegisterNetEvent('zat-farming:client:StartEffect', function(item)
    local purity = 0
    if Config.Inventory == 'ox' then
        purity = item.metadata.purity
    else
        purity = item.info.purity
    end
    
    for k, v in pairs(Config.MoonshineItem.effects) do
        if purity <= v.quality then
            local value = purity * v.multi
            StartEffect(value, v.type, v.effect, v.periode)
            break
        end
    end
end)

function DestroyAllProps()
    for _, v in pairs(props) do
        DeleteEntity(v)
    end
    props = {}
end