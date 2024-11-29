local houseBlip = nil

function createBlip(coords)
    if not coords then return end
    if houseBlip and DoesBlipExist(houseBlip) then
        RemoveBlip(houseBlip)
        houseBlip = nil
    end
    houseBlip = AddBlipForCoord(coords["x"], coords["y"], coords["z"])
    SetBlipSprite(houseBlip,Config.Blip['sprite'])
    SetBlipAlpha(houseBlip, 255)
    SetBlipScale(houseBlip,Config.Blip['scale'])
    SetBlipHighDetail(houseBlip, true)
    SetBlipColour(houseBlip, Config.Blip['color'])
    SetBlipAsShortRange(houseBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Lang['blip_text'])
    EndTextCommandSetBlipName(houseBlip)
    Wait(Config.Cooldown * 60 * 1000)
    if houseBlip and DoesBlipExist(houseBlip) then
        RemoveBlip(houseBlip)
        houseBlip = nil
    end
end

function deleteBlip()
    if houseBlip and DoesBlipExist(houseBlip) then
        RemoveBlip(houseBlip)
        houseBlip = nil
    end
end