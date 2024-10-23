Config.Locations = Config.Locations or {}
--[[ 

Config.Locations[#Config.Locations+1] = { 
	Enabled = true,
	job = "mechanicautos",
	zones = {
		vector2(525.06372070312, -147.67092895508),
  		vector2(562.84588623047, -146.33016967773),
		vector2(591.15319824219, -176.9616394043),
		vector2(594.78039550781, -206.00289916992),
  		vector2(564.77819824219, -206.73092651367),
  		vector2(529.23681640625, -206.20852661133)
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(556.04, -179.4, 54.52, 179.72), w = 2.0, d = 3, }, 
		{ coords = vec4(556.07, -187.11, 54.51, 179.72), w = 2.0, d = 3, },
		{ coords = vec4(562.81, -202.78, 50.38, 181.80), w = 1.0, d = 2, },
	},
	store = {
		{ coords = vec4(560.50, -187.34, 54.50, 275.71), w = 1.3, d = 1.3, }, 
	},
	carLift = {
		{ coords = vec4(553.50, -175.66, 54.50, 269.94), use = false },
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/0/0c/HayesAutoBodyShop-GTAV-Logo.png/revision/latest?cb=20160921170659",
		{ coords = vec4(543.80, -199.39, 54.53, 271.33), prop = true, }, 
	},
	Restrictions = { -- Remove what you DON'T what the location to be able to edit
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vector3(548.86, -183.96, 54.51),
		label = "Auto Exotic",
		color = 3,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 16711680,
	}
}
 ]]



Config.Locations[#Config.Locations+1] = {
	Enabled = true,
	job = "countymechanic",              --- petelo
	zones = {
		vec2(1081.5328369141, 2696.1118164062),
		vec2(1084.4787597656, 2784.1237792969),
		vec2(1015.5625, 2783.1748046875),
		vec2(1010.1610107422, 2780.2329101562),
		vec2(1005.7610473633, 2733.5649414062),
		vec2(1005.0486450195, 2699.4719238281)

	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(1062.74, 2725.99, 38.79, 358.0), w = 5.0, d = 1.0 },
		{ coords = vec4(1063.6, 2744.04, 38.84, 0.0), w = 5.0, d = 1.0 },
		{ coords = vec4(1036.8, 2754.3, 38.85, 358.0), w = 5.0, d = 1.0 },
		{ coords = vec4(1035.96, 2736.3, 38.79, 358.0), w = 5.0, d = 1.0 }
	},
	store = {
		{ coords = vec4(1056.35, 2715.04, 38.79, 358.0), w = 1.2, d = 3.8 }
	},
	--[[ crafting = {
		{ coords = vec4(-328.42184448242, -165.7989654541, 39.009510040283, 195.7785949707), w = 3.2, d = 1.0 }
	}, ]]
	clockin = {
		{ coords = vec4(0.0, 0.0, 0.0, 0), prop = false, },
	},
	manualRepair = {
		{ coords = vec4(37.99, -1781.93, 29.61, 317.36), prop = true, },

		{ coords = vec4(-1300.52, -3370.22, 13.94, 241.05), prop = true, },
	},
	--[[ carLift = {
		{ coords = vec4(-333.95, -135.42, 39.01, 340), },
		{ coords = vec4(-323.76, -155.36, 39.01, 249.59) },
	}, ]]
	garage = {
		spawn = vec4(-359.2473449707, -122.99184417725, 38.699180603027, 153.87454223633),
		out = vec4(-353.98, -127.04, 39.43, 74.74),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
		{ coords = vec4(1062.5181, 2718.5505, 38.6436, 267.4991), prop = true, },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(1035.96, 2736.3, 38.79),
		label = "County Mechanics",
		color = 3,
		sprite = 446,
		disp = 6,
		scale = 1.0,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}




