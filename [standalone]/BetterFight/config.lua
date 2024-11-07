Config = {}


--SERVERSIDE STUFF--
Config.CheckVersion =  false -- Enable/Disable version checker. Prints on serverside console.
--SERVERSIDE STUFF

--CROSSHAIR--
Config.UseCustomCrosshair = false -- Turn on/off custom crosshair.
Config.RemoveCrosshairOnFirstPerson = false -- Turn on/off custom crosshair while On First Person. IGNORE if the above is set to FALSE.
--CROSSHAIR--

--DISABLE HEADSHOT--
Config.RemoveHeadshots = true -- Disable/Enable headshots only on players.
--DISABLE HEADSHOT--

--JUMP SPAM PREVENTION
Config.JumpSpamPrevention = false -- Disable/Enable the jump spam prevention system. Pretty much if you spam the jump button it will make you fall down.
Config.JumpSpamPreventionTimer = 2000 -- Timer for the jump spam prevention system. This is in milliseconds. So 2000 is 2 seconds.
--JUMP SPAM PREVENTION


--REMOVE PISTOL WHIPPING
Config.RemovePistolWhipping = true
--REMOVE PISTOL WHIPPING

--ROLL PREVENTION
Config.RollPrevention = false -- Disable/Enable the roll prevention. Just doesn't allow players to roll while aiming. Yes, it is annoying in gta.
--ROLL PREVENTION

--VIEW CAM FORCER
Config.UseViewCamForcer = false -- Turn on/off view cam forcer inside vehicles.
Config.ViewCamForcerStartTime = 200
Config.ViewCamForcerFinishTime = 0
Config.UseVehicleViewCamForcer = true -- Turn on/off view cam forcer inside vehicles.
Config.UseDisable3rdPersonShooting = false
Config.UseFirstJoinViewCamForcer = false -- Disable the first person on first join. To stop the loop you need to trigger our export on your first joined event. exports['BetterFight']:ViewCamForcerJoined()
Config.DefaultViewCamModeOnFirstJoin = 1 -- Sets their prespective. Choose either 1/2/3.
--VIEW CAM FORCER

--WEAPON DAMAGES
Config.UseCustomWeaponDamages = true -- Disable/Enable custom weapon damages.
--WEAPON DAMAGES


