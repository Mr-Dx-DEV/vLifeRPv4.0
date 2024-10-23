Config = {}

Config.DefaultKey = 'N'

Config.SlowdownOnSwitch = true
Config.SlowdownPercentage = 0.2 -- 0.2 => 20%

Config.PlaySoundOnSwitch = true

Config.PlayServerSyncedSound = true -- server synced sounds can be heard by other players, disable if you cannot hear the sounds at higher speeds or mess with the distance settings below
Config.MaxSoundDistance = 3.0 -- Server Synced only, and no volume falloff
Config.MaxSoundDistanceAtMediumSpeeds = 5.0 -- Do not touch if you don't know what you're doing!
Config.MaxSoundDistanceAtHighSpeeds = 10.0 -- Do not touch if you don't know what you're doing!

Config.SoundFile = 'beep-sound-1' -- file name without the .ogg (located in /resources/[standalone]/interact-sound/client/html/sounds/)
Config.SoundVolume = 0.05

Config.SwitchNotification = "Changed mode to %s" -- %s will be replaced with the vehicle mode, e.g. S+

Config.AuthorizedJobs = { -- empty => everyone can use it
    "police",
    "bcso",
    "ambulance",
}

Config.VehicleModes = { -- If you define a new mode, you will have to add a new Vehicle Modification and a new mode for EVERY vehicle defined in Config.VehiclesConfig!
    "A",
    "A+",
    "S",
    "S+"
}

Config.VehicleModifications = {
    ["A"] = {
        ["Turbo"] = false,
        ["Engine"] = 1,
        ["Brakes"] = -1,
        ["Transmission"] = 1,
    },
    ["A+"] = {
        ["Turbo"] = false,
        ["Engine"] = 2,
        ["Brakes"] = 1,
        ["Transmission"] = 2,
    },
    ["S"] = {
        ["Turbo"] = true,
        ["Engine"] = 3,
        ["Brakes"] = 1,
        ["Transmission"] = 2,
    },
    ["S+"] = {
        ["Turbo"] = true,
        ["Engine"] = 4,
        ["Brakes"] = 2,
        ["Transmission"] = 3,
    }
}

-- To add more cars just copy an existing one and adjust the values correspondingly (don't forget to change the model name aswell, e.g. police3) 
-- You can remove or add any value that is a float, integer or vector3 (for available values check handling.meta) but make sure to do so for every mode / class of that vehicle, otherwise the value won't be reset
Config.VehiclesConfig = {
    ["npolvette"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 1.200000,
            ["fInitialDriveMaxFlatVel"] = 230.000000,
            ["fSteeringLock"] = 40.300000,
            ["fInitialDriveForce"] = 0.50
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 2.000000,
            ["fInitialDriveMaxFlatVel"] = 250.000000,
            ["fSteeringLock"] = 40.300000,
            ["fInitialDriveForce"] = 0.60
        },
        ["S"] = {
            ["fDriveInertia"] = 1.00000,
            ["fBrakeForce"] = 3.5,
            ["fInitialDriveMaxFlatVel"] = 260.0,
            ["fSteeringLock"] = 40.3,
            ["fInitialDriveForce"] = 0.75
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.00,
            ["fBrakeForce"] = 4.5,
            ["fInitialDriveMaxFlatVel"] = 270.0,
            ["fSteeringLock"] = 40.3,
            ["fInitialDriveForce"] = 0.85
        }
    },
    ["npolchal"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 1.000000,
            ["fInitialDriveMaxFlatVel"] = 198.000000,
            ["fSteeringLock"] = 35.000000,
            ["fInitialDriveForce"] = 0.60
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 2.000000,
            ["fInitialDriveMaxFlatVel"] = 210.000000,
            ["fSteeringLock"] = 35.000000,
            ["fInitialDriveForce"] = 0.60
        },
        ["S"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 3.5,
            ["fInitialDriveMaxFlatVel"] = 215.0,
            ["fSteeringLock"] = 35.0,
            ["fInitialDriveForce"] = 0.70
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 4.5,
            ["fInitialDriveMaxFlatVel"] = 235.0,
            ["fSteeringLock"] = 40.0,
            ["fInitialDriveForce"] = 0.80
        }
    },
    ["npolstang"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 1.000000,
            ["fInitialDriveMaxFlatVel"] = 200.000000,
            ["fSteeringLock"] =38.0,
            ["fInitialDriveForce"] = 0.60
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 2.000000,
            ["fInitialDriveMaxFlatVel"] = 210.000000,
            ["fSteeringLock"] =39.0,
            ["fInitialDriveForce"] = 0.68
        },
        ["S"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 3.5,
            ["fInitialDriveMaxFlatVel"] = 220.0,
            ["fSteeringLock"] = 40.0,
            ["fInitialDriveForce"] = 0.75
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 3.5,
            ["fInitialDriveMaxFlatVel"] = 230.0,
            ["fSteeringLock"] = 42.0,
            ["fInitialDriveForce"] = 0.78
        }
    },
}

Config.UseGeneralVehicleConfig = false -- change this if you want every EMERGENCY vehicle to be able to change modes (still restricted by Configs.AuthorizedJobs)
Config.EmergencyVehiclesOnly = false -- change this if you want EVERY vehicle to be able to change modes (still restricted by Configs.AuthorizedJobs)
Config.GeneralVehicleConfig = {
    ["A"] = {
        ["fDriveInertia"] = 1.000000,
        ["fBrakeForce"] = 1.700000,
        ["fInitialDriveMaxFlatVel"] = 130.000000,
        ["fSteeringLock"] = 44.300000,
        ["fInitialDriveForce"] = 0.270000
    },
    ["A+"] = {
        ["fDriveInertia"] = 1.100000,
        ["fBrakeForce"] = 2.000000,
        ["fInitialDriveMaxFlatVel"] = 150.000000,
        ["fSteeringLock"] = 45.200000,
        ["fInitialDriveForce"] = 0.32
    },
    ["S"] = {
        ["fDriveInertia"] = 1.2,
        ["fBrakeForce"] = 3.5,
        ["fInitialDriveMaxFlatVel"] = 170.0,
        ["fSteeringLock"] = 43.3,
        ["fInitialDriveForce"] = 0.37
    },
    ["S+"] = {
        ["fDriveInertia"] = 1.3,
        ["fBrakeForce"] = 4.5,
        ["fInitialDriveMaxFlatVel"] = 490.0,
        ["fSteeringLock"] = 40.3,
        ["fInitialDriveForce"] = 0.85
    }
}

