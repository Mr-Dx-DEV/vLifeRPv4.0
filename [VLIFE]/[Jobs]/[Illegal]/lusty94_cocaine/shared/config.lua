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
        Evidence = 'evidence:client:SetStatus', -- name of evidence event to set widepupils status when taking cocaine and crack
    },
    Target = {
        Type = 'ox', -- target script name support for qb-target and ox_target        
        --use 'qb' for qb-target
        --use 'ox' for ox_target 
    },
    Notify = {
        Type = 'ox', -- notification type, support for qb-core notify, okokNotify, mythic_notify, boii_ui notify and ox_lib notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for myhthic_notify
        --use 'boii' for boii_ui notify
        --use 'ox' for -x_lib notify
    },    
    Inventory = {
        Type = 'ox' -- support for qb-inventory & ox_inventory
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Police = {
        Type = 'ps' -- support for qb-policejob and ps_dispatch
        --use 'qb' for qb-policejob
        --use 'ps' for ps-dispatch
    },
    ProgressBar = {
		PickCocaLeaves = 5000, -- time it takes to pick coca leaves
		GetCement = 10000, -- time it takes to get cement
		GetGasoline = 5000, -- time it takes to get gasoline
		GetHydrochloricAcid = 5000, -- time it takes to get acid
        PlaceProcessingTable = 5000, -- time to place processing table
		ProcessCocaine = 5000, -- time it takes to process all ingredients required to make cocaine
		ProcessCrack = 5000, -- time it takes to process all ingredients required to make crack
		ProcessCokeBaggy = 5000, -- time it takes to consume crack
		ProcessCrackBaggy = 5000, -- time it takes to consume crack
        CreateOverDoseCure = 20000, -- time it takes to create overdose cure -- THIS IS PURPOSELY SET HIGH TO SIMULATE BREWING INGREDIENTS
		TakeCocaine = 5000, -- time it takes to consume cocaine
		TakeCrack = 5000, -- time it takes to consume crack
		TakeOverDoseCure = 5000, -- time it takes to take overdose cure
    },
    Props = {
         -- NAME  = prop name
         -- REQUIREDITEM = item needed to activate target 
         -- TARGETICON = icon for target 
         -- TARGETLABEL = label for target 
         -- TARGETDISTANCE = distance for target
        CocaLeaves = {
            Name = 'prop_plant_fern_02a',
            RequiredItem = 'trowel',
            TargetIcon = 'fa-brands fa-pagelines',
            TargetLabel = 'Pick Coca Leaves',
            TargetDistance = 2.0,
        },
        Cement = {
            Name = 'prop_cons_cements01', -- uses same prop as other drug scripts - if causing issues then change prop model or use 1 item for all recipes
            TargetIcon = 'fa-solid fa-hand-point-up',
            TargetLabel = 'Get Cement',
            TargetDistance = 2.0,
        },
        Gasoline = {
            Name = 'prop_barrel_exp_01a', -- uses same prop as other drug scripts - if causing issues then change prop model or use 1 item for all recipes
            RequiredItem = 'plasticjerrycan',
            TargetIcon = 'fa-solid fa-gas-pump',
            TargetLabel = 'Siphon Gasoline',
            TargetDistance = 2.0,
        },
        HydrochloricAcid = {
            Name = 'prop_storagetank_02b', -- uses same prop as other drug scripts - if causing issues then change prop model or use 1 item for all recipes
            RequiredItem = 'plasticjerrycan',
            TargetIcon = 'fa-solid fa-jug-detergent',
            TargetLabel = 'Siphon Hydrochloric Acid',
            TargetDistance = 2.0,
        },
        ProcessingTable = {
            Name = 'v_ret_ml_tableb',
            TargetIconOpen = 'fa-solid fa-bars',
            TargetLabelOpen = 'Use Processing Table',
            TargetIconRemove = 'fas fa-xmark',
            TargetLabelRemove = 'Remove Processing Table',
            TargetDistance = 2.0,
        },
    },
    CoolDownTimers = {
        Cement = 5000, -- cooldown timer in MS for getting cement
        Gasoline = 5000, -- cooldown timer in MS for getting gasoline
        HydrochloricAcid = 5000, -- cooldown timer in MS for getting hydrochloric acid
        RespawnLeaves = 30 * 1000 * 60 -- timer to respawn coke leaves - 30 mins by default - EDIT THE FIRST NUMBER TO CHANGE THE RESPAWN TIMER DURATOIN
    }, 
    Chances = { -- chances for individual events
        CallPolice = 90, -- chance to call police when searching for items
        GetLeaves = 90, -- chance to get coca leaves
        GetCement = 90, -- chance to get cement
        GetGas = 90, -- chance to get gasoline
        GetHydro = 90, -- chance to get hydrochloric acid
        ProcessSuccess = 100, -- chance to process drugs successfuly
    }   
}

