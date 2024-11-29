Config = {}

--
--██╗░░░░░██╗░░░██╗░██████╗████████╗██╗░░░██╗░█████╗░░░██╗██╗
--██║░░░░░██║░░░██║██╔════╝╚══██╔══╝╚██╗░██╔╝██╔══██╗░██╔╝██║
--██║░░░░░██║░░░██║╚█████╗░░░░██║░░░░╚████╔╝░╚██████║██╔╝░██║
--██║░░░░░██║░░░██║░╚═══██╗░░░██║░░░░░╚██╔╝░░░╚═══██║███████║
--███████╗╚██████╔╝██████╔╝░░░██║░░░░░░██║░░░░█████╔╝╚════██║
--╚══════╝░╚═════╝░╚═════╝░░░░╚═╝░░░░░░╚═╝░░░░╚════╝░░░░░░╚═╝


--Thank you for downloading this script!

--Below you can change multiple options to suit your server needs.

Config.DebugZones = false -- set to true to enable visual zones where peds spawn for interactions when delivering packages and selling oxy - only used for debugging and moving locations
Config.StartPedBlip = false -- set to false if you dont wany blips for the suspicious package mission ped and make players find the ped on their own
Config.CreateUseableOxyItem = true -- set to false if you have your own methods of handling oxy consumption [ consumables ] this disables the in built features for consuming oxy if set to true make sure there is no other script that creates a useable item for oxy as it may clash
Config.CreateUseableBurnerPhone = true -- set to false if you have your own methods of selling oxy i.e a drug sale script

