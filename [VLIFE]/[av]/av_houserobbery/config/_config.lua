--[[
    IMPORTANT
    Make sure to read and understand the docs before using this script:
    https://docs.av-scripts.com/guides/house-robbery
    https://docs.av-scripts.com/guides/house-robbery
    https://docs.av-scripts.com/guides/house-robbery
]]

Config = {}
Config.Framework = "QBCore" -- "ESX", "QBCore" or "Other" for custom Frameworks
Config.Debug = false -- Enable some extra prints to find possible errors
Config.DevServer = false -- Set false when using this script in live server to prevent the use of admin commands
Config.DevCommands = {
    -- don't change the first value, only the 2nd one (ex: "robbery:shell")
    ['spawn_shell'] = "robbery:shell", -- Spawn a shell from _shells.lua and create zones/objects
    ['take_coords'] = "robbery:coords", -- Take the coords from the house entry for _locations.lua
    ['test_object'] = "testobject", -- /testobject + prop_name = Spawn an object inside a shell to preview how it looks
}
Config.PoliceJobName = { -- Police job names, the ones that will receive an alert and can raid houses
    ['police'] = true,
    ['sheriff'] = true,
}
Config.MinCops = 0 -- Min cops online to start the job
Config.StartingDoor = vector3(1510.4838, 6326.0747, 24.6071) -- Coords for the door where mission starts
Config.Cooldown = 5 -- Player cooldown (in minutes), to prevent the same person from farming all houses 24/7
Config.RemoveHouseTime = 60 -- Player have X minutes to rob the house before it gets removed
Config.LockpickItem = "lockpick" -- Item name used to break into houses, or set to false if you don't want to use an item for this
Config.AlarmTime = 20 -- In seconds, max time you have to disable house alarm before calling cops
Config.Lucky = { -- This items aren't spawned all time, they are lucky based
    ['safe'] = 10, -- % of lucky (from a 100%) to get a safe spawned in house
    ['jewelry'] = 50, -- % of lucky (from a 100%) to get jewels spawned in house
    ['illegal'] = 30, -- % of lucky (from a 100%) to get an illegal item spawned in house
    ['money'] = 30, -- % of lucky (from a 100%) to get a pile of cash spawned in house
    ['item'] = 70,
}
Config.Blip = {
    sprite = 40,
    color = 2,
    scale = 0.8
}
Config.VehClass = { -- Vehicle class allowed to be used for storing objects (tv, coffee machine, etc)
    ["0"] = true,
    ["1"] = true,
    ["2"] = true,
    ["9"] = true,
    ["10"] = true,
    ["11"] = true,
    ["12"] = true,
    ["20"] = true,
}

-- If your inventory is not listed here, go to server/framework/_framework.lua and edit the needed functions and leave this as false
Config.Inventory = "ox_inventory" -- Compatible inventories: "qb-inventory", "lj-inventory", "qs-inventory" (2.0) or "ox_inventory"
Config.SellItems = true -- Only available if you use ox_inventory (other inventories doesn't support this function, nothing I can do...)

-- Items you can find when searching
Config.ZoneRewards = {
    -- itemName, min/max amount of items it can drop at once
    {itemName = "phone", min = 1, max = 2},
    {itemName = "rolex", min = 1, max = 2},
    {itemName = "casio", min = 1, max = 2},
}

Config.Rewards = { -- Player will receive a random item from the table, this rewards corresponds to Config.Lucky
    ['safe'] = {
        {type = "item", itemName = "rolex", min = 10, max = 20},
        {type = "item", itemName = "necklace", min = 10, max = 20},
        -- {type = "item", itemName = "diamond_ring", min = 10, max = 20},

        -- {type = "item", itemName = "goldchain", min = 1, max = 1},
        {type = "item", itemName = "gold_bracelet", min = 1, max = 1},
        {type = "item", itemName = "gold_watch", min = 1, max = 1},
    },
    ['jewelry'] = {
        {type = "item", itemName = "rolex", min = 5, max = 10},
        {type = "item", itemName = "necklace", min = 5, max = 10},
        -- {type = "item", itemName = "diamond_ring", min = 5, max = 10},

        {type = "item", itemName = "earings", min = 1, max = 1},
    },
    ['illegal'] = {
        {type = "item", itemName = "meth1g", min = 20, max = 30}, -- I don't provide this items in _ITEMS, replace them with your own illegal items
        {type = "item", itemName = "cokebrick", min = 1, max = 2}, -- I don't provide this items in _ITEMS, replace them with your own illegal items

        {type = "item", itemName = "gunpowder", min = 1, max = 1},
    },
    ['money'] = {
        {type = "money", accountName = "cash", min = 5, max = 20}, -- 'cash' for qb-core / 'black_money' for ESX
    },
    ['item'] = {
      --  {type = "item", itemName = "condom", min = 1, max = 1},
      --  {type = "item", itemName = "romantic_book", min = 1, max = 1},
        {type = "item", itemName = "blacktape", min = 1, max = 20},
        {type = "item", itemName = "rope", min = 1, max = 35},
        {type = "item", itemName = "remote", min = 1, max = 35},
        {type = "item", itemName = "glassbottle", min = 1, max = 1},
      --  {type = "item", itemName = "notepad", min = 1, max = 1},
     --   {type = "item", itemName = "pencil", min = 1, max = 1},
      --  {type = "item", itemName = "bong", min = 1, max = 1},
     --   {type = "item", itemName = "emptycan", min = 1, max = 1},
      --  {type = "item", itemName = "cardboard", min = 1, max = 1},
     --   {type = "item", itemName = "emptypapercup", min = 1, max = 1},
        {type = "item", itemName = "phone", min = 1, max = 1},
        {type = "item", itemName = "spring", min = 1, max = 30},
        {type = "item", itemName = "pcb", min = 1, max = 35},
    --    {type = "item", itemName = "copper_wires", min = 1, max = 1},
     --   {type = "item", itemName = "condom_used", min = 1, max = 1},
     --   {type = "item", itemName = "cloth", min = 1, max = 1},
    --    {type = "item", itemName = "laptop_green", min = 1, max = 1},
    },
}

Config.SellAccount = "cash" -- 'cash' for qb-core / 'black_money' for ESX
Config.ItemPrices = {
    ['high_end_tv'] = 250,
    ['high_end_art'] = 200,
    ['rolex'] = 100,
    ['diamond_ring'] = 100,
    ['necklace'] = 100,
    ['low_end_art'] = 75,
    ['stolen_laptop'] = 50,
    ['low_end_tv'] = 50,
    ['casio'] = 50,
    ['ipod'] = 25,
    ['coffee_machine'] = 25,
    ['toaster'] = 15,
    ['phone'] = 15,
}