Config = {}

Config.Framework        = "qb" -- "esx"
Config.Inventory        = "ox" -- "qb", "ox", "qs"
Config.QBInventory      = "new" -- new
Config.Img              = 'ox_inventory/web/images/'
Config.Target           = "qb" -- ox !!!!!!!!! IMPORTANT
Config.FrameworkPseudo  = 'qb-core'
Config.Target           = 'qb' --ox
Config.UseInteract      = false
Config.UseBuckets       = false -- Keep it false unless you want to use props inside the apartments and houses taht uses buckets (instance) (Not Recommended)

Config.UpdatePlants         = 15            -- Update Plant data every 15 mins
Config.WaterDecay           = 0.5           -- Decrease amount of the Water every minute.
Config.SoilDecay            = 0.5           -- Decrease amount of the soil every minute.

Config.SoilThreshold        = 45            -- Value under it, the Plant Health will decrease
Config.WaterThreshold       = 45            -- Value under it, the Plant Health will decrease
Config.LightThreshold       = 45            -- Value under it, the Plant Health will decrease
Config.HealthBaseDecay      = {5, 10}       -- The decrease amount of the Plant Health when needs are missing.(water, nutrition and lights)


Config.CompostUpdateTime    = 10         -- Update Comp every 15 minutes
Config.rottenDecay          = 5           -- Value decreased for comp every Config.CompostUpdateTime

-- F : number of clones on clone,   (math.random(1,3) extra seed on clone for each F in the genetic)
Config.FgeneticBonus = math.random(1,3)  -- set it to 0 if you want to disable it
-- M : number of clones on harvest, (math.random(1,3) extra seed on harvest for each M in the genetic)
Config.MgeneticBonus = math.random(1,3)  -- set it to 0 if you want to disable it
-- Y : number of rewards,           (math.random(1,3) extra reward on harvest for each Y in the genetic) 
Config.YgeneticBonus = math.random(1,3)  -- set it to 0 if you want to disable it


----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------OPTIMISATION PART --------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- Description  : this part is responsable on deleting the not needed props when no players are nearby
-- refreshprops : is the time to check if there is someone near the props or not
-- radius       : is to check how far is the player from the prop if it is < then the prop will be deleted until someone is nearby...
Config.RefreshProps = 5     -- 15 seconds
Config.Radius       = 300.0  -- if the distance between the player and the prop is < 50 then the prop will be deleted.
----------------------------------------------------------------------------------------------------------------------------------------


-- Props 
-- MAX is 4 slots (you can not do more)
Config.Pots = {
    ['farm_pot_xs'] = {
        model       = 'prop_milk_crate_xs',
        type        = 'KITCHEN POT',
        slots       = 1,
        img         = 'nui://'..Config.Img..'farm_pot_xs.png',
        description = 'An old milk crate ready for a new life.',
    },
    ['farm_pot_s'] = {
        model       = 'prop_milk_crate_s',
        type        = 'MILK CRATE SMALL',
        slots       = 2,
        img         = 'nui://'..Config.Img..'farm_pot_s.png',
        description = 'An old milk crate ready for a new life.',
    },
    ['farm_pot_m'] = {
        model       = 'prop_milk_crate_m',
        type        = 'MILK CRATE MEDIUM',
        slots       = 3,
        img         = 'nui://'..Config.Img..'farm_pot_m.png',
        description = 'An old milk crate ready for a new life.',
    },
    ['farm_pot_l'] = {
        model       = 'prop_milk_crate_l',
        type        = 'MILK CRATE LARGE',
        slots       = 4,
        img         = 'nui://'..Config.Img..'farm_pot_l.png',
        description = 'An old milk crate ready for a new life.',
    },    
}

Config.Wheat = 'farm_wheat_comp'    -- mashing this item with any rotten item will give yeast item
Config.Yeast = 'farm_yeast'         -- mashing this item with any rotten item will give yeast item