Config.Blips = {-- if adding more coca leaves in random locations then make sure to add a blip for their general location here too
    {title = 'Coca Leaves',         colour = 5, id = 89,    coords = vector3(-1941.44, 4539.38, 10.28),     scale = 0.8, useblip = true,}, -- BLIP FOR COCAINE LEAVES 
    {title = 'Construction Site',   colour = 5, id = 478,   coords = vector3(-489.18, -990.85, 29.13),      scale = 0.8, useblip = true,}, -- BLIP FOR CONSTRUCTION SITE
    {title = 'Hydrochloric Acid',   colour = 5, id = 415,   coords = vector3(1688.40, -1666.45, 111.49),    scale = 0.8, useblip = true,}, -- BLIP FOR HYDROCHLORIC ACID
    {title = 'Gasoline Barrels',    colour = 5, id = 648,   coords = vector3(463.64, -578.81, 28.50),       scale = 0.8, useblip = true,}, -- BLIP FOR GASOLINE BARRELS
}



Config.Peds = {
    -- if setting useped to false make sure to set useblip to false also and add your own methods of obtaining the items for the supplier store
    {
        name = 'supplies_ped',  
        useped = true, 
        coords = vector4(91.11, -1604.26, 30.9, 233.24),   
        model = 'g_m_m_chicold_01',   
        playanim = true,  
        scenario = 'WORLD_HUMAN_CLIPBOARD', 
        useblip = true, 
        title = 'Supplier', 
        colour = 5, 
        id = 51, 
        scale = 0.8, 
        targeticon = 'fa-solid fa-boxes-packing', 
        targetlabel = 'Speak With Supplier', 
        targetdistance = 2.0,
    },
}



Config.Plants = { -- add or remove plants as you wish
     --item is required item to target
     --label is target label
     --icon is target icon
     --coords are plant locations
     --distance is target distance
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1937.94, 4535.57, 10.56), distance = 2.0, },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1931.42, 4532.3, 11.05), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1940.55, 4540.43, 10.22), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1939.57, 4543.84, 9.87), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1934.64, 4545.18, 9.93), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1930.71, 4543.22, 10.44), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1926.92, 4535.39, 11.6), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1922.0, 4539.74, 11.53), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1914.72, 4541.63, 11.61), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1916.13, 4548.66, 9.56), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1918.18, 4553.98, 8.08), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1921.54, 4557.79, 7.36), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1926.16, 4560.36, 7.2), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1932.84, 4562.26, 6.68), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1942.21, 4567.03, 5.4), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1947.69, 4567.06, 5.11), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1951.78, 4559.63, 5.89), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1951.27, 4555.43, 6.65), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1951.17, 4547.96, 7.83), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1951.94, 4539.66, 8.28), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1947.66, 4534.37, 9.51), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1942.3, 4529.29, 10.52), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1936.96, 4525.56, 12.33), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1932.68, 4525.13, 12.89), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1927.96, 4527.63, 12.3), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1918.34, 4530.86, 12.94), distance = 2.0,  },
}

-- XP settings
Config.XP = { -- use xp
    Enabled = false, -- Toggles xp system on or off; true = on, false = off
    Command = false, -- Toggles commands on or off use /drugxp or whatever you have named the metadata
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
        2200, -- level 9
        2500, -- level 10  
    }
}

