Config = {}


--
--██╗░░░░░██╗░░░██╗░██████╗████████╗██╗░░░██╗░█████╗░░░██╗██╗
--██║░░░░░██║░░░██║██╔════╝╚══██╔══╝╚██╗░██╔╝██╔══██╗░██╔╝██║
--██║░░░░░██║░░░██║╚█████╗░░░░██║░░░░╚████╔╝░╚██████║██╔╝░██║
--██║░░░░░██║░░░██║░╚═══██╗░░░██║░░░░░╚██╔╝░░░╚═══██║███████║
--███████╗╚██████╔╝██████╔╝░░░██║░░░░░░██║░░░░█████╔╝╚════██║
--╚══════╝░╚═════╝░╚═════╝░░░░╚═╝░░░░░░╚═╝░░░░╚════╝░░░░░░╚═╝


-- Thank you for downloading this script!

-- Below you can change multiple options to suit your server needs.



Config.CoreSettings = {
    EventNames = {
        Stress = 'hud:server:RelieveStress', -- name of stress removal event
        Evidence = 'evidence:client:SetStatus', -- name of evidence event to set widepupils status when taking mushrooms
    },
    Target = {
        Type = 'ox', -- target script name support for qb-target and ox_target        
        --use 'qb' for qb-target
        --use 'ox' for ox_target 
    },
    Notify = {
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify, mythic_notify, boii_ui notify and ox_lib notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for myhthic_notify
        --use 'boii' for boii_ui notify
        --use 'ox' for ox_lib notify
    },
    Inventory = { -- support for qb-inventory and ox_inventory
        Type = 'ox',
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Timers = {
		Pick = 5000, -- time it takes to pick raw mushroom
		Dry = 10000, -- time it takes to dry mushroom
		ProcessRaw = 5000, -- time it takes to process raw mushrooms
		ProcessMagic = 5000, -- time it takes to process dry mushrooms
		Take = 5000, -- time it takes to eat magic mushrooms
		CreateCure = 20000, -- time it takes to create overdose cure -- THIS IS PURPOSELY SET HIGH TO SIMULATE BREWING INGREDIENTS
		TakeCure = 5000, -- time it takes to take overdose cure
		TakeDeathCap = 5000, -- time it takes to eat death cap mushroom		
        RespawnShrooms = 1 * 1000 * 60, -- time to respawn mushrooms default is 60 minutes
    },
    Chances = {
        Pick = 90, -- chance to pick mushrooms
        Dry = 75, -- chance to dry mushrooms
        Process = 75, -- chance to process successfully
    },
    Props = {
        Mushrooms = { 
            Name = 'prop_stoneshroom2', -- name of prop
            Label = 'Pick Mushroom', -- target label 
            Icon = 'fa-solid fa-hand-point-up', -- target icon
            Distance = 2.0, -- target distance
        },
        ProcessingTable = { 
            Name = 'v_ret_ml_tableb',  -- name of prop
            LabelOpen = 'Use Processing Table', -- target label 
            LabelRemove = 'Remove Processing Table', -- target label 
            IconOpen = 'fa-solid fa-bars', -- target icon
            IconRemove = 'fas fa-xmark', -- target icon
            Distance = 3.0, -- target distance
        },
    },    
}


Config.Peds = {
    -- if setting useped to false make sure to set useblip to false also and add your own methods of obtaining the items below
    {
        useped = true, 
        name = 'supplies_ped',  
        coords = vector4(92.01, -1603.14, 30.90, 227.31),
        model = 's_m_m_scientist_01',
        playanim = true,
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        useblip = false,
        title = 'Supplies',
        colour = 5,
        id = 51,
        scale = 0.8,
        targeticon = 'fa-solid fa-boxes-packing',
        targetlabel = 'Open Supplies Shop',
        targetdistance = 2.0,
    },
}


Config.Mushrooms = { -- add or remove plants as you wish
     --item is required item to target set to nil for no item requirement
     --label is target label
     --icon is target icon
     --coords are plant locations
     --distance is target distance - make sure to edit the distance checks in mushrooms_client also if increasing target distance
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2249.37, 2529.8, 4.54, 289.73),   distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2245.68, 2532.52, 4.13, 302.82),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2241.96, 2528.32, 3.13, 220.17),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2239.44, 2522.98, 3.04, 212.69),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2235.95, 2524.93, 3.84, 308.51),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2229.16, 2525.56, 3.69, 283.98),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2230.06, 2529.6, 3.63, 22.77),    distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2225.13, 2531.91, 3.92, 289.36),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2219.18, 2536.15, 1.98, 329.84),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2225.48, 2541.58, 3.61, 62.15),   distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2228.72, 2538.26, 3.84, 157.04),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2233.55, 2542.98, 3.59, 31.52),   distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2238.04, 2545.34, 3.59, 65.26),   distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2239.26, 2540.04, 3.57, 143.15),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2248.82, 2541.88, 4.5, 300.91),   distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2244.67, 2538.99, 4.42, 201.62),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2250.39, 2536.61, 4.43, 68.48),   distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2254.45, 2538.01, 4.51, 19.46),   distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2256.69, 2531.08, 4.51, 348.28),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2250.39, 2520.2, 3.31, 326.32),   distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2246.37, 2519.23, 3.61, 247.02),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2241.28, 2517.34, 2.16, 256.63),  distance = 2.0, },
    { item = 'trowel', label = 'Pick Mushroom', icon = 'fa-solid fa-hand-point-up', coords = vector4(-2239.78, 2533.49, 3.48, 293.59),  distance = 2.0, },
}

