function CreateTargetExports()
    for k, v in pairs(Config.GangFlags) do
        exports[Config.Target]:AddTargetModel(GetHashKey(v.Prop), {
            options = {
                {
                    event = "snipe-gangsystem:client:pickup",
                    icon = "fas fa-circle", 
                    label = "Pickup",
                    gangName = k,
                    canInteract = function(entity)
                        if currentGang ~= nil and PlayerGang.name == currentGang and not IsEntityDead(entity) then
                            return true
                        end
                    end,
                },
                {
                    event = "snipe-gangsystem:client:destroy",
                    icon = "fas fa-circle", 
                    label = "Rob", 
                    gangName = k,
                    canInteract = function(entity)
                        if currentGang ~= nil and PlayerGang.name ~= currentGang and not IsEntityDead(entity) then
                            return true
                        end
                    end,
                },
            },
            distance = 5.0
        })
    end
end