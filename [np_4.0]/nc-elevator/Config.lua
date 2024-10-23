
Config = {}

Config.WaitTime = 4000 -- This will set the time for the ProgressBar | 1000 = 1 second

Config.UseLanguage = "en" -- make new languages to your own likng

Config.UseSoundEffect = false -- makes a sound when you use elevator Note: still a work in progress

Config.Elevator = {
    [1] = {
        Sound = "LiftSoundBellRing",
        name = "Apartments", -- it should be different for each elevator you make
        locations = {
            vector3(-659.2011, -1111.356, 15.2),
            vector3(-655.7241, -1111.48, 22.0),
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(-658.845, -1110.279, 15.063224, 60.813488),
            },
            [1] = {
                Coords = vector4(-655.6077, -1110.514, 21.834331, 68.611686),
            },
        }
    },
    [2] = {
        Sound = "LiftSoundBellRing",
        name = "VineWoodPolice", -- it should be different for each elevator you make
        locations = {
            vector3(614.03112, -13.07026, 83.019737),
            vector3(611.2611, -11.97273, 82.995719),
            vector3(611.2918, -12.14775, 87.274009),
            vector3(614.07141, -13.19764, 87.266593),
            vector3(612.53283, -17.43825, 91.774757),
            vector3(540.91, 24.97, 69.51)
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(540.75, 25.39, 69.51, 280.43),
            },
            [1] = {
                Coords = vector4(614.30505, -14.78626, 82.763526, 335.74468),
            },
            [2] = {
                Coords = vector4(614.24542, -14.89499, 87.053642, 338.45019),
            },
            [3] = {
                Coords = vector4(612.80151, -19.37052, 91.537811, 340.91256),
            },
        }
    },
    [3] = {
        Sound = "LiftSoundBellRing",
        name = "AMBULANCEGarage", -- it should be different for each elevator you make
        locations = {
            vector3(-435.07412719727, -357.96371459961, 35.459838867188),
            vector3(-420.90155029297, -344.60388183594, 24.689918518066)
            
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(-418.83489990234, -344.61703491211, 24.231649398804, 104.78638458252),
            },
            [1] = {
                Coords = vector4(-435.94921875, -359.55047607422, 34.949199676514, 351.26171875),
            },
        }
    },
    [4] = {
        Sound = "LiftSoundBellRing",
        name = "AMBULANCEinSide", -- it should be different for each elevator you make
        locations = {
            vector3(-454.21969604492, -288.28686523438, 35.357231140137),
            vector3(-491.61801147461, -329.07354736328, 42.453098297119),
            vector3(-491.60403442383, -329.23608398438, 70.057403564453),
            vector3(-442.77572631836, -333.89373779297, 78.102073669434)
            
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(-452.53378295898, -288.50903320312, 34.94942855835, 127.4411315918),
            },
            [1] = {
                Coords = vector4(-490.36727905273, -328.20590209961, 42.306385040283, 164.31842041016),
            },
            [2] = {
                Coords = vector4(-490.47906494141, -327.55233764648, 69.504852294922, 172.24089050293),
            },
            [3] = {
                Coords = vector4(-443.85766601562, -331.83071899414, 78.167999267578, 169.04669189453),
            },
        }
    },
}





Config.Locals = {
    ["en"] = {
        Waiting = "Waiting for the Elevator...",
        Restricted = "Access Restricted!",
        CurrentFloor = "Current Floor: ",
        Unable = "You Can't Use The Elevator...",
    },
}
