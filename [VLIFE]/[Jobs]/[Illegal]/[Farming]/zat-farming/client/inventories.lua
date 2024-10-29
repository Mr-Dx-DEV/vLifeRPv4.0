local QBCore = nil

Citizen.CreateThread(function() 
    if Config.Framework == "qb" then
        QBCore = exports[Config.FrameworkPseudo]:GetCoreObject()
    end
end)

function GetFarmingItems()
    local items = {}
    local done = false
    if Config.Inventory == 'qb' or Config.Inventory == 'ps' or Config.Inventory == 'qs'then
        TriggerServerCallback('zat-farming:server:GetPlayerItems', function(result)
            for k, v in pairs(result) do
                for i, j in pairs(Config.Items) do
                    for x, y in pairs(j) do
                        for a, b in pairs(y) do
                            if v.name == b then
                                if v.name == 'farm_water' then
                                    if v.info.water ~= nil and v.info.water > 0 then 
                                        items[#items+1] = {
                                            id      = #items+1,
                                            name    = v.name,
                                            img     = 'nui://'..Config.Img..v.image,
                                            info    = v.info,
                                            amount  = v.amount,
                                            label	= v.label,
                                            slot    = v.slot,
                                            type    = i, --seed or water etc...
                                        }
                                    end
                                else
                                    items[#items+1] = {
                                        id      = #items+1,
                                        name    = v.name,
                                        img     = 'nui://'..Config.Img..v.image,
                                        info    = v.info,
                                        amount  = v.amount,
                                        label	= v.label,
                                        slot    = v.slot,
                                        type    = i, --seed or water etc...
                                    }
                                end
                            end
                        end
                    end
                end
            end
            done = true
        end)        
    elseif Config.Inventory == 'ox' then
        TriggerServerCallback('zat-farming:server:GetPlayerItems', function(result)
            for k, v in pairs(result) do
                for i, j in pairs(Config.Items) do
                    for x, y in pairs(j) do
                        for a, b in pairs(y) do
                            if v.name == b then
                                if v.name == 'farm_water' then
                                    if v.metadata.water ~= nil and v.metadata.water > 0 then 
                                        items[#items+1] = {
                                            id      = #items+1,
                                            name    = v.name,
                                            img     = 'nui://'..Config.Img..v.name..'.png',
                                            info    = v.metadata,
                                            amount  = v.count,
                                            label	= v.label,
                                            slot    = v.slot,
                                            type    = i, --seed or water etc...
                                        }
                                    end
                                else
                                    items[#items+1] = {
                                        id      = #items+1,
                                        name    = v.name,
                                        img     = 'nui://'..Config.Img..v.name..'.png',
                                        info    = v.metadata,
                                        amount  = v.count,
                                        label	= v.label,
                                        slot    = v.slot,
                                        type    = i, --seed or water etc...
                                    }
                                end
                            end
                        end
                    end
                end
            end
            done = true
        end) 
    end
    while not done do
        Citizen.Wait(20)
    end
    
    return items
end

function GetCompostableItems()
    local items = {}
    local done = false
    if Config.Inventory == 'qb' or Config.Inventory == 'ps' or Config.Inventory == 'qs'then
        TriggerServerCallback('zat-farming:server:GetPlayerItems', function(result)
            for k, v in pairs(result) do
                for i, j in pairs(Config.Items['seeds']) do
                    if v.name == j.reward then
                        local purity = 0
                        if (v.info.purity ~= nil) then
                            purity = v.info.purity
                        end
                        local rotten = 99
                        if (v.info.rotten ~= nil) then
                            rotten = v.info.rotten
                        end
                        items[#items+1] = {
                            id        = #items+1,
                            name      = v.name,
                            img       = 'nui://'..Config.Img..v.image,
                            purity    = purity,
                            rotten    = rotten,
                            info      = v.info,
                            amount    = v.amount,
                            label	  = v.label,
                            slot      = v.slot,
                            composted = false,
                            type      = 'seeds', --seed or water etc...
                        }
                    end
                end
            end
            done = true
        end)        
    elseif Config.Inventory == 'ox' then
        TriggerServerCallback('zat-farming:server:GetPlayerItems', function(result)
            for k, v in pairs(result) do
                for i, j in pairs(Config.Items['seeds']) do
                    if v.name == j.reward then
                        local purity = 0
                        if (v.metadata.purity ~= nil) then
                            purity = v.metadata.purity
                        end
                        local rotten = 99
                        if (v.metadata.rotten ~= nil) then
                            rotten = v.metadata.rotten
                        end
                        items[#items+1] = {
                            id        = #items+1,
                            name      = v.name,
                            img     = 'nui://'..Config.Img..v.name..'.png',
                            purity    = purity,
                            rotten    = rotten,
                            info      = v.metadata,
                            amount    = v.count,
                            label	  = v.label,
                            slot      = v.slot,
                            composted = false,
                            type      = 'seeds', --seed or water etc...
                        }
                    end
                end
            end
            done = true
        end)    
    end
    while not done do
        Citizen.Wait(20)
    end
    return items
