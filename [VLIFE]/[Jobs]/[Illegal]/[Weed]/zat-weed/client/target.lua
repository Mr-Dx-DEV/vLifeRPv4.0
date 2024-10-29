local QBCore = nil

Citizen.CreateThread(function() 
    if Config.Framework == "qb" then
        QBCore = exports[Config.FrameworkPseudo]:GetCoreObject()
    end
end)

CreateThread(function()
    if Config.UseInteract then
        exports.interact:AddModelInteraction({
            model = Config.FanProps[1],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'FAN1', -- optional
            id = 'FAN1', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-fan',
                    label   =  _U("str_fan"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatfan01'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                }
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.FanProps[2],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'FAN2', -- optional
            id = 'FAN2', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-fan',
                    label   =  _U("str_fan"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatresfan'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                }
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.FanProps[3],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'FAN3', -- optional
            id = 'FAN3', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-fan',
                    label   =  _U("str_fan"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatwallfan'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                }
            }
        })


        exports.interact:AddModelInteraction({
            model = Config.HeaterProps[1],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'HEAT1', -- optional
            id = 'HEAT1', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-temperature-empty',
                    label   =  _U("str_hea"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatheater'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                }
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.HeaterProps[2],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'HEAT2', -- optional
            id = 'HEAT2', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-temperature-empty',
                    label   =  _U("str_hea"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatpatioheater'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                }
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.LightProps[1],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'LIGHT1', -- optional
            id = 'LIGHT1', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-lightbulb',
                    label   =  _U("str_lig"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatwalllight'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                }
            }
        })


        exports.interact:AddModelInteraction({
            model = Config.LightProps[2],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'LIGHT2', -- optional
            id = 'LIGHT2', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-lightbulb',
                    label   =  _U("str_lig"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatceilinglight'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                }
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.LightProps[3],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'LIGHT3', -- optional
            id = 'LIGHT3', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-lightbulb',
                    label   =  _U("str_lig"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatbluelight'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                }
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.PlanterProps[1],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'PLANTER1', -- optional
            id = 'PLANTER1', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-box',
                    label   =  _U("str_pla"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatplanter'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                            retval = not linked
                        end, GetModelIdFromEntity(entity), 'planter')
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                                retval = not linked
                        end, GetModelIdFromEntity(entity), 'planter')
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-plant-wilt',
                    label   =  _U("pro_nut"),
                    action = function(entity)
                        FertilizingProgressBar(entity)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        if HasItem('zatweednutrition') then
                            TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                                retval = linked
                            end, GetModelIdFromEntity(entity), 'planter')
                        else
                            retval = false
                        end
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                }
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.PlanterProps[5],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'PLANTER5', -- optional
            id = 'PLANTER5', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-bottle-water',
                    label   =  _U("str_fiw"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatwatersetup'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                            retval = not linked
                        end, GetModelIdFromEntity(entity), 'watersetup')
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    type    =  'client',
                    icon    =  'fas fa-plant-wilt',
                    label   =  _U("fil_wtr"),
                    action = function(entity)
                        FillingWaterSetupProgressBar(entity)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        if HasItem('zatwaterbottlefull') then
                            TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                                retval = linked
                            end, GetModelIdFromEntity(entity), 'watersetup')
                        else
                            retval = false
                        end
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,

                }
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.PlanterProps[2],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'PLANTER2', -- optional
            id = 'PLANTER2', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-box',
                    label   =  _U("str_wrc"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatweedrackxs'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "RackDryer_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "RackDryer_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-store',
                    label   =  _U("ope_rac"),
                    action = function(entity)
                        local data = {
                            slots = 3,
                            entity = entity,
                        }
                        TriggerEvent('zat-weed:client:OpenStash', data)
                    end,
                }
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.PlanterProps[3],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'PLANTER3', -- optional
            id = 'PLANTER3', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-box',
                    label   =  _U("str_wrc"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatweedracks'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "RackDryer_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "RackDryer_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-store',
                    label   =  _U("ope_rac"),
                    action = function(entity)
                        local data = {
                            slots = 5,
                            entity = entity,
                        }
                        TriggerEvent('zat-weed:client:OpenStash', data)
                    end,
                }
            }
        })
        -- Plants

        exports.interact:AddModelInteraction({
            model = Config.WeedProps[1],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'WEED1', -- optional
            id = 'WEED1', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("che_pla"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:CheckPlant', data)
                    end,
                },
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.WeedProps[2],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'WEED2', -- optional
            id = 'WEED2', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("che_pla"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:CheckPlant', data)
                    end,
                },
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("clo_pla"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:ClonePlant', data)
                    end,
                },
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.WeedProps[3],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'WEED3', -- optional
            id = 'WEED3', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("che_pla"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:CheckPlant', data)
                    end,
                },
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.WeedProps[4],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'WEED4', -- optional
            id = 'WEED4', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("che_pla"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:CheckPlant', data)
                    end,
                },
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.WeedProps[5],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'WEED4', -- optional
            id = 'WEED4', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("che_pla"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:CheckPlant', data)
                    end,
                },
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("harv_pl"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Harvest', data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:GetPlantData', function(result)
                            if (result.growth >= 100) then
                                retval = true
                            end
                        end, GetWeedPlantIdFromEntity(entity))
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },  
            }
        })

        exports.interact:AddModelInteraction({
            model = Config.PlanterProps[4],
            offset = vec3(0.0, 0.0, 1.0), -- optional
            name = 'PLANTER4', -- optional
            id = 'PLANTER4', -- needed for removing interactions
            distance = 3.0, -- optional
            interactDst = 3.0, -- optional
            options = {
                {
                    icon    =  'fas fa-box',
                    label   =  _U("mk_weeb"),
                    action = function(entity)
                        TriggerEvent('zat-weed:client:CreateWeedBrick')
                    end,
                }, 
                {
                    icon    =  'fas fa-box',
                    label   =  _U("wee_sto"),
                    action = function(entity)
                        local data = {
                            slots  = 10,
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:OpenWeedTable', data)
                    end,
                }, 
                {
                    icon    =  'fas fa-box',
                    label   =  _U("str_wta"),
                    action = function(entity)
                        local data = {
                            entity = entity,
                            name   = 'zatweedtable'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "WeedStorage_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    action = function(entity)
                        local data = {
                            entity = entity
                        }
                        TriggerEvent('zat-weed:client:Move', data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "WeedStorage_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
            }
        })
    else
        if Config.Target == 'qb' then
            exports['qb-target']:AddTargetModel(Config.FanProps[1], {
                options = {
                    {
                        icon    =  'fas fa-fan',
                        label   =  _U("str_fan"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatfan01'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                    }
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.FanProps[2], {
                options = {
                    {
                        icon    =  'fas fa-fan',
                        label   =  _U("str_fan"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatresfan'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                    }
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.FanProps[3], {
                options = {
                    {
                        icon    =  'fas fa-fan',
                        label   =  _U("str_fan"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatwallfan'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                    }
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.HeaterProps[1], {
                options = {
                    {
                        icon    =  'fas fa-temperature-empty',
                        label   =  _U("str_hea"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatheater'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                    }
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.HeaterProps[2], {
                options = {
                    {
                        icon    =  'fas fa-temperature-empty',
                        label   =  _U("str_hea"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatpatioheater'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                    }
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.LightProps[1], {
                options = {
                    {
                        icon    =  'fas fa-lightbulb',
                        label   =  _U("str_lig"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatwalllight'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                    }
                },
                distance = 3.0, 
            })

            exports['qb-target']:AddTargetModel(Config.LightProps[2], {
                options = {
                    {
                        icon    =  'fas fa-lightbulb',
                        label   =  _U("str_lig"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatceilinglight'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                    }
                },
                distance = 3.0, 
            })

            exports['qb-target']:AddTargetModel(Config.LightProps[3], {
                options = {
                    {
                        icon    =  'fas fa-lightbulb',
                        label   =  _U("str_lig"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatbluelight'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                    }
                },
                distance = 3.0, 
            })
            
            exports['qb-target']:AddTargetModel(Config.PlanterProps[1], {
                options = {
                    {
                        icon    =  'fas fa-box',
                        label   =  _U("str_pla"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatplanter'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                                retval = not linked
                            end, GetModelIdFromEntity(entity), 'planter')
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                                    retval = not linked
                            end, GetModelIdFromEntity(entity), 'planter')
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,
                    },
                    {
                        icon    =  'fas fa-plant-wilt',
                        label   =  _U("pro_nut"),
                        action = function(entity)
                            FertilizingProgressBar(entity)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            if HasItem('zatweednutrition') then
                                TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                                    retval = linked
                                end, GetModelIdFromEntity(entity), 'planter')
                            else
                                retval = false
                            end
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,
                    }
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.PlanterProps[5], {
                options = {
                    {
                        icon    =  'fas fa-bottle-water',
                        label   =  _U("str_fiw"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatwatersetup'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                                retval = not linked
                            end, GetModelIdFromEntity(entity), 'watersetup')
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,
                    },
                    {
                        type    =  'client',
                        icon    =  'fas fa-plant-wilt',
                        label   =  _U("fil_wtr"),
                        action = function(entity)
                            FillingWaterSetupProgressBar(entity)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            if HasItem('zatwaterbottlefull') then
                                TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                                    retval = linked
                                end, GetModelIdFromEntity(entity), 'watersetup')
                            else
                                retval = false
                            end
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,

                    }
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.PlanterProps[2], {
                options = {
                    {
                        icon    =  'fas fa-box',
                        label   =  _U("str_wrc"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatweedrackxs'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                                retval = not result
                            end, GetModelIdFromEntity(entity), "RackDryer_")
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                                retval = not result
                            end, GetModelIdFromEntity(entity), "RackDryer_")
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,
                    },
                    {
                        icon    =  'fas fa-store',
                        label   =  _U("ope_rac"),
                        action = function(entity)
                            local data = {
                                slots = 3,
                                entity = entity,
                            }
                            TriggerEvent('zat-weed:client:OpenStash', data)
                        end,
                    }

                    
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.PlanterProps[3], {
                options = {
                    {
                        icon    =  'fas fa-box',
                        label   =  _U("str_wrc"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatweedracks'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                                retval = not result
                            end, GetModelIdFromEntity(entity), "RackDryer_")
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                                retval = not result
                            end, GetModelIdFromEntity(entity), "RackDryer_")
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,
                    },
                    {
                        icon    =  'fas fa-store',
                        label   =  _U("ope_rac"),
                        action = function(entity)
                            local data = {
                                slots = 5,
                                entity = entity,
                            }
                            TriggerEvent('zat-weed:client:OpenStash', data)
                        end,
                    }
                },
                distance = 1.5, 
            })

            -- Plants

            exports['qb-target']:AddTargetModel(Config.WeedProps[1], {
                options = {
                    {
                        icon    =  'fas fa-cannabis',
                        label   =  _U("che_pla"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:CheckPlant', data)
                        end,
                    },
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.WeedProps[2], {
                options = {
                    {
                        icon    =  'fas fa-cannabis',
                        label   =  _U("che_pla"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:CheckPlant', data)
                        end,
                    },
                    {
                        icon    =  'fas fa-cannabis',
                        label   =  _U("clo_pla"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:ClonePlant', data)
                        end,
                    },
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.WeedProps[3], {
                options = {
                    {
                        icon    =  'fas fa-cannabis',
                        label   =  _U("che_pla"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:CheckPlant', data)
                        end,
                    },
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.WeedProps[4], {
                options = {
                    {
                        icon    =  'fas fa-cannabis',
                        label   =  _U("che_pla"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:CheckPlant', data)
                        end,
                    },
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.WeedProps[5], {
                options = {
                    {
                        icon    =  'fas fa-cannabis',
                        label   =  _U("che_pla"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:CheckPlant', data)
                        end,
                    },
                    {
                        icon    =  'fas fa-cannabis',
                        label   =  _U("harv_pl"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Harvest', data)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            TriggerServerCallback('zat-weed:server:GetPlantData', function(result)
                                if (result.growth >= 100) then
                                    retval = true
                                end
                            end, GetWeedPlantIdFromEntity(entity))
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,
                    },  
                },
                distance = 1.5, 
            })

            exports['qb-target']:AddTargetModel(Config.PlanterProps[4], {
                options = {
                    {
                        icon    =  'fas fa-box',
                        label   =  _U("mk_weeb"),
                        action = function(entity)
                            TriggerEvent('zat-weed:client:CreateWeedBrick')
                        end,
                    }, 
                    {
                        icon    =  'fas fa-box',
                        label   =  _U("wee_sto"),
                        action = function(entity)
                            local data = {
                                slots  = 10,
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:OpenWeedTable', data)
                        end,
                    }, 
                    {
                        icon    =  'fas fa-box',
                        label   =  _U("str_wta"),
                        action = function(entity)
                            local data = {
                                entity = entity,
                                name   = 'zatweedtable'
                            }
                            TriggerEvent('zat-weed:client:StoreItem', data)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                                retval = not result
                            end, GetModelIdFromEntity(entity), "WeedStorage_")
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,
                    },
                    {
                        icon    =  'fas fa-up-down-left-right',
                        label   =  _U("mv_obje"),
                        action = function(entity)
                            local data = {
                                entity = entity
                            }
                            TriggerEvent('zat-weed:client:Move', data)
                        end,
                        canInteract = function(entity)
                            local retval = nil
                            TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                                retval = not result
                            end, GetModelIdFromEntity(entity), "WeedStorage_")
                            while retval == nil do
                                Citizen.Wait(10)
                            end
                            return retval
                        end,
                    },
                },
                distance = 1.5, 
            })
        elseif Config.Target == 'ox' then
            exports.ox_target:addModel(Config.FanProps[1], {
                {
                    icon    =  'fas fa-fan',
                    label   =  _U("str_fan"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatfan01'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                }
            })

            exports.ox_target:addModel(Config.FanProps[2], {
                {
                    icon    =  'fas fa-fan',
                    label   =  _U("str_fan"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatresfan'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                }
            })

            exports.ox_target:addModel(Config.FanProps[3], {
                {
                    icon    =  'fas fa-fan',
                    label   =  _U("str_fan"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatwallfan'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                }
            })

            exports.ox_target:addModel(Config.HeaterProps[1], {
                {
                    icon    =  'fas fa-temperature-empty',
                    label   =  _U("str_hea"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatheater'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                }
            })

            exports.ox_target:addModel(Config.HeaterProps[2], {
                {
                    icon    =  'fas fa-temperature-empty',
                    label   =  _U("str_hea"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatpatioheater'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                }
            })

            exports.ox_target:addModel(Config.LightProps[1], {
                {
                    icon    =  'fas fa-lightbulb',
                    label   =  _U("str_lig"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatwalllight'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                }
            })

            exports.ox_target:addModel(Config.LightProps[2], {
                {
                    icon    =  'fas fa-lightbulb',
                    label   =  _U("str_lig"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatceilinglight'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                }
            })

            exports.ox_target:addModel(Config.LightProps[3], {
                {
                    icon    =  'fas fa-lightbulb',
                    label   =  _U("str_lig"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatbluelight'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                }
            })
            
            exports.ox_target:addModel(Config.PlanterProps[1], {
                {
                    icon    =  'fas fa-box',
                    label   =  _U("str_pla"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatplanter'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                            retval = not linked
                        end, GetModelIdFromEntity(entity), 'planter')
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                                retval = not linked
                        end, GetModelIdFromEntity(entity), 'planter')
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-plant-wilt',
                    label   =  _U("pro_nut"),
                    onSelect = function(data)
                        FertilizingProgressBar(data.entity)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        if HasItem('zatweednutrition') then
                            TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                                retval = linked
                            end, GetModelIdFromEntity(entity), 'planter')
                        else
                            retval = false
                        end
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                }
            })

            exports.ox_target:addModel(Config.PlanterProps[5], {
                {
                    icon    =  'fas fa-bottle-water',
                    label   =  _U("str_fiw"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatwatersetup'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                            retval = not linked
                        end, GetModelIdFromEntity(entity), 'watersetup')
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    type    =  'client',
                    icon    =  'fas fa-plant-wilt',
                    label   =  _U("fil_wtr"),
                    onSelect = function(data)
                        FillingWaterSetupProgressBar(data.entity)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        if HasItem('zatwaterbottlefull') then
                            TriggerServerCallback('zat-weed:server:CheckIfEntityIsLinked', function(linked)
                                retval = linked
                            end, GetModelIdFromEntity(entity), 'watersetup')
                        else
                            retval = false
                        end
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,

                }
            })

            exports.ox_target:addModel(Config.PlanterProps[2], {
                {
                    icon    =  'fas fa-box',
                    label   =  _U("str_wrc"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatweedrackxs'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "RackDryer_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "RackDryer_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-store',
                    label   =  _U("ope_rac"),
                    onSelect = function(data)
                        local Data = {
                            slots = 3,
                            entity = data.entity,
                        }
                        TriggerEvent('zat-weed:client:OpenStash', Data)
                    end,
                }
            })

            exports.ox_target:addModel(Config.PlanterProps[3], {
                {
                    icon    =  'fas fa-box',
                    label   =  _U("str_wrc"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatweedracks'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "RackDryer_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "RackDryer_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-store',
                    label   =  _U("ope_rac"),
                    onSelect = function(data)
                        local Data = {
                            slots = 5,
                            entity = data.entity,
                        }
                        TriggerEvent('zat-weed:client:OpenStash', Data)
                    end,
                }
            })

            -- Plants

            exports.ox_target:addModel(Config.WeedProps[1], {
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("che_pla"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:CheckPlant', Data)
                    end,
                },
            })

            exports.ox_target:addModel(Config.WeedProps[2], {
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("che_pla"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:CheckPlant', Data)
                    end,
                },
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("clo_pla"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:ClonePlant', Data)
                    end,
                },
            })

            exports.ox_target:addModel(Config.WeedProps[3], {
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("che_pla"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:CheckPlant', Data)
                    end,
                },
            })

            exports.ox_target:addModel(Config.WeedProps[4], {
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("che_pla"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:CheckPlant', Data)
                    end,
                },
            })

            exports.ox_target:addModel(Config.WeedProps[5], {
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("che_pla"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:CheckPlant', Data)
                    end,
                },
                {
                    icon    =  'fas fa-cannabis',
                    label   =  _U("harv_pl"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Harvest', Data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:GetPlantData', function(result)
                            if (result.growth >= 100) then
                                retval = true
                            end
                        end, GetWeedPlantIdFromEntity(entity))
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },  
            })

            exports.ox_target:addModel(Config.PlanterProps[4], {
                {
                    icon    =  'fas fa-box',
                    label   =  _U("mk_weeb"),
                    onSelect = function(data)
                        TriggerEvent('zat-weed:client:CreateWeedBrick')
                    end,
                }, 
                {
                    icon    =  'fas fa-box',
                    label   =  _U("wee_sto"),
                    onSelect = function(data)
                        local Data = {
                            slots  = 10,
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:OpenWeedTable', Data)
                    end,
                }, 
                {
                    icon    =  'fas fa-box',
                    label   =  _U("str_wta"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity,
                            name   = 'zatweedtable'
                        }
                        TriggerEvent('zat-weed:client:StoreItem', Data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "WeedStorage_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
                {
                    icon    =  'fas fa-up-down-left-right',
                    label   =  _U("mv_obje"),
                    onSelect = function(data)
                        local Data = {
                            entity = data.entity
                        }
                        TriggerEvent('zat-weed:client:Move', Data)
                    end,
                    canInteract = function(entity)
                        local retval = nil
                        TriggerServerCallback('zat-weed:server:IsStashFull', function(result)
                            retval = not result
                        end, GetModelIdFromEntity(entity), "WeedStorage_")
                        while retval == nil do
                            Citizen.Wait(10)
                        end
                        return retval
                    end,
                },
            })
        end
    end
end)