carryObject = nil
crackedSafe = false
local carryCoords = {
    ["prop_tv_03"] = { bone = 18905, x = 0.1, y = 0.3, z = 0.2, rotX = 240.0, rotY = 120.0, rotZ = 0.0 },
    ["prop_tv_04"] = { bone = 18905, x = 0.1, y = 0.1, z = 0.3, rotX = 240.0, rotY = 120.0, rotZ = 0.0 },
    ["ex_prop_ex_tv_flat_01"] = { bone = 18905, x = 0.1, y = 0.1, z = 0.3, rotX = 240.0, rotY = 120.0, rotZ = 0.0 },
    ["hei_heist_kit_coffeemachine_01"] = { bone = 18905, x = 0.03, y = -0.08, z = 0.2, rotX = 240.0, rotY = 200.0, rotZ = 0.0 },
}

function ObjectsFunction(data)
    if carryObject then return end
    if data['type'] == "alarm" then
        if houseAlarm then
            local hacked = AlarmHack()
            if hacked then
                TriggerEvent('InteractSound_CL:PlayOnOne', 'Alarm3', 0.3)
                TriggerServerEvent('av_houserobbery:disableAlarm', currentIdentifier)
            else
                TriggerEvent('InteractSound_CL:PlayOnOne', 'Alarm2', 0.5)
            end
        end
        return
    end
    if houseAlarm then return end
    if data['type'] == "safe" then
        if crackedSafe then return end
        local safe = createSafe({ math.random(0, 99), math.random(0, 99), math.random(0, 99), math.random(0, 99) })
        Wait(500)
        if safe then
            crackedSafe = true
            TriggerServerEvent('av_houserobbery:addItem', currentIdentifier, data)
        else
            callCops()
        end
        return
    end
    if not carryCoords[data['prop']] then
        data['netId'] = NetworkGetNetworkIdFromEntity(data['object'])
        TakeObjectAnim()
        DeleteEntity(data['object'])
        TriggerServerEvent('av_houserobbery:addItem', currentIdentifier, data)
    else
        CreateThread(function()
            CarryFunction(currentIdentifier, data)
        end)
    end
end

function CarryFunction(houseId, data)
    if not data or carryObject then return end
    if Config.Debug then print("carryfunction()") end
    lib.requestAnimDict('anim@heists@box_carry@')
    carryObject = data['object']
    local player = PlayerPedId()
    local coords = carryCoords[data['prop']]
    local closeToVehicle = false
    local w = 500
    if carryObject and DoesEntityExist(carryObject) then
        if Config.Debug then print("DoesEntityExist(carryObject)") end
        TaskPlayAnim(player, "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
        AttachEntityToEntity(carryObject, player, GetPedBoneIndex(player, 18905), coords.x, coords.y, coords.z,
            coords.rotX, coords.rotY, coords.rotZ, true, true, false, false, 1, true)
        while carryObject do
            w = 500
            if not IsEntityPlayingAnim(player, 'anim@heists@box_carry@', 'idle', 3) then
                TaskPlayAnim(player, "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
            end
            local playerCoords = GetEntityCoords(player)
            local veh = lib.getClosestVehicle(playerCoords, 2.0, false)
            if veh then
                w = 1
                if not closeToVehicle then
                    closeToVehicle = true
                    lib.showTextUI('[E] - ' .. Lang['save_in_vehicle'])
                end
            else
                if closeToVehicle then
                    closeToVehicle = false
                    lib.hideTextUI()
                end
            end
            if IsControlJustPressed(0, 38) and veh then
                local vehClass = GetVehicleClass(veh)
                if Config.VehClass[tostring(vehClass)] then
                    if Config.Debug then print("carryObject IsControlJustPressed > av_houserobbery:addItem") end
                    DeleteEntity(carryObject)
                    TriggerServerEvent('av_houserobbery:addItem', houseId, data)
                    carryObject = nil
                    lib.hideTextUI()
                else
                    TriggerEvent('av_houserobbery:notification', 'error', Lang['wrong_vehicle_class'])
                end
            end
            if GetVehiclePedIsIn(player, false) ~= 0 then
                if DoesEntityExist(carryObject) then
                    DeleteEntity(carryObject)
                    carryObject = nil
                end
            end
            Wait(w)
        end
        ClearPedTasks(player)
    end
end

function TakeObjectAnim()
    local playerPed = PlayerPedId()
    lib.requestAnimDict('anim@heists@ornate_bank@ig_4_grab_gold')
    local fwd, _, _, pos = GetEntityMatrix(playerPed)
    local newPos = (fwd * 0.8) + pos
    SetEntityCoords(playerPed, newPos.xy, newPos.z - 1.5)
    local rot, pos = GetEntityRotation(playerPed), GetEntityCoords(playerPed)
    SetPedComponentVariation(playerPed, 5, -1, 0, 0)
    local bag = CreateObject(`hei_p_m_bag_var22_arm_s`, pos.x, pos.y, pos.z, true, true, false)
    local entry = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, 2, false, false, 1065353216, 0,
        1.3)
    local exit = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, 2, false, false, 1065353216, 0,
        1.3)
    SetEntityCollision(bag, 0, 1)
    NetworkAddPedToSynchronisedScene(playerPed, entry, "anim@heists@ornate_bank@ig_4_grab_gold", "enter", 1.5, -4.0, 1,
        16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, entry, "anim@heists@ornate_bank@ig_4_grab_gold", "enter_bag", 4.0, -8.0, 1)
    NetworkAddPedToSynchronisedScene(playerPed, exit, "anim@heists@ornate_bank@ig_4_grab_gold", "exit", 1.5, -4.0, 1, 16,
        1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, exit, "anim@heists@ornate_bank@ig_4_grab_gold", "exit_bag", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(entry)
    Citizen.Wait(1500)
    NetworkStartSynchronisedScene(exit)
    Citizen.Wait(1500)
    DeleteEntity(bag)
    SetPedComponentVariation(playerPed, 5, 45, 0, 0)
    NetworkStopSynchronisedScene(entry)
    NetworkStopSynchronisedScene(exit)
    FreezeEntityPosition(playerPed, false)
end