Config.Items = {
    ['seeds'] = {
        {
            name        = 'farm_seed_tomato',
            img         = 'https://i.ibb.co/2gN8T6b/tomato-seed.png',
            label       = 'Tomato',
            reward      = 'farm_tomato',
            compost     = 'farm_tomato_comp',
            mash	    = 'farm_tomato_mash',
            fertiliser  = 5, -- round of item health / 5 ( if the health is 100 you will get 20 fertiliser) minimum you will get 1 no worries of 0.
            grow        = 3, -- 3 minutes to fully grow
            amount      = math.random(1,3),
            props       = {
                [1] = 'prop_farm_plant_one_seed',   -- stage 1
                [2] = 'prop_farm_plant_one_xs',     -- stage 2
                [3] = 'prop_farm_plant_one_s',      -- stage 3
                [4] = 'prop_farm_plant_one_m',      -- stage 4
                [5] = 'prop_farm_plant_one_l'       -- stage 5
            }
        },
        {
            name        = 'farm_seed_corn',
            img         = 'https://i.ibb.co/xDdcdJ6/corn-seed.png',
            reward      = 'farm_corn',
            compost     = 'farm_corn_comp',
            mash	    = 'farm_corn_mash',
            fertiliser  = 5, -- round of item health / 5 ( if the health is 100 you will get 20 fertiliser) minimum you will get 1 no worries of 0.
            grow        = 1, -- 3 minutes to fully grow
            amount      = math.random(1,3),
            label       = 'Corn',
            props       = {
                [1] = 'prop_farm_plant_three_seed',   -- stage 1
                [2] = 'prop_farm_plant_three_xs',     -- stage 2
                [3] = 'prop_farm_plant_three_s',      -- stage 3
                [4] = 'prop_farm_plant_three_m',      -- stage 4
                [5] = 'prop_farm_plant_three_l'       -- stage 5
            }
        },
        {
            name        = 'farm_seed_sunflower',
            img         = 'https://i.ibb.co/hYjM9Ly/sunflower-seed.png',
            reward      = 'farm_sunflower',
            compost     = 'farm_sunflower_comp',
            mash	    = 'farm_sunflower_mash',
            fertiliser  = 5, -- round of item health / 5 ( if the health is 100 you will get 20 fertiliser) minimum you will get 1 no worries of 0.
            grow        = 15, -- 3 minutes to fully grow
            amount      = math.random(1,3),
            label       = 'SunFlower',
            props       = {
                [1] = 'prop_farm_plant_two_seed',   -- stage 1
                [2] = 'prop_farm_plant_two_xs',     -- stage 2
                [3] = 'prop_farm_plant_two_s',      -- stage 3
                [4] = 'prop_farm_plant_two_m',      -- stage 4
                [5] = 'prop_farm_plant_two_l'       -- stage 5
            }
        },
        {
            name        = 'farm_seed_carrot',
            img         = 'https://i.ibb.co/bbnYJhY/carrot-seed.png',
            reward      = 'farm_carrot',
            compost     = 'farm_carrot_comp',
            mash	    = 'farm_carrot_mash',
            fertiliser  = 5, -- round of item health / 5 ( if the health is 100 you will get 20 fertiliser) minimum you will get 1 no worries of 0.
            grow        = 3, -- 3 minutes to fully grow
            amount      = math.random(1,3),
            label       = 'Carrot',
            props       = {
                [1] = 'prop_farm_plant_one_seed',   -- stage 1
                [2] = 'prop_farm_plant_one_xs',     -- stage 2
                [3] = 'prop_farm_plant_one_s',      -- stage 3
                [4] = 'prop_farm_plant_one_m',      -- stage 4
                [5] = 'prop_farm_plant_one_l'       -- stage 5
            }
        },
        {
            name        = 'farm_seed_onion',
            img         = 'https://i.ibb.co/tLFTGgH/onion-seed.png',
            reward      = 'farm_onion',
            compost     = 'farm_onion_comp',
            mash	    = 'farm_onion_mash',
            fertiliser  = 5, -- round of item health / 5 ( if the health is 100 you will get 20 fertiliser) minimum you will get 1 no worries of 0.
            grow        = 3, -- 3 minutes to fully grow
            amount      = math.random(1,3),
            label       = 'Onion',
            props       = {
                [1] = 'prop_farm_plant_one_seed',   -- stage 1
                [2] = 'prop_farm_plant_one_xs',     -- stage 2
                [3] = 'prop_farm_plant_one_s',      -- stage 3
                [4] = 'prop_farm_plant_one_m',      -- stage 4
                [5] = 'prop_farm_plant_one_l'       -- stage 5
            }
        },
        {
            name        = 'farm_seed_wheat',
            img         = 'https://i.ibb.co/Nr8SpH7/farm-seed-wheat.png',
            reward      = 'farm_wheat',
            compost     = 'farm_wheat_comp',
            mash	    = 'farm_wheat_mash',
            fertiliser  = 5, -- round of item health / 5 ( if the health is 100 you will get 20 fertiliser) minimum you will get 1 no worries of 0.
            grow        = 3, -- 3 minutes to fully grow
            amount      = math.random(1,3),
            label       = 'Wheat',
            props       = {
                [1] = 'prop_farm_plant_four_seed',   -- stage 1
                [2] = 'prop_farm_plant_four_xs',     -- stage 2
                [3] = 'prop_farm_plant_four_s',      -- stage 3
                [4] = 'prop_farm_plant_four_m',      -- stage 4
                [5] = 'prop_farm_plant_four_l'       -- stage 5
            }
        }, 
    },
    ['water'] = {
        {
            name = 'farm_water'
        }
    },
    ['fertiliser'] = {
        {
            name  = 'farm_fertilizer',
            label = 'fertilizer',
            img   = 'nui://'..Config.Img..'farm_fertilizer.png',
        }
    },
}

