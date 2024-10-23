Loc = {}

--[[	LIST OF POSSIBLE VEHICLE MODIFIERS   ]]--
-- Using these will change how each vehicle spawns
-- This can be used for making sure the vehicles comes out exactly how you want it to

-- CustomName = "Police Car", this will show a custom override name for your vehicles so you don't need to add them to your vehicles.lua
-- rank = { 2, 4 }, -- This specifes which grades can see it, and only these grades
-- grade = 4, -- This specifies the lowest grade and above that can see the vehicle
-- colors = { 136, 137 }, -- This is the colour index id of the vehicle, Primary and Secondary in that order
-- bulletproof = true, -- This determines if the tyres are bullet proof (don't ask me why, I was asked to add this)
-- livery = 1, -- This sets the livery id of the vehicle, (most mod menus would number them or have them in number order) 0 = stock
-- extras = { 1, 5 }, -- This enables the selected extras on the vehicle
-- performance = "max", this sets the stats to max if available
-- performance = { 2, 3, 3, 2, 4, true }, -- This allows more specific settings for each upgrade level, in order: engine, brakes, suspension, transmission, armour, turbo
-- trunkItems = { }, -- Use this to add items to the trunk of the vehicle when it is spawned

-- ANY VEHICLE, BOATS, POLICE CARS, EMS VEHICLES OR EVEN PLANES CAN BE ADDED.

Config = {
	Debug = false,  -- Enable to use debug features
	Lan = "en",

	Core = "qb-core",
	Menu = "ox",
	Notify = "ox",

	Fuel = "cdn-fuel", -- Set this to your fuel script folder

	CarDespawn = false, -- Sends the vehicle to hell (removal animation)

	DistCheck = false, -- Require the vehicle to be near by to remove it

	Locations = {
		-- { 	zoneEnable = true,
		-- 	job = "mechanic",
		-- 	garage = {
		-- 		spawn = vec4(-179.34, -1285.27, 30.83, 89.24),  -- Where the car will spawn
		-- 		out = vec4(-177.1, -1282.25, 31.3, 179.01),	-- Where the parking stand is
		-- 		list = {
		-- 			["cheburek"] = {
		-- 				colors = { 136, 137 },
		-- 				grade = 4,
		-- 				livery = 5,
		-- 				bulletproof = true,
		-- 				extras = { 1, 4 },
		-- 			},
		-- 			["burrito3"] = { },
		-- 		},
		-- 	},
		-- },
		{ 	zoneEnable = true,
			job = "police",
			garage = {
				spawn = vector4(480.827, -1020.34, 28.782, 270.149),
				out = vector4(476.325, -1016.751, 27.982, 185.214),
				list = {
					["npolcoach"] = {
						CustomName = "DOC Bus",
						livery = 0,
						grade = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["bcat"] = {
						CustomName = "SWAT Escort",
						livery = 0,
						grade = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["riot2"] = {
						CustomName = "Armored RCV Escort",
						livery = 0,
						grade = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["insurgent2"] = {
						CustomName = "Armored Escort",
						livery = 0,
						grade = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["govcaval3"] = {
						CustomName = "VIP Escort",
						livery = 0,
						grade = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},

					-- ["police"] = {
					-- 	CustomName = "Police Car",
					-- 	livery = 5,
					-- 	extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
					-- 	performance = "max",
					-- 	-- trunkItems = {
					-- 	-- 	{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
					-- 	-- 	{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
					-- 	-- 	{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
					-- 	-- },
					-- },
					-- ["fbi"] = {
					-- 	rank = { 4 },
					-- 	performance = { 2, 3, 3, 2, 4, true },
					-- },
				},
			},
		},
		{ 	zoneEnable = true,
			job = "police",
			garage = {
				spawn = vector4(-792.84, -1501.314, -0.475, 104.442),
				out = vector4(-778.482, -1502.79, 1.521, 24.748),
				list = {
					["predator"] = {
						CustomName = "Predator",
						livery = 0,
						grade = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
				},
			},
		},	
		{ 	zoneEnable = true,
			job = "police",
			garage = {
				spawn = vector4(450.121, -975.998, 25.7, 276.733),
				out = vector4(441.484, -974.681, 25.7, 180.053),
				list = {
					["npolmm"] = {
						CustomName = "GS 1200",
						livery = 0,
						grade = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["npolvette"] = {
						CustomName = "Corvette",
						livery = 0,
						grade = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["npolretinue"] = {
						CustomName = "Retinue",
						livery = 0,
						grade = 20,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
				},
			},
		},	
		-- { 	zoneEnable = true,
		-- 	job = "ambulance",
		-- 	garage = {
		-- 		spawn = vec4(294.95, -606.92, 43.24, 64.84),
		-- 		out = vec4(294.54, -599.52, 43.28, 159.68),
		-- 		list = {
		-- 			["ambulance"] = {
		-- 				CustomName = "Ambulance"
		-- 			},
		-- 		},
		-- 	},
		-- },
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "police", -- set this to required job grade
			garage = {
				spawn = vector4(449.698, -981.263, 43.691, 94.398),  -- Where the vehicle will spawn
				out = vector4(463.926, -982.329, 43.692, 93.156),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["polas350"] = {
						CustomName = "PD Heli",
						livery = 2,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					}
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "ambulance", -- set this to required job grade
			garage = {
				spawn = vector4(-501.15, -331.44, 34.39, 259.82),  -- Where the vehicle will spawn
				out = vector4(-502.41, -328.04, 34.39, 171.08),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					
					["emsnspeedo"] = {
						CustomName = "EMT",
						livery = 0,
						grade = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["emscar2"] = {
						CustomName = "EMT Advance",
						livery = 4,
						grade = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["npolchar"] = {
						CustomName = "EMS Sargent",
						livery = 8,
						grade = 2,
						colors = { 74, 74 },
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["poltorencep"] = {
						CustomName = "EMS Lead-Paramedic",
						livery = 1,
						grade = 3,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["polscoutp"] = {
						CustomName = "EMS Specialist",
						livery = 1,
						grade = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["polgauntletp"] = {
						CustomName = "EMS Lieutenant",
						livery = 1,
						grade = 5,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["polvigerop"] = {
						CustomName = "EMS Captain",
						livery = 1,
						grade = 6,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["mbu3bb"] = {
						CustomName = "EMS bike",
						livery = 1,
						grade = 6,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},

					["npolexp"] = {
						CustomName = "Assistant Chief",
						livery = 1,
						grade = 7,
						colors = { 74, 74 },
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					--[[ ["npolexp"] = {
						CustomName = "Deputy Chief",
						livery = 1,
						grade = 8,
						colors = { 255, 255 },
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["npolexp"] = {
						CustomName = "Chief of EMS",
						livery = 1,
						grade = 9,
						colors = { 0, 0 },
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					}, ]]
				},
			},
		},

		

		
		
		
		
		
		



		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "ambulance", -- set this to required job grade
			garage = {
				spawn = vector4(-447.36877441406, -312.50741577148, 78.164588928223, 23.741683959961),  -- Where the vehicle will spawn
				out = vector4(-437.19180297852, -319.03134155273, 78.164512634277, 118.92848968506),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["emsaw139"] = {
						CustomName = "emsaw139 Super",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					}
					--[[ ["supervolito"] = {
						CustomName = "Heli",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					} ]]
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "beanmachine", -- set this to required job grade
			garage = {
				spawn = vector4(129.36, -1036.4, 29.43, 338.77),  -- Where the vehicle will spawn
				out = vector4(125.95, -1040.69, 29.22, 262.46),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["starbucksvan"] = {
						CustomName = "Van",
						livery = 27,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["foodbike"] = {
						CustomName = "Bike",
						livery = 27,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["foodcar3"] = {
						CustomName = "Van 2",
						livery = 27,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "atoms", -- set this to required job grade
			garage = {
				spawn = vector4(89.43, 304.86, 110.01, 67.02),  -- Where the vehicle will spawn
				out = vector4(90.66, 312.64, 110.03, 159.33),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["foodcar"] = {
						CustomName = "speed Van",
						livery = 20,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					}
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "catcafe", -- set this to required job grade
			garage = {
				spawn = vector4(-594.47, -1087.68, 22.18, 225.31),  -- Where the vehicle will spawn
				out = vector4(-590.59, -1087.36, 22.33, 190.21),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
				["panto"] = {
					CustomName = "speed",
					livery = 20,
					extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
					performance = "max",
				},
				["burrito3"] = {
					CustomName = "store Van",
					livery = 20,
					extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
					performance = "max",
				}
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "burgershot", -- set this to required job grade
			garage = {
				spawn = vector4(-1179.77, -903.0, 13.54, 295.23),  -- Where the vehicle will spawn
				out = vector4(-1175.04, -903.23, 13.66, 33.76),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["stalion2"] = {
						CustomName = "speed",
						livery = 20,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["burrito3"] = {
						CustomName = "store Van",
						livery = 20,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					}
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "koi", -- set this to required job grade
			garage = {
				spawn = vector4(-1019.72, -1464.0, 5.05, 26.37),  -- Where the vehicle will spawn
				out = vector4(-1023.08, -1465.58, 5.05, 302.14),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["foodcar2"] = {
						CustomName = "speed Van",
						livery = 15,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					}
				},
			},
		},
	},
}
