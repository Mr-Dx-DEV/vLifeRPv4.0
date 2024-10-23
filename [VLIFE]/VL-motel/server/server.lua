lib.locale()

lib.callback.register('lazy-motel:server:getConfig', function(source)
    return Config.Motel
end)

lib.callback.register('lazy-motel:server:iskeyholders', function(source, motel, room)
    return IsKeyHolders(source, motel, room)
end)

lib.callback.register('lazy-motel:client:getConfig', function(source)
    return Config.Motel
end)

local NearbyPlayers = {}

lib.callback.register('lazy-motel:server:getNearbyPlayers', function(source, motel, room)
    local data = {}
    for playersource, _ in pairs(NearbyPlayers[motel][room]) do
        data[#data + 1] = {
            id = playersource,
            name = Functions.GetName(source)
        }
    end
    return data or {}
end)

lib.callback.register('lazy-motel:server:requestinvite', function(_, motel, room, target)
    local res = lib.callback.await('lazy-motel:client:sendInvite', target, motel, room)
    return res
end)

RegisterNetEvent('lazy-motel:server:playernearby', function(motel, room)
    local src = source
    if not NearbyPlayers[motel] or not NearbyPlayers[motel][room] then
        NearbyPlayers[motel] = {
            [room] = {
                [src] = true
            }
        }
    else
        NearbyPlayers[motel][room] = {
            [src] = true
        }
    end
end)

RegisterNetEvent('lazy-motel:server:removenearby', function(motel, room)
    local src = source
    if not NearbyPlayers[motel] or not NearbyPlayers[motel][room] then return end
    NearbyPlayers[motel][room][src] = nil
end)

RegisterNetEvent('lazy-motel:server:toggleDoorState', function(motel, room)
    local src = source
    ToggleDoorState(src, motel, room)
end)

RegisterNetEvent('lazy-motel:server:toggleStash', function(motel, room)
    local src = source
    if not motel or not room then return end
    if Config.Stash.owneronly then
        local identifier = Functions.GetIdentifier(src)
        if identifier ~= Config.Motel[motel].motel[room]?.owner then
            return TriggerClientEvent("lazy-motel:notify", src, "You can't do that")
        end
    end
    local locked = Config.Motel[motel].motel[room].stash.locked
    Config.Motel[motel].motel[room].stash.locked = not locked
    if locked then
        TriggerClientEvent('lazy-motel:notify', src, "The stash is unlocked")
    else
        TriggerClientEvent('lazy-motel:notify', src, "Locked the stash")
    end
    TriggerClientEvent('lazy-motel:client:setRoomConfig', -1, motel, room, Config.Motel[motel].motel[room])
end)

RegisterNetEvent('lazy-motel:server:setInsideMeta', function(motel, room, status)
    local src = source
    Functions.SaveMetadata(src, motel, room, status)
    if status then
        AddPlayerToRoom(room, src)
    else
        RemovePlayerFromRoom(room, src)
    end
end)

RegisterNetEvent('lazy-motel:server:inviteeveryone', function(motel, room)
    TriggerClientEvent('lazy-motel:client:inviteeveryone', -1, motel, room)
end)

RegisterNetEvent('lazy-motel:server:raidmotel', function(data)
    if not data?.motel or not data?.room then return end
end)

RegisterNetEvent('lazy-motel:server:logout', function()
    local src = source
    Functions.Logout(src)
end)

CreateThread(function()
    Wait(500)
    Functions.RegisterUseable("motel_key", function(source, motel, room, serialkey)
        TriggerClientEvent("lazy-motel:client:useItem", source, {
            motel = motel,
            room = room,
            serial = serialkey,
        })
    end)
end)
