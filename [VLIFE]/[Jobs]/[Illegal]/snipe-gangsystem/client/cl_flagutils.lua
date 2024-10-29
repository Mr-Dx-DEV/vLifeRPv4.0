RegisterNetEvent("snipe-gangsystem:client:destroy", function(data)
    for k, v in pairs(FlagTable) do
        if v.obj == data.entity then
            
            local p = promise.new()
            QBCore.Functions.TriggerCallback('snipe-gangsystem:server:checkFlagsDestroyedOfGang', function(result)
                p:resolve(result)
            end, v.gang)

            local flagsDestroyedOfGang = Citizen.Await(p)

            local p = promise.new()
            QBCore.Functions.TriggerCallback('snipe-gangsystem:server:checkFlagsDestroyedByGang', function(result)
                p:resolve(result)
            end, PlayerGang.name)

            local flagsDestroyedByGang = Citizen.Await(p)

            if flagsDestroyedOfGang >= Config.NumberOfFlagsCanBeDestroyed then
                ShowNotification(Config.Locale["cannot_destroy_now"], "error")
                return
            end

            if flagsDestroyedByGang >= Config.NumberOfFlagsGangCanDestroy then
                ShowNotification(Config.Locale["limit_reached_to_destroy"], "error")
                return
            end
            local hasItem = false
            local p = promise.new()
            QBCore.Functions.TriggerCallback('snipe-gangsystem:server:checkItem', function(result)
                p:resolve(result)
            end, Config.RemovalItem.item)
            hasItem = Citizen.Await(p)
            if hasItem then
                local p = promise.new()
                QBCore.Functions.TriggerCallback('snipe-gangsystem:server:checkAvailableGangMembers', function(result)
                    p:resolve(result)
                end, v.gang)

                local result = Citizen.Await(p)

                if result >= Config.RequiredGangMembers then
                    TriggerServerEvent("snipe-gangsystem:server:notifyGangDestroy", v.gang, GetEntityCoords(data.entity))
                    local index = k
                    loadAnimDict("amb@medic@standing@kneel@base")        
                    TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base", "base", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
                    QBCore.Functions.Progressbar("pick-table", Config.Locale["destroy"],  Config.RobTime, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                    }, {
                        animDict =  "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        anim = "machinic_loop_mechandplayer",
                        flags = 49,
                    }, {}, {}, function() -- Done
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent("snipe-gangsystem:server:destroy", index, v.coords, v.gang, PlayerGang.name)
                    end, function()
                        ClearPedTasks(PlayerPedId())  
                        ShowNotification(Config.Locale["cancel"], "error")
                    end, Config.ProgressBarIcons["destroying"])
                else
                    ShowNotification(Config.Locale["not_enough_gang_members"], "error")
                end
            else
                ShowNotification(Config.Locale["no_item_to_remove"], "error")
            end
        end
    end
end)

RegisterNetEvent("snipe-gangsystem:client:pickup", function(data)
    for k, v in pairs(FlagTable) do
        if v.obj == data.entity then
            local index = k
            loadAnimDict("amb@medic@standing@kneel@base")        
            TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base", "base", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
            QBCore.Functions.Progressbar("pick-table", Config.Locale["pick_up"],  Config.PickUpTime, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
            }, {
                animDict =  "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                flags = 49,
            }, {}, {}, function() -- Done
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent("snipe-gangsystem:server:pickup", index, v.coords, v.gang)
            end, function()
                ClearPedTasks(PlayerPedId())  
                ShowNotification(Config.Locale["cancel"], "error")
            end, Config.ProgressBarIcons["picking"])
        end
    end
end)


RegisterNetEvent("snipe-gangsystem:client:deleteFlag", function(index)
	if FlagTable[index] then
		DeleteEntity(FlagTable[index].obj)
        if currentBlipState then
            if FlagTable[index].blip then
                RemoveBlip(FlagTable[index].blip)
            end
        end
        table.remove(FlagTable, index)
        currentGang = nil
    end
end)