Config.Processing = { -- ItemName and ItemLabel MUST MATCH with items and labels in qb-core/shared/items.lua to work properly
    Cocaine = {  
        RequiredItemName = 'cocaleaf',  -- required item name
        RequiredItemLabel = 'Cocaine Leaf', -- required item label
        RequiredItemAmount = 10, -- required item amount
        RequiredItem2Name = 'cement',  -- required item name
        RequiredItem2Label = 'Cement', -- required item label
        RequiredItem2Amount = 1, -- required item amount
        RequiredItem3Name = 'gasoline',  -- required item name
        RequiredItem3Label = 'Gasoline', -- required item label
        RequiredItem3Amount = 1, -- required item amount
        RequiredItem4Name = 'hydrochloricacid',  -- required item name
        RequiredItem4Label = 'Hydrochloric Acid', -- required item label
        RequiredItem4Amount = 1, -- required item amount
        ProcessedItemName = 'pure_cocaine', -- given item name
        ProcessedItemLabel = 'Pure Cocaine', -- given item label
        ProcessedItemAmount = math.random(2,5),  -- given item amount if not using xp
    },
    Crack = {  
        RequiredItemName = 'pure_cocaine',  -- required item name
        RequiredItemLabel = 'Pure Cocaine', -- required item label
        RequiredItemAmount = 5, -- required item amount
        RequiredItem2Name = 'sodiumcarbonate',  -- required item name
        RequiredItem2Label = 'Sodium Carbonate', -- required item label
        RequiredItem2Amount = 1, -- required item amount
        RequiredItem3Name = 'water_bottle',  -- required item name
        RequiredItem3Label = 'Bottled Water', -- required item label
        RequiredItem3Amount = 1, -- required item amount
        ProcessedItemName = 'pure_crack', -- given item name
        ProcessedItemLabel = 'Pure Crack', -- given item label
        ProcessedItemAmount = math.random(1,3),  -- given item amount if not using xp
    },
    Bagging = {
        Cocaine = {
            RequiredItemName = 'pure_cocaine', -- required item name
            RequiredItemLabel = 'Pure Cocaine', -- required item label
            RequiredItemAmount = 1, -- required item amount
            RequiredItem2Name = 'scales', -- required item name
            RequiredItem2Label = 'Scales', -- required item label [SCALES DOESNT NEED AN ITEM AMOUNT AS ITS JUST A CHECK FOR THE ITEM ITSELF IN THE PLAYERS INVENTORY - IT DOESNT GET REMOVED WHEN BAGGING]
            RequiredItem3Name = 'emptybaggies', -- required item name
            RequiredItem3Label = 'Empty Baggies', -- required item label
            RequiredItem3Amount = 1, -- required item amount
            BaggedItemName = 'coke_baggy', -- given item name
            BaggedItemLabel = 'Bag of Cocaine', -- given item label
            BaggedItemAmount = math.random(3,6), -- given item amount if not using xp
        },
        Crack = {
            RequiredItemName = 'pure_crack', -- required item name
            RequiredItemLabel = 'Pure Crack', -- required item label
            RequiredItemAmount = 1, -- required item amount
            RequiredItem2Name = 'scales', -- required item name
            RequiredItem2Label = 'Scales', -- required item label [SCALES DOESNT NEED AN ITEM AMOUNT AS ITS JUST A CHECK FOR THE ITEM ITSELF IN THE PLAYERS INVENTORY - IT DOESNT GET REMOVED WHEN BAGGING]
            RequiredItem3Name = 'emptybaggies', -- required item name
            RequiredItem3Label = 'Empty Baggies', -- required item label
            RequiredItem3Amount = 1, -- required item amount
            BaggedItemName = 'crack_baggy', -- given item name
            BaggedItemLabel = 'Bag of Crack', -- given item label
            BaggedItemAmount = math.random(2,4), -- given item amount if not using xp
        },
    },
    Curing = {
        RequiredItemName = 'acetone',  -- required item name
        RequiredItemLabel = 'Acetone', -- required item label
        RequiredItemAmount = 2, -- required item amount
        RequiredItem2Name = 'dimethylformamide',  -- required item name
        RequiredItem2Label = 'Dimethylformamide', -- required item label
        RequiredItem2Amount = 2, -- required item amount
        RequiredItem3Name = 'iodine',  -- required item name
        RequiredItem3Label = 'Iodine', -- required item label
        RequiredItem3Amount = 2, -- required item amount
        ProcessedItemName = 'cokeoverdosecure', -- given item name
        ProcessedItemLabel = 'Overdose Cure', -- given item label
        ProcessedItemAmount = 1,  -- given item amount if not using xp
    },
}


