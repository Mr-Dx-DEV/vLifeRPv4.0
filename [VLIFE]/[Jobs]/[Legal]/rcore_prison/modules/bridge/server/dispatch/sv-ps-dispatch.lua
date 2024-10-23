CreateThread(function()
    if (isBridgeLoaded('Dispatch', DispatchList.PS)) then
        Dispatch.Breakout = function(playerId)
            local text = _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE')
            local coords = vec3(SH.data.prisonYard.x, SH.data.prisonYard.y, SH.data.prisonYard.z)
            local data = {
                message = text,
                codeName = 'NONE',
                code = '10-64',
                icon = 'fas fa-question',
                priority = 1,
                coords = coords,
                jobList = Config.Escape.NotifyJobs,
                jobs = Config.Escape.NotifyJobs,
                alert = {
                    recipientList = Config.Escape.NotifyJobs,
                    sprite = 488, 
                    colour = 1, 
                    scale = 1.5,
                    text = _U('DISPATCH.BREAKOUT_BLIP_TEXT'),
                    radius = 0,
                    length = 2,
                    sound = "Lose_1st",
                    sound2 = "GTAO_FM_Events_Soundset",
                    offset = false,
                    flash = true, 
                }
            }

            if isResourceLoaded(THIRD_PARTY_RESOURCE.QF_MDT) then
                TriggerEvent('ps-dispatch:server:notify', data)
            end
            
            dbg.info('Dispatch.Breakout: Prison break started!')

            local success, result = pcall(function()
                exports[DispatchList.PS]:CreateDispatchCall(data)
            end)

            if not success then
                dbg.info('Dispatch.Breakout: Imported function not found, loading fallback solution.')
                TriggerClientEvent('rcore_prison:client:setDispatch', playerId, data)
            end
        end
    end
end)