-- XP settings
Config.XP = { -- use xp when picking mushrooms
    Enabled = false, -- Toggles xp system on or off; true = on, false = off
    Command = false, -- Toggles commands on or off use /drugxp or whatever you have named the metadata
    XPChance = 75, -- chance to earn XP from events
    XPAmount = math.random(5,10), -- amount of xp given from events
    MetaDataName = 'drugxp', -- The name of your xp if you edit this make sure to also edit the line you added into qb-core/server/player.lua
    Levels = { -- Change your xp requirements here to suit your server set these as high as you want preset xp increase = (xp / 0.8) if changing amounts dont forget to edit server file also where raw_mushroom is given to match new xp amounts
        150, -- level 2 
        250, -- level 3 
        500, -- level 4
        750, -- level 5
        1000, -- level 6
        1250, -- level 6
        1500, -- level 7
        1750, -- level 8
        2000, -- level 9
        2500, -- level 10  
    }
}

Config.Processing = {
    Drying = {  
        RequiredItemName = 'libertycap_mushroom',  -- required item name
        RequiredItemLabel = 'Liberty Cap Mushroom', -- required item label
        RequiredItem2Name = 'dryingrack',  -- required item name
        RequiredItem2Label = 'Drying Rack', -- required item label
        DriedItemName = 'dried_libertycap_mushroom', -- given item name
        DriedItemLabel = 'Dried Liberty Cap Mushroom', -- given item label
    },
    Processing = {  
        RequiredItemName = 'dried_libertycap_mushroom',  -- required item name
        RequiredItemLabel = 'Dried Liberty Cap Mushroom', -- required item label
        RequiredItem2Name = 'acetone',  -- required item name
        RequiredItem2Label = 'Acetone', -- required item label
        ProcessedItemName = 'magic_mushroom', -- given item name
        ProcessedItemLabel = 'Magic Mushroom', -- given item label
    },
    Curing = {
        RequiredItemName = 'indigomilkcap_mushroom',  -- required item name
        RequiredItemLabel = 'Indigo Milk Cap Mushroom', -- required item label
        RequiredItem2Name = 'dimethylformamide',  -- required item name
        RequiredItem2Label = 'Dimethylformamide', -- required item label
        ProcessedItemName = 'mushroomoverdosecure', -- given item name
        ProcessedItemLabel = 'Overdose Cure', -- given item label
        ProcessedItemAmount = 1,  -- given item amount if not using XP
    },
}



