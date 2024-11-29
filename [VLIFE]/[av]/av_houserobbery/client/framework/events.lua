busy = false

RegisterNetEvent('av_houserobbery:interact', function(data)
    if Config.Debug then
        print("av_houserobbery:interact triggered")
    end
    if not data['interactionType']['type'] == "exit" and busy then
        if Config.Debug then
            print("Zone is not exit and we are busy, exit event...")
        end
        return 
    end
    busy = true
    local extraData = data['extraData']
    local type = data['interactionType']
    if Config.Debug then
        print("Type: "..type)
    end
    if type == "lockpick" then
        local res = false
        if Config.LockpickItem then
            local item = hasItem(Config.LockpickItem)
            if item then
                res = lockpickDoor()
            else
                TriggerEvent('av_houserobbery:notification','error',Lang['no_lockpick'])
            end
        else
            res = lockpickDoor()
        end
        if res then
            TriggerServerEvent('av_houserobbery:openDoor',extraData)
            EnterShell(extraData,true)
        end
    end
    if type == "enter" then
        EnterShell(extraData,false)
    end
    if type == "object" then
        ObjectsFunction(extraData)
    end
    if type == "zone" then
        ZonesFunction(extraData)
    end
    Wait(500)
    busy = false
end)

RegisterNetEvent('av_houserobbery:knock', function()
    if busy then return end
    busy = true
    local ped = PlayerPedId()
    lib.requestAnimDict("timetable@jimmy@doorknock@", 5000)
    FreezeEntityPosition(ped,true)
    TaskPlayAnim(ped, "timetable@jimmy@doorknock@", 'knockdoor_idle', 2.0, 2.0, 3000, 1, 0, true, true, true)
    FreezeEntityPosition(ped,false)
    Wait(2000)
    if IsCop() then
        TriggerEvent('av_houserobbery:notification', "error", Lang['isCop'])
        busy = false
        return
    end
    local options = {
        {
            title = Lang['getJob'],
            icon = 'fa-solid fa-user-ninja',
            event = 'av_houserobbery:getMission',
        }
    }
    if Config.Inventory == "ox_inventory" and Config.SellItems then
       options[#options+1] = {
            title = Lang['leave_items'],
            icon = 'fa-solid fa-box',
            event = 'av_houserobbery:openInventory',
       }
       options[#options+1] = {
            title = Lang['sell_items'],
            icon = 'fa-solid fa-clipboard-check',
            event = 'av_houserobbery:sellInventory',
       }
    end
    lib.registerContext({
        id = 'house_robbery',
        title = Lang['house_title_menu'],
        options = options
    })
    lib.showContext('house_robbery')
    Wait(1000)
    busy = false
end)

RegisterNetEvent('av_houserobbery:openInventory', function()
    if lib.progressBar({
        duration = math.random(5000,10000), -- prevent any type of dupe glitches
        label = Lang['opening'],
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true
        }
    }) then
        if Config.Inventory == "ox_inventory" then
            exports.ox_inventory:openInventory('stash', 'house_robbery')
        end
    end
end)

RegisterNetEvent('av_houserobbery:sellInventory', function()
    if busy then return end
    busy = true
    if lib.progressBar({
        duration = math.random(5000,10000), -- prevent any type of dupe glitches
        label = Lang['selling'],
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true
        }
    }) then 
        TriggerServerEvent('av_houserobbery:sellItems')
        busy = false
    else
        busy = false
    end
    busy = false
end)