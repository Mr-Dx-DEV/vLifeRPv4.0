-- Configuration settings for the GPS system.
Config                  = {}

-- Debug print setting for displaying debug messages.
Config.DebugPrint       = true

-- Locale setting for language localization.
Config.Locale           = "en"

-- Do not CHANGE !!!
Config.FrameWork        = nil

-- ("esx_notify" | "qb_notify" | "custom_notify") -- > System to be used
Config.NotifyType       = "qb_notify"

-- ("ox_inventory" | "qb-inventory" | "custom") System to be used
Config.InventoryType    = "ox_inventory"

-- ("ox_target" | "qb-target") System to be used
Config.TargetType       = "ox_target"

Config.CraftableItems_1 = {
    --[[ [1] = {
        name = "electronickit",
        label = "Electronic Kit",
        propModel = "prop_prototype_minibomb",
        count = 1,
        duration = 300000,
        image = "items/electronickit.png",
        ingredients = {
            pcb = 5,
            copperwire = 5,
            plastic = 10,
            steel = 5,
            blacktape = 10,
        },
        price = 1000,
    },
    [2] = {
        name = "ignition_bomb",
        label = "Ignition Explosive",
        propModel = "prop_prototype_minibomb",
        count = 1,
        duration = 300000,
        image = "items/ignition_bomb.png",
        ingredients = {
            gunpowder = 120,
            rubber = 50,
            plastic = 50,
            copperwire = 60,
            spring = 10,
            metal = 10,
            remote = 5,
            electronickit = 10,
            steel = 50,
            blacktape = 20,
            rope = 20,
        },
        price = 1000,
    },
    [3] = {
        name = "c4",
        label = "C4 Bomb",
        propModel = "prop_c4_final",
        count = 1,
        duration = 300000,
        image = "items/c4.png",
        ingredients = {
            gunpowder = 200,
            rubber = 100,
            aluminum = 20,
            copperwire = 30,
            spring = 15,
            steel = 50,
            blacktape = 25,
            rope = 10,
        },
        price = 1000,
    },
    [4] = {
        name = "remote_bomb",
        label = "Remote Explosive",
        propModel = "v_res_tt_tvremote",
        count = 1,
        duration = 300000,
        image = "items/remote_bomb.png",
        ingredients = {
            remote = 1,
            electronickit = 10,
            gunpowder = 120,
            rubber = 20,
            aluminum = 30,
            copperwire = 20,
            spring = 20,
            steel = 60,
            blacktape = 40,
        },
        price = 1000,
    },
    [5] = {
        name = "impact_bomb",
        label = "Impact Explosive",
        propModel = "prop_prototype_minibomb",
        count = 1,
        duration = 300000,
        image = "items/impact_bomb.png",
        ingredients = {
            electronickit = 10,
            gunpowder = 150,
            rubber = 20,
            aluminum = 30,
            copperwire = 50,
            spring = 20,
            steel = 70,
            blacktape = 10,
        },
        price = 1000,
    },
    [6] = {
        name = "phone_bomb",
        label = "Detonator Device",
        propModel = "prop_prototype_minibomb",
        count = 1,
        duration = 300000,
        image = "items/phone_bomb.png",
        ingredients = {
            phone = 1,
            electronickit = 20,
            gunpowder = 100,
            rubber = 20,
            aluminum = 30,
            copperwire = 20,
            spring = 20,
            steel = 45,
            blacktape = 20,
            rope = 20,
        },
        price = 1000,
    }, ]]
    [1] = {
        name = "at_flashlight",
        label = "Flashlight",
        propModel = "w_at_pi_flsh",
        count = 1,
        duration = 300000,
        image = "items/flashlight.png",
        ingredients = {
            rubber = 150,
            scrapmetal = 50,
            spring = 100,
            plastic = 60,
            steel = 60,
            rope = 20,
        },
        price = 1000,
    },
    [2] = {
        name = "at_grip",
        label = "SMG Grip",
        propModel = "w_at_ar_afgrip",
        count = 1,
        duration = 300000,
        image = "items/grip.png",
        ingredients = {
            rubber = 300,
            spring = 300,
            plastic = 100,
            metalscrap = 100,
            iron = 100,
            rope = 100,
        },
        price = 1000,
    },
    [3] = {
        name = "at_scope_medium",
        label = "Medium Scope",
        propModel = "w_at_scope_medium",
        count = 1,
        duration = 300000,
        image = "items/scope_medium.png",
        ingredients = {
            rubber = 500,
            metalscrap = 300,
            metal = 200,
            spring = 400,
            plastic = 200,
            rope = 200,
            iron = 100,
        },
        price = 1000,
    },
    [4] = {
        name = "at_suppressor_light",
        label = "Light Suppressor",
        propModel = "w_at_pi_supp",
        count = 1,
        duration = 300000,
        image = "items/suppressor_light.png",
        ingredients = {
            steel = 200,
            aluminum = 100,
            spring = 50,
            metal = 100,
            plastic = 50,
            iron = 50,
            metalscrap = 70,
        },
        price = 1000,
    },
    [5] = {
        name = "at_clip_extended_pistol",
        label = "Extended Pistol Clip",
        propModel = "w_pi_pistolmag1",
        count = 1,
        duration = 300000,
        image = "items/extended_pistol_clip.png",
        ingredients = {
            metal = 300,
            iron = 100,
            metalscrap = 100,
            plastic = 100,
            spring = 300,
            rubber = 150,
        },
        price = 1000,
    },
    [6] = {
        name = "at_clip_extended_smg",
        label = "Extended SMG Clip",
        propModel = "w_sb_smgmag1",
        count = 1,
        duration = 300000,
        image = "items/extended_smg_clip.png",
        ingredients = {
            metal = 500,
            steel = 500,
            metalscrap = 350,
            plastic = 300,
            spring = 500,
            rubber = 300,
            iron = 200,
        },
        price = 1000,
    },
    [7] = {
        name = "at_clip_extended_rifle",
        label = "Extended Rifle Clip",
        propModel = "w_ar_riflemag1",
        count = 1,
        duration = 300000,
        image = "items/extended_rifle_clip.png",
        ingredients = {
            glass = 300,
            plastic = 300,
            iron = 100,
            metal = 300,
            rubber = 100,
        },
        price = 1000,
    },
    [8] = {
        name = "at_clip_drum_rifle",
        label = "Drum Rifle Clip",
        propModel = "w_ar_assaultrifle_mag2",
        count = 1,
        duration = 300000,
        image = "items/drum_rifle_clip.png",
        ingredients = {
            glass = 500,
            plastic = 500,
            metalscrap = 300,
            metal = 200,
            rubber = 300,
        },
        price = 1000,
    },
    [9] = {
        name = "at_clip_drum_pistol",
        label = "Drum Pistol Clip",
        propModel = "w_ar_carbinerifle_mag2",
        count = 1,
        duration = 300000,
        image = "items/drum_pistol_clip.png",
        ingredients = {
            rubber = 500,
            plastic = 500,
            metalscrap = 200,
            metal = 200,
            iron = 150,
            spring = 200,
        },
        price = 1000,
    },
    [10] = {
        name = "at_clip_clear",
        label = "Clear Clip",
        propModel = "w_ar_carbinerifle_mag1",
        count = 1,
        duration = 300000,
        image = "items/clear_clip.png",
        ingredients = {
            rubber = 500,
            plastic = 500,
            metalscrap = 200,
            metal = 200,
            iron = 150,
            spring = 200,
        },
        price = 1000,
    },
    [11] = {
        name = "at_clip_100_pistol",
        label = "100 Round Pistol Clip",
        propModel = "w_ar_bullpuprifle_mag2",
        count = 1,
        duration = 300000,
        image = "items/100_round_pistol_clip.png",
        ingredients = {
            rubber = 500,
            plastic = 500,
            metalscrap = 200,
            metal = 200,
            iron = 150,
            spring = 200,
        },
        price = 1000,
    },
    [12] = {
        name = "at_clip_drum_pistol",
        label = "50 Round Drum",
        propModel = "w_ar_carbinerifle_mag2",
        count = 1,
        duration = 300000,
        image = "items/at_clip_drum_pistol.png",
        ingredients = {
            rubber = 500,
            plastic = 500,
            metalscrap = 200,
            metal = 200,
            iron = 150,
            spring = 200,
        },
        price = 1000,
    },

    [13] = {
        name = "WEAPON_BAR15",
        label = "AR-15",
        propModel = "w_ar_kyrosbar15",
        count = 1,
        duration = 300000,
        image = "weapons/WEAPON_BAR15.png",
        ingredients = {
            rifleblueprint = 1,
            handgurd = 1,
            weapontrigger = 1,
            triggerguard = 1,
            barrelextension = 1,
            metal = 700,
            iron = 400,
            plastic = 500,
            rubber = 400,
            spring = 500,
        },
        price = 1000,
    },
    [14] = {
        name = "WEAPON_LBTARP",
        label = "LB TAN ARP",
        propModel = "w_ar_kyroslbtarp",
        count = 1,
        duration = 300000,
        image = "weapons/WEAPON_LBTARP.png",
        ingredients = {
            rifleblueprint = 2,
            handgurd = 1,
            weapontrigger = 1,
            triggerguard = 1,
            barrelextension = 1,
            metal = 700,
            iron = 500,
            plastic = 600,
            rubber = 500,
            spring = 500,
        },
        price = 1000,
    },
    [15] = {
        name = "WEAPON_M500",
        label = "MOSSBERG 500",
        propModel = "w_sg_kyrosm500",
        count = 1,
        duration = 300000,
        image = "weapons/WEAPON_M500.png",
        ingredients = {
            shortgunblueprint = 1,
            handgurd = 1,
            weapontrigger = 1,
            triggerguard = 1,
            barrelextension = 1,
            metal = 700,
            iron = 450,
            plastic = 600,
            rubber = 500,
            spring = 500,
        },
        price = 1000,
    },
    [16] = {
        name = "WEAPON_T1911",
        label = "TAN 1911",
        propModel = "w_pi_kyrostan1911",
        count = 1,
        duration = 300000,
        image = "weapons/WEAPON_T1911.png",
        ingredients = {
            handgurd = 1,
            weapontrigger = 1,
            triggerguard = 1,
            barrelextension = 1,
            metal = 400,
            iron = 200,
            plastic = 300,
            rubber = 150,
            spring = 200,
        },
        price = 1000,
    },
    [17] = {
        name = "WEAPON_TEC9S",
        label = "TEC 9 W STRAP",
        propModel = "w_sb_kyrostec9s",
        count = 1,
        duration = 300000,
        image = "weapons/WEAPON_TEC9S.png",
        ingredients = {
            pistolblueprint = 1,
            handgurd = 1,
            weapontrigger = 1,
            triggerguard = 1,
            barrelextension = 1,
            metal = 250,
            iron = 150,
            plastic = 100,
            spring = 100,
        },
        price = 1000,
    },
    
}

