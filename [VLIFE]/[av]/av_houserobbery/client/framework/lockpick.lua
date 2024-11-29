function lockpickDoor()
    local success = false
    local ped = PlayerPedId()
    lib.requestAnimDict("mini@repair")
    TaskPlayAnim(ped, "mini@repair", 'fixing_a_player', 2.0, 2.0, -1, 16, 0, true, true, true)
    exports['ps-ui']:Circle(function(res)
        success = res
    end, 3, 20) -- NumberOfCircles, MS
    ClearPedTasks(ped)
    return success
end