--RECOIL
Config.UseRecoil = true -- Turn on/off recoil.
Config.RightLeftRecoil = true -- Turn on/off right left movement recoil.
Config.RightLeftRecoilRandomiser = true --If this is set to true then the recoil inside a vehicle will not trigger all the time. The value below will set the chance if true.
Config.RightLeftRecoilRandomiserChance = 50 --This is a percentage out of 100. The higher it is, the higher the chance of recoil kicking inside a vehicle.
Config.UseVehicleRecoil = true --Enable/Disable recoil inside vehicles.
Config.UseScreenExplosions = false --Adds a small screen explosion, it is affected by how big recoil is.
Config.GripMultiplier =  false
Config.SuppressorMultiplier = false
Config.LoweredFirstPersonRecoil = true -- Turn on/off lowered recoil while being in first person mode..
Config.LoweredFirstPersonRecoilValue = 0.00 -- Value for lowered recoil. It is actually the recoil * the value. So the lower the value is here the lowered it will be in first person.
--RECOIL--
--WEAPON SETTINGS--
Config.Weapons= {

    --You can change the values down here, feel free to also comment any weapons you don't want and add any weapons you do want. Only throwables are missing from this list.
    --Here's a link for you to find all weapons in GTA V: https://wiki.rage.mp/index.php?title=Weapons

   --Sniper Rifles
   [1] = { hash = `WEAPON_SNIPERRIFLE`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.80, suppressorMultiplier = 0.72, damageMultiplier = 1.00},
   [2] = { hash = `WEAPON_HEAVYSNIPER`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.80, suppressorMultiplier = 0.72, damageMultiplier = 1.00},
   [3] = { hash = `WEAPON_HEAVYSNIPER_MK2`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.80, suppressorMultiplier = 0.72, damageMultiplier = 1.00},
   [4] = { hash = `WEAPON_MARKSMANRIFLE`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.80, suppressorMultiplier = 0.72, damageMultiplier = 1.00},
   [5] = { hash = `WEAPON_MARKSMANRIFLE_MK2`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.80, suppressorMultiplier = 0.72, damageMultiplier = 1.00},
   
   --Melee--
   [6] = { hash = `WEAPON_UNARMED`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [7] = { hash = `WEAPON_DAGGER`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
   [8] = { hash = `WEAPON_BAT`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
   [9] = { hash = `WEAPON_BOTTLE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
   [10] = { hash = `WEAPON_CROWBAR`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
   [11] = { hash = `WEAPON_FLASHLIGHT`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.00},
   [12] = { hash = `WEAPON_GOLFCLUB`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
   [13] = { hash = `WEAPON_HAMMER`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
   [14] = { hash = `WEAPON_HATCHET`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
   [15] = { hash = `WEAPON_KNUCKLE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [16] = { hash = `WEAPON_KNIFE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.05},
   [17] = { hash = `WEAPON_MACHETE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [18] = { hash = `WEAPON_SWITCHBLADE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [19] = { hash = `WEAPON_NIGHTSTICK`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [20] = { hash = `WEAPON_WRENCH`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [21] = { hash = `WEAPON_BATTLEAXE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [22] = { hash = `WEAPON_POOLCUE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.05},
   [23] = { hash = `WEAPON_STONE_HATCHET`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [24] = { hash = `WEAPON_THERMALKATANA`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.0},
   [25] = { hash = `WEAPON_DAGGER2`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [26] = { hash = `WEAPON_KARAMBIT`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [27] = { hash = `WEAPON_KIBA`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [28] = { hash = `WEAPON_SOGFASTHAWK`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   [29] = { hash = `WEAPON_BERSERKER`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
   -- CRIMINAL
   [30] = { hash = `weapon_glock22`, recoil = 3.00, rightLeftRecoil = 3.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 8.00, gripMultiplier = 4.00, suppressorMultiplier = 4.00, damageMultiplier = 0.45},
   [31] = { hash = `weapon_m4wagesofsin`, recoil = 2.10, rightLeftRecoil = 5.50, vehicleRecoil = 4.00, vehicleRightLeftRecoil = 6.00, gripMultiplier = 4.00, suppressorMultiplier = 4.00, damageMultiplier = 0.38 },
   [32] = { hash = `weapon_yellowm4a1s`, recoil = 2.10, rightLeftRecoil = 5.50, vehicleRecoil = 4.00, vehicleRightLeftRecoil = 6.00, gripMultiplier = 4.00, suppressorMultiplier = 4.00, damageMultiplier = 0.38 },
   [33] = { hash = `weapon_tacticalak47`, recoil = 2.40, rightLeftRecoil = 6.00, vehicleRecoil = 4.00, vehicleRightLeftRecoil = 6.00, gripMultiplier = 4.00, suppressorMultiplier = 4.00, damageMultiplier = 0.41},
   [34] = { hash = `weapon_edge`, recoil = 4.00, rightLeftRecoil = 3.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 8.00, gripMultiplier = 4.00, suppressorMultiplier = 4.00, damageMultiplier = 0.58 },



   [35] = { hash = `WEAPON_REVOLVER`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.80, suppressorMultiplier = 0.72, damageMultiplier = 10.5},
   -- PD
   --[35] = { hash = `weapon_fostechorigin12`, recoil = 2.00, rightLeftRecoil = 3.00, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.63 },
   --[36] = { hash = `weapon_heymaker`, recoil = 2.00, rightLeftRecoil = 3.00, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.19 },
   [37] = { hash = `weapon_grau`, recoil = 1.70, rightLeftRecoil = 2.50, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.38 },
   [38] = { hash = `weapon_pq15`, recoil = 1.70, rightLeftRecoil = 2.50, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.38 },
   [39] = { hash = `weapon_pdmk18`, recoil = 1.70, rightLeftRecoil = 2.50, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.38 },
   --[40] = { hash = `weapon_akcqb`, recoil = 2.00, rightLeftRecoil = 3.00, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.70 },
   --[41] = { hash = `weapon_fnx45`, recoil = 2.00, rightLeftRecoil = 3.00, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.70},
   --[42] = { hash = `WEAPON_PISTOL50`, recoil = 2.00, rightLeftRecoil = 3.00, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.80, suppressorMultiplier = 1.00, damageMultiplier = 0.29},
   [43] = { hash = `weapon_glock17`, recoil = 2.00, rightLeftRecoil = 3.00, vehicleRecoil = 2.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.44},
   --[44] = { hash = `WEAPON_PUMPSHOTGUN_MK2`, recoil = 2.50, rightLeftRecoil = 3.00, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 4.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.70},
   [45] = { hash = `weapon_scarh`, recoil = 1.70, rightLeftRecoil = 2.50, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.35},
   [46] = { hash = `weapon_ar15`, recoil = 1.70, rightLeftRecoil = 2.50, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.38},
   --[47] = { hash = `weapon_m4`, recoil = 1.50, rightLeftRecoil = 3.00, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.38},
   [48] = { hash = `weapon_hk416`, recoil = 1.70, rightLeftRecoil = 2.50, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.39},
  
   [50] = { hash = `WEAPON_STUNGUN`, recoil = 1.00, rightLeftRecoil = 2.50, vehicleRecoil = 1.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 1.00, suppressorMultiplier = 1.00, damageMultiplier = 0.10},
   [51] = { hash = `WEAPON_COLBATON`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 1.00, suppressorMultiplier = 0.00, damageMultiplier = 3.00},

   -- ADMIN
   [52] = { hash = `weapon_1928bar`, recoil = 0.0, rightLeftRecoil = 0.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 100.70 },
   [53] = { hash = `weapon_an94`, recoil = 0.0, rightLeftRecoil = 0.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 100.70 },
   [54] = { hash = `weapon_darkknightak`, recoil = 0.0, rightLeftRecoil = 0.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 100.70 },
   --[55] = { hash = `weapon_icedrake`, recoil = 0.0, rightLeftRecoil = 1.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 100.70 },
   [56] = { hash = `weapon_kn57`, recoil = 0.0, rightLeftRecoil = 0.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 100.70 },
   [57] = { hash = `weapon_m249playmaker`, recoil = 0.0, rightLeftRecoil = 0.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 100.70 },
   [58] = { hash = `WEAPON_MINIGUN`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 100.70},
   [59] = { hash = `WEAPON_RPG`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 100.70},
   [60] = { hash = `WEAPON_FIREWORK`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1000.70},
   [61] = { hash = `WEAPON_HOMINGLAUNCHER`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 100.70},
   [62] = { hash = `WEAPON_GAK`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 3.00, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 100.70},



   [63] = { hash = `WEAPON_ILLGLOCK17`, recoil = 0.5, rightLeftRecoil = 0.2, vehicleRecoil = 3.8, vehicleRightLeftRecoil = 0.3, gripMultiplier = 0.9, suppressorMultiplier = 0.95, damageMultiplier = 0.4 },
   [64] = { hash = `WEAPON_MIDASGLOCK`, recoil = 0.6, rightLeftRecoil = 0.25, vehicleRecoil = 3.9, vehicleRightLeftRecoil = 0.35, gripMultiplier = 0.92, suppressorMultiplier = 0.95, damageMultiplier = 0.35 },
   [65] = { hash = `WEAPON_BLUEGLOCKS`, recoil = 0.5, rightLeftRecoil = 0.2, vehicleRecoil = 3.85, vehicleRightLeftRecoil = 0.3, gripMultiplier = 0.9, suppressorMultiplier = 0.94, damageMultiplier = 0.32 },
   [66] = { hash = `WEAPON_GLOCK21`, recoil = 0.6, rightLeftRecoil = 0.3, vehicleRecoil = 3.9, vehicleRightLeftRecoil = 0.4, gripMultiplier = 0.88, suppressorMultiplier = 0.93, damageMultiplier = 0.45 },
   [67] = { hash = `WEAPON_P210`, recoil = 0.4, rightLeftRecoil = 0.15, vehicleRecoil = 3.7, vehicleRightLeftRecoil = 0.25, gripMultiplier = 0.9, suppressorMultiplier = 0.95, damageMultiplier = 0.3 },
   [68] = { hash = `WEAPON_GLOCKBEAMS`, recoil = 0.5, rightLeftRecoil = 0.2, vehicleRecoil = 3.8, vehicleRightLeftRecoil = 0.35, gripMultiplier = 0.9, suppressorMultiplier = 0.92, damageMultiplier = 0.33 },
   [69] = { hash = `WEAPON_SR40`, recoil = 0.7, rightLeftRecoil = 0.3, vehicleRecoil = 3.0, vehicleRightLeftRecoil = 0.4, gripMultiplier = 0.85, suppressorMultiplier = 0.9, damageMultiplier = 0.48 },
   [70] = { hash = `WEAPON_T1911`, recoil = 0.6, rightLeftRecoil = 0.25, vehicleRecoil = 3.9, vehicleRightLeftRecoil = 0.35, gripMultiplier = 0.88, suppressorMultiplier = 0.93, damageMultiplier = 0.4 },
   [71] = { hash = `WEAPON_MGGLOCK`, recoil = 0.5, rightLeftRecoil = 0.2, vehicleRecoil = 3.8, vehicleRightLeftRecoil = 0.3, gripMultiplier = 0.9, suppressorMultiplier = 0.95, damageMultiplier = 0.38 },
   [72] = { hash = `WEAPON_TGLOCK19`, recoil = 0.6, rightLeftRecoil = 0.25, vehicleRecoil = 3.85, vehicleRightLeftRecoil = 0.35, gripMultiplier = 0.89, suppressorMultiplier = 0.93, damageMultiplier = 0.35 },
   [73] = { hash = `WEAPON_GLOCK41`, recoil = 0.7, rightLeftRecoil = 0.3, vehicleRecoil = 3.95, vehicleRightLeftRecoil = 0.4, gripMultiplier = 0.88, suppressorMultiplier = 0.92, damageMultiplier = 0.42 },
   [74] = { hash = `WEAPON_FN57`, recoil = 0.5, rightLeftRecoil = 0.2, vehicleRecoil = 3.8, vehicleRightLeftRecoil = 0.3, gripMultiplier = 0.92, suppressorMultiplier = 0.95, damageMultiplier = 0.34 },
   [75] = { hash = `WEAPON_P30L`, recoil = 0.4, rightLeftRecoil = 0.15, vehicleRecoil = 3.75, vehicleRightLeftRecoil = 0.25, gripMultiplier = 0.9, suppressorMultiplier = 0.95, damageMultiplier = 0.32 },
   [76] = { hash = `WEAPON_TEC9S`, recoil = 0.8, rightLeftRecoil = 0.35, vehicleRecoil = 3.1, vehicleRightLeftRecoil = 0.45, gripMultiplier = 0.85, suppressorMultiplier = 0.9, damageMultiplier = 0.48 },
   [77] = { hash = `WEAPON_KRISSVECTOR`, recoil = 0.7, rightLeftRecoil = 0.3, vehicleRecoil = 3.0, vehicleRightLeftRecoil = 0.4, gripMultiplier = 0.88, suppressorMultiplier = 0.93, damageMultiplier = 0.45 },
   [78] = { hash = `WEAPON_REDM4A1`, recoil = 0.0, rightLeftRecoil = 0.0, vehicleRecoil = 3.2, vehicleRightLeftRecoil = 0.5, gripMultiplier = 0.82, suppressorMultiplier = 0.88, damageMultiplier = 0.5 },
   [79] = { hash = `WEAPON_R590`, recoil = 0.0, rightLeftRecoil = 0.0, vehicleRecoil = 3.3, vehicleRightLeftRecoil = 0.55, gripMultiplier = 0.8, suppressorMultiplier = 0.85, damageMultiplier = 0.5 },
   [80] = { hash = `WEAPON_M500`, recoil = 1.2, rightLeftRecoil = 0.4, vehicleRecoil = 3.4, vehicleRightLeftRecoil = 0.6, gripMultiplier = 0.78, suppressorMultiplier = 0.83, damageMultiplier = 0.5 },  --- craft
   [81] = { hash = `WEAPON_LBTARP`, recoil = 0.7, rightLeftRecoil = 0.3, vehicleRecoil = 3.0, vehicleRightLeftRecoil = 0.4, gripMultiplier = 0.88, suppressorMultiplier = 0.92, damageMultiplier = 0.45 },
   [82] = { hash = `WEAPON_BLACKARP`, recoil = 0.6, rightLeftRecoil = 0.25, vehicleRecoil = 3.9, vehicleRightLeftRecoil = 0.35, gripMultiplier = 0.9, suppressorMultiplier = 0.93, damageMultiplier = 0.43 },
   [83] = { hash = `WEAPON_REDARP`, recoil = 0.5, rightLeftRecoil = 0.2, vehicleRecoil = 3.85, vehicleRightLeftRecoil = 0.3, gripMultiplier = 0.92, suppressorMultiplier = 0.95, damageMultiplier = 0.5 },   -- gun drop
   [84] = { hash = `WEAPON_TARP`, recoil = 0.7, rightLeftRecoil = 0.3, vehicleRecoil = 3.0, vehicleRightLeftRecoil = 0.4, gripMultiplier = 0.88, suppressorMultiplier = 0.92, damageMultiplier = 0.44 },
   [85] = { hash = `WEAPON_WOARP`, recoil = 0.5, rightLeftRecoil = 0.2, vehicleRecoil = 3.8, vehicleRightLeftRecoil = 0.35, gripMultiplier = 0.9, suppressorMultiplier = 0.95, damageMultiplier = 0.36 },
   [86] = { hash = `WEAPON_RAM7`, recoil = 0.8, rightLeftRecoil = 0.35, vehicleRecoil = 3.1, vehicleRightLeftRecoil = 0.45, gripMultiplier = 0.85, suppressorMultiplier = 0.9, damageMultiplier = 0.48 },
   [87] = { hash = `WEAPON_THOMPSON`, recoil = 0.0, rightLeftRecoil = 0.0, vehicleRecoil = 3.2, vehicleRightLeftRecoil = 0.5, gripMultiplier = 0.82, suppressorMultiplier = 0.88, damageMultiplier = 0.5 },  --mafia
   [88] = { hash = `WEAPON_BAR15`, recoil = 0.0, rightLeftRecoil = 0.0, vehicleRecoil = 3.3, vehicleRightLeftRecoil = 0.55, gripMultiplier = 0.8, suppressorMultiplier = 0.85, damageMultiplier = 0.5 },   --- craft
   [89] = { hash = `WEAPON_BSCAR`, recoil = 0.0, rightLeftRecoil = 0.0, vehicleRecoil = 3.4, vehicleRightLeftRecoil = 0.6, gripMultiplier = 0.78, suppressorMultiplier = 0.83, damageMultiplier = 0.5 },    --mafia
   [90] = { hash = `WEAPON_DMK18`, recoil = 0.0, rightLeftRecoil = 0.0, vehicleRecoil = 3.1, vehicleRightLeftRecoil = 0.45, gripMultiplier = 0.85, suppressorMultiplier = 0.9, damageMultiplier = 0.5 },     -- gun drop
   


   --- pd new 
   [91] = { hash = `WEAPON_PDBATON`, recoil = 0.0, rightLeftRecoil = 0.0, vehicleRecoil = 3.0, vehicleRightLeftRecoil = 0.0, gripMultiplier = 1.0, suppressorMultiplier = 1.0, damageMultiplier = 0.1 },  -- Baton, no recoil
   [92] = { hash = `WEAPON_BTASER`, recoil = 0.2, rightLeftRecoil = 0.1, vehicleRecoil = 3.3, vehicleRightLeftRecoil = 0.1, gripMultiplier = 1.0, suppressorMultiplier = 1.0, damageMultiplier = 0.25 },  -- Taser, very minimal recoil
   [93] = { hash = `WEAPON_YTASER`, recoil = 0.2, rightLeftRecoil = 0.1, vehicleRecoil = 3.3, vehicleRightLeftRecoil = 0.1, gripMultiplier = 1.0, suppressorMultiplier = 1.0, damageMultiplier = 0.0 },  -- Taser, very minimal recoil
   [94] = { hash = `WEAPON_PDG19`, recoil = 0.6, rightLeftRecoil = 0.2, vehicleRecoil = 3.9, vehicleRightLeftRecoil = 0.4, gripMultiplier = 0.9, suppressorMultiplier = 0.95, damageMultiplier = 0.35 },  -- Pistol
   [95] = { hash = `WEAPON_PD870`, recoil = 1.2, rightLeftRecoil = 0.4, vehicleRecoil = 3.5, vehicleRightLeftRecoil = 0.6, gripMultiplier = 0.85, suppressorMultiplier = 0.9, damageMultiplier = 0.5 },  -- Shotgun
   [96] = { hash = `WEAPON_PDM700`, recoil = 0.8, rightLeftRecoil = 0.3, vehicleRecoil = 3.3, vehicleRightLeftRecoil = 0.5, gripMultiplier = 0.88, suppressorMultiplier = 0.92, damageMultiplier = 0.45 },  -- Rifle
   [97] = { hash = `WEAPON_HK417`, recoil = 0.0, rightLeftRecoil = 0.0, vehicleRecoil = 3.4, vehicleRightLeftRecoil = 0.55, gripMultiplier = 0.85, suppressorMultiplier = 0.9, damageMultiplier = 0.5 },  -- Rifle
   [98] = { hash = `WEAPON_PDCM607`, recoil = 0.0, rightLeftRecoil = 0.0, vehicleRecoil = 3.6, vehicleRightLeftRecoil = 0.6, gripMultiplier = 0.8, suppressorMultiplier = 0.88, damageMultiplier = 0.5 },  -- Carbine Rifle
   [99] = { hash = `WEAPON_PDC7`, recoil = 0.9, rightLeftRecoil = 0.3, vehicleRecoil = 3.2, vehicleRightLeftRecoil = 0.5, gripMultiplier = 0.88, suppressorMultiplier = 0.92, damageMultiplier = 0.42 },  -- Rifle
   [100] = { hash = `WEAPON_PDG22`, recoil = 0.6, rightLeftRecoil = 0.2, vehicleRecoil = 3.9, vehicleRightLeftRecoil = 0.4, gripMultiplier = 0.9, suppressorMultiplier = 0.95, damageMultiplier = 0.35 },  -- Pistol
   [101] = { hash = `WEAPON_PDBM3`, recoil = 0.8, rightLeftRecoil = 0.45, vehicleRecoil = 3.7, vehicleRightLeftRecoil = 0.65, gripMultiplier = 0.8, suppressorMultiplier = 0.88, damageMultiplier = 0.5 },  -- Shotgun
   [102] = { hash = `WEAPON_PDP88`, recoil = 0.7, rightLeftRecoil = 0.25, vehicleRecoil = 3.0, vehicleRightLeftRecoil = 0.45, gripMultiplier = 0.88, suppressorMultiplier = 0.93, damageMultiplier = 0.38 },  -- Pistol
   [103] = { hash = `WEAPON_PDHK45`, recoil = 0.8, rightLeftRecoil = 0.3, vehicleRecoil = 3.1, vehicleRightLeftRecoil = 0.5, gripMultiplier = 0.85, suppressorMultiplier = 0.9, damageMultiplier = 0.4 },  -- Pistol
   [104] = { hash = `WEAPON_PDHK33`, recoil = 0.7, rightLeftRecoil = 0.35, vehicleRecoil = 3.3, vehicleRightLeftRecoil = 0.55, gripMultiplier = 0.85, suppressorMultiplier = 0.9, damageMultiplier = 0.45 },  -- Rifle
   [105] = { hash = `WEAPON_PDHKUSP`, recoil = 0.9, rightLeftRecoil = 0.3, vehicleRecoil = 3.2, vehicleRightLeftRecoil = 0.5, gripMultiplier = 0.88, suppressorMultiplier = 0.92, damageMultiplier = 0.42 },  -- Pistol
   [106] = { hash = `WEAPON_SMG`, recoil = 0.0, rightLeftRecoil = 0.3, vehicleRecoil = 3.00, vehicleRightLeftRecoil = .4, gripMultiplier = 0.8, suppressorMultiplier = 0.8, damageMultiplier = 0.3},

   
   
}
