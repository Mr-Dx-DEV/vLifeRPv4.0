Config = {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

-- To make this simple. Everything you need is in the config, except for discord, weapon drops, vehicle classes for cruise, hands up disabled keys, and recoil

Config.AFK = {
    ignoredGroups = {
        ['mod'] = true,
        ['admin'] = true,
        ['god'] = true,
    },
    secondsUntilKick = 1800, -- AFK Kick Time Limit (in seconds)
    kickInCharMenu = false -- Set to true if you want to kick players for being AFK even when they are in the character menu.
}

Config.HandsUp = {
    command = 'hu',
    keybind = 'X',
}

Config.Binoculars = {
    fov_max = 70.0,
    fov_min = 5.0, -- max zoom level (smaller fov is more zoom)
    zoomspeed = 10.0, -- camera zoom speed
    speed_lr = 8.0, -- speed by which the camera pans left-right
    speed_ud = 8.0, -- speed by which the camera pans up-down
    storeBinoclarKey = 177
}

-- Whether to enable or disable dispatch services
Config.DispatchServices = {
    [1] = false, -- Police Vehicles
    [2] = false, -- Police Helicopters
    [3] = false, -- Fire Department Vehicles
    [4] = false, -- Swat Vehicles
    [5] = false, -- Ambulance Vehicles
    [6] = false, -- Police Motorcycles
    [7] = false, -- Police Backup
    [8] = false, -- Police Roadblocks
    [9] = false, -- PoliceAutomobileWaitPulledOver
    [10] = false, -- PoliceAutomobileWaitCruising
    [11] = false, -- Gang Members
    [12] = false, -- Swat Helicopters
    [13] = false, -- Police Boats
    [14] = false, -- Army Vehicles
    [15] = false, -- Biker Backup
}

-- Enable or disable the wanted level
Config.EnableWantedLevel = false

-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686
Config.Discord = {
    ["IsEnabled"] = true, -- If set to true, then discord rich presence will be enabled
    ["ApplicationId"] = '1271912550543392811', -- The discord application id
    ["IconLarge"] = 'logo', -- The name of the large icon
    ["IconLargeHoverText"] = 'VLife Exclusive | BD', -- The hover text of the large icon
    ["IconSmall"] = 'logo', -- The name of the small icon
    ["loo"] = 'VLife Exclusive | BD', -- The hover text of the small icon
    ["UpdateRate"] = 60000, -- How often the player count should be updated
    ["ShowPlayerCount"] = true, -- If set to true the player count will be displayed in the rich presence
    ["MaxPlayers"] = 150, -- Maximum amount of players
    ["Buttons"] = {
        {
            text = 'Connect',
            url = 'fivem://connect/6kqomj'
        },
        --[[ {
            text = 'Discord',
            url = 'https://discord.gg/Elevate-RP'
        }, ]]
    }
}

Config.Density = {
    ['parked'] = 0.4,
    ['vehicle'] = 0.1,
    ['multiplier'] = 0.2,
    ['peds'] = 0.2,
    ['scenario'] = 0.1,
}

Config.Stun = {
    active = true,
    min = 7000,
    max = 10000
}

Config.Cruise = 'km/h'
Config.IdleCamera = true
Config.disableHandsupControls = {24, 25, 47, 58, 59, 63, 64, 71, 72, 75, 140, 141, 142, 143, 257, 263, 264}
Config.DisableAmbience = false -- Disabled distance sirens, distance car alarms, etc
Config.HarnessUses = 20
Config.DamageNeeded = 100.0 -- vehiclepush 0-1000
Config.EnableProne = false -- prone isnt recomended at this time
Config.MapText = "Vlife RP BD" -- This is the name / text shown above the map

Config.Disable = {
    disableHudComponents = {1, 2, 3, 4, 7, 9, 13, 14, 19, 20, 21, 22}, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    disableControls = {37}, -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = true -- false disables ammo display
}

Config.ConsumablesEat = {
    ["burger"] = math.random(40, 50),
    ["hotdog"] = math.random(30, 40),
    ["coldweiner"] = math.random(15, 20),
    ["hotdogbun"] = math.random(10, 20),
    ["burger_bun"] = math.random(10, 20),
    ["americancheese"] = math.random(5, 15),
    -- ["tosti"] = math.random(5, 10),
    -- ["chickennoodlesoup"] = math.random(80, 100),
    -- ["misosoup"] = math.random(80, 100),
    -- ["fries"] = math.random(80, 100),
}
Config.ConsumablesDrink = {
    -- ['coffee'] = math.random(40, 50),
    -- ['water_bottle'] = math.random(5, 10),
    -- ["kurkakola"] = math.random(5, 10),
}

Config.ConsumablesAlcohol = {

}

-- Custom Consumables hand bones
-- 18905 left hand
-- 57005 right hand
Config.ConsumablesCustom = {
    -- ['newitem'] = {
    --     ['progress'] = {
    --         label = 'Using Item...',
    --         time = 5000
    --     },
    --     ['animation'] = {
    --         animDict = "amb@prop_human_bbq@male@base",
    --         anim = "base",
    --         flags = 8,
    --     },
    --     ['prop'] = {
    --         model = false,
    --         bone = false,
    --         coords = false, -- vector 3 format
    --         rotation = false, -- vector 3 format
    --     },
    --     ['replenish'] = {
    --         type = 'Hunger', -- replenish type 'Hunger'/'Thirst' / false
    --         replenish = math.random(20, 40),
    --         isAlcohol = false, -- if you want it to add alcohol count
    --         event = false, -- 'eventname' if you want it to trigger an outside event on use useful for drugs
    --         server = false -- if the event above is a server event
    --     }
    -- }
}


Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,
    [`HYDRA`] = true,
    [`OPPRESSOR`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
    [`cargoplane2`] = true,
    [`voltic2`] = true,
    [`THRUSTER`] = true,
    [`polmav`] = true,
    [`swift`] = true,
    [`frogger`] = true,
    [`policeb`] = true,

    [`paragon`] = true,
    [`kuruma2`] = true,
    [`nightshade`] = true,
    [`dukes2`] = true,
    [`boxville5`] = true,
    
    
    
    
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.DisableVestDrawable = true -- Set to TRUE to disable the vest equipped when using heavy armor.

Config.HolsterVariant = {
    154, -- Police Holster
    155, -- Police Holster
    156, -- Police Holster
    157, -- Police Holster
    158, -- Police Holster
    159, -- Police Holster
    171,
    172,
    173,
    174,
    188,
    189
}
Config.HolsterableWeapons = {
    'WEAPON_STUNGUN',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_REVOLVER',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    --Custom Weapon
	'WEAPON_DE',
	'WEAPON_GLOCK17',
	'WEAPON_M9',
	'WEAPON_M1911',
	'WEAPON_FNX45',
	'WEAPON_GLOCK18C',
	'WEAPON_GLOCK22',
    'WEAPON_EDGE',
}

Config.Objects = { -- for object removal
    {coords = vector3(266.09,-349.35,44.74), heading = 0, length = 200, width = 200, model = "prop_sec_barier_02b"},
    {coords = vector3(285.28,-355.78,45.13), heading = 0, length = 200, width = 200, model = "prop_sec_barier_02a"},
}

-- You may add more than 2 selections and it will bring up a menu for the player to select which floor be sure to label each section though
Config.Teleports = {

    --[[ --Coke Processing Enter/Exit
    [1] = {
        [1] = {
            ['poly'] = {
                coords = vector3(909.49, -1589.22, 30.51),
                heading = 92.24,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = '[E] Enter Coke Processing'
        },
        [2] = {
            ['poly'] = {
                coords = vector3(1088.81, -3187.57, -38.99),
                heading = 181.7,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = '[E] Leave'
        }
    } ]]
}

Config.DefaultPrice = 20 -- Default price for the carwash
Config.DirtLevel = 0.1 -- Threshold for the dirt level to be counted as dirty
--[[ Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(174.81, -1736.77, 28.87),
            length = 7.0,
            width = 8.8,
            heading = 359
        }
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(25.2, -1391.98, 28.91),
            length = 6.6,
            width = 8.2,
            heading = 0
        }
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(-74.27, 6427.72, 31.02),
            length = 9.4,
            width = 8,
            heading = 315
        }
    },
    [4] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(1362.69, 3591.81, 34.5),
            length = 6.4,
            width = 8,
            heading = 21
        }
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(-699.84, -932.68, 18.59),
            length = 11.8,
            width = 5.2,
            heading = 0
        }
    }
} ]]

