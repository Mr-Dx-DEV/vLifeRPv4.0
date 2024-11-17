local QBCore = exports[Config.CoreName]:GetCoreObject()

-- Notify
function Notify(msg, typem, time)
    if type == "primary" then 
        QBCore.Functions.Notify(msg, "primary", time)
    end
    if type == "success" then
        QBCore.Functions.Notify(msg, "success", time)
    end
    if type == "error" then
        QBCore.Functions.Notify(msg, "error", time)
    end
end

-- Function to call the cops
function CallCops()
    if Config.Dispatch == 'cd_dispatch' then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police'},
            coords = data.coords,
            title = '10-10 - Illegal Hunting',
            message = 'A '..data.sex..' possibly committing a crime '..data.street,
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 156,
                scale = 0.5,
                colour = 1,
                flashes = false,
                text = '911 - Illegal Hunting',
                time = (5*60*1000),
                sound = 1,
            }
        })
    elseif Config.Dispatch == 'ps-dispatch' then
        local pCoords = GetEntityCoords(PlayerPedId())
        exports["ps-dispatch"]:CustomAlert({
            coords = pCoords,
            message = "911 - Illegal Hunting",
            dispatchCode = "10-10 Illegal Hunting",
            description = "possibly committing a crime",
            gender = true,
            radius = 0,
            sprite = 156,
            color = 1,
            scale = 1.2,
            length = 3,
        })
    end
end

function CheckPlayer()
    local playerPed = PlayerPedId()
    if not IsPedSwimming(playerPed) and not IsPedInAnyVehicle(playerPed, false) and not IsEntityDead(playerPed) then
        return true
    end
end


    