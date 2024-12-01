houseAlarm = false
beeps = 0
calledCops = false

function AlarmHack()
    local hacked = false
    local solved = false
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_STAND_MOBILE', 0, true)
    Wait(2500)
    exports['ps-ui']:Scrambler(function(success)
        hacked = success
        solved = true
    end, "greek", Config.AlarmTime, 0) -- Type (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only )
    while not solved do Wait(30) end
    ClearPedTasks(ped)
    return hacked
end

function AlarmLoop()
    while houseAlarm do
        if houseAlarm then
            TriggerEvent('InteractSound_CL:PlayOnOne','Alarm1',0.3)
            beeps += 1
            if beeps >= Config.AlarmTime and not calledCops then
                calledCops = true
                callCops()
            end
        end
        Wait(1000)
    end
end

RegisterNetEvent("av_houserobbery:alarmOff", function(identifier)
    if currentIdentifier == identifier then
        houseAlarm = false
        beeps = 0
    end
end)