Config.Shells = { -- Default shells1
     ['Motel'] = { -- This is the key index
        label = "Motel", -- Label to display in creator menu
        shell = `standardmotel_shell`, -- Shell object name
        z = 25.0, -- How far down should be spawned
        door = {x = -0.73, y = -1.96, z = 1.40, heading = 271.29},
        objects = {
            {type = "alarm", prop = 'v_res_tre_alarmbox', x = 0.28, y = -3.56, z = 1.32, heading = -179.25, label = "Hack", icon = "fa-solid fa-laptop-code"}, -- Alarm don't remove it
            {type = "safe", prop = 'ch_prop_ch_arcade_safe_door', x = -0.02, y = 3.55, z = 1.35, heading = -0.29, label = "Crack", icon = "fa-solid fa-vault"}, -- it spawns randomly
            {type = "item", prop = 'ex_prop_ex_tv_flat_01', x = 3.25, y = -0.22, z = 1.16, heading = -89.49, itemName = "high_end_tv", label = "Grab", icon = "fa-solid fa-user-ninja"},
            
        },
        zones = { -- items: the amount of different items (from Config.ZoneRewards) u will receive after searching
            {x = 1.54, y = -3.28, z = 0.78, heading = -177.18, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = 1.3, y = 2.89, z = 1.5, heading = -0.29, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = -1.01, y = 1.05, z = 0.93, heading = -93.52, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
        },
    }, 
    
  --[[ ['Luxury1'] = { -- This is the key index
        label = "Luxury 1", -- Label to display in creator menu
        shell = `luxury_housing3_k4mb1`, -- Shell object name
        z = 25.0, -- How far down should be spawned
        door = {x = -6.01, y = -0.93, z = 1.90, heading = -90.00},
        objects = {
            {type = "alarm", prop = 'v_res_tre_alarmbox', x = -3.42, y = 0.0, z = 3.44, heading = 0.0, label = "Hack", icon = "fa-solid fa-laptop-code"}, -- Alarm don't remove it
            {type = "safe", prop = 'ch_prop_ch_arcade_safe_door', x = 4.53, y = 5.75, z = 3.40, heading = 0.0, label = "Crack", icon = "fa-solid fa-vault"}, -- it spawns randomly
            {type = "item", prop = 'ex_prop_ex_tv_flat_01', x = 1.99, y = 0.23, z = 3.45, heading = -180.0, itemName = "high_end_tv", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'as_prop_as_speakerdock', x = -0.87, y = -5.70, z = 3.10, heading = 145.0, itemName = "ipod", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'sf_prop_sf_laptop_01a', x = 4.48, y = -2.10, z = 2.50, heading = -181.20, itemName = "stolen_laptop", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'hei_heist_kit_coffeemachine_01', x = -1.95, y = -3.71, z = 3.10, heading = 0.0, itemName = "coffee_machine", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'prop_toaster_01', x = -1.30, y = -3.67, z = 3.10, heading = 0.0, itemName = "toaster", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'apa_mp_h_acc_artwalll_03', x = 0.81, y = 0.01, z = 2.55, heading = 0.0, itemName = "high_end_art", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'apa_mp_h_acc_artwalll_01', x = 6.69, y = -3.90, z = 2.55, heading = -90.0, itemName = "high_end_art", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "illegal", prop = 'prop_drug_package_02', x = 0.14, y = -5.59, z = 3.10, heading = 0.0, label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "jewelry", prop = 'ex_office_swag_jewelwatch3', x = 2.0, y = 0.49, z = 2.99, heading = -180.0, label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "money", prop = 'bkr_prop_money_wrapped_01', x = 0.86, y = -2.63, z = 3.10, heading = 0.0, label = "Grab", icon = "fa-solid fa-user-ninja"},
        },
        zones = {
            {x = 5.30, y = 1.34, z = 1.50, heading = -270.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = -2.67, y = 5.05, z = 1.05, heading = -3.74, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = 5.32, y = 3.05, z = 1.46, heading = -270.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
        },
    }, ]]
    --[[ ['Luxury2'] = { -- This is the key index
        label = "Luxury 2", -- Label to display in creator menu
        shell = `luxury_housing4_k4mb1`, -- Shell object name
        z = 25.0, -- How far down should be spawned
        door = {x = -6.01, y = -0.93, z = 1.90, heading = -90.00},
        objects = {
            {type = "alarm", prop = 'v_res_tre_alarmbox', x = -3.42, y = 0.0, z = 3.44, heading = 0.0, label = "Hack", icon = "fa-solid fa-laptop-code"}, -- Alarm don't remove it
            {type = "safe", prop = 'ch_prop_ch_arcade_safe_door', x = 4.53, y = 5.75, z = 3.40, heading = 0.0, label = "Crack", icon = "fa-solid fa-vault"}, -- it spawns randomly
            {type = "item", prop = 'ex_prop_ex_tv_flat_01', x = 1.99, y = 0.23, z = 3.45, heading = -180.0, itemName = "high_end_tv", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'as_prop_as_speakerdock', x = -0.87, y = -5.70, z = 3.10, heading = 145.0, itemName = "ipod", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'sf_prop_sf_laptop_01a', x = 4.48, y = -2.10, z = 2.50, heading = -181.20, itemName = "stolen_laptop", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'hei_heist_kit_coffeemachine_01', x = -1.95, y = -3.71, z = 3.10, heading = 0.0, itemName = "coffee_machine", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'prop_toaster_01', x = -1.30, y = -3.67, z = 3.10, heading = 0.0, itemName = "toaster", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'apa_mp_h_acc_artwalll_03', x = 0.81, y = 0.01, z = 2.55, heading = 0.0, itemName = "high_end_art", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'apa_mp_h_acc_artwalll_01', x = 6.69, y = -3.90, z = 2.55, heading = -90.0, itemName = "high_end_art", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "illegal", prop = 'prop_drug_package_02', x = 0.14, y = -5.59, z = 3.10, heading = 0.0, label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "jewelry", prop = 'ex_office_swag_jewelwatch3', x = 2.0, y = 0.49, z = 2.99, heading = -180.0, label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "money", prop = 'bkr_prop_money_wrapped_01', x = 0.86, y = -2.63, z = 3.10, heading = 0.0, label = "Grab", icon = "fa-solid fa-user-ninja"},
        },
        zones = {
            {x = 5.30, y = 1.34, z = 1.50, heading = -270.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = -2.67, y = 5.05, z = 1.05, heading = -3.74, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = 5.32, y = 3.05, z = 1.46, heading = -270.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
        },
    }, ]]
    --[[ ['LowEnd'] = { -- This is the key index
        label = "LowEnd", -- Label to display in creator menu
        shell = `kambi_furnishedhouse1`, -- Shell object name
        z = 25.0, -- How far down should be spawned
        door = {x = -0.55, y = -2.30, z = 1.99, heading = -90.00},
        objects = {
            {type = "alarm", prop = 'v_res_tre_alarmbox', x = 2.03, y = -4.00, z = 1.76, heading = -182.10, label = "Hack", icon = "fa-solid fa-laptop-code"}, -- Alarm don't remove it
            {type = "safe", prop = 'ch_prop_ch_arcade_safe_door', x = -4.72, y = 2.70, z = 1.50, heading = -270.0, label = "Crack", icon = "fa-solid fa-vault"}, -- it spawns randomly
            {type = "item", prop = 'as_prop_as_speakerdock', x = -1.56, y = 1.72, z = 1.32, heading = -90.00, itemName = "ipod", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'vw_prop_vw_wallart_131a', x = -2.70, y = 4.5, z = 1.80, heading = 0.0, itemName = "low_end_art", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'xm_prop_x17_laptop_avon', x = -0.6, y = -0.19, z = 1.295, heading = 80.0, itemName = "stolen_laptop", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "illegal", prop = 'prop_drug_package_02', x = 2.78, y = 1.36, z = 1.25, heading = 0.0, label = "Grab", icon = "fa-solid fa-user-ninja"},
        },
        zones = {
            {x = -4.03, y = 3.78, z = 1.66, heading = -87.45, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = 4.39, y = -1.60, z = 1.36, heading = -270.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
        },
    }, ]]
    ['MidApt'] = { -- This is the key index
        label = "Mid Apt", -- Label to display in creator menu
        shell = `furnitured_midapart`, -- Shell object name
        z = 25.0, -- How far down should be spawned
        door = {x = 1.37, y = -10.60, z = 1.32, heading = -5.00},
        objects = {
            {type = "alarm", prop = 'v_res_tre_alarmbox', x = 3.32, y = -9.53, z = 1.24, heading = -90.35, label = "Hack", icon = "fa-solid fa-laptop-code"}, -- Alarm don't remove it
            {type = "safe", prop = 'ch_prop_ch_arcade_safe_door', x = 4.28, y = 10.37, z = 1.35, heading = -0.29, label = "Crack", icon = "fa-solid fa-vault"}, -- it spawns randomly
            {type = "item", prop = 'prop_toaster_02', x = -2.71, y = -0.98, z = 1.02, heading = -90.0, itemName = "toaster", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "jewelry", prop = 'ex_office_swag_jewelwatch3', x = 6.19, y = 3.08, z = 0.86, heading = 0.0, label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'xm_prop_x17_laptop_avon', x = -3.7, y = 6.74, z = 0.642, heading = 80.0, itemName = "stolen_laptop", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "illegal", prop = 'prop_drug_package_02', x = 4.19, y = -5.44, z = 0.87, heading = 0.0, label = "Grab", icon = "fa-solid fa-user-ninja"},
        },
        zones = {
            {x = 0.54, y = 1.23, z = 1.0, heading = -95.0, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = 6.0, y = 9.64, z = 1.20, heading = -1.50, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = 3.66, y = 7.90, z = 0.85, heading = -75.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = 1.70, y = 8.75, z = 1.05, heading = -90.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = -7.25, y = 7.86, z = 1.30, heading = -90.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = -7.25, y = 4.47, z = 1.30, heading = -90.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = -4.23, y = -1.0, z = 1.14, heading = -180.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
        },
    },
    ['Apartment'] = { -- This is the key index
        label = "Lev Apartment", -- Label to display in creator menu
        shell = `lev_apartment_shell`, -- Shell object name
        z = 25.0, -- How far down should be spawned
        door = {x = 0.10, y = -2.32, z = 1.0, heading = -90.0},
        objects = {
            {type = "alarm", prop = 'v_res_tre_alarmbox', x = 0.25, y = -3.55, z = 1.50, heading = -180.0, label = "Hack", icon = "fa-solid fa-laptop-code"}, -- Alarm don't remove it
            {type = "safe", prop = 'ch_prop_ch_arcade_safe_door', x = 8.18, y = 2.13, z = 1.35, heading = -90.0, label = "Crack", icon = "fa-solid fa-vault"}, -- it spawns randomly
            {type = "item", prop = 'ex_prop_ex_tv_flat_01', x = 5.90, y = -1.58, z = 1.40, heading = -180.0, itemName = "high_end_tv", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'sf_prop_sf_laptop_01a', x = 1.93, y = 2.40, z = 1.13, heading = -90.00, itemName = "stolen_laptop", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "illegal", prop = 'prop_drug_package_02', x = 3.01, y = 1.43, z = 1.22, heading = 0.0, label = "Grab", icon = "fa-solid fa-user-ninja"},
        },
        zones = {
            {x = 0.40, y = 2.97, z = 1.45, heading = -2.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = -1.0, y = 0.01, z = 0.85, heading = -92.00, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = 4.02, y = 3.20, z = 0.85, heading = -14.50, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
        },
    },
    --[[ ['LowApt'] = { -- This is the key index
        label = "Low Apartment", -- Label to display in creator menu
        shell = `furnitured_lowapart`, -- Shell object name
        z = 25.0, -- How far down should be spawned
        door = {x = 4.91, y = -1.06, z = 3.33, heading = -2.95},
        objects = {
            {type = "alarm", prop = 'v_res_tre_alarmbox', x = 6.14, y = -1.65, z = 3.15, heading = -180.44, label = "Hack", icon = "fa-solid fa-laptop-code"}, -- Alarm don't remove it
            {type = "safe", prop = 'ch_prop_ch_arcade_safe_door', x = -4.33, y = 1.80, z = 3.20, heading = 90.0, label = "Crack", icon = "fa-solid fa-vault"}, -- it spawns randomly
            {type = "item", prop = 'prop_tv_04', x = 2.69, y = -2.09, z = 2.60, heading = 0.0, itemName = "low_end_tv", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'prop_tv_03', x = -3.54, y = 4.60, z = 2.80, heading = 45.0, itemName = "low_end_tv", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'ch_prop_ch_wallart_01a', x = -1.14, y = -4.01, z = 3.30, heading = 90.0, itemName = "low_end_art", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'as_prop_as_speakerdock', x = 3.15, y = 4.93, z = 2.97, heading = 0.0, itemName = "ipod", label = "Grab", icon = "fa-solid fa-user-ninja"},
            {type = "item", prop = 'prop_toaster_02', x = 6.24, y = 2.84, z = 2.97, heading = 0.0, itemName = "toaster", label = "Grab", icon = "fa-solid fa-user-ninja"},
        },
        zones = {
            {x = 6.08, y = -0.02, z = 2.11, heading = -267.99, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = -3.31, y = -1.55, z = 2.10, heading = -179.23, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
            {x = 1.23, y = -2.14, z = 2.05, heading = -2.50, label = "Search", icon = "fa-solid fa-magnifying-glass", items = 1},
        },
    }, ]]
}