Config.DrugSettings = {
    Effects = {
        Enabled = true, -- enables screen visuals and armour, health and stress effects setting to false will disable everything
        EffectsTimer = 10000, -- timer for drug effects when consumed perfect time is around 10000 ms {10 seconds}
        UseTeleport = true, -- enables teleport when taking drugs
        TeleportChance = 50, -- chance to teleport player when taking magic mushrooms if UseTeleport above is set to true
        TeleportLocation = vector3(501.75, 5604.69, 797.91), -- teleport location when screen fades during drug effects animation
        GraveLocation = vector3(-1762.99, -262.61, 48.22), -- location of graveyard to teleport player if taken a bad trip from a death cap mushroom
        SpawnPed = true, -- spawn an agry ped when tripping from drug effects
        SpawnChance = 50, -- spawn chance of angry ped
        PedModel = "s_m_m_movalien_01", -- ped model of angry ped that spawns
        UseSound = true, -- uses sound effects when taking drugs - REQUIRES INTERACT SOUND TO WORK PROPERPLY
        SoundName = 'MushroomTripEffect', -- name of sound file for drug effects
        ArmourGained = math.random(20,40), -- amount of armour gained SET TO 0 FOR NOTHING
        HealthGained = math.random(20,40), -- amount of health gained SET TO 0 FOR NOTHING
        StressReduced = math.random(20,40), -- amount of stress reduced SET TO 0 FOR NOTHING
        OverDose = false, -- set to true for a chance for the player to become overdosed after a certain amount of times taking magic mushrooms
        OverDoseMetaDataName = 'overdose', -- The name of your overdose metadata if you edit this make sure to also edit the line you added into qb-core/server/player.lua --USE /overdose TO CHECK YOUR OVERDOSE LEVEL if OverDose is set to true above
        OverDoseAmount = math.random(5,10), -- overdose counter each time mushroom_baggy is consumed if OverDose is set to true -- this will eventually add up to the number you specify below as the minimum level required to overdose
        OverDoseLevel = 1250, -- minimum level needed to overdose - set fairly high to prevent constant overdoses or match your highest level stated in the OverDoseLevels table below
        HealthRemoved = 50, -- amount of health to be removed when overdosing
        OverDoseCureAmount = math.random(30,50), -- amount of overdose metadata is removed when consuming indigo_mycota_cure
        DeathCapTripChance = 50, -- chance for the player to have a trip when consuming a death cap mushroom or else they will die
    },
    OverDoseLevels = { -- Change your overdose requirements here to suit your server set these as high as you want preset overdose increase -  if changing amounts dont forget to edit server file also where overdose values are
        150, -- level 2 
        250, -- level 3 
        500, -- level 4
        750, -- level 5
        1000, -- level 6
        1250, -- level 6
        1500, -- level 7
        1750, -- level 8
        2000, -- level 9
        2500, -- level 10  
    },
}


Config.Animations = { -- change animations below for various tasks
    PickMushrooms = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = "prop_cs_trowel",
    },
    PlaceProcessingTable = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
    },
    UseProcessingTable = {
        AnimDict = 'anim@amb@board_room@supervising@',
        Anim = 'think_01_hi_amy_skater_01',
        Flags = 41,
    },
    TakeDrugs = {
        AnimDict = 'mp_player_inteat@burger',
        Anim = 'mp_player_int_eat_burger',
        Flags = 49,
    },
    DrugEffects = {
        AnimDict = 'amb@world_human_vehicle_mechanic@male@base',
        Anim = 'base',
        Flags = 9,
    },
}



Config.Language = {
    ProgressBar = { 
        PickMushrooms = 'Picking Mushrooms',
        DryMushrooms = 'Drying Mushrooms',
        MakeMagicMushrooms = 'Making Magic Mushrooms',
        TakeDrugs = 'Eating Mushrooms',
        CreateOverDoseCure = 'Creating Overdose Cure',
        TakeOverDoseCure = 'Taking Overdose Cure',
        TakeDeathCap = 'Eating Death Cap Mushroom',
        PlaceProcessingTable = 'Placing Processing Table',
    },
	Notifications = { 
        AlreadyCuredName = 'You Are Not Close To Overdosing Any Time Soon, You Dont Need This At The Moment!',
        OverDosedName = 'You Have Overdosed Go See A Doctor Immediately!',
        OverDoseWarningName = 'Careful You Dont Overdose If You Take Too Many Mushrooms!',
        OverDoseCuredName = 'You Start To Feel Better And Less Likely To Overdose!',
        EarnedXpName = 'You Earned Some XP!',
        CancelledName = 'Cancelled',
        NothingFoundName = 'This Mushroom Was Damaged, Try Another!',
        NoItemsName = 'You Are Missing Items!',
        DrugEffectsName = 'Holy Shit That Stuff Is Strong!',
        BadTripName = 'You Are Having A Bad Trip!',
        BusyName = 'You Are Already Doing Something!',
        CantCarryName = 'You Cant Carry Anymore!',
        FailedName = 'Action Failed!',
        ProcessFailedName = 'Something Went Wrong With The Mixture, Try Again!',
        NotOnFootName = 'You Are Not On Foot!',
        TooFarAway = 'You Are Too Far Away!',
        PropErrorName = 'You Cant Spawn Another Processing Table Without Removing The Other One First!',
        InvalidAmountName = 'You have entered an invalid amount!',
        NotEnoughName = 'You dont have enough to do that!',
    },	
}