Config.Locations[#Config.Locations+1] = { 
	Enabled = true,
	job = "urbanmechanic",
	zones = {
		vector2(90.257316589355, -1847.4005126953),
		vector2(124.62877655029, -1815.1960449219),
		vector2(151.16674804688, -1782.8688964844),
		vector2(83.204689025879, -1725.7215576172),
		vector2(47.444877624512, -1697.4614257812),
		vector2(-26.445264816284, -1747.6912841797)
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(76.8, -1792.55, 29.61, 50), w = 2.0, d = 3, }, 
		{ coords = vec4(71.19, -1788.45, 29.61, 140), w = 2.0, d = 3, }
		
	},
	store = {
		{ coords = vec4(105.51, -1771.11, 29.61, 50), w = 1.3, d = 1.3, },
		{ coords = vec4(82.48, -1762.31, 29.61, 55), w = 1.3, d = 1.3, },
		{ coords = vec4(67.5, -1785.15, 29.61, 140), w = 1.3, d = 1.3, },
		{ coords = vec4(80.99, -1795.83, 29.61, 320), w = 1.3, d = 1.3, }
	},
	--[[ crafting = {
		{ coords = vec4(-328.42184448242, -165.7989654541, 39.009510040283, 195.7785949707), w = 3.2, d = 1.0 }
	}, ]]
	--[[ clockin = {
		{ coords = vec4(0.0, 0.0, 0.0, 0), prop = false, },
	},]]
	manualRepair = {
		{ coords = vec4(1033.77, 2707.8, 38.79, 0.06), prop = true, },
	},
	--[[ carLift = {
		{ coords = vec4(-333.95, -135.42, 39.01, 340), },
		{ coords = vec4(-323.76, -155.36, 39.01, 249.59) },
	}, ]]
	garage = {
		spawn = vec4(-359.2473449707, -122.99184417725, 38.699180603027, 153.87454223633),
		out = vec4(-353.98, -127.04, 39.43, 74.74),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/0/0c/HayesAutoBodyShop-GTAV-Logo.png/revision/latest?cb=20160921170659",
		{ coords = vec4(81.84, -1735.32, 29.61, 50), prop = true, }, 
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vector3(82.43, -1763.66, 29.61),
		label = "Urban Mechanics",
		color = 3,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 16711680,
	}
}


Config.Locations[#Config.Locations+1] = { --[[ GABZ ALTA STREET BENNYS ]]--
	Enabled = true,
	job = "pdmmechancis",
	zones = {
		vec2(-249.339, -1152.002),
		vec2(-248.799, -1185.063),
		vec2(-128.949, -1187.516),
		vec2(-125.76, -1151.523)
		
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(-209.2, -1176.95, 23.03, 90.0), w = 4.0, d = 2.0, },
		{ coords = vec4(-195.93, -1176.84, 23.03, 90.0), w = 4.0, d = 2.0, },
		{ coords = vec4(-182.19, -1176.62, 23.03, 90.0), w = 3.0, d = 2.0, },
	},
	store = {
		{ coords = vec4(-202.53, -1175.81, 23.03, 90.0), w = 8.0, d = 3.0 },
		{ coords = vec4(-188.56, -1175.83, 23.03, 90.0), w = 8.0, d = 3.0 },
		{ coords = vec4(-175.5, -1175.34, 23.03, 90.0), w = 8.0, d = 3.0 },
	},
	crafting = {
		{ coords = vec4(-203.687, -1159.738, 23.034, 0.0), w = 2.0, d = 1.0 },
		{ coords = vec4(-174.74, -1163.279, 23.036, 0.0), w = 2.0, d = 1.0 },
	},
	clockin = {
		{ coords = vec4(-210.33, -1162.56, 23.03, 0.0), prop = false },
	},
	manualRepair = {
		{ coords = vec4(-171.99, -1159.58, 23.03, 270.0), prop = false, },
	},
	carLift = {
        { coords = vec4(-201.85, -1319.65, 31.3, 19.36), useMLOLift = false },
        { coords = vec4(-221.27, -1318.71, 31.3, 352.67), useMLOLift = false },
    },
	garage = {
		spawn = vec4(-246.369, -1183.977, 23.096, 336.62),
		out = vec4(-241.054, -1183.624, 23.029, 274.45),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(-214.68, -1162.9, 23.03, 0.0), prop = false },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-210.123, -1171.293, 23.034),
		label = "PDM Mechanic",
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/kKC2Mw2.png",
	},
	discord = {
		link = "",
		color = 16711680,
	}
}
