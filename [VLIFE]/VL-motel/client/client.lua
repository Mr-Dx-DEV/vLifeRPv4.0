lib.locale()


RegisterNetEvent('lazy-motel:client:setConfig', function(config)
    if not config then return end
    Config.Motel = config
    if NearestMotel then
        return UpdateUIData(NearestMotel)
    end
end)

RegisterNetEvent('lazy-motel:client:setRoomConfig', function(motel, room, config)
    if not motel or not room or not config then return end
    if not Config.Motel[motel] or not Config.Motel[motel].motel[room] then return end
    Config.Motel[motel].motel[room] = config
    UpdateUIData(motel)
end)

RegisterNetEvent('lazy-motel:client:updateUser', function(motel, room)
    if not Display then return end
    if not motel or not room then return end
    if Display and NearestMotel ~= motel then return end
    SendNUIMessage({
        action = 'update-data',
        data = {
            type = 'user-motel',
            user = {
                roomname = room
            }
        }
    })
end)

RegisterNetEvent('lazy-motel:client:getConfig', function()
    Config.Motel = lib.callback.await('lazy-motel:server:getConfig', false)
end)

RegisterNetEvent('lazy-motel:client:kick', function()
    if IsInside and NearestMotel and NearestDoor then
        LeaveMotel(NearestMotel, NearestDoor)
        Notification("This room is expire..., you've been kicked from the motel", 'error')
    end
end)

RegisterNetEvent('lazy-motel:notify', function(text, type)
    Notification(text, type)
end)

RegisterNetEvent('lazy-motel:client:useItem', function(data)
    if not data then return end
    local config = Config.Motel[data.motel]?.motel[data.room]
    local pos = GetEntityCoords(cache.ped)

    if config.serial ~= data.serial then return end
    if IsInside then
        if InExitZone and data.room == NearestDoor then
            TriggerServerEvent('lazy-motel:server:toggleDoorState', data.motel, data.room)
        end
    else
        local doorpos = config.enter.xyz
        local dist = #(doorpos - pos)
        if dist <= 1.5 then
            if not GetResourceState("qb-doorlock"):match("start") or Config.Motel[data.motel]?.type == "shell" then
                Anim()
            end
            TriggerServerEvent('lazy-motel:server:toggleDoorState', data.motel, data.room)
        end
    end
end)

RegisterNetEvent('lazy-motel:client:spawnLastLocation', function(motel, room)
    EnterMotel(motel, room, false)
end)

RegisterNetEvent('lazy-motel:client:startMotel', function(motel)
    if not motel then return end
    local roomfree = nil
    for k, v in pairs(Config.Motel[motel].motel) do
        if not v.owned then
            roomfree = k
            break
        end
    end
    if roomfree then
        local res = RentMotel(motel, roomfree)
        if not res then
            return Notification("Something went wrong...", 'error')
        end
        if res.type ~= 'error' then
            EnterMotel(motel, roomfree, true)
        end
        return Notification(res.text, res.type)
    else
        Notification("There is no room free!, please contact the developer", "error")
    end
end)

RegisterNetEvent('lazy-motel:client:logout', function()
    TriggerServerEvent('lazy-motel:server:logout')
end)

RegisterNetEvent('lazy-motel:client:knocknotify', function()
    Notification("Someone knocking the door")
end)
