local QBCore = exports[Config.CoreName]:GetCoreObject()

CreateThread(function()
  if Config.Target == "qb" then
      exports["qb-target"]:AddCircleZone("NPC", vector3(-773.2, 5597.93, 33.61), 1.0, {
              name = "NPC",
              debugPoly = false,
              useZ = true,
          }, {
              options = {
                  {
                      event = "m-Hunting:client:AbrirMenuGeral",
                      icon = "fas fa-person",
                      label = "Talk to Hunter",
                  },
              },
              distance = 1.5
          })
        
          exports["qb-target"]:AddTargetModel(Config.LegalAnimals, { -- Target on Animals
            options = {
              {
                event = "m-Hunting:skinAnimal",
                icon = "far fa-hand-paper",
                label = "Skin",
              },
            },
            distance = 1.5
          })

          exports["qb-target"]:AddTargetModel(Config.IlegalAnimals, { -- Target on Animals
            options = {
              {
                event = "m-Hunting:skinAnimal",
                icon = "far fa-hand-paper",
                label = "Skin",
              },
            },
            distance = 1.5
          })
  elseif Config.Target == "ox" then
      exports.ox_target:addBoxZone({
            coords = vec3(-773.2, 5597.93, 33.61),
            size = vec3(1.0, 1.0, 1.0),
            rotation = 22,
            debug = false,
            options = {
                {
                    event = "m-Hunting:client:AbrirMenuGeral",
                    icon = "fas fa-person",
                    label = "Talk to Hunter",
                }
            }
        })

        exports.ox_target:addModel(Config.LegalAnimals, {
            {
                event = "m-Hunting:skinAnimal",
                icon = "far fa-hand-paper",
                label = "Skin",
            }, 
        }) 

        exports.ox_target:addModel(Config.IlegalAnimals, {
            {
                event = "m-Hunting:skinAnimal",
                icon = "far fa-hand-paper",
                label = "Skin",
            }, 
        }) 
    end
end)