end

function GetMillableItems()
    local items = {}
    local done = false
    if Config.Inventory == 'qb' or Config.Inventory == 'ps' or Config.Inventory == 'qs'then
        TriggerServerCallback('zat-farming:server:GetPlayerItems', function(result)
            for k, v in pairs(result) do
                for i, j in pairs(Config.Items['seeds']) do
                    if v.name == j.compost then
                        local purity = 0
                        if (v.info.purity ~= nil) then
                            purity = v.info.purity
                        end
                        items[#items+1] = {
                            id        = #items+1,
                            name      = v.name,
                            img       = 'nui://'..Config.Img..v.image,
                            purity    = purity,
                            info      = v.info,
                            amount    = v.amount,
                            label	  = v.label,
                            slot      = v.slot,
                            composted = false,
                            type      = 'seeds', --seed or water etc...
                        }
                    end
                end
            end
            done = true
        end)        
    elseif Config.Inventory == 'ox' then
        TriggerServerCallback('zat-farming:server:GetPlayerItems', function(result)
            for k, v in pairs(result) do
                for i, j in pairs(Config.Items['seeds']) do
                    if v.name == j.compost then
                        local purity = 0
                        if (v.metadata.purity ~= nil) then
                            purity = v.metadata.purity
                        end
                        items[#items+1] = {
                            id        = #items+1,
                            name      = v.name,
                            img     = 'nui://'..Config.Img..v.name..'.png',
                            purity    = purity,
                            info      = v.metadata,
                            amount    = v.count,
                            label	  = v.label,
                            slot      = v.slot,
                            composted = false,
                            type      = 'seeds', --seed or water etc...
                        }
                    end
                end
            end
            done = true
        end)  
    end
    while not done do
        Citizen.Wait(20)
    end
    return items
end

function GetMoonshinableItems()
    local items = {}
    local done = false
    if Config.Inventory == 'qb' or Config.Inventory == 'ps' or Config.Inventory == 'qs'then
        TriggerServerCallback('zat-farming:server:GetPlayerItems', function(result)
            for k, v in pairs(result) do
                for i, j in pairs(Config.Moonshine[1].items) do
                    if v.name == i then
                        local purity = 0
                        if (v.info.purity ~= nil) then
                            purity = v.info.purity
                        end
                        items[#items+1] = {
                            id        = #items+1,
                            name      = v.name,
                            img       = 'nui://'..Config.Img..v.image,
                            purity    = purity,
                            info      = v.info,
                            amount    = v.amount,
                            label	  = v.label,
                            slot      = v.slot,
                        }
                    end
                end
            end
            done = true
        end)        
    elseif Config.Inventory == 'ox' then
        TriggerServerCallback('zat-farming:server:GetPlayerItems', function(result)
            for k, v in pairs(result) do
                for i, j in pairs(Config.Moonshine[1].items) do
                    if v.name == i then
                        local purity = 0
                        if (v.metadata.purity ~= nil) then
                            purity = v.metadata.purity
                        end
                        items[#items+1] = {
                            id        = #items+1,
                            name      = v.name,
                            img     = 'nui://'..Config.Img..v.name..'.png',
                            purity    = purity,
                            info      = v.metadata,
                            amount    = v.count,
                            label	  = v.label,
                            slot      = v.slot,
                        }
                    end
                end
            end
            done = true
        end)  
    end
    while not done do
        Citizen.Wait(20)
    end
    return items 
end

function IsItASeed(item)
    local retval = false
    for k, v in pairs(Config.Items['seeds']) do
        if item.name == v.name then
            retval = true
        end
    end
    return retval
end

function IsItACan(item)
    local retval = false
    for k, v in pairs(Config.Items['water']) do
        if item.name == v.name then
            retval = true
        end
    end
    return retval
end

function IsItAFertiliser(item)
    local retval = false
    for k, v in pairs(Config.Items['fertiliser']) do
        if item.name == v.name then
            retval = true
        end
    end
    return retval
end

Citizen.CreateThread(function() 
    if Config.Inventory == "ox" then
        exports.ox_inventory:displayMetadata({
            purity     = "Quality",
            rotten     = "Rotten",
            water      = "Water",
        })
    end
end)
