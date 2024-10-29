local QBCore = nil


Citizen.CreateThread(function() 
    if Config.Framework == "qb" then
        QBCore = exports[Config.FrameworkPseudo]:GetCoreObject()
    end
end)

local function LoadModel(model)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(GetHashKey(model)) do Wait(1) end
end

Citizen.CreateThread(function()
    if Config.UseInteract then  
        for k, v in pairs(Config.Pots) do
            LoadModel(v.model) 
            exports.interact:AddModelInteraction({
                model = v.model,
                offset = vec3(0.0, 0.0, 0.0), -- optional
                name = k, -- optional
                id = k, -- needed for removing interactions
                ignoreLos = true,
                distance = 7.0, -- optional
                interactDst = 3.0, -- optional
                options = {
                    {
                        label = 'Garden',
                        action = function(entity)
                            checkPotPB(entity)
                        end,
                    },
                    {
                        label = 'Move',
                        action = function(entity)
                            TriggerServerEvent('zat-farming:server:Move', GetPotIdFromEntity(entity), 'pots', entity)
                        end,
                    },
                    {
                        label = 'Store',
                        action = function(entity)
                            TriggerServerEvent('zat-farming:server:Store', GetPotIdFromEntity(entity), 'pots')
                        end,
                    },
                }
            })
        end   
        for k, v in pairs(Config.Lights) do
            LoadModel(v.model) 
            exports.interact:AddModelInteraction({
                model = v.model,
                offset = vec3(0.0, 0.0, 0.0), -- optional
                name = k, -- optional
                id = k, -- needed for removing interactions
                ignoreLos = true,
                distance = 7.0, -- optional
                interactDst = 3.0, -- optional
                options = {
                    {
                        label = 'Move',
                        action = function(entity)
                            TriggerServerEvent('zat-farming:server:Move', GetLightIdFromEntity(entity), 'lights', entity)
                        end,
                    },
                    {
                        label = 'Store',
                        action = function(entity)
                            TriggerServerEvent('zat-farming:server:Store', GetLightIdFromEntity(entity), 'lights')
                        end,
                    },
                }
            })
        end   
        for k, v in pairs(Config.Tools) do
            LoadModel(v.model) 
            exports.interact:AddModelInteraction({
                model = v.model,
                offset = vec3(0.0, 0.0, 0.5), -- optional
                name = k, -- optional
                id = k, -- needed for removing interactions
                ignoreLos = true,
                distance = 7.0, -- optional
                interactDst = 3.0, -- optional
                options = {
                    {
                        label = 'Move',
                        action = function(entity)
                            TriggerServerEvent('zat-farming:server:Move', GetToolIdFromEntity(entity), 'tools', entity)
                        end,
                    },
                    {
                        label = 'Store',
                        action = function(entity)
                            TriggerServerEvent('zat-farming:server:Store', GetToolIdFromEntity(entity), 'tools')
                        end,
                    },
                    {
                        label = 'Open',
                        action = function(entity)
                            if k == 'farm_compost' then
                                TriggerEvent('zat-farming:client:OpenComp', entity)
                            elseif k == 'farm_mil' then
                                TriggerEvent('zat-farming:client:OpenMil', entity)
                            elseif k == 'moon_distillation' then
                                TriggerEvent('zat-farming:client:OpenMoonshine', entity)
                            end
                        end,
                        canInteract = function(entity)
                            if k ~= 'farm_sink_s' and k ~= 'farm_sink_m' then return true end
                        end
                    },
                    {
                        label = 'Water Tap',
                        action = function(entity)
                            if k == 'farm_sink_m' or k == 'farm_sink_s' then
                                WaterTap()
                            end
                        end,
                        canInteract = function(entity)
                            if k == 'farm_sink_s' or k == 'farm_sink_m' then return true end
                        end
                    },
                }
            })
        end     
    else -- TARGET
        if Config.Target == 'qb' then
            for k, v in pairs(Config.Pots) do
                LoadModel(v.model) 
                exports['qb-target']:AddTargetModel(v.model, {
                    options = {
                        {
                            label = 'Garden',
                            action = function(entity)
                                checkPotPB(entity)
                            end,
                        },
                        {
                            label = 'Move',
                            action = function(entity)
                                TriggerServerEvent('zat-farming:server:Move', GetPotIdFromEntity(entity), 'pots', entity)
                            end,
                        },
                        {
                            label = 'Store',
                            action = function(entity)
                                TriggerServerEvent('zat-farming:server:Store', GetPotIdFromEntity(entity), 'pots')
                            end,
                        },
                    },
                    distance = 2.5
                })
            end

            for k, v in pairs(Config.Lights) do
                LoadModel(v.model) 
                exports['qb-target']:AddTargetModel(v.model, {
                    options = {
                        {
                            label = 'Move',
                            action = function(entity)
                                TriggerServerEvent('zat-farming:server:Move', GetLightIdFromEntity(entity), 'lights', entity)
                            end,
                        },
                        {
                            label = 'Store',
                            action = function(entity)
                                TriggerServerEvent('zat-farming:server:Store', GetLightIdFromEntity(entity), 'lights')
                            end,
                        },
                    },
                    distance = 2.5
                })
            end

            for k, v in pairs(Config.Tools) do
                LoadModel(v.model) 
                exports['qb-target']:AddTargetModel(v.model, {
                    options = {
                        {
                            label = 'Move',
                            action = function(entity)
                                TriggerServerEvent('zat-farming:server:Move', GetToolIdFromEntity(entity), 'tools', entity)
                            end,
                        },
                        {
                            label = 'Store',
                            action = function(entity)
                                TriggerServerEvent('zat-farming:server:Store', GetToolIdFromEntity(entity), 'tools')
                            end,
                        },
                        {
                            label = 'Open',
                            action = function(entity)
                                if k == 'farm_compost' then
                                    TriggerEvent('zat-farming:client:OpenComp', entity)
                                elseif k == 'farm_mil' then
                                    TriggerEvent('zat-farming:client:OpenMil', entity)
                                elseif k == 'moon_distillation' then
                                    TriggerEvent('zat-farming:client:OpenMoonshine', entity)
                                end
                            end,
                            canInteract = function(entity)
                                if k ~= 'farm_sink_s' and k ~= 'farm_sink_m' then return true end
                            end
                        },
                        {
                            label = 'Water Tap',
                            action = function(entity)
                                if k == 'farm_sink_m' or k == 'farm_sink_s' then
                                    WaterTap()
                                end
                            end,
                            canInteract = function(entity)
                                if k == 'farm_sink_s' or k == 'farm_sink_m' then return true end
                            end
                        },
                    },
                    distance = 2.5
                })
            end 
        elseif Config.Target == 'ox' then
            for k, v in pairs(Config.Pots) do
                LoadModel(v.model) 
                exports.ox_target:addModel(v.model, {
                    {
                        label = 'Garden',
                        onSelect = function(data)
                            checkPotPB(data.entity)
                        end,
                    },
                    {
                        label = 'Move',
                        onSelect = function(data)
                            TriggerServerEvent('zat-farming:server:Move', GetPotIdFromEntity(data.entity), 'pots', data.entity)
                        end,
                    },
                    {
                        label = 'Store',
                        onSelect = function(data)
                            TriggerServerEvent('zat-farming:server:Store', GetPotIdFromEntity(data.entity), 'pots')
                        end,
                    },
                })
            end

            for k, v in pairs(Config.Lights) do
                LoadModel(v.model) 
                exports.ox_target:addModel(v.model, {
                    {
                        label = 'Move',
                        onSelect = function(data)
                            TriggerServerEvent('zat-farming:server:Move', GetLightIdFromEntity(data.entity), 'lights', data.entity)
                        end,
                    },
                    {
                        label = 'Store',
                        onSelect = function(data)
                            TriggerServerEvent('zat-farming:server:Store', GetLightIdFromEntity(data.entity), 'lights')
                        end,
                    },
                })
            end

            for k, v in pairs(Config.Tools) do
                LoadModel(v.model) 
                exports.ox_target:addModel(v.model, {
                    {
                        label = 'Move',
                        onSelect = function(data)
                            TriggerServerEvent('zat-farming:server:Move', GetToolIdFromEntity(data.entity), 'tools', data.entity)
                        end,
                    },
                    {
                        label = 'Store',
                        onSelect = function(data)
                            TriggerServerEvent('zat-farming:server:Store', GetToolIdFromEntity(data.entity), 'tools')
                        end,
                    },
                    {
                        label = 'Open',
                        onSelect = function(data)
                            if k == 'farm_compost' then
                                TriggerEvent('zat-farming:client:OpenComp', data.entity)
                            elseif k == 'farm_mil' then
                                TriggerEvent('zat-farming:client:OpenMil', data.entity)
                            elseif k == 'moon_distillation' then
                                TriggerEvent('zat-farming:client:OpenMoonshine', data.entity)
                            end
                        end,
                        canInteract = function(entity)
                            if k ~= 'farm_sink_s' and k ~= 'farm_sink_m' then return true end
                        end
                    },
                    {
                        label = 'Water Tap',
                        onSelect = function(data)
                            if k == 'farm_sink_m' or k == 'farm_sink_s' then
                                WaterTap()
                            end
                        end,
                        canInteract = function(entity)
                            if k == 'farm_sink_s' or k == 'farm_sink_m' then return true end
                        end
                    },
                })
            end 
        end
    end
end)
