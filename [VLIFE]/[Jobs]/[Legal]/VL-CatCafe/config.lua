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

	Items = {
		label = "Ingredients Storage",
		slots = 14,
		items = {
			{ name = "sugar", price = 8, amount = 500, info = {}, type = "item", slot = 1, },
			{ name = "flour", price = 8, amount = 500, info = {}, type = "item", slot = 2, },
			{ name = "nori", price = 8, amount = 500, info = {}, type = "item", slot = 3, },
			{ name = "tofu", price = 8, amount = 500, info = {}, type = "item", slot = 4, },
			{ name = "onion", price = 8, amount = 500, info = {}, type = "item", slot = 5, },
			{ name = "boba", price = 8, amount = 500, info = {}, type = "item", slot = 6, },
			{ name = "mint", price = 8, amount = 500, info = {}, type = "item", slot = 7, },
			{ name = "orange", price = 8, amount = 500, info = {}, type = "item", slot = 8, },
			{ name = "strawberry", price = 8, amount = 500, info = {}, type = "item", slot = 9, },
			{ name = "blueberry", price = 8, amount = 500, info = {}, type = "item", slot = 10, },
			{ name = "milk", price = 8, amount = 500, info = {}, type = "item", slot = 11, },
			{ name = "rice", price = 8, amount = 500, info = {}, type = "item", slot = 12, },
			{ name = "sake", price = 8, amount = 500, info = {}, type = "item", slot = 13, },
			{ name = "noodles", price = 8, amount = 500, info = {}, type = "item", slot = 14, },
		},
	},
	Locations = {
		{	zoneEnable = true,
			job = "catcafe", -- Set this to the required job
			label = "Cat Cafe",
			autoClock = { enter = false, exit = false, },
			zones = {
				vec2(-591.15808105469, -1087.8620605469),
				vec2(-563.33447265625, -1087.8508300781),
				vec2(-563.26678466797, -1045.1898193359),
				vec2(-618.20904541016, -1044.2902832031),
				vec2(-617.80517578125, -1079.7291259766),
				vec2(-599.44097900391, -1079.6105957031)
			},
			blip = vec3(-581.06, -1066.22, 22.34), blipcolor = 48, blipsprite = 89, blipscale = 0.5, blipdisp = 6, blipcat = nil,
			garage = { spawn = vec4(-594.62, -1086.59, 21.76, 220.09),
						out = vec4(-593.19, -1084.99, 22.33, 311.96),
						list = { "panto", "burrito3", } },
		},
	},
}
Crafting = {
	ChoppingBoard = {
		{ ['bmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['blueberry'] = 1, }, },
		{ ['gmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['mint'] = 1, }, },
		{ ['omochi'] = { ['sugar'] = 1, ['flour'] = 1, ['orange'] = 1, }, },
		{ ['pmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['strawberry'] = 1, }, },
		{ ['riceball'] = { ['rice'] = 1, ['nori'] = 1, }, },
		{ ['bento'] = { ['rice'] = 1, ['nori'] = 1, ['tofu'] = 1, }, },
		{ ['purrito'] = { ['rice'] = 1, ['flour'] = 1, ['onion'] = 1, }, },
	},
	Oven = {
		{ ['nekocookie'] = { ['flour'] = 1, ['milk'] = 1, }, },
		{ ['nekodonut'] = { ['flour'] = 1, ['milk'] = 1, }, },
		{ ['cake'] = { ['flour'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },
		{ ['cakepop'] = { ['flour'] = 1, ['milk'] = 1, ['sugar'] = 1, }, },
		{ ['pancake'] = { ['flour'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },
		{ ['pizza'] = { ['flour'] = 1, ['milk'] = 1, }, },
	},
	Coffee = {
		{ ['catcoffee'] = { } },
		{ ['nekolatte'] = { } },
		{ ['bobatea'] = { ['boba'] = 1, ['milk'] = 1, }, },
		{ ['bbobatea'] = { ['boba'] = 1, ['milk'] = 1, ['sugar'] = 1, }, },
		{ ['gbobatea'] = { ['boba'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },
		{ ['obobatea'] = { ['boba'] = 1, ['milk'] = 1, ['orange'] = 1, }, },
		{ ['pbobatea'] = { ['boba'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },
		{ ['mocha'] = { ['milk'] = 1, ['sugar'] = 1, }, },
	},
	Hob = {
		{ ['miso'] = { ['nori'] = 1, ['tofu'] = 1, ['onion'] = 1, }, },
		{ ['ramen'] = { ['noodles'] = 1, ['onion'] = 1, }, },
		{ ['noodlebowl'] = { ['noodles'] = 1, }, },
	},
}

Loc = {}