Config.Lights = { -- add any lights you want ...
    ['farm_light_s'] = { 
        model       = 'h4_prop_x17_sub_lampa_small_blue',
        max         = 50,  -- gives max coverage of 50% 
        min_dis    = 1.0,  -- Less than this distance, the plant will be full covered.
        max_dis    = 3.0,  -- More than this distance, the plant will not be covered at all.
    },                   
    ['farm_light_l'] = { 
        model       = 'h4_prop_x17_sub_lampa_large_blue',
        max         = 100, -- gives max coverage of 100% 
        min_dis    = 5.0,  -- Less than this distance, the plant will be full covered.
        max_dis    = 7.0,  -- More than this distance, the plant will not be covered at all.
    }, 
}

Config.Tools = { -- add any lights you want ...
    ['farm_mil'] = { 
        model       = 'prop_farming_mil',
        type        = 'mil',
    },                   
    ['farm_compost'] = { 
        model       = 'prop_farming_compost',
        type        = 'comp',
    }, 
    ['farm_sink_s'] = { 
        model       = 'prop_ff_sink_02',
        type        = 'sink',
    }, 
    ['farm_sink_m'] = { 
        model       = 'prop_bar_sink_01',
        type        = 'sink',
    }, 
    ['moon_distillation'] = { 
        model       = 'prop_moonshine',
        type        = 'moonshine',
    },  
}

--------------------- MOONSHINE CONFIG ------------------------------
Config.MoonshineTime = 45 -- 45 minutes for the moonshine to finish
Config.MoonshineItem = {
    name    = 'moon_moonshine',
    pack    = 'moon_moonshine_pack',
    amount  = 6, -- 1 pack = 6 bottles
    label   = 'Moonshine',
    effects = {
        {
            quality = 20, --less than 20% quality
            type    = 'stress',
            multi   = 1, -- 1 x quality if the quality is 20%, the drink will retrieve 20% of stress ( you can change it to 0.5, 1.5, etc..)
            effect  = 'MenuMGSelectionIn',
            periode = nil, -- nil means it doesn't depends on time
        },
        {
            quality = 40, -- 20 < quality < 40
            type    = 'stamina',
            multi   = 1,
            effect  = 'HeistTripSkipFade',
            periode = 30, -- 30 seconds
        },
        {
            quality = 60, -- 40 < quality < 60
            type    = 'sprint',
            multi   = 0.8, -- more than 0.5 it will have no effects 
            effect  = 'MP_job_load',
            periode = 30, -- 30 seconds
        }, 
        {
            quality = 80, -- 60 < quality < 80
            type    = 'health',
            multi   = 1, 
            effect  = 'MenuMGTournamentIn',
            periode = nil, -- nil means it doesn't depends on time
        }, 
        {
            quality = 100, -- 80 < quality < 100
            type    = 'armor',
            multi   = 1, 
            effect  = 'MenuMGHeistIn',
            periode = nil, -- nil means it doesn't depends on time
        }, 

    }
}

