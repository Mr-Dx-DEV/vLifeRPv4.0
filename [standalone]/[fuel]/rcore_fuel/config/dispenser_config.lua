Config.SupportedGasPumpModel = {
    {
        -- model of the gas pump
        modelHash = -164877493,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "prop_gas_pump_old3_piece",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "pump_old_3_holders",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(0.500000, -0.000000, 0.920000),
                heading = 180.0,
                offsetHolder = vec3(0.420000, -0.000000, 0.890000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(0.380000, 0.000000, 0.630000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = -90.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(0.800000, 0.000000, 0.000000)
        },

        -- this is position check for the camera + player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        -- this is also working for the camera because it will flip the html so the text isnt rendered backwards.
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(0.000000, 0.000000, 0.000000)
        },
    },
    {
        -- model of the gas pump
        modelHash = 1339433404,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the camera + player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        -- this is also working for the camera because it will flip the html so the text isnt rendered backwards.
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },
    },
    {
        -- model of the gas pump
        modelHash = -462817101,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "prop_vintage_pump_piece",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "prop_vintage_pump_piece_hole",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(0.300000, -0.020000, 0.845000),
                heading = 180.0,
                offsetHolder = vec3(0.235000, 0.010000, 1.210000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(0.230000, -0.050000, 1.250000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = -90.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(0.800000, 0.000000, 0.000000)
        },

        -- this is position check for the camera + player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        -- this is also working for the camera because it will flip the html so the text isnt rendered backwards.
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(0.000000, 0.000000, 0.000000)
        },
    },
    {
        -- model of the gas pump
        modelHash = 2287735495,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the camera + player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        -- this is also working for the camera because it will flip the html so the text isnt rendered backwards.
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },
    },
    {
        -- model of the gas pump
        modelHash = 1537112021,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "rcore_electric_nozzle_hand",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_electric_nozzle_a",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(0.000000, 0.000000, 0.000000),
                heading = 0.0,
                offsetHolder = vec3(0.000000, -0.000000, -1.250000)
            },
            [2] = {
                offsetRope = vec3(0.000000, 0.000000, 0.000000),
                heading = 180.0,
                offsetHolder = vec3(0.000000, 0.000000, -1.250000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.400000, 0.000000, 0.800000),
            [2] = vec3(0.400000, 0.000000, 0.800000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 70.0,
            [2] = -110.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.900000, -0.500000, 0.000000),
            [2] = vec3(0.900000, 0.500000, 0.000000)
        },

        -- this is position check for the camera + player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        -- this is also working for the camera because it will flip the html so the text isnt rendered backwards.
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },
    },
    {
        -- model of the gas pump
        modelHash = 1933174915,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the camera + player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        -- this is also working for the camera because it will flip the html so the text isnt rendered backwards.
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },
    },
    {
        -- model of the gas pump
        modelHash = -2007231801,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the camera + player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        -- this is also working for the camera because it will flip the html so the text isnt rendered backwards.
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },
    },
    {
        -- model of the gas pump
        modelHash = 1499213999,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "prop_gas_pump_old3_piece",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "pump_old_3_holders",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.500000, -0.000000, 0.920000),
                heading = 0.0,
                offsetHolder = vec3(-0.420000, -0.000000, 0.890000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.380000, 0.000000, 0.630000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 90.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.800000, 0.000000, 0.000000)
        },

        -- this is position check for the camera + player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        -- this is also working for the camera because it will flip the html so the text isnt rendered backwards.
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(0.000000, 0.000000, 0.000000)
        },
    },
    {
        -- model of the gas pump
        modelHash = 1694452750,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the camera + player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        -- this is also working for the camera because it will flip the html so the text isnt rendered backwards.
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },
    },


    -- gabz LTD map
    {
        -- model of the gas pump
        modelHash = 486135101,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the camera + player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        -- this is also working for the camera because it will flip the html so the text isnt rendered backwards.
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },
    },
}