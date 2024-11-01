local Blips = {}


function SetupBlips()
    for _, v in pairs(Config.Motel) do
        local options = v.Blips or {
                sprite = 475,
                color = 15
            }
        local coords = v.rent.coords
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, options.sprite)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, options.color)
        SetBlipDisplay(blip, 4)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.label)
        EndTextCommandSetBlipName(blip)
        --Comment below if you want to disable the blip category
        SetBlipCategory(blip, 10)
        Blips[#Blips + 1] = blip
    end
end

function DeleteBlips()
    for i = 1, #Blips do
        RemoveBlip(Blips[i])
    end
end

function RefreshBlips()
    DeleteBlips()
end

CreateThread(function()
    SetupBlips()
end)