Config.DrugSettings = {
    Effects = {
        Enabled = true, -- enables screen visuals and armour, health and stress effects setting to false will disable everything
        EffectsTimer = 10000, -- timer for drug effects when consumed before wearing off - perfect time is around 10000 ms {10 seconds}
        GiveArmour = true, -- enables the player to gain armour when consuming coke and crack
        ArmourGained = math.random(5,10), -- amount of armour gained SET TO 0 FOR NOTHING
        ReduceStress = true, -- enables the player to get stress relief when consuming coke and crack
        StressReduced = math.random(5,10), -- amount of stress reduced SET TO 0 FOR NOTHING
        OverDose = false, -- set to true for a chance for the player to become overdosed after a certain amount of times taking drugs
        OverDoseMetaDataName = 'overdose', -- The name of your overdose metadata if you edit this make sure to also edit the line you added into core also --USE /overdose TO CHECK YOUR OVERDOSE LEVEL if OverDose is set to true above
        OverDoseAmount = math.random(5,10), -- overdose counter each time cocaine and crack is consumed if OverDose is set to true -- this will eventually add up to the number you specify below as the minimum level required to overdose
        OverDoseLevel = 2500, -- minimum level needed to overdose - set fairly high to prevent constant overdoses or match your highest level stated in the OverDoseLevels table below
        HealthRemoved = 50, -- amount of health to be removed when overdosing
        OverDoseCureAmount = math.random(30,50), -- amount of overdose metadata is removed when consuming overdose_cure
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
    PickCocaLeaves = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_cs_trowel',
        Bone = 18905,
        Pos = vec3(0.12, 0.0, 0.02),
        Rot = vec3(76.0, 188.0, 34.0),
    },
    GetCement = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_cs_trowel',
        Bone = 18905,
        Pos = vec3(0.12, 0.0, 0.02),
        Rot = vec3(76.0, 188.0, 34.0),
    },
    GetGasoline = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_ld_jerrycan_01',
        Bone = 60309,
        Pos = vec3(0.06, 0.04, 0.02),
        Rot = vec3(194.0, 0.0, 0.0),
    },
    GetHydrochloricAcid = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_ld_jerrycan_01',
        Bone = 60309,
        Pos = vec3(0.06, 0.04, 0.02),
        Rot = vec3(194.0, 0.0, 0.0),
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
        AnimDict = 'switch@trevor@trev_smoking_meth',
        Anim = 'trev_smoking_meth_loop',
        Flags = 49,
    },
}



Config.Language = {
	Notifications = { 
        BusyName = 'You Are Already Doing Something',
        FailedName = 'Action failed!',
        PoliceNotifiedName = 'The Police Have Been Called!',
        AlreadyCuredName = 'You Are Not Close To Overdosing Any Time Soon, You Dont Need This At The Moment!',
        OverDosedName = 'You Have Overdosed Go See A Doctor Immediately!',
        OverDoseWarningName = 'Careful You Dont Overdose If You Take Too Many Drugs!',
        OverDoseCuredName = 'You Start To Feel Better And Less Likely To Overdose!',
        EarnedXpName = 'You Earned Some XP!',
        CancelledName = 'Cancelled',
        NothingFoundName = 'You Found Nothing This Time!',
        NoItemsName = 'You Dont Have The Right Items!',
        SearchTimerName = 'You Must Wait  ',
        PropErrorName = 'You Cant Spawn Another Processing Table Without Removing The Other One First!',
    },
	ProgressBar = { 
        PickCocaLeaves = 'Picking Coca Leaves',
        GetCement = 'Getting Cement',
        GetGasoline = 'Siphoning Gasoline',
        GetHydrochloricAcid = 'Siphoning Hydrochloric Acid',
        TakeCocaine = 'Snorting Cocaine',
        TakeCrack = 'Smoking Crack',
        PlaceTableName = 'Placing processing table',
        ProcessCocaine = 'Processing Pure Cocaine',
        ProcessCrack = 'Processing Pure Crack',
        ProcessCokeBaggy = 'Processing Bag of Coke',
        ProcessCrackBaggy = 'Processing Bag of Crack',
        CreateOverDoseCure = 'Creating Overdose Cure',
        TakeOverDoseCure = 'Taking Overdose Cure',
    },
}


