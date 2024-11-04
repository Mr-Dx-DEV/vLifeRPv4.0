local DisplayMessage = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

Citizen.CreateThread(function()
    while true do
        local isViewing = false
        local near = 1000
        local cl = Config.Citizen.Locations
        for i=1, #cl do
            local ply = PlayerPedId()
            if #(vector3(table.unpack(cl[i])) - GetEntityCoords(ply)) < 2 then
                near = 1
                if not isViewning then
                    DisplayMessage(Config.Citizen.Text)
                    local x,y,z = table.unpack(cl[i])
                    DrawMarker(2, x,y,z, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.3, 0.5, 0.2, 200, 0, 0, 222, false, false, false, true, false, false, false)
                end
                if IsControlJustReleased(0, Config.Citizen.Key) then
                    CitizenOpen()
                    isViewning = true
                end
            end
        end
        Wait(near)
    end
end)