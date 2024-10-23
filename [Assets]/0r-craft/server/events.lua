RegisterNetEvent("0r-craft:server:HandleCallback", function(key, payload)
    local src = source
    if Koci.Callbacks[key] then
        Koci.Callbacks[key](src, payload, function(cb)
            TriggerClientEvent("0r-craft:client:HandleCallback", src, key, cb)
        end)
    end
end)

RegisterNetEvent("0r-craft:server:ErrorHandle", function(error)
    Koci.Utils:printTable(error)
end)
