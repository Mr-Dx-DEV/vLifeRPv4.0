Config = {}

--[[
▀█▀ █▀▀ █▀▀ ▀█ █▄█   █▀▀ █▀█ █▀█ █▀▀   █▀▄ █▀▀ █░█ █▀▀ █░░ █▀█ █▀█ █▀▄▀█ █▀▀ █▄░█ ▀█▀
░█░ ██▄ ██▄ █▄ ░█░   █▄▄ █▄█ █▀▄ ██▄   █▄▀ ██▄ ▀▄▀ ██▄ █▄▄ █▄█ █▀▀ █░▀░█ ██▄ █░▀█ ░█░
]]

Config.Lang = 'en'
Config.Debug = false                       -- if you want to see debug messages in console

Config.TargetResource = 'qb-target'       -- supported: ox_target, qb-target
Config.InventoryResource = 'ox_inventory' -- supported: ox_inventory, qb-inventory, ps-inventory, qs-inventory
Config.SQLResource = 'oxmysql'            -- supported: oxmysql, mysql-async, ghmattimysql

Config.UseCommand = true                  -- if you want to use command to give starter pack to player
Config.Command = 'welcomepack'            -- command to give starter package to player

Config.UseTarget = true                   -- if you want to use target script to give starter pack to player
Config.Target = {
    ped = 'a_m_y_business_03',            -- https://docs.fivem.net/docs/game-references/ped-models/
    label = 'Get your starter pack',
    receiving_radius = 20.0,              -- radius to receive the starter pack
    coords = vec4(199.149, -854.144, 30.894, 338.698),
    distance = 2.0,
}

Config.StarterPackItems = { -- items that will be given to player
    { item = 'sandwich',    amount = 1 },
    { item = 'money',    amount = 500000 },
   -- { item = 'phone',    amount = 1 },
   -- { item = 'lockpick', amount = 1 },
   -- { item = 'money',    amount = 5000 },
}

Config.EnableStarterVehicle = false -- if you want to give starter vehicle to player
Config.StarterVehicle = {
    model = 'comet6',               -- https://docs.fivem.net/docs/game-references/vehicle-models/
    teleport_player = true,        -- player will be teleported to the vehicle
    vehicle_spawns = {             -- vehicle spawn points
        ["1"] = vector4(199.53, -844.38, 30.639, 247.685),
        ["2"] = vector4(204.849, -846.496, 30.504, 248.67),
        ["3"] = vector4(210.824, -848.691, 30.353, 250.417),
        ["4"] = vector4(216.347, -850.669, 30.214, 250.46),
        ["5"] = vector4(221.739, -852.648, 30.078, 250.471),
    },
    fuel = 100.0, -- fuel level of the vehicle
}

Config.EnableAlertDialog = true -- if you want to use alert dialog to give a short message to the player
Config.Dialog = {
    title = 'vLife Roleplay Server',
    message = 'Welcome to the server, I hope you enjoy your stay. make sure to read the **rules** and have fun! \n\nDo you want to receive the starter pack?',
}

---@param vehicle any
---@param fuel number
---@decription Set fuel level of the vehicle by default it uses LegacyFuel
Config.SetFuel = function(vehicle, fuel)
    exports['cdn-fuel']:SetFuel(vehicle, fuel)
end


---@param vehicle any
---@return string
---@decription If you have a custom vehicle key system you can give the key to the player
Config.GiveKey = function(vehicle)
    local Core, Framework = GetCore()
    if Framework == "esx" then
        -- ESX Vehicle Key System
    else
        TriggerEvent("vehiclekeys:client:SetOwner", Core.Functions.GetPlate(vehicle))
    end
end

Config.Notification = function(message, type, is_server, src)
    local Core, Framework = GetCore()
    if is_server then
        if Framework == "esx" then
            TriggerClientEvent("esx:showNotification", src, message)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 5000)
        end
    else
        if Framework == "esx" then
            TriggerEvent("esx:showNotification", message)
        else
            TriggerEvent('QBCore:Notify', message, type, 5000)
        end
    end
end

Config.Locale = {
    ['en'] = {
        ['received'] = 'You have already received your welcome pack',
        ['success'] = 'You have received your welcome pack, Enjoy!',
        ['canceled'] = 'You have canceled the welcome pack',
        ['not_near_receiving_point'] = 'You are not near the receiving point',
        ['no_available_spawn'] = 'Possible area for vehicle spawn is occupied',
        ['player_in_vehicle'] = 'You can\'t receive the welcome pack while in the vehicle',
    },
}
