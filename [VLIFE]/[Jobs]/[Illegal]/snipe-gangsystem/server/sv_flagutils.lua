local gangFlagDestroyed = {}
local gangRobbingFlags = {}

RegisterServerEvent("snipe-gangsystem:server:notifyGangDestroy", function(gang, coords)
    for k, v in pairs(GangCountTable[gang]) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player then
            TriggerClientEvent("snipe-gangsystem:client:notifyGangDestroy", Player.PlayerData.source, coords)
        end
    end
end)

QBCore.Functions.CreateCallback("snipe-gangsystem:server:checkFlagsDestroyedOfGang", function(source, cb, gang)
    if gangFlagDestroyed[gang] then
        cb(gangFlagDestroyed[gang])
    else
        cb(0)
    end
end)

QBCore.Functions.CreateCallback("snipe-gangsystem:server:checkFlagsDestroyedByGang", function(source, cb, gang)
    if gangRobbingFlags[gang] then
        cb(gangRobbingFlags[gang])
    else
        cb(0)
    end
end)

function GetGangMembersCount(gang)
    return #GangCountTable[gang]
end

RegisterServerEvent("snipe-gangsystem:server:pickup", function(id, coords, gang)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local canRemove = false
    Wait(math.random(1, 3000))
    if Player.Functions.AddItem(Config.GangFlags[gang].Item, 1) then
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.GangFlags[gang].Item], "add")
        if flagTable[id] then
            if flagTable[id].coords == coords then
                table.remove(flagTable, id)
                StoreCollectibleTables()
                canRemove = true
                TriggerClientEvent('snipe-gangsystem:client:deleteFlag', -1, id)
            else
                for k,v in ipairs(flagTable) do
                    if v.coords == coords then
                        table.remove(flagTable,k)
                        StoreCollectibleTables()
                        canRemove = true
                        TriggerClientEvent('snipe-gangsystem:client:deleteFlag', -1, k)
                    end
                end
            end
        end

        if not canRemove then
            Player.Functions.RemoveItem(Config.GangFlags[gang].Item, 1)
            ShowNotification(source, "Flag is not even present", "error")
        end
    else
        ShowNotification(source, Config.Locale["inventory_full"], "error")
    end
end)

RegisterServerEvent("snipe-gangsystem:server:destroy", function(id, coords, gangGettingRobbed, gangRobbing)
    if gangFlagDestroyed[gangGettingRobbed] == nil then
        gangFlagDestroyed[gangGettingRobbed] = 1
    else
        gangFlagDestroyed[gangGettingRobbed] = gangFlagDestroyed[gangGettingRobbed] + 1
    end

    if gangRobbingFlags[gangRobbing] == nil then
        gangRobbingFlags[gangRobbing] = 1
    else
        gangRobbingFlags[gangRobbing] = gangRobbingFlags[gangRobbing] + 1
    end

    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if flagTable[id] then
        if flagTable[id].coords == coords then
            if Player.Functions.RemoveItem(Config.RemovalItem.item, 1) then
                table.remove(flagTable, id)
                StoreCollectibleTables()
                TriggerClientEvent('snipe-gangsystem:client:deleteFlag', -1, id)
            else
                ShowNotification(source, Config.Locale["do_not_have_shovel"], "error")
            end
        else
            for k,v in ipairs(flagTable) do
                if v.coords == coords then
                    if Player.Functions.RemoveItem(Config.RemovalItem.item, 1) then
                        table.remove(flagTable,k)
                        StoreCollectibleTables()
                        TriggerClientEvent('snipe-gangsystem:client:deleteFlag', -1, k)
                        return
                    else
                        ShowNotification(source, Config.Locale["do_not_have_shovel"], "error")
                    end
                end
            end
        end
    end
end)

RegisterServerEvent("snipe-gangsystem:server:syncRob", function(set)
    TriggerClientEvent("snipe-gangsystem:client:syncRob", -1, set)
end)

RegisterServerEvent("snipe-gangsystem:server:syncSell", function(set)
    TriggerClientEvent("snipe-gangsystem:client:syncSell", -1, set)
end)