Config.CoreSettings = {
    Target = {
        Type = 'ox', -- support for qb-target and ox_target    
        --use 'qb' for qb-target
        --use 'ox' for ox_target
    },
    Notify = {
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify, mythic_notify and ox_lib notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for myhthic_notify
        --use 'ox' for ox_lib notify
    },
    Inventory = { -- support for qb-inventory and ox_inventory
        Type = 'ox',
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Police = { -- support for qb-policejob and ps-dispatch
        Type = 'ps',
        --use 'qb' for qb-policejob
        --use 'ps' for ps-dispatch
    },
}

-- XP settings
Config.XP = { -- use xp 
    Enabled = false, -- Toggles xp system on or off; true = on, false = off
    Command = false, -- Toggles commands on or off use /oxyxp or whatever you have named the metadata
    MetaDataName = 'oxyxp', -- The name of your xp if you edit this make sure to also edit the line you added into qb-core/server/player.lua - new core goes into config - you might also need to change how metadata is assigned
    XPChance = 75, -- chance to earn XP from events
    XPAmount = math.random(5,10), -- amount of xp given from events
    Levels = { -- Change your xp requirements here to suit your server set these as high as you want preset xp increase = (xp / 0.8) if changing amounts dont forget to edit server file also where items are given to match new xp amounts
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

Config.InteractionLocations = {
    Settings = {
        StartCost = 1000, -- cost to start suspicious package delivery
        MaxDelivery = math.random(7,13),-- maximum delivery of suspicious packages amount player can do in 1 mission
        MaxSales = 10, -- maximum sale of oxy amount player can do in 1 mission - THIS IS ALSO THE MINIMUM AMOUNT OF OXY A PLAYER IS REQUIRED TO HAVE ON THEM BEFORE BEING ALLOWED TO REQUEST SALE MISSIONS
        SaleChance = 80, -- chance for successful sale when selling oxy
    },
    PoliceSettings = {
        MinCops = 0, -- minimum amount of on duty cops required to start delivery mission and to sell oxy
        CallChance = 75, -- chance to call cops upon hand off of packages and selling 
    },
    PedModels = { -- add more ped models for the mission start ped here
        'g_m_y_lost_02',
        'g_m_y_ballasout_01',
        'g_m_y_famdnf_01',
        'g_m_m_chigoon_01',
        'g_f_y_lost_01',
        'g_f_importexport_01',
        'g_f_y_vagos_01',
    },
    PedTargets = {
        Icon = 'fas fa-capsules', -- target iocon
        Label = 'Suspicious Package Delivery', -- target label
        Disance = 2.0, -- target distance
    },
    StartLocations = { -- add more random locations for the suspcious package delivery start ped to spawn at here
        vector4(-83.04, -1399.58, 29.32, 187.07),
        vector4(226.63, -1776.68, 29.12, 321.84),
        vector4(130.45, -2200.28, 6.03, 49.94),
        vector4(-9.08, -2536.29, 7.39, 325.12),
        vector4(1092.57, -2251.91, 31.23, 245.7),
        vector4(1220.82, -1270.26, 35.36, 86.94),
        vector4(1134.9, -789.12, 57.6, 178.49),
    },
    DeliveryModels = { -- add more ped models for the delivery ped here
        'a_m_m_hillbilly_01',
        'a_m_m_genfat_01',
        'a_m_m_malibu_01',
        'a_m_m_soucent_03',
        's_m_m_dockwork_01',
    },
    DeliveryTargets = {
        Icon = 'fas fa-capsules', -- target icon
        Label = 'Deliver Suspicious Package', -- target label
        Disance = 2.0, -- target distance
    },
    DeliveryLocations = { -- add more random delivery locations here for suspcious packages
        vector4(249.91, -1958.5, 23.16, 318.16),
        vector4(166.49, -1813.23, 28.69, 140.73),
        vector4(546.77, -1756.21, 29.14, 61.76),
        vector4(879.52, -1602.38, 30.19, 5.41),
        vector4(1708.16, -1784.01, 111.34, 255.48),
        vector4(1123.07, -974.19, 46.56, 200.24),
        vector4(274.32, 12.83, 79.38, 230.44),
        vector4(-190.87, 288.16, 93.0, 221.85),
        vector4(-251.19, 202.7, 84.32, 176.65),
        vector4(-635.05, 196.62, 69.75, 239.24),
    },
    SaleModels = { -- add more ped models for the selling ped here
        's_m_m_lathandy_01',
        's_m_m_linecook',
        's_m_m_strvend_01',
        's_m_y_airworker',
        's_m_y_construct_01',
        's_m_y_construct_02',
        's_m_y_dockwork_01',
        's_m_y_garbage',
    },
    SaleTargets = {
        Icon = 'fas fa-capsules', -- target icon
        Label = 'Sell Oxy', -- target label
        Disance = 2.0, -- target distance
    },
    SaleLocations = { -- add more random sale locations for oxy when players request to sell through the burner phone
        vector4(-1276.72, -1097.12, 7.28, 293.71),
        vector4(-1047.72, -1603.69, 4.74, 39.95),
        vector4(-669.7, -1103.17, 14.65, 78.83),
        vector4(-312.91, -1329.83, 31.32, 356.66),
        vector4(-194.41, -1533.85, 33.85, 43.1),
        vector4(212.63, -1698.12, 29.35, 138.25),
        vector4(377.04, -1812.99, 29.11, 120.8),
        vector4(517.34, -1844.17, 27.67, 126.95),
        vector4(867.53, -1647.58, 30.2, 95.88),
        vector4(1220.61, -688.09, 60.79, 104.38),
        vector4(844.43, -563.38, 57.83, 192.47),
        vector4(722.28, 2330.99, 51.75, 19.52),
        vector4(359.4, 2623.82, 44.69, 29.48),
        vector4(361.51, 2977.0, 41.62, 123.47),
        vector4(508.95, 3099.58, 41.31, 48.51),
        vector4(1389.94, 3661.37, 34.92, 25.91),
        vector4(1764.54, 3335.49, 41.43, 349.22),
        vector4(2618.15, 3275.04, 55.74, 234.95),
        vector4(2517.54, 4113.79, 38.63, 331.25),
        vector4(1683.55, 4689.64, 43.07, 242.32),
        vector4(1681.68, 6428.83, 32.18, 314.37),
        vector4(31.97, 6596.1, 32.47, 234.67),
        vector4(-214.83, 6444.37, 31.31, 317.96),
        vector4(-454.27, 6198.91, 29.55, 340.35),
        vector4(-295.42, 6188.98, 31.49, 158.44),
        vector4(-358.98, 6061.85, 31.5, 42.54),
    },
}

Config.Animations = {
    StartDelivery = {
        Player = {
            Dict = 'mp_common',
            Anim = 'givetake2_a',
            Flag = 49,
            Prop = 'sf_prop_sf_cash_pile_01',
            Bone = 57005,
            Pos = vec3(0.13, 0.03, 0.0),
            Rot = vec3(-99.0, 4.0, -17.0),
        },
        Ped = {
            Dict = 'anim@heists@box_carry@',
            Anim = 'idle',
            Flag = 49,
            Prop = 'prop_mp_drug_package',
            Bone = 18905,
            Pos = vec3(0.16, -0.15, 0.23),
            Rot = vec3(-120.0, 120.0, 0.0),
        },
    },
    DeliverPackage = {
        Player = {
            Dict = 'anim@heists@box_carry@',
            Anim = 'idle',
            Flag = 49,
            Prop = 'prop_mp_drug_package',
            Bone = 18905,
            Pos = vec3(0.16, -0.15, 0.23),
            Rot = vec3(-120.0, 120.0, 0.0),
        },
        Ped = {
            Dict = 'mp_common',
            Anim = 'givetake2_a',
            Flag = 49,
            Prop = 'prop_cs_pills',
            Bone = 57005,
            Pos = vec3(0.13, 0.03, 0.0),
            Rot = vec3(-99.0, 4.0, -17.0),
        },
    },
    TextClients = {
        Player = {
            Dict = 'cellphone@',
            Anim = 'cellphone_text_read_base',
            Flag = 49,
            Prop = 'prop_npc_phone_02',
            Bone = 28422,
            Pos = vec3(0, 0, 0),
            Rot = vec3(50, 320, 50),
        },
    },
    SellOxy = {
        Player = {
            Dict = 'mp_common',
            Anim = 'givetake2_a',
            Flag = 49,
            Prop = 'prop_cs_pills',
            Bone = 57005,
            Pos = vec3(0.13, 0.03, 0.0),
            Rot = vec3(-99.0, 4.0, -17.0),
        },
        Ped = {
            Dict = 'mp_common',
            Anim = 'givetake2_a',
            Flag = 49,
            Prop = 'sf_prop_sf_cash_pile_01',
            Bone = 57005,
            Pos = vec3(0.13, 0.03, 0.0),
            Rot = vec3(-99.0, 4.0, -17.0),
        },
    },
}

Config.Language = {
    ProgressBar = {
        Consume = 'Consuming oxy',
        TextCustomers = 'Texting customers',
    },
    Notifications = {
        CancelledName = 'Action cancelled',
        BusyName = 'You are already doing something!',
        LocationSentName = 'A location will be sent to your GPS shortly!',
        DeliveryRequestName = 'You have a delivery request, check your GPS!',
        AllDeliveredName = 'You have delivered all the packages!',
        AlreadyStartedName = 'You have already started a mission!',
        SomeoneSawName = 'Be careful, a local saw you do that!',
        MissingItemsName = 'You are missing items!',
        SaleName = 'You have a sale, check your GPS for a delivery location!', 
        SellingErrorName = 'You have already started selling, please complete your sales before requesting more.',
        SaleFailedName = 'What kind of whack ass shit is this? get the fuck out of here asshole!',
        NoMoreRequestsName = 'You dont have any more requests!',
        NotEnoughPoliceName = 'There is not enough police on duty!',
        CantCarryName = 'You cant carry anymore of that!',
        EarnedXPName = 'You earned some XP!',
    },
}