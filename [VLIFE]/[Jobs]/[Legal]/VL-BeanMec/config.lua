Config = {
	Debug = false, -- false to remove green boxes
	Lan = "en",
	img = "ox_inventory/web/images/", -- Change this to your inventory's name and image folder (SET TO "" IF YOU HAVE DOUBLE IMAGES)

	PatHeal = 0, 			--how much you are healed by patting a cat, 2 hp seems resonable, enough not to be over powered and enough to draw people in.
							--set to 0 if you don't want to use this
	RelieveStress = 2,		-- How much stress relief per pat

	Core = "qb-core", -- set this to your core folder
	Inv = "ox", -- set to "ox" if using OX Inventory
	Menu = "ox", -- set to "ox" if using ox_lib context menus
	Notify = "ox",
	ProgressBar = "ox", -- set to "ox" if using ox_lib progressbar

	MultiCraft = true,
	MultiCraftAmounts = { [1], [5], [10], [20], [30], [40], [50], [100] },
	
	JimShop = true, 		-- Enable this to use jim-shops for buying ingredients

	--Simple Toy Reward Support
	RewardItem = "", --Set this to the name of an item eg "bento"
	RewardPool = { -- Set this to the list of items to be given out as random prizes when the item is used - can be more or less items in the list
		"",
		"",
		"",
	},

	
	FoodItems = {
		label = "Food Store",
		slots = 8,
		items = {
			{ name = "water_bottle", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "sugar", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "chickenbreast", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "rhinohorn", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "oystershell", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "milk", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "beancoffee", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
		},
	},
	DesertItems = {
		label = "Desert Store",
		slots = 6,
		items = {
			{ name = "beandonut", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "chocolate", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "watermelon", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "cheesecake", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "tosti", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
		},
	},
	SodaItems = {
		label = "Soda Storage",
		slots = 4,
		items = {
			{ name = "ecola", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "ecolalight", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "sprunk", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
		},
	},
	Locations = {
		{	zoneEnable = true,
			job = "beanmachine", -- Set this to the required job
			label = "Bean Machine(Legion)",
			autoClock = { enter = false, exit = false, },
			zones = {
				vec2(137.44329833984, -1019.5242919922),
				vec2(122.99235534668, -1058.451171875),
				vec2(101.35326385498, -1048.4799804688),
				vec2(115.27521514893, -1011.9081420898)
			},
			garage = { spawn = vec4(130.93, -1032.04, 28.76, 340.2),
						out = vec4(129.41, -1031.15, 29.43, 253.32),
						list = { "panto", } },
			blip = vec3(120.27, -1038.09, 29.28), blipcolor = 56, blipsprite = 106, blipdisp = 6, blipscale = 0.7, blipcat = nil,
		},
	},
}


Crafting = {
	Slush = {
		{ ['bigfruit'] = { ['watermelon'] = 1, ['water_bottle'] = 1, ['orange'] = 1, ['sugar'] = 1, }, },
	},
	Drinks = {
		{ ['highnoon'] = { ['beancoffee'] = 1, ['water_bottle'] = 1, ['orange'] = 1, }, },
		{ ['speedball'] = { ['beancoffee'] = 3, ['sugar'] = 1, }, },
		{ ['gunkaccino'] = { ['beancoffee'] = 1, ['sugar'] = 2, ['cheesecake'] = 1, }, },
		{ ['bratte'] = { ['beancoffee'] = 2, ['sugar'] = 5, }, },
		{ ['flusher'] = { ['beancoffee'] = 1, ['water_bottle'] = 1, ['orange'] = 1, ['chickenbreast'] = 1, }, },
		{ ['ecocoffee'] = { ['beancoffee'] = 1, ['water_bottle'] = 1, ['milk'] = 1, ['plastic'] = 1, }, },
		{ ['caffeagra'] = { ['beancoffee'] = 1, ['rhinohorn'] = 2, ['oystershell'] = 1, }, },
	},
}

Loc = {}