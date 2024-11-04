bedoflex = {}

bedoflex.Debug = false

bedoflex.Framework = "qb" -- Sets the framework to use: qb, esx, newesx, oldqb

bedoflex.AirdropStartCommand = "airdropstart" -- Command to start the airdrop event
bedoflex.AirdropDeleteCommand = "airdropdelete" -- Command to delete the airdrop event

bedoflex.CommandPermission = "admin" -- Permission level required to use the commands

bedoflex.AirdropTime = 30 -- Time in minutes after which the airdrop can be received

bedoflex.CanJoinTime = 20 -- If the remaining time is less than this, players cannot rejoin and the airdrop will be deleted on them when they leave

bedoflex.MarkerSize = 240.0 -- Airdrop zone size

bedoflex.WinnerAnnounceEveryone = true -- When enabled, it announces the winner to the entire server. When disabled, it only sends the announcement to the people inside the airdrop.

bedoflex.EnableDropTimes = true -- Enables or disables scheduled drop times

bedoflex.EnableAnnouncementManualStarts = true -- Should a countdown notification be sent for manual airdrop starts?

bedoflex.EnableAutomatedAnnoucements = true -- This setting enables announcements for automated airdrops.

bedoflex.AnnounceTimes = { -- You need to sort this place from the highest to the lowest.
    5, -- Will announce 30 minutes before it starts.
    4, -- Will announce 20 minutes before it starts.
    3, -- Will announce 10 minutes before it starts.
    2,  -- Will announce 5 minutes before it starts.
    1,  -- Will announce 1 minute before it starts.
}

bedoflex.DropTimes = {
    [1] = { hour = 16, minute = 00 }, -- Schedule for an airdrop at 4:00 PM
    [2] = { hour = 21, minute = 00 }, -- Schedule for an airdrop at 9:00 PM
    [3] = { hour = 24, minute = 00 }, -- Schedule for an airdrop at 12:00 PM
    [5] = { hour = 03, minute = 00 }, -- Schedule for an airdrop at 3:00 AM
}

bedoflex.AirdropHeight = 180 -- The height at which the airdrop crate is dropped

bedoflex.ToggleMenuKey = "F6" -- Statistics menu toggle key

bedoflex.Locale = "EN" -- Language setting for the script (TR/EN)

bedoflex.ExploitBans = true -- Enables or disables banning for exploiting

bedoflex.JobTypeCheck = false -- Enables job type checking (only for qb framework)

bedoflex.IgnoredJobTypes = { -- Specifies allowed job types
    "police",
    "leo",
}

bedoflex.JobNameCheck = true -- Enables job name checking

bedoflex.IgnoredJobNames = {
    "ambulance" -- Specifies allowed job names
}

bedoflex.SendRespawnCoordsWhenDeath = true -- If true, sends coordinates to respawn when a player dies
bedoflex.RespawnCoords = vector3(-455.483, -351.517, 34.501) -- Coordinates for respawn location
bedoflex.ClearInvWhenDeath = false -- If true, clears inventory on death
bedoflex.HideAirdropWhenDeath = true -- If true, hides the airdrop when the player dies
bedoflex.ReviveWhenDeath = true -- If true, revives the player when they die
bedoflex.DeathNotify = true -- If true, notifies when a player dies

bedoflex.Plane = "titan" -- The model of the plane used for airdrop

bedoflex.Crate = "jrbPUBG_Crate" -- The model of the airdrop crate

bedoflex.OpenCrateKey = 38 -- Key used to open the crate (38 = E)

bedoflex.AirdropTakeTime = 15000 -- Time in milliseconds to take the airdrop

bedoflex.RandomItems = true -- If you set true checks CrateItems random values

bedoflex.CrateItems = { -- Items included in the airdrop crate


{ItemName = "WEAPON_BLUEGLOCKS", ItemCount = 1, random = {a = 50, b = 100}},   -- comom
{ItemName = "WEAPON_GLOCKBEAMS", ItemCount = 1, random = {a = 50, b = 100}},
{ItemName = "WEAPON_BLACKARP", ItemCount = 1, random = {a = 50, b = 100} },

{ItemName = "WEAPON_DMK18", ItemCount = 1, random = {a = 80, b = 100}},      --  rare
{ItemName = "WEAPON_REDARP", ItemCount = 1, random = {a = 80, b = 100}},    -- rare



}

bedoflex.CoordSystem = "Random Coords" -- or Random Coords

bedoflex.AirdropCoords = { -- Possible coordinates for the airdrop to land
    vector3(-882.5654, -115.3191, 37.9638),
    vector3(-1085.6289, 263.8919, 63.9305),
    vector3(-224.5301, 261.9980, 92.0779),
    vector3(509.7928, 80.7725, 96.3862),
    vector3(752.0234, -28.9859, 81.9740),
    vector3(1173.6521, -512.6446, 65.1418),
    vector3(-173.9562, 6360.2739, 31.5194),
    vector3(-395.3300, 4706.2178, 263.8014),
    vector3(-1286.5773, 2525.2739, 19.8033),
    vector3(-1829.8851, 2213.0110, 87.0661),
    vector3(-2058.9214, 1182.3053, 287.6334),
    vector3(-1741.4968, 158.0225, 64.3710),
    vector3(-2159.6914, -350.6654, 13.1843),
    vector3(-1522.8920, -855.7369, 23.2255),
    vector3(-1005.3559, -1120.4236, 2.1862),
    vector3(-274.2031, -1430.2003, 31.3505),
    vector3(321.1263, -1516.7092, 29.3192),
    vector3(755.8544, -1195.4822, 45.0207),
    vector3(1082.2523, -693.4667, 58.0197),
    vector3(1346.9434, -568.8180, 74.3692),
    vector3(1089.1027, 4.9005, 80.8831),
    vector3(203.7943, 193.5903, 105.5673),
    vector3(776.1699, -2069.8931, 29.3561),
    vector3(738.3901, -2462.0596, 20.1589),
    vector3(-196.7617, -2623.1047, 6.0014),
    vector3(520.0048, -2975.6431, 6.0445),
    vector3(2551.0061, -387.1763, 92.9928),
    vector3(2574.6248, 1739.8424, 24.5029),
    vector3(2170.7791, 2195.1194, 115.4317),
    vector3(1287.8271, 2846.8640, 49.3943),
    vector3(825.6439, 3381.6448, 78.1551),
    vector3(1745.9901, 3751.5347, 33.9209),
    vector3(853.3459, 4230.6719, 50.1508),
    vector3(238.9619, 3572.7229, 34.2739),
    vector3(2998.0212, 4399.8345, 70.3704),
    vector3(2495.4722, 5053.3311, 50.5314),
    vector3(2031.4033, 4833.5664, 41.4618),
}