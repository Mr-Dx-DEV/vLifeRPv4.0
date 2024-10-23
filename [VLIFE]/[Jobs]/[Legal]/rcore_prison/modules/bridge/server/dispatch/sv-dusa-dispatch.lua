CreateThread(function()
    if (isBridgeLoaded('Dispatch', DispatchList.DUSA)) then
        Dispatch.Breakout = function(playerId)
            local text = _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE')
            local coords = vec3(SH.data.prisonYard.x,SH.data.prisonYard.y, SH.data.prisonYard.z)
            local dispatchData = {
                id = 0,
                event = 'NEW ALERT',
                title = 'Prison Break',
                description = text,
                code = '10-64',
                codeName = 'explosion',
                coords = coords,
                priority = 0,
                img = "https://rco.re/product/prison/rcore_dispatch_preview.png",
                alert = {
                    radius = 0, -- Radius around the blip
                    sprite = 488, -- Sprite of the blip
                    color = 1, -- Color of the blip
                    scale = 0.5, -- Scale of the blip
                    length = 2, -- How long it stays on the map
                    sound = "Lose_1st", -- Alert sound
                    sound2 = "GTAO_FM_Events_Soundset", -- Alert sound
                    offset = "false", -- Blip / radius offset
                    flash = "false" -- Blip flash
                },
                recipientJobs = Config.Escape.NotifyJobs,
            }
    
            TriggerClientEvent('rcore_prison:client:setDispatch', playerId, dispatchData)
            dbg.info('Dispatch.Breakout: Prison break started!')
        end
    end
end)