-- Enable a shop to access the crafting menu
Config.CraftingTables   = {
    [1] = {
        active = true,
        name = "Crafting Station",
        coords = vector4(148.364838, 317.591217, 110.5, 204.09),
        cam = {
            coords = vector3(147.80, 318.8, 112.6),
            rotation = vector3(185.0, 180.0, 25.00),
        },
        distance = 2.0,
        blip = {
            active = false,
            name = "Crafting Station",
            spriteId = 544,
            color = 2,
            scale = 0.7
        },
        object = {
            name = "gr_prop_gr_bench_02b",
            preview_spawn_coord = vector3(148.40, 317.75, 112.50),
            rotation = vector3(0.0, 0.0, 30.0),
        },
        -- "target" | "drawtext"
        interact_type = "target",
        -- Bench theme color: red|blue|green|orange
        color = "red",
        -- You can choose different items for each bench.
        craftableItems = Config.CraftableItems_1,
        -- nil or "mechanic" or {mechanic = 1, police = 1},
        jobs = nil
    },
}

Config.WeaponAttachment = {
    Bones = {
        ["WAPClip"]     = { label = "Magazine", key = "clip", shift_left = -2, shift_top = 13 },
        ["Gun_GripR"]   = { label = "Skin", key = "skin", shift_left = 2, shift_top = 8 },
        ["WAPSupp"]     = { label = "Muzzle", key = "suppressor", shift_left = -5, shift_top = 8 },
        ["WAPFlshLasr"] = { label = "Tactical", key = "flashlight", shift_left = -8, shift_top = -12 },
        ["WAPScop"]     = { label = "Scope", key = "scope", shift_left = -1, shift_top = -10 },
        ["WAPGrip"]     = { label = "Grip", key = "grip", shift_left = -4, shift_top = 5 },
    },
}

