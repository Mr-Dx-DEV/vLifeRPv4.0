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
    ["beyin"] = "https://cdn.discordapp.com/attachments/971695978962907176/971696814157885460/unknown.png?ex=65f2bbad&is=65e046ad&hm=4c613e7d957d585abc4e2d73cb3f652f8b49b6b27be65ca72c65c52bf91b1f69&",
    ["kalca"] = "https://cdn.discordapp.com/attachments/971695978962907176/971696110202658866/unknown.png?ex=65f2bb05&is=65e04605&hm=73b7f5c64ae5616986e16c375a94649286901b7329751d787cc1b3a36bf262d8&",
    ["tabdomen"] = "https://cdn.discordapp.com/attachments/971695978962907176/971696236375736350/unknown.png?ex=65f2bb23&is=65e04623&hm=e4f6cea673ceec2de0823756eb61dcd93e42fa77ac0d635d37c7910d429c4d2e&",
    ["tchest"] = "https://cdn.discordapp.com/attachments/971695978962907176/971696442508980234/unknown.png?ex=65f2bb55&is=65e04655&hm=17fd836e2a714f159b105d095969d356b5e44da8769a0d49f32cea96adcfa8a9&",
    ["elbilek"] = "https://cdn.discordapp.com/attachments/971695978962907176/971696521085087784/unknown.png?ex=65f2bb67&is=65e04667&hm=0da5966d2293a5a70cfe47633ddee20e7a1e29883cab1bcc815bd77b6f85a2b4&",
    ["omuz"] = "https://cdn.discordapp.com/attachments/971695978962907176/971696619865133056/unknown.png?ex=65f2bb7f&is=65e0467f&hm=f9d4fc8ff166c8bfe2ffbfaa055c96bac0026b8826e7d0c10f78946542cc1e94&",
    ["diz"] = "https://cdn.discordapp.com/attachments/971695978962907176/971696691629686834/unknown.png?ex=65f2bb90&is=65e04690&hm=7d3dac932dca55bab55cb0bcb71b4fba0a9a4c0ff7752ff764e531b4cc87bdf2&",
    ["tboyun"] = "https://cdn.discordapp.com/attachments/971695978962907176/1213049350939353098/fdhc-900x400.png?ex=65f40f3e&is=65e19a3e&hm=9f2e079cfaa0c4d19a88adc3f9db70e7cfc42206b3536febdcc3fb3ac4feb140&",
    ["hipofiz"] = "https://cdn.discordapp.com/attachments/971695978962907176/971696882663444520/unknown.png?ex=65f2bbbe&is=65e046be&hm=6ea7ed59b63528c1117a5192f2898acc5253bf1a579f7fdeb6fd5aa9d1588dc1&",
}

Config.XrayPhotos = {
    ["kafa"] = "https://cdn.discordapp.com/attachments/971695978962907176/971697604972916746/unknown.png?ex=65f2bc6a&is=65e0476a&hm=47c04a800367511806a82334253e6cbe1f1a980f93b92ec62fb370d7b683e0a4&",
    ["omuz"] = "https://cdn.discordapp.com/attachments/971695978962907176/971697737886208000/unknown.png?ex=65f2bc89&is=65e04789&hm=f75088c872c437c88a20fafd6df246791764574a77faddecf311d9afed411f0c&",
    ["humerus"] = "https://cdn.discordapp.com/attachments/971695978962907176/971698068904869928/unknown.png?ex=65f2bcd8&is=65e047d8&hm=e700e4acbe5dd144f94dfd7650f7cf586ab22d0580faf5ca1674377f15bb6e97&",
    ["onkol"] = "https://cdn.discordapp.com/attachments/971695978962907176/971698142816907304/unknown.png?ex=65f2bcea&is=65e047ea&hm=cd1b98b844b08fde4bcbdd2b71022c556d7fdefa3fd1707672efd3ea06ba8b3d&",
    ["pelvis"] = "https://cdn.discordapp.com/attachments/971695978962907176/971698255727575100/unknown.png?ex=65f2bd05&is=65e04805&hm=edb7c35c6124f6c6380429543cc09163b5971e98b7ea4ae0d75ca8fd60d81811&",
    ["femur"] = "https://cdn.discordapp.com/attachments/971695978962907176/971698337914953749/unknown.png?ex=65f2bd19&is=65e04819&hm=9933ebd8ac8783d49d6654fcb8b37f732ce1ab702f9a1dc1be21e8ea0818af05&",
    ["diz"] = "https://cdn.discordapp.com/attachments/971695978962907176/971698409071345664/unknown.png?ex=65f2bd2a&is=65e0482a&hm=b306da6a90267975873ec7d86e0b188469de2d110562d13960c3b81abfe4cd15&",
    ["ayak"] = "https://cdn.discordapp.com/attachments/971695978962907176/971698512293158912/unknown.png?ex=65f2bd42&is=65e04842&hm=c87e3db6b0118d6dd3c977f8eb190f4fdb745a3592e343c56a77b7cefbd106af&",
    ["ciger"] = "https://cdn.discordapp.com/attachments/971695978962907176/971698573102174258/unknown.png?ex=65f2bd51&is=65e04851&hm=a49c67fd6d2f6c6746a80f6a2bcf0a50ee35594027ad0837533aab9f0e37e701&",
}