Config.ElevatorWaitTime = 3					-- How many seconds until the player arrives at their floor

Config.Elevators = {

	PillboxElevatorNorth = {
		{
			coords = vector3(338.47, -583.91, 74.16), heading = 71.32, level = "Heli Pad", label = "Pillbox - Main Floor",
			jobs = {
				["police"] = 0,
                ["bcso"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(332.42, -595.62, 43.28), heading = 246.22, level = "Main Floor", label = "Pillbox - Heli Pad",
			jobs = {
				["police"] = 0,
                ["bcso"] = 0,
				["ambulance"] = 0,
			},
		},
        {
			coords = vector3(341.82, -585.19, 28.79), heading = 69.89, level = "Parking Lot", label = "Pillbox - Parking",
			jobs = {
				["police"] = 0,
                ["bcso"] = 0,
				["ambulance"] = 0,
			},
		},
	},

    MRPDElevatorSouth = {
        {
			coords = vector3(464.87, -985.56, 45.21), heading = 0, level = "Top", label = "Roof Top",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
       
		{
			coords = vector3(464.76, -985.47, 40.21), heading = 0, level = "Second", label = "Second Floor",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		
		{
			coords = vector3(464.99, -985.33, 30.69), heading = 0, level = "Main", label = "Main Floor",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
        {
			coords = vector3(465.17, -985.47, 26.39), heading = 0, level = "Garage", label = "Garage",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
	},

    TropicalHeights = {
        {
			coords = vector3(288.43, -920.07, 29.46), heading = 73.84, level = "Ground Floor", label = "Ground Floor",
		},
       
		{
			coords = vector3(317.62, -915.55, 58.34), heading = 98.36, level = "Main Lobby", label = "Main Lobby",
		},
		
	},

    SandyMechanic = {
        {
			coords = vector3(1071.4506, 2732.2107, 38.7922), heading = 0, level = "Lobby", label = "Lobby",
		},
       
		{
			coords = vector3(1074.2994, 2738.8279, 45.0617), heading = 0, level = "Roof", label = "Roof Top",
		},
		
		
	},

    SkyClub = {
        {
			coords = vector3(-908.73, -446.00, 39.60), heading = 116.03, level = "Ground Floor", label = "Ground Floor",
		},
       
		{
			coords = vector3(-906.97, -447.14, 160.98), heading = 115.92, level = "Sky Club", label = "Lobby - SkyClub",
		},
		
		
	},

    SkyClub2 = {   
		{
			coords = vector3(-905.98, -451.41, 39.60), heading = 117.66, level = "Ground", label = "Ground Floor",
		},

		{
			coords = vector3(-905.74, -449.79, 160.98), heading = 20.44, level = "Sky Club", label = "Lobby - SkyClub",
		},
		
		
	},

    RacingAutos = {
         {
            coords = vector3(-312.10, -1308.53, 31.29), -- Coords, if you're new; last number is heading
            heading = 359.05, -- Heading of how will spawn on floor
            level = 'Ground Floor', -- Title 
            label = 'Go to Mechanic Shop', -- Description
        },
        {
            coords = vector3(-308.06, -1296.64, 41.93), -- Coords, if you're new; last number is heading
            heading = 356.38,
            level = 'Heli Pad',
            label = 'Go to Heli Pad',
        },
    },
-- Do not edit this part manually unless you know what you are doing
-- Do not edit this part manually unless you know what you are doing
-- Do not edit this part manually unless you know what you are doing
}