Core = nil

CreateThread(function()
    while not Config.Framework and not Config.Inventory do Wait(1) end
    if Config.Target and GetResourceState(Config.Target) ~= "started" then
        print("^3[WARNING] You set "..Config.Target.." as your Config.Target but the resource doesn't exist in your server, check your laptop config.^7")
        print("^3[WARNING] You set "..Config.Target.." as your Config.Target but the resource doesn't exist in your server, check your laptop config.^7")
        print("^3[WARNING] You set "..Config.Target.." as your Config.Target but the resource doesn't exist in your server, check your laptop config.^7")
    end
    print("^2Framework: ^7"..Config.Framework, "^2Inventory: ^7"..Config.Inventory, "^2Target: ^7", Config.Target)
    Core = getCore()
    if Config.Inventory == "origen_inventory" and Core == "qb" then
        Core.Functions.CreateUseableItem(Config.LaptopItem, useLaptop)
    else
        exports['av_laptop']:registerItem(Config.LaptopItem, useLaptop)
    end
    ready = true -- Framework is loaded and laptop is now ready :)
end)

-- Triggered when u use item laptop
function useLaptop(source,item,info)
    local src = source
    local identifier = getIdentifier(src)
    local metadata, slot = getMetadata(item, info)
    metadata = metadata or {}
    slot = slot or 1
    dbug("^3[DEBUG]:^7 ".."open laptop", json.encode(metadata))
    if metadata and not metadata['serial'] then
        local info = {}
        local serial = lib.string.random('..............')
        info['serial'] = serial
        dbug("^3[DEBUG]:^7 ".."durability: ", metadata['durability'])
        info['durability'] = metadata['durability'] or 100
        info['password'] = false
        if info['durability'] > 100 then
            dbug("^3[DEBUG]:^7 ".."more than 100")
            info['durability'] = 100
        end
        allDevices[serial] = os.time()
        setItemMetadata(src, Config.LaptopItem, slot, info)
        TriggerClientEvent("av_laptop:openUI", src, info, slot, true)
    else
        if metadata['serial'] == identifier then
            metadata['serial'] = lib.string.random('..............')
            setItemMetadata(src, Config.LaptopItem, slot, metadata)
        end
        allDevices[metadata['serial']] = os.time()
        TriggerClientEvent("av_laptop:openUI", src, metadata, slot, true)
    end
end

-- Event handlers to get when a player is fully loaded into server
RegisterServerEvent("av_laptop:loaded")
AddEventHandler("QBCore:Server:PlayerLoaded", function(Player)
    TriggerEvent("av_laptop:loaded", Player.PlayerData.source)
end)

RegisterServerEvent("esx:onPlayerJoined")
AddEventHandler("esx:onPlayerJoined", function(Player)
    local src = Player
    if not src then src = source end
    TriggerEvent("av_laptop:loaded", src)
end)

-- Add Player Metadata
local metadataFields = {
    ['hunger'] = true,
    ['thirst'] = true
}
RegisterServerEvent("av_laptop:addMetadata", function(field, amount) -- used to add thirst/hunger, ESX uses client events for esx_status
    if not metadataFields[field] then return end
    local src = source
    if Config.Framework == "qb" then
        local Player = getPlayer(src)
        if Player then
            local value = Player.Functions.GetMetaData(field)
            value += amount
            Player.Functions.SetMetaData(field, value)
            if field == "hunger" then
                TriggerClientEvent('hud:client:UpdateNeeds', src, value, Player.PlayerData.metadata.thirst)
            else
                TriggerClientEvent('hud:client:UpdateNeeds', src, Player.PlayerData.metadata.hunger, value)
            end
        end
    end
end)

RegisterServerEvent("av_laptop:openStash", function(name,data) -- used for new qb-inventory stash system
    local src = source
    exports[Config.Inventory]:OpenInventory(src, name, data)
end)