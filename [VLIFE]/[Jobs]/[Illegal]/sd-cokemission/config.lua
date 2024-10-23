Config = {}



SD.Locale.LoadLocale('en') -- Load the locale language, if available. You can change 'en' to any other available language in the locales folder.

Config.CokeDebug = false -- Change to true to enable PolyZone DebugPoly's for testing. (Some Targeting Solutions, like ox_target might not display PZ's)

-- General Settings
Config.MinimumPolice = 1 -- Minimum Police Required to start the Job!
Config.PoliceJobs = { 'police', --[['sheriff']] } -- Array of jobs that are checked in the cop count callback.
Config.RunCost = 500 -- Price for starting the Run
Config.Cooldown = 60 -- Minutes * Recommended to have some form of cooldown!

Config.SendEmail = false -- Starting Email (Only Triggers if Config.EnableMinigame is set to false. when Config.EnableMinigame is true the email event from the minigame will be triggered irregardless of what this is set to.)
-- (if Config.SendEmail & Config.EnableMinigame are false, it'll just put out a Notification and start the Run)

Config.Interaction = 'ox_target' -- 'target' = qb-target/qtarget/ox_target or 'textui' = cd_drawtextui/qb-core/ox_lib textui 

-- Enable cache mode (true = cache, false = direct item output from underwater vehicles)
Config.UsingSealedCache = true

-- If using cache, specify the cache item and key item details
if Config.UsingSealedCache then
    Config.SealedCache = {
        Item = 'sealed_cache',            -- Cache item name
        RequiresKeyToOpen = false,        -- Cache requires a key to open (true/false)
        KeyItem = 'cache_key',           -- Key item name
        KeyItemChance = 10,              -- Chance to get a key when looting a cache (in %)
        ChanceToRemoveKey = 35,          -- Chance to remove the key upon cache use (in %)
    }
end

-- Specify the reward items directly for both cases
Config.RewardItems = {
    { item = 'coke_brick' },
    -- { item = 'hello :)' },
    -- Add more reward items as needed
}

Config.RewardAmount = 2  -- Number of reward items to give from each cache item or from each vehicle (Depending on Config.UsingSealedCache)

-- Police Alert for Cocaine Package Drops
policeAlert = function()
    exports['ps-dispatch']:Coke()
end -- This is the function that is called when the police are meant to be alerted. You can modify this in any way.

Config.EnableAnimation = true -- Animation for the talking to the Ped.
Config.FlareTime = 15 -- Minutes (before the flares stop burning..)

Config.CheckForBlackout = true -- Set to true if you want the run to only be accessible when a blackout is active. (currently only supports qb-weathersync)
 
-- Minigame Settings -- (reference Config.Phone in sd_lib/sh_config.lua and the util function SendEmail in sd_lib/client/cl_utils.lua)
Config.EnableMinigame = false -- true, will direct players to complete the phone numbers minigame instead of directly starting the run. false = directly starts the run
Config.EnableMinigameTimeout = true -- When will the Minigame Timeout (Remove Zones, Blips and clear Variables)
Config.MinigameTimeout = 30 -- Minutes

Config.PhoneBooths = {
    { x = -1224.1, y = -322.62, z = 37.58, heading = 30.0 }, -- Booth 1
    { x = -1073.98, y = -397.78, z = 36.96, heading = 30.0 }, -- Booth 2
    { x = -523.79, y = -299.86, z = 35.35, heading = 30.0 }, -- Booth 3
    { x = -544.16, y = -157.43, z = 38.54, heading = 30.0 }, -- Booth 4
}

-- Blip Creation for Boss Peds
Config.Blip = {
    Enable = false, -- Change to false to disable blip creation
    Sprite = 480,
    Display = 4,
    Scale = 0.6,
    Colour = 1,
    Name = "Mysterious Person", -- Name of the blip
}

-- Ped Spawns
Config.BossPed = 's_m_y_uscg_01' -- The model name of the boss ped.
Config.BossLocation = { -- The locations where the boss can spawn.
    [1] = vector4(892.16, -2012.78, 35.82, 75.7),
    [2] = vector4(-71.85, -1508.04, 35.62, 229.98),
}

-- Boat Settings
Config.EnableBoat = true -- True if you want a boat to spawn in the Alamo Sea
Config.Boatspawn = vector3(2225.68, 4018.5, 36.33) -- Location where the boat will spawn!
Config.BoatTimeout = 10 -- Minutes (Till the Boat blip despawns)

-- Submerged Vehicle Settings
Config.CarModels = {
    'voodoo',
    'virgo3',
    'dukes3'
}

Config.CarSpawnList = {
    vector3(-3426.810, 1700.721, -64.30),
    vector3(-3612.931, 751.214, -50.39),
    vector3(-1297.913, 5799.770, -30.04),
    vector3(1406.560, 6937.847, -28.51),
    vector3(3546.872, 5780.012, -21.24),
    vector3(3836.941, 5153.833, -57.15),
    vector3(4231.236, 3950.319, -48.87),
    vector3(3251.902, 1360.341, -52.64),
    vector3(1647.259, -3111.905, -65.95),
} 