if Config.inventory == 'ox_inventory' then
    lib.callback.register('mt-restaurants:server:registerStash', function(source, id, label, slots, weight)
        return exports.ox_inventory:RegisterStash(id, label, slots, weight)
    end)

    lib.callback.register('mt-restaurants:server:registerCraft', function(source, id, items, label)
        return exports.ox_inventory:RegisterCraftStation(id, { items = items, label = label })
    end)

    lib.callback.register('mt-restaurants:server:registerShop', function(source, id, label, items)
        return exports.ox_inventory:RegisterShop(id, { name = label, inventory = items })
    end)
end

if Config.inventory ~= 'ox_inventory' and Config.framework == 'qb' then
    lib.callback.register('mt-restaurants:server:GetItemCount', function(source, item)
        local src = source
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        if Player.Functions.GetItemByName(item) then
            return Player.Functions.GetItemByName(item).amount
        end
        return 0
    end)

    lib.callback.register('mt-restaurants:server:openShop', function(source, items, id, label)
        local src = source
        exports[Config.inventory]:CreateShop({ name = id, label = label, slots = #items, items = items })
        Wait(200)
        exports[Config.inventory]:OpenShop(src, id)
        return true
    end)

    lib.callback.register('mt-restaurants:server:openStash', function(source, id, data)
        local src = source
        exports[Config.inventory]:OpenInventory(src, id, data)
        return true
    end)
end

lib.callback.register('mt-restaurants:server:addNeeds', function(source, thirst, hunger)
    return addNeeds(thirst, hunger)
end)

lib.callback.register('mt-restaurants:server:removeFoodItem', function(source, metadata, slot)
    local src = source
    if Config.inventory == 'ox_inventory' then
        exports.ox_inventory:RemoveItem(src, 'restaurant_food', 1, metadata, slot)
    else
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        Player.Functions.RemoveItem('restaurant_food', 1, slot)
    end
    return true
end)

if Config.inventory == 'ox_inventory' then
    lib.callback.register('mt-restaurants:server:getInventoryItems', function(source, invId)
        return exports.ox_inventory:GetInventoryItems(invId)
    end)
end

lib.callback.register('mt-restaurants:server:addRestaurantBox', function(source, job)
    local src = source
    local info = { id = 'restaurants_food_box_'..job..'_'..math.random(1, 999999) }
    if Config.inventory == 'ox_inventory' then
        exports.ox_inventory:AddItem(src, 'restaurant_box', 1, info)
    else
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        Player.Functions.AddItem('restaurant_box', 1, nil, info)
        TriggerClientEvent('inventory:client:ItemBox', src, Config.core.Shared.Items['restaurant_box'], "add", 1)
    end
    return true
end)

lib.callback.register('mt-restaurants:server:addRestaurantMenu', function(source, job)
    local src = source
    local menus = MySQL.query.await('SELECT * FROM `restaurants_menus` WHERE job = ?', { job })
    if not menus[1]?.image_url then return end
    local info = { job = job, imageurl = menus[1].image_url, images = menus[1].image_url, image_url = menus[1].image_url, label = Config.restaurants[job].menus[1].label }
    if Config.inventory == 'ox_inventory' then
        exports.ox_inventory:AddItem(src, 'restaurant_menu', 1, info)
    else
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        Player.Functions.AddItem('restaurant_menu', 1, nil, info)
        TriggerClientEvent('inventory:client:ItemBox', src, Config.core.Shared.Items['restaurant_menu'], "add", 1)
    end
    return true
end)

if Config.framework == 'esx' then
    lib.callback.register('mt-restaurants:server:getPlayerJobESX', function(source)
        local src = source
        local Player = Config.core.GetPlayerFromId(src)
        if not Player then return end
        return Player.getJob().name
    end)

    lib.callback.register('mt-restaurants:server:getPlayerJobIsBossESX', function(source)
        local src = source
        local Player = Config.core.GetPlayerFromId(src)
        if not Player then return end
        return (Player.getJob().grade_name == 'boss')
    end)
end

lib.callback.register('mt-restaurants:server:canCraftItem', function(source, nItems)
    local src = source
    local items = 0
    local neededItems = {}

    for k, v in pairs(nItems) do
        neededItems[#neededItems+1] = { item = tostring(k), count = tonumber(v) }
    end

    if Config.inventory == 'ox_inventory' then
        for k, v in pairs(neededItems) do
            if exports.ox_inventory:GetItemCount(src, v.item) >= v.count then items += 1 else break end
        end
    else
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        for k, v in pairs(neededItems) do
            if Player.Functions.GetItemByName(v.item) and Player.Functions.GetItemByName(v.item).amount >= v.count then items += 1 else break end
        end
    end

    if items == #neededItems then return true end
    return false
end)

lib.callback.register('mt-restaurants:server:craftItem', function(source, item, count, neededItems, metadata)
    local src = source
    if Config.inventory == 'ox_inventory' then
        for k, v in pairs(neededItems) do
            exports.ox_inventory:RemoveItem(src, tostring(k), tonumber(v))
        end
        exports.ox_inventory:AddItem(src, item, count, metadata or {})
    else
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        for k, v in pairs(neededItems) do
            Player.Functions.RemoveItem(tostring(k), tonumber(v))
        end
        Player.Functions.AddItem(item, count, nil, metadata or {})
    end
    createLog(Config.logs.craftItem, locale('logs_item_crafted'), locale('logs_item_crafted_desc', GetPlayerName(src), src, item, count))
    return true
end)