-- YOU CAN ORDER THEM THE WAY YOU WANT !!!!!!!!!!! REALLY IMPORTANT
Config.Moonshine = {
    -- 10 slots 
    [1] = {
        chemicals   = {
            ['Nd'] = 100.0, -- BEST 
            ['Hi'] = 80.0,
            ['Hu'] = 60.0,
            ['Sr'] = 40.0,
            ['Pb'] = 30.0,
            ['Hg'] = 20.0,
            ['Li'] = 10.0, -- WORST
        },
        items = { -- You must list every ingredients here (if you miss one it will not show in the ui as item) (check client/inventories.lua line 133)
            ['farm_tomato_mash'] = 100.0,-- BEST 
            ['farm_corn_mash'] = 80.0,
            ['farm_sunflower_mash'] = 50.0,
            ['farm_carrot_mash'] = 30.0,
            ['farm_onion_mash'] = 20.0,
            ['farm_wheat_mash'] = 10.0 -- -- WORST
        }
    },
    [2] = {
        chemicals   = {
            ['Hi'] = 100.0, -- BEST 
            ['Nd'] = 80.0,
            ['Sr'] = 60.0,
            ['Hu'] = 40.0,
            ['Hg'] = 30.0,
            ['Pb'] = 20.0,
            ['Li'] = 10.0, -- WORST
        },
        items = { -- You must list every ingredients here (if you miss one it will not show in the ui as item) (check client/inventories.lua line 133)
            ['farm_corn_mash'] = 100.0,-- BEST 
            ['farm_tomato_mash'] = 80.0,
            ['farm_sunflower_mash'] = 50.0,
            ['farm_carrot_mash'] = 30.0,
            ['farm_wheat_mash'] = 20.0,
            ['farm_onion_mash'] = 10.0 -- -- WORST
        }
    },
    [3] = {
        chemicals   = {
            ['Pb'] = 100.0, -- BEST 
            ['Hg'] = 80.0,
            ['Hu'] = 60.0,
            ['Sr'] = 40.0,
            ['Nd'] = 30.0,
            ['Hi'] = 20.0,
            ['Li'] = 10.0, -- WORST
        },
        items = { -- You must list every ingredients here (if you miss one it will not show in the ui as item) (check client/inventories.lua line 133)
            ['farm_onion_mash'] = 100.0,-- BEST 
            ['farm_corn_mash'] = 80.0,
            ['farm_sunflower_mash'] = 50.0,
            ['farm_wheat_mash'] = 30.0,
            ['farm_tomato_mash'] = 20.0,
            ['farm_carrot_mash'] = 10.0 -- -- WORST
        }
    },
    [4] = {
        chemicals   = {
            ['Hg'] = 100.0, -- BEST 
            ['Sr'] = 80.0,
            ['Hu'] = 60.0,
            ['Hi'] = 40.0,
            ['Pb'] = 30.0,
            ['Nd'] = 20.0,
            ['Li'] = 10.0, -- WORST
        },
        items = { -- You must list every ingredients here (if you miss one it will not show in the ui as item) (check client/inventories.lua line 133)
            ['farm_wheat_mash'] = 100.0,-- BEST 
            ['farm_onion_mash'] = 80.0,
            ['farm_sunflower_mash'] = 50.0,
            ['farm_carrot_mash'] = 30.0,
            ['farm_corn_mash'] = 20.0,
            ['farm_tomato_mash'] = 10.0 -- -- WORST
        }
    },
    [5] = {
        chemicals   = {
            ['Nd'] = 100.0, -- BEST 
            ['Hi'] = 80.0,
            ['Hu'] = 60.0,
            ['Sr'] = 40.0,
            ['Pb'] = 30.0,
            ['Hg'] = 20.0,
            ['Li'] = 10.0, -- WORST
        },
        items = { -- You must list every ingredients here (if you miss one it will not show in the ui as item) (check client/inventories.lua line 133)
            ['farm_tomato_mash'] = 100.0,-- BEST 
            ['farm_corn_mash'] = 80.0,
            ['farm_sunflower_mash'] = 50.0,
            ['farm_carrot_mash'] = 30.0,
            ['farm_onion_mash'] = 20.0,
            ['farm_wheat_mash'] = 10.0 -- -- WORST
        }
    },
    [6] = {
        chemicals   = {
            ['Nd'] = 100.0, -- BEST 
            ['Hi'] = 80.0,
            ['Hu'] = 60.0,
            ['Sr'] = 40.0,
            ['Pb'] = 30.0,
            ['Hg'] = 20.0,
            ['Li'] = 10.0, -- WORST
        },
        items = { -- You must list every ingredients here (if you miss one it will not show in the ui as item) (check client/inventories.lua line 133)
            ['farm_tomato_mash'] = 100.0,-- BEST 
            ['farm_corn_mash'] = 80.0,
            ['farm_sunflower_mash'] = 50.0,
            ['farm_carrot_mash'] = 30.0,
            ['farm_onion_mash'] = 20.0,
            ['farm_wheat_mash'] = 10.0 -- -- WORST
        }
    },
    [7] = {
        chemicals   = {
            ['Nd'] = 100.0, -- BEST 
            ['Hi'] = 80.0,
            ['Hu'] = 60.0,
            ['Sr'] = 40.0,
            ['Pb'] = 30.0,
            ['Hg'] = 20.0,
            ['Li'] = 10.0, -- WORST
        },
        items = { -- You must list every ingredients here (if you miss one it will not show in the ui as item) (check client/inventories.lua line 133)
            ['farm_tomato_mash'] = 100.0,-- BEST 
            ['farm_corn_mash'] = 80.0,
            ['farm_sunflower_mash'] = 50.0,
            ['farm_carrot_mash'] = 30.0,
            ['farm_onion_mash'] = 20.0,
            ['farm_wheat_mash'] = 10.0 -- -- WORST
        }
    },
    [8] = {
        chemicals   = {
            ['Nd'] = 100.0, -- BEST 
            ['Hi'] = 80.0,
            ['Hu'] = 60.0,
            ['Sr'] = 40.0,
            ['Pb'] = 30.0,
            ['Hg'] = 20.0,
            ['Li'] = 10.0, -- WORST
        },
        items = { -- You must list every ingredients here (if you miss one it will not show in the ui as item) (check client/inventories.lua line 133)
            ['farm_tomato_mash'] = 100.0,-- BEST 
            ['farm_corn_mash'] = 80.0,
            ['farm_sunflower_mash'] = 50.0,
            ['farm_carrot_mash'] = 30.0,
            ['farm_onion_mash'] = 20.0,
            ['farm_wheat_mash'] = 10.0 -- -- WORST
        }
    },
    [9] = {
        chemicals   = {
            ['Nd'] = 100.0, -- BEST 
            ['Hi'] = 80.0,
            ['Hu'] = 60.0,
            ['Sr'] = 40.0,
            ['Pb'] = 30.0,
            ['Hg'] = 20.0,
            ['Li'] = 10.0, -- WORST
        },
        items = { -- You must list every ingredients here (if you miss one it will not show in the ui as item) (check client/inventories.lua line 133)
            ['farm_tomato_mash'] = 100.0,-- BEST 
            ['farm_corn_mash'] = 80.0,
            ['farm_sunflower_mash'] = 50.0,
            ['farm_carrot_mash'] = 30.0,
            ['farm_onion_mash'] = 20.0,
            ['farm_wheat_mash'] = 10.0 -- -- WORST
        }
    },
    [10] = {
        chemicals   = {
            ['Nd'] = 100.0, -- BEST 
            ['Hi'] = 80.0,
            ['Hu'] = 60.0,
            ['Sr'] = 40.0,
            ['Pb'] = 30.0,
            ['Hg'] = 20.0,
            ['Li'] = 10.0, -- WORST
        },
        items = { -- You must list every ingredients here (if you miss one it will not show in the ui as item) (check client/inventories.lua line 133)
            ['farm_tomato_mash'] = 100.0,-- BEST 
            ['farm_corn_mash'] = 80.0,
            ['farm_sunflower_mash'] = 50.0,
            ['farm_carrot_mash'] = 30.0,
            ['farm_onion_mash'] = 20.0,
            ['farm_wheat_mash'] = 10.0 -- -- WORST
        }
    },
}

Config.Chemicals = { -- do not touch this, please
    'Nd',
    'Hi',
    'Hu',
    'Sr',
    'Pb',
    'Hg',
    'Li',
}