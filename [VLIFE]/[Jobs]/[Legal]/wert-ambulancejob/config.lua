Config = {}

Config.DebugPoly = false -- Show target polys (true or false)

Config.CoffeItem = "coffee"

Config.ReviveClientEvent = 'hospital:client:Revive'

Config.Locale = "en"

Config.OxInventory = false

--Mr desk
Config.MrCoord = vector4(-447.2, -291.19, 34.81, 111.64)
--Xray desk
Config.Xray = vector4(-441.027, -303.276, 34.78, 49.85)

Config.TargetInfos = {
    ["EMSWertAmbulanceDuty"] = {     -------------------
        Coord = vector3(-447.8, -319.39, 34.91),
        Heading = 25,
        Lenght = 1.0,
        Width = 1.0,
        Minz = 33.91,
        Maxz = 37.91,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    ["EMSWertArmoryStash"] = {     -------------------
        Coord = vector3(-451.87, -325.45, 34.91),
        Heading = 350,
        Lenght = 2.2,
        Width = 2.6,
        Minz = 33.91,
        Maxz = 37.91,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    ["EMSWertBossMenu"] = {     -------------------
        --Don't tuch event value
        Coord = vector3(-447.14, -321.26, 34.91),
        Heading = 20,
        Lenght = 1.0,
        Width = 1.0,
        Minz = 33.91,
        Maxz = 37.91,
        Event = "qb-bossmenu:client:OpenMenu",
        Icon = "fas fa-clipboard",
        Label = "Boss Menu",
        Distance = 1.5
    },
    ["EMSWertMrComputer"] = {                   -------------------
        --Don't tuch event value
        Coord = vector3(-443.91, -295.73, 34.91),
        Heading = 290,
        Lenght = 2.0,
        Width = 1.0,
        Minz = 33.91,
        Maxz = 37.91,
        Event = "wert-ambulancejob:mr-panel",
        Icon = "fas fa-desktop",
        Label = "MRI Computer",
        Distance = 1.0
    },
    ["EMSWertMrDesk"] = {            -------------------
        --Don't tuch event value
        Coord = vector3(-447.17, -290.58, 34.91),
        Heading = 25,
        Lenght = 3.8,
        Width = 3.0,
        Minz = 33.91,
        Maxz = 37.91,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    ["EMSWertXrayComputer"] = {            -------------------
        --Don't tuch event value
        Coord = vector3(-441.92, -299.61, 34.91),
        Heading = 290,
        Lenght = 2,
        Width = 1,
        Minz = 33.91,
        Maxz = 37.91,
        Event = "wert-ambulancejob:xray-panel",
        Icon = "fas fa-desktop",
        Label = "XRAY Computer",
        Distance = 1.0
    },
    ["EMSWertXrayDesk"] = {            -------------------
        --Don't tuch event value
        Coord = vector3(-440.39, -303.26, 34.91),
        heading = 30,
        Lenght = 2.0,
        Width = 4.0,
        Minz = 33.91,
        Maxz = 37.91,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    --
    ["EMSWertAmbulanceComputer"] = {          -------------------
        Coord = vector3(-454.44, -319.09, 34.91),
        Heading = 25,
        Lenght = 2,
        Width = 2,
        minZ = 33.91,
        maxZ = 37.91,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },

    ["EMSBloodCard"] = {          -------------------
        --Don't tuch event value
        Coord = vector3(-445.81, -324.56, 34.91),
        Heading = 0,
        Lenght = 2.0,
        Width = 1.0,
        minZ = 33.91,
        maxZ = 37.91,
        Event = 'wert-ambulancejob:take-blood-card',
        Icon = "fa-solid fa-address-card",
        Label = 'Buy blood card',
        Distance = 1.5
    },
}

-- Armory items
Config.Items = {
    label = "Ambulance Armory",
    slots = 45,
    items = {
        [1] = {
            name = "radio",
            price = 250,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "bandage",
            price = 50,
            amount = 10,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_flashlight",
            price = 500,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_fireextinguisher",
            price = 500,
            amount = 10,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "painkillers",
            price = 500,
            amount = 10,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "emptytube",
            price = 500,
            amount = 10,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "emptysyringe",
            price = 500,
            amount = 10,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "emptybaggy",
            price = 500,
            amount = 10,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "ifaks",
            price = 100,
            amount = 10,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "handcuffs",
            price = 100,
            amount = 10,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "diving_gear",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "nikon",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "repairkit",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "cleaningkit",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "binoculars",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 15,
        },
       
        [16] = {
            name = "parachute",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 16,
        },
        
        [17] = {
            name = "accesstool",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 17,
        },
        
    }
}

-- Elevator coords
Config.ElevatorInfos = {
    [-1] = {
        Coord = vector3(339.88, -586.28, 28.8),
        Heading = 340,
        Lenght = 0.2,
        Width = 0.4,
        Minz = 29.0,
        Maxz = 29.3,
        Distance = 1.5,
        Tpcoord = vector4(339.82, -584.66, 28.8, 75.64),
    },
    [1] = {
        Coord = vector3(325.57, -603.57, 43.28),
        Heading = 70,
        Lenght = 0.2,
        Width = 0.4,
        Minz = 43.5,
        Maxz = 43.8,
        Distance = 1.5,
        Tpcoord = vector4(327.29, -603.33, 43.28, 340.34),
    },
    [2] = {
        Coord = vector3(338.13, -583.64, 74.16),
        Heading = 340,
        Lenght = 2.8,
        Width = 0.4,
        Minz = 73.80,
        Maxz = 74.56,
        Distance = 1.5,
        Tpcoord = vector4(339.12, -584.01, 74.16, 251.08),
    },
}

--Garage config

Config.GarageEnabled = false -- If you want don't use garage change false

Config.GarageNpcInfos = {
    --Pillbox
    ["pillbox"] = {
        ["car"] = {
            coord = vector4(340.53, -582.82, 28.8, 72.09),
            hash = GetHashKey("s_m_y_valet_01"),
            type = "car",
        },
        ["helicopter"] = {
            coord = vector4(337.74, -586.7, 74.16, 249.22),
            hash = GetHashKey("s_m_y_valet_01"),
            type = "helicopter",
        },
    },
}

Config.GarageSpawnCoords = {
    --Pillbox
    ["pillbox"] = {
        ["car"] = vector4(332.05, -578.33, 28.8, 340.2),
        ["helicopter"] = vector4(352.6, -588.51, 74.16, 69.65)
    },
}

Config.EmsVehicles = {
    ["car"] = {
        "ambulance",
        "lguard",
    },
    ["helicopter"] = {
        "polmav"
    },
}

-- Npc doctor

Config.NpcDoctors = {
    {coord = vector4(312.77, -594.62, 43.28, 345.11), name = "John" }, -- Gabz
}

Config.ReviveTime = 70000
Config.RestTime = 50000

Config.NpcDoctorCost = 150
Config.NpcDoctorMoney = "cash" -- or "bank"

Config.UseCheckOnlineDoc = true

Config.Beds = {
    ["John"] = {
        ["dead"] = {vector4(326.84, -570.82, 43.26, 161.06), vector4(315.28, -566.61, 43.28, 155.03)},
        ["rest"] = {vector4(307.81, -581.69, 43.2, 340.96), vector4(311.12, -583.02, 43.2, 333.79), vector4(314.52, -584.28, 43.2, 337.71), vector4(317.74, -585.4, 43.2, 337.33), vector4(322.69, -587.23, 43.2, 339.7), vector4(324.22, -582.84, 43.2, 158.46), vector4(319.32, -580.99, 43.2, 162.94)}
    },
}


-- Photos
Config.MrPhotos = {
    ["beyin"] = "https://www.hekimoglugoruntuleme.com/wp-content/uploads/2022/01/beyin-mr-fiyatlari.jpg",
    ["kalca"] = "https://www.acikemar.info/wp-content/uploads/2023/03/kalca-mr-640x400.jpg",
    ["tabdomen"] = "https://www.hekimoglugoruntuleme.com/wp-content/uploads/2021/12/abdominal-mr-2-300x123.png",
    ["tchest"] = "https://greaterwaterburyimagingcenter.org/wp-content/uploads/2022/11/Chest-image-118252.png",
    ["elbilek"] = "https://www.hekimoglugoruntuleme.com/wp-content/uploads/2022/01/el-ve-el-bilegi-mr-fiyatlari-1000x400.jpg",
    ["omuz"] = "https://www.hekimoglugoruntuleme.com/wp-content/uploads/2022/01/omuz-mr-fiyatlari.jpg",
    ["diz"] = "https://www.hekimoglugoruntuleme.com/wp-content/uploads/2022/01/diz-mr-fiyatlari.png",
    ["tboyun"] = "https://www.hekimoglugoruntuleme.com/wp-content/uploads/2021/12/servikal-mr-1000x400.jpg",
    ["hipofiz"] = "https://bosstanci.com/wp-content/uploads/2017/02/fgff.png",
}

Config.XrayPhotos = {
    ["kafa"] = "https://www.hekimoglugoruntuleme.com/wp-content/uploads/2016/01/kafa-grafisi-fiyatlari.png",
    ["omuz"] = "https://acilci.net/wp-content/uploads/2019/03/Posteriyor-omuz-%C3%A7%C4%B1k%C4%B1%C4%9F%C4%B1-ve-normal-g%C3%B6r%C3%BCn%C3%BCm.jpg",
    ["humerus"] = "https://sedatseven.com.tr/image/saglik/26042021005048_humeruskirigi.jpg",
    ["onkol"] = "https://bookacil.wordpress.com/wp-content/uploads/2015/10/f2.png",
    ["pelvis"] = "https://www.acilci.net/wp-content/uploads/2015/10/Slide11.jpg",
    ["femur"] = "https://www.kalcacerrahi.org/images/fas-radyoloji/1.jpg",
    ["diz"] = "https://www.drserhatelci.com/wp-content/uploads/2021/12/2.-DIZ-PROTEZI.jpg",
    ["ayak"] = "https://www.acilcalisanlari.com/wp-content/uploads/2023/05/ayak-bilegi-grafisi-3-yonlu.jpg",
    ["ciger"] = "https://toraks.org.tr/site/sf/nmf/pre_migration/0e0199e61ef936c46ef0f75bebaaba56e4ec9480ab8d824a9853af3bdd0630fa.jpg",
}