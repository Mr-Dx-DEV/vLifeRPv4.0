NearestMotel = nil
NearestDoor = nil

CreateThread(function()
    SetupEnterZone()
    if IsPlayerLoaded then
        Functions.OnPlayerLoaded()
    end
end)

CreateThread(function()
    while true do
        if IsPlayerLoaded then
            for k, v in pairs(Config.Motel) do
                local pos = GetEntityCoords(PlayerPedId())
                if v.type == 'mlo' then
                    for k2, v2 in pairs(v.motel) do
                        local dist = #(pos - v2.enter.xyz)
                        if dist <= 20.0 then
                            SetupMLOZone(k, k2)
                        elseif dist >= 20.0 then
                            RemoveMLOZone(k, k2)
                        end
                    end
                end
                local dist = #(pos - v.rent.coords.xyz)
                if dist <= 20.0 and not SpawnedPed[k] then
                    SpawnPed(k)
                elseif dist >= 20.0 and SpawnedPed[k] then
                    RemovePed(k)
                end
            end
        end
        Wait(1000)
    end
end)