Config.Weapons          = {
    ["weapon_pistol"] = {
        components = {
            { item = "at_clip_pistol",          type = "clip",       hash = "COMPONENT_PISTOL_CLIP_01" },
            { item = "at_clip_extended_pistol", type = "clip",       hash = "COMPONENT_PISTOL_CLIP_02" },
            { item = "at_flashlight",           type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "at_suppressor_light",     type = "suppressor", hash = "COMPONENT_AT_PI_SUPP_02" },
            { item = "at_skin_luxe",            type = "skin",       hash = "COMPONENT_PISTOL_VARMOD_LUXE" }
        }
    },
    ["weapon_combatpistol"] = {
        components = {
            { item = "at_clip_pistol",          type = "clip",       hash = "COMPONENT_COMBATPISTOL_CLIP_01" },
            { item = "at_clip_extended_pistol", type = "clip",       hash = "COMPONENT_COMBATPISTOL_CLIP_02" },
            { item = "at_flashlight",           type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "at_suppressor_light",     type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" },
            { item = "at_skin_luxe",            type = "skin",       hash = "COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_appistol"] = {
        components = {
            { item = "at_clip_pistol",          type = "clip",       hash = "COMPONENT_APPISTOL_CLIP_01" },
            { item = "at_clip_extended_pistol", type = "clip",       hash = "COMPONENT_APPISTOL_CLIP_02" },
            { item = "at_flashlight",           type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "at_suppressor_light",     type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" },
            { item = "at_skin_luxe",            type = "skin",       hash = "COMPONENT_APPISTOL_VARMOD_LUXE" }
        }
    },
    ["weapon_pistol50"] = {
        components = {
            { item = "at_clip_pistol",          type = "clip",       hash = "COMPONENT_PISTOL50_CLIP_01" },
            { item = "at_clip_extended_pistol", type = "clip",       hash = "COMPONENT_PISTOL50_CLIP_02" },
            { item = "at_flashlight",           type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "at_suppressor_heavy",     type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "at_skin_luxe",            type = "skin",       hash = "COMPONENT_PISTOL50_VARMOD_LUXE" }
        }
    },
    ["weapon_snspistol"] = {
        components = {
            { item = "at_clip_pistol",          type = "clip", hash = "COMPONENT_SNSPISTOL_CLIP_01" },
            { item = "at_clip_extended_pistol", type = "clip", hash = "COMPONENT_SNSPISTOL_CLIP_02" },
            { item = "at_skin_luxe",            type = "skin", hash = "COMPONENT_SNSPISTOL_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_heavypistol"] = {
        components = {
            { item = "at_clip_pistol",          type = "clip",       hash = "COMPONENT_HEAVYPISTOL_CLIP_01" },
            { item = "at_clip_extended_pistol", type = "clip",       hash = "COMPONENT_HEAVYPISTOL_CLIP_02" },
            { item = "at_flashlight",           type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "at_suppressor_light",     type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" },
            { item = "at_skin_luxe",            type = "skin",       hash = "COMPONENT_HEAVYPISTOL_VARMOD_LUXE" }
        }
    },
    ["weapon_vintagepistol"] = {
        components = {
            { item = "at_clip_pistol",          type = "clip",       hash = "COMPONENT_VINTAGEPISTOL_CLIP_01" },
            { item = "at_clip_extended_pistol", type = "clip",       hash = "COMPONENT_VINTAGEPISTOL_CLIP_02" },
            { item = "at_suppressor_light",     type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" }
        }
    },
    ["weapon_machinepistol"] = {
        components = {
            { item = "at_clip_smg",          type = "clip",       hash = "COMPONENT_MACHINEPISTOL_CLIP_01" },
            { item = "at_clip_extended_smg", type = "clip",       hash = "COMPONENT_MACHINEPISTOL_CLIP_02" },
            { item = "at_clip_drum_smg",     type = "clip",       hash = "COMPONENT_MACHINEPISTOL_CLIP_03" },
            { item = "at_suppressor_light",  type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" }
        }
    },
    ["weapon_smg"] = {
        components = {
            { item = "at_clip_smg",          type = "clip",       hash = "COMPONENT_SMG_CLIP_01" },
            { item = "at_clip_extended_smg", type = "clip",       hash = "COMPONENT_SMG_CLIP_02" },
            { item = "at_clip_drum_smg",     type = "clip",       hash = "COMPONENT_SMG_CLIP_03" },
            { item = "at_flashlight",        type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_scope_macro",       type = "scope",      hash = "COMPONENT_AT_SCOPE_MACRO_02" },
            { item = "at_suppressor_light",  type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" },
            { item = "at_skin_luxe",         type = "skin",       hash = "COMPONENT_SMG_VARMOD_LUXE" }
        }
    },
    ["weapon_assaultsmg"] = {
        components = {
            { item = "at_clip_smg",          type = "clip",       hash = "COMPONENT_ASSAULTSMG_CLIP_01" },
            { item = "at_clip_extended_smg", type = "clip",       hash = "COMPONENT_ASSAULTSMG_CLIP_02" },
            { item = "at_flashlight",        type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_scope_macro",       type = "scope",      hash = "COMPONENT_AT_SCOPE_MACRO" },
            { item = "at_suppressor_heavy",  type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "at_skin_luxe",         type = "skin",       hash = "COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_microsmg"] = {
        components = {
            { item = "at_clip_smg",          type = "clip",       hash = "COMPONENT_MICROSMG_CLIP_01" },
            { item = "at_clip_extended_smg", type = "clip",       hash = "COMPONENT_MICROSMG_CLIP_02" },
            { item = "at_flashlight",        type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "at_scope_macro",       type = "scope",      hash = "COMPONENT_AT_SCOPE_MACRO" },
            { item = "at_suppressor_heavy",  type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "at_skin_luxe",         type = "skin",       hash = "COMPONENT_MICROSMG_VARMOD_LUXE" }
        }
    },
    ["weapon_minismg"] = {
        components = {
            { item = "at_clip_smg",          type = "clip", hash = "COMPONENT_MINISMG_CLIP_01" },
            { item = "at_clip_extended_smg", type = "clip", hash = "COMPONENT_MINISMG_CLIP_02" }
        }
    },
    ["weapon_combatpdw"] = {
        components = {
            { item = "at_clip_smg",          type = "clip",       hash = "COMPONENT_COMBATPDW_CLIP_01" },
            { item = "at_clip_extended_smg", type = "clip",       hash = "COMPONENT_COMBATPDW_CLIP_02" },
            { item = "at_clip_drum_smg",     type = "clip",       hash = "COMPONENT_COMBATPDW_CLIP_03" },
            { item = "at_flashlight",        type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_grip",              type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "at_scope_small",       type = "scope",      hash = "COMPONENT_AT_SCOPE_SMALL" }
        }
    },
    ["weapon_pumpshotgun"] = {
        components = {
            { item = "at_flashlight",       type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_suppressor_light", type = "suppressor", hash = "COMPONENT_AT_SR_SUPP" },
            { item = "at_skin_luxe",        type = "skin",       hash = "COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_sawnoffshotgun"] = {
        components = {
            { item = "at_skin_luxe", type = "skin", hash = "COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE" }
        }
    },
    ["weapon_assaultshotgun"] = {
        components = {
            { item = "at_clip_shotgun",          type = "clip",       hash = "COMPONENT_ASSAULTSHOTGUN_CLIP_01" },
            { item = "at_clip_extended_shotgun", type = "clip",       hash = "COMPONENT_ASSAULTSHOTGUN_CLIP_02" },
            { item = "at_flashlight",            type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_suppressor_heavy",      type = "suppressor", hash = "COMPONENT_AT_AR_SUPP" },
            { item = "at_grip",                  type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" }
        }
    },
    ["weapon_bullpupshotgun"] = {
        components = {
            { item = "at_flashlight",       type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_suppressor_heavy", type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "at_grip",             type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" }
        }
    },
    ["weapon_heavyshotgun"] = {
        components = {
            { item = "at_clip_shotgun",          type = "clip",       hash = "COMPONENT_HEAVYSHOTGUN_CLIP_01" },
            { item = "at_clip_extended_shotgun", type = "clip",       hash = "COMPONENT_HEAVYSHOTGUN_CLIP_02" },
            { item = "at_clip_drum_shotgun",     type = "clip",       hash = "COMPONENT_HEAVYSHOTGUN_CLIP_03" },
            { item = "at_flashlight",            type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_suppressor_heavy",      type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "at_grip",                  type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" }
        }
    },
    ["weapon_assaultrifle"] = {
        components = {
            { item = "at_clip_rifle",          type = "clip",       hash = "COMPONENT_ASSAULTRIFLE_CLIP_01" },
            { item = "at_clip_extended_rifle", type = "clip",       hash = "COMPONENT_ASSAULTRIFLE_CLIP_02" },
            { item = "at_clip_drum_rifle",     type = "clip",       hash = "COMPONENT_ASSAULTRIFLE_CLIP_03" },
            { item = "at_flashlight",          type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_scope_macro",         type = "scope",      hash = "COMPONENT_AT_SCOPE_MACRO" },
            { item = "at_suppressor_heavy",    type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "at_grip",                type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "at_skin_luxe",           type = "skin",       hash = "COMPONENT_ASSAULTRIFLE_VARMOD_LUXE" }
        }
    },
    ["weapon_carbinerifle"] = {
        components = {
            { item = "at_clip_rifle",          type = "clip",       hash = "COMPONENT_CARBINERIFLE_CLIP_01" },
            { item = "at_clip_extended_rifle", type = "clip",       hash = "COMPONENT_CARBINERIFLE_CLIP_02" },
            { item = "at_clip_drum_rifle",     type = "clip",       hash = "COMPONENT_CARBINERIFLE_CLIP_03" },
            { item = "at_flashlight",          type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_scope_medium",        type = "scope",      hash = "COMPONENT_AT_SCOPE_MEDIUM" },
            { item = "at_suppressor_heavy",    type = "suppressor", hash = "COMPONENT_AT_AR_SUPP" },
            { item = "at_grip",                type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "at_skin_luxe",           type = "skin",       hash = "COMPONENT_CARBINERIFLE_VARMOD_LUXE" }
        }
    },
    ["weapon_advancedrifle"] = {
        components = {
            { item = "at_clip_rifle",          type = "clip",       hash = "COMPONENT_ADVANCEDRIFLE_CLIP_01" },
            { item = "at_clip_extended_rifle", type = "clip",       hash = "COMPONENT_ADVANCEDRIFLE_CLIP_02" },
            { item = "at_flashlight",          type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_scope_small",         type = "scope",      hash = "COMPONENT_AT_SCOPE_SMALL" },
            { item = "at_suppressor_heavy",    type = "suppressor", hash = "COMPONENT_AT_AR_SUPP" },
            { item = "at_skin_luxe",           type = "skin",       hash = "COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE" }
        }
    },
    ["weapon_specialcarbine"] = {
        components = {
            { item = "at_clip_rifle",          type = "clip",       hash = "COMPONENT_SPECIALCARBINE_CLIP_01" },
            { item = "at_clip_extended_rifle", type = "clip",       hash = "COMPONENT_SPECIALCARBINE_CLIP_02" },
            { item = "at_clip_drum_rifle",     type = "clip",       hash = "COMPONENT_SPECIALCARBINE_CLIP_03" },
            { item = "at_flashlight",          type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_scope_medium",        type = "scope",      hash = "COMPONENT_AT_SCOPE_MEDIUM" },
            { item = "at_suppressor_heavy",    type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "at_grip",                type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "at_skin_luxe",           type = "skin",       hash = "COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_bullpuprifle"] = {
        components = {
            { item = "at_clip_rifle",          type = "clip",       hash = "COMPONENT_BULLPUPRIFLE_CLIP_01" },
            { item = "at_clip_extended_rifle", type = "clip",       hash = "COMPONENT_BULLPUPRIFLE_CLIP_02" },
            { item = "at_flashlight",          type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_scope_small",         type = "scope",      hash = "COMPONENT_AT_SCOPE_SMALL" },
            { item = "at_suppressor_heavy",    type = "suppressor", hash = "COMPONENT_AT_AR_SUPP" },
            { item = "at_grip",                type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "at_skin_luxe",           type = "skin",       hash = "COMPONENT_BULLPUPRIFLE_VARMOD_LOW" }
        }
    },
    ["weapon_compactrifle"] = {
        components = {
            { item = "at_clip_rifle",          type = "clip", hash = "COMPONENT_COMPACTRIFLE_CLIP_01" },
            { item = "at_clip_extended_rifle", type = "clip", hash = "COMPONENT_COMPACTRIFLE_CLIP_02" },
            { item = "at_clip_drum_rifle",     type = "clip", hash = "COMPONENT_COMPACTRIFLE_CLIP_03" }
        }
    },
    ["weapon_mg"] = {
        components = {
            { item = "at_clip_extended_mg", type = "clip",  hash = "COMPONENT_MG_CLIP_02" },
            { item = "at_scope_small",      type = "scope", hash = "COMPONENT_AT_SCOPE_SMALL_02" },
            { item = "at_skin_luxe",        type = "skin",  hash = "COMPONENT_MG_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_combatmg"] = {
        components = {
            { item = "at_clip_extended_mg", type = "clip",  hash = "COMPONENT_COMBATMG_CLIP_01" },
            { item = "at_clip_extended_mg", type = "clip",  hash = "COMPONENT_COMBATMG_CLIP_02" },
            { item = "at_scope_medium",     type = "scope", hash = "COMPONENT_AT_SCOPE_MEDIUM" },
            { item = "at_grip",             type = "grip",  hash = "COMPONENT_AT_AR_AFGRIP" },
        }
    },
    ["weapon_gusenberg"] = {
        components = {
            { item = "at_clip_extended_mg", type = "clip", hash = "COMPONENT_GUSENBERG_CLIP_01" },
            { item = "at_clip_extended_mg", type = "clip", hash = "COMPONENT_GUSENBERG_CLIP_02" },
        }
    },
    ["weapon_sniperrifle"] = {
        components = {
            { item = "at_scope_large",      type = "scope",      hash = "COMPONENT_AT_SCOPE_LARGE" },
            { item = "at_scope_advanced",   type = "scope",      hash = "COMPONENT_AT_SCOPE_MAX" },
            { item = "at_suppressor_heavy", type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "at_skin_luxe",        type = "skin",       hash = "COMPONENT_SNIPERRIFLE_VARMOD_LUXE" }
        }
    },
    ["weapon_heavysniper"] = {
        components = {
            { item = "at_scope_large",    type = "scope", hash = "COMPONENT_AT_SCOPE_LARGE" },
            { item = "at_scope_advanced", type = "scope", hash = "COMPONENT_AT_SCOPE_MAX" }
        }
    },
    ["weapon_marksmanrifle"] = {
        components = {
            { item = "at_clip_sniper",          type = "clip",       hash = "COMPONENT_MARKSMANRIFLE_CLIP_01" },
            { item = "at_clip_extended_sniper", type = "clip",       hash = "COMPONENT_MARKSMANRIFLE_CLIP_02" },
            { item = "at_flashlight",           type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "at_scope_large",          type = "scope",      hash = "COMPONENT_AT_SCOPE_LARGE_MK2" },
            { item = "at_suppressor_heavy",     type = "suppressor", hash = "COMPONENT_AT_AR_SUPP" },
            { item = "at_grip",                 type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "at_skin_luxe",            type = "skin",       hash = "COMPONENT_MARKSMANRIFLE_VARMOD_LUXE" }
        }
    }
}

Config.Weapons_QB       = {
    ["weapon_pistol"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_PISTOL_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_PISTOL_CLIP_02" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_PI_SUPP_02" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_PISTOL_VARMOD_LUXE" }
        }
    },
    ["weapon_combatpistol"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_COMBATPISTOL_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_COMBATPISTOL_CLIP_02" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_appistol"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_APPISTOL_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_APPISTOL_CLIP_02" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_APPISTOL_VARMOD_LUXE" }
        }
    },
    ["weapon_pistol50"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_PISTOL50_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_PISTOL50_CLIP_02" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_PISTOL50_VARMOD_LUXE" }
        }
    },
    ["weapon_snspistol"] = {
        components = {
            { item = "clip_attachment",         type = "clip", hash = "COMPONENT_SNSPISTOL_CLIP_01" },
            { item = "clip_attachment",         type = "clip", hash = "COMPONENT_SNSPISTOL_CLIP_02" },
            { item = "luxuryfinish_attachment", type = "skin", hash = "COMPONENT_SNSPISTOL_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_heavypistol"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_HEAVYPISTOL_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_HEAVYPISTOL_CLIP_02" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_HEAVYPISTOL_VARMOD_LUXE" }
        }
    },
    ["weapon_vintagepistol"] = {
        components = {
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_VINTAGEPISTOL_CLIP_01" },
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_VINTAGEPISTOL_CLIP_02" },
            { item = "suppressor_attachment", type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" }
        }
    },
    ["weapon_machinepistol"] = {
        components = {
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_MACHINEPISTOL_CLIP_01" },
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_MACHINEPISTOL_CLIP_02" },
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_MACHINEPISTOL_CLIP_03" },
            { item = "suppressor_attachment", type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" }
        }
    },
    ["weapon_smg"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_SMG_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_SMG_CLIP_02" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_SMG_CLIP_03" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "smallscope_attachment",   type = "scope",      hash = "COMPONENT_AT_SCOPE_MACRO_02" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_PI_SUPP" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_SMG_VARMOD_LUXE" }
        }
    },
    ["weapon_assaultsmg"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_ASSAULTSMG_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_ASSAULTSMG_CLIP_02" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "smallscope_attachment",   type = "scope",      hash = "COMPONENT_AT_SCOPE_MACRO" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_microsmg"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_MICROSMG_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_MICROSMG_CLIP_02" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_PI_FLSH" },
            { item = "smallscope_attachment",   type = "scope",      hash = "COMPONENT_AT_SCOPE_MACRO" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_MICROSMG_VARMOD_LUXE" }
        }
    },
    ["weapon_minismg"] = {
        components = {
            { item = "clip_attachment", type = "clip", hash = "COMPONENT_MINISMG_CLIP_01" },
            { item = "clip_attachment", type = "clip", hash = "COMPONENT_MINISMG_CLIP_02" }
        }
    },
    ["weapon_combatpdw"] = {
        components = {
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_COMBATPDW_CLIP_01" },
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_COMBATPDW_CLIP_02" },
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_COMBATPDW_CLIP_03" },
            { item = "flashlight_attachment", type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "grip_attachment",       type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "smallscope_attachment", type = "scope",      hash = "COMPONENT_AT_SCOPE_SMALL" }
        }
    },
    ["weapon_pumpshotgun"] = {
        components = {
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_SR_SUPP" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_sawnoffshotgun"] = {
        components = {
            { item = "luxuryfinish_attachment", type = "skin", hash = "COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE" }
        }
    },
    ["weapon_assaultshotgun"] = {
        components = {
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_ASSAULTSHOTGUN_CLIP_01" },
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_ASSAULTSHOTGUN_CLIP_02" },
            { item = "flashlight_attachment", type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "suppressor_attachment", type = "suppressor", hash = "COMPONENT_AT_AR_SUPP" },
            { item = "grip_attachment",       type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" }
        }
    },
    ["weapon_bullpupshotgun"] = {
        components = {
            { item = "flashlight_attachment", type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "suppressor_attachment", type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "grip_attachment",       type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" }
        }
    },
    ["weapon_heavyshotgun"] = {
        components = {
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_HEAVYSHOTGUN_CLIP_01" },
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_HEAVYSHOTGUN_CLIP_02" },
            { item = "clip_attachment",       type = "clip",       hash = "COMPONENT_HEAVYSHOTGUN_CLIP_03" },
            { item = "flashlight_attachment", type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "suppressor_attachment", type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "grip_attachment",       type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" }
        }
    },
    ["weapon_assaultrifle"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_ASSAULTRIFLE_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_ASSAULTRIFLE_CLIP_02" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_ASSAULTRIFLE_CLIP_03" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "smallscope_attachment",   type = "scope",      hash = "COMPONENT_AT_SCOPE_MACRO" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "grip_attachment",         type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_ASSAULTRIFLE_VARMOD_LUXE" }
        }
    },
    ["weapon_carbinerifle"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_CARBINERIFLE_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_CARBINERIFLE_CLIP_02" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_CARBINERIFLE_CLIP_03" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "medscope_attachment",     type = "scope",      hash = "COMPONENT_AT_SCOPE_MEDIUM" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_AR_SUPP" },
            { item = "grip_attachment",         type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_CARBINERIFLE_VARMOD_LUXE" }
        }
    },
    ["weapon_advancedrifle"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_ADVANCEDRIFLE_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_ADVANCEDRIFLE_CLIP_02" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "smallscope_attachment",   type = "scope",      hash = "COMPONENT_AT_SCOPE_SMALL" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_AR_SUPP" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE" }
        }
    },
    ["weapon_specialcarbine"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_SPECIALCARBINE_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_SPECIALCARBINE_CLIP_02" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_SPECIALCARBINE_CLIP_03" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "medscope_attachment",     type = "scope",      hash = "COMPONENT_AT_SCOPE_MEDIUM" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "grip_attachment",         type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_bullpuprifle"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_BULLPUPRIFLE_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_BULLPUPRIFLE_CLIP_02" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "smallscope_attachment",   type = "scope",      hash = "COMPONENT_AT_SCOPE_SMALL" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_AR_SUPP" },
            { item = "grip_attachment",         type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_BULLPUPRIFLE_VARMOD_LOW" }
        }
    },
    ["weapon_compactrifle"] = {
        components = {
            { item = "clip_attachment", type = "clip", hash = "COMPONENT_COMPACTRIFLE_CLIP_01" },
            { item = "clip_attachment", type = "clip", hash = "COMPONENT_COMPACTRIFLE_CLIP_02" },
            { item = "clip_attachment", type = "clip", hash = "COMPONENT_COMPACTRIFLE_CLIP_03" }
        }
    },
    ["weapon_mg"] = {
        components = {
            { item = "clip_attachment",         type = "clip",  hash = "COMPONENT_MG_CLIP_02" },
            { item = "smallscope_attachment",   type = "scope", hash = "COMPONENT_AT_SCOPE_SMALL_02" },
            { item = "luxuryfinish_attachment", type = "skin",  hash = "COMPONENT_MG_VARMOD_LOWRIDER" }
        }
    },
    ["weapon_combatmg"] = {
        components = {
            { item = "clip_attachment",     type = "clip",  hash = "COMPONENT_COMBATMG_CLIP_01" },
            { item = "clip_attachment",     type = "clip",  hash = "COMPONENT_COMBATMG_CLIP_02" },
            { item = "medscope_attachment", type = "scope", hash = "COMPONENT_AT_SCOPE_MEDIUM" },
            { item = "grip_attachment",     type = "grip",  hash = "COMPONENT_AT_AR_AFGRIP" },
        }
    },
    ["weapon_gusenberg"] = {
        components = {
            { item = "clip_attachment", type = "clip", hash = "COMPONENT_GUSENBERG_CLIP_01" },
            { item = "clip_attachment", type = "clip", hash = "COMPONENT_GUSENBERG_CLIP_02" },
        }
    },
    ["weapon_sniperrifle"] = {
        components = {
            { item = "largescope_attachment",   type = "scope",      hash = "COMPONENT_AT_SCOPE_LARGE" },
            { item = "advscope_attachment",     type = "scope",      hash = "COMPONENT_AT_SCOPE_MAX" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_AR_SUPP_02" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_SNIPERRIFLE_VARMOD_LUXE" }
        }
    },
    ["weapon_heavysniper"] = {
        components = {
            { item = "largescope_attachment", type = "scope", hash = "COMPONENT_AT_SCOPE_LARGE" },
            { item = "advscope_attachment",   type = "scope", hash = "COMPONENT_AT_SCOPE_MAX" }
        }
    },
    ["weapon_marksmanrifle"] = {
        components = {
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_MARKSMANRIFLE_CLIP_01" },
            { item = "clip_attachment",         type = "clip",       hash = "COMPONENT_MARKSMANRIFLE_CLIP_02" },
            { item = "flashlight_attachment",   type = "flashlight", hash = "COMPONENT_AT_AR_FLSH" },
            { item = "largescope_attachment",   type = "scope",      hash = "COMPONENT_AT_SCOPE_LARGE_MK2" },
            { item = "suppressor_attachment",   type = "suppressor", hash = "COMPONENT_AT_AR_SUPP" },
            { item = "grip_attachment",         type = "grip",       hash = "COMPONENT_AT_AR_AFGRIP" },
            { item = "luxuryfinish_attachment", type = "skin",       hash = "COMPONENT_MARKSMANRIFLE_VARMOD_LUXE" }
        }
    }
}
