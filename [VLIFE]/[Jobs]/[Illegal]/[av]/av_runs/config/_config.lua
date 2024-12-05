-- PLEASE READ THE DOCS BEFORE USING THIS SCRIPT
-- PLEASE READ THE DOCS BEFORE USING THIS SCRIPT
-- https://docs.av-scripts.com/laptop-pack/av-drug-runs
-- https://docs.av-scripts.com/laptop-pack/av-drug-runs
-- https://docs.av-scripts.com/laptop-pack/av-drug-runs

Config = {}
Config.Debug = false -- It will do some prints client/server side to help me fix possible errors
Config.PrintCoords = true -- It will print the current NPC coords in server console
Config.Framework = "qb" -- Available options "qb" / "esx", for custom Framework u need to modify everything from framework folders
Config.TargetSystem = "ox_target" -- "qtarget", "qb-target" or "ox_target"
Config.HackingDevice = "hacking_device" -- Same item frm av_boosting :)
Config.DrugPackageItem = "drug_package" -- Item received during mission
Config.ShowCopsBlip = true -- Shows the vehicle blip on map during mission to all cops
Config.CooldownZones = 1 -- Wait time before generating the next location to collect the package (in minutes)
Config.PoliceJobs = { -- Used for function isCop() and ESX checks for online cops
    "police",
    "bsco",
    "leo", -- u can use job types (qbcore)
}
Config.DefaultVehicles = {`burrito2`, `burrito3`, `youga`, `youga2`} -- Vehicles spawned at each zone with the drug box inside trunk

Config.Drugs = {
    ['weed_bag'] = { -- item name
        minCops = 0, -- min cops online to start mission
        vehicle = {`schafter5`, `cognoscenti2`, `xls2`, `kuruma2`}, -- Vehicle used for runs, it will pick one random model from table
        moneyAccount = "cash", -- The account name to receive the reward
        cooldown = 30, -- In minutes, time before other players can do the mission again / this value CAN'T be lower than timeLimit
        timeLimit = 60, --Max time for mission, after this time it will be canceled and all guards/vehicles wiped
        minQty = 5, -- min bags u need to deposit to start the job
        maxQty = 10, -- The amount of slots the stash will have to prevent people from puting more bags
        stashWeight = 100000, -- Make sure it has enough space for 30 bags (100kg)
        purityField = "purity", -- How the purity field is named in your item metadata
        basePrice = 20000, -- Price per package (1% quality)
        maxPrice = 40000, -- Max price per package (100% quality)
        zones = {min = 3, max = 6}, -- How many packages will be generated (every package means 1 zone with goons)    
        canInteract = function()
            -- Here you can do some extra check to prevent cops from using this PED, or limit the interaction to only gang members (?)
            if isCop() then return false end
            return true
        end
    },
    ['weed_ak47_joint'] = { -- item name
        minCops = 0, -- min cops online to start mission
        vehicle = {`schafter5`, `cognoscenti2`, `xls2`, `kuruma2`}, -- Vehicle used for runs, it will pick one random model from table
        moneyAccount = "cash", -- The account name to receive the reward
        cooldown = 30, -- In minutes, time before other players can do the mission again / this value CAN'T be lower than timeLimit
        timeLimit = 60, --Max time for mission, after this time it will be canceled and all guards/vehicles wiped
        minQty = 20, -- min bags u need to deposit to start the job
        maxQty = 30, -- The amount of slots the stash will have to prevent people from puting more bags
        stashWeight = 100000, -- Make sure it has enough space for 30 bags (100kg)
        purityField = "purity", -- How the purity field is named in your item metadata
        basePrice = 25000, -- Price per package (1% quality)
        maxPrice = 50000, -- Max price per package (100% quality)
        zones = {min = 3, max = 6}, -- How many packages will be generated (every package means 1 zone with goons)    
        canInteract = function()
            -- Here you can do some extra check to prevent cops from using this PED, or limit the interaction to only gang members (?)
            if isCop() then return false end
            return true
        end
    },

    ['coke_baggy'] = { -- item name
        minCops = 0, -- min cops online to start mission
        vehicle = {`schafter5`, `cognoscenti2`, `xls2`, `kuruma2`}, -- Vehicle used for runs, it will pick one random model from table
        moneyAccount = "cash", -- The account name to receive the reward
        cooldown = 30, -- In minutes, time before other players can do the mission again / this value CAN'T be lower than timeLimit
        timeLimit = 60, --Max time for mission, after this time it will be canceled and all guards/vehicles wiped
        minQty = 8, -- min bags u need to deposit to start the job
        maxQty = 12, -- The amount of slots the stash will have to prevent people from puting more bags
        stashWeight = 100000, -- Make sure it has enough space for 30 bags (100kg)
        purityField = "purity", -- How the purity field is named in your item metadata
        basePrice = 30000, -- Price per package (1% quality)
        maxPrice = 60000, -- Max price per package (100% quality)
        zones = {min = 3, max = 6}, -- How many packages will be generated (every package means 1 zone with goons)    
        canInteract = function()
            -- Here you can do some extra check to prevent cops from using this PED, or limit the interaction to only gang members (?)
            if isCop() then return false end
            return true
        end
    },

    ['coke_raw'] = { -- item name
        minCops = 0, -- min cops online to start mission
        vehicle = {`schafter5`, `cognoscenti2`, `xls2`, `kuruma2`}, -- Vehicle used for runs, it will pick one random model from table
        moneyAccount = "cash", -- The account name to receive the reward
        cooldown = 30, -- In minutes, time before other players can do the mission again / this value CAN'T be lower than timeLimit
        timeLimit = 60, --Max time for mission, after this time it will be canceled and all guards/vehicles wiped
        minQty = 25, -- min bags u need to deposit to start the job
        maxQty = 30, -- The amount of slots the stash will have to prevent people from puting more bags
        stashWeight = 100000, -- Make sure it has enough space for 30 bags (100kg)
        purityField = "purity", -- How the purity field is named in your item metadata
        basePrice = 50000, -- Price per package (1% quality)
        maxPrice = 100000, -- Max price per package (100% quality)
        zones = {min = 3, max = 6}, -- How many packages will be generated (every package means 1 zone with goons)    
        canInteract = function()
            -- Here you can do some extra check to prevent cops from using this PED, or limit the interaction to only gang members (?)
            if isCop() then return false end
            return true
        end
    },
}

function dbug(...)
    if Config.Debug then print ('^3[DEBUG]^7', ...) end
end