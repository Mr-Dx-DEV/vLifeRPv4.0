print("^2VL^7-^2Koi ^7v^41^7.^40^7.^40^7- ^2VL Koi Job Script by ^1UtshoBoy^7")
Config = {}

Config.Koi = {
	Debug = false,  -- True to show debug boxes and messages

	--Info To load depends on chosen MLO's
	MLO = "GN",     --use "LP" if you are using Smallo's burgershot MLO
					--use "GN" if you are using GNMods burgershot MLO

	img = "qb-inventory/html/images/", -- Change this to your inventory's name and image folder
	CheckMarks = true, -- If true this will show the player if they have the correct items to be able to craft the items
	--Simple Toy Reward Support Put your item here
	RewardItem = "", --Set this to the name of an item eg "bento"
	RewardPool = { -- Set this to the list of items to be given out as random prizes when the item is used - can be more or less items in the list
		"",
		"",
		"",
	},
	Items = {
		label = "Storage",
		slots = 10,
		items = {
			[1] = { name = 'avocado', price = 10, amount = 200, info = {}, type = 'item', slot = 1, },
			[2] = { name = 'carrot', price = 10, amount = 200, info = {}, type = 'item', slot = 2, },
			[3] = { name = 'creamchese', price = 20, amount = 200, info = {}, type = 'item', slot = 3, },

			[4] = { name = 'cucumber', price = 10, amount = 200, info = {}, type = 'item', slot = 4, },

			[5] = { name = 'fishoil', price = 10, amount = 200, info = {}, type = 'item', slot = 5, },
			[6] = { name = 'illfish', price = 10, amount = 200, info = {}, type = 'item', slot = 6, },
			[7] = { name = 'noriseaweed', price = 10, amount = 200, info = {}, type = 'item', slot = 7, },
			[8] = { name = 'rawsalmon', price = 50, amount = 200, info = {}, type = 'item', slot = 8, },
			[9] = { name = 'soyasauce', price = 10, amount = 200, info = {}, type = 'item', slot = 9, },
		    [10] = { name = 'spicymayo', price = 80, amount = 200, info = {}, type = 'item', slot = 10, },
		    [11] = { name = 'sushirice', price = 70, amount = 200, info = {}, type = 'item', slot = 11, },
		    [12] = { name = 'tuna', price = 40, amount = 200, info = {}, type = 'item', slot = 12, },
		    [13] = { name = 'wasabi', price = 40, amount = 200, info = {}, type = 'item', slot = 13, },
		    [14] = { name = 'salmonnigiri', price = 140, amount = 200, info = {}, type = 'item', slot = 14, },
		    [15] = { name = 'onion', price = 5, amount = 200, info = {}, type = 'item', slot = 15, },

			[16] = { name = 'shrimp', price = 10, amount = 200, info = {}, type = 'item', slot = 16, },
			[17] = { name = 'tempura', price = 20, amount = 200, info = {}, type = 'item', slot = 17, },
			[18] = { name = 'coal', price = 20, amount = 200, info = {}, type = 'item', slot = 18, },
		},
	},
	Locations = {
		[1] ={
			zoneEnable = true,
			job = "koi",
			label = "",
			autoClock = { enter = false, exit = true, },
			zones = {
				vector2(-1098.0491943359, -1436.3005371094),
				vector2(-1068.8328857422, -1512.7813720703),
				vector2(-1012.6766357422, -1473.8658447266),
				vector2(-1040.5207519531, -1424.4459228516)
			},
			blip = vector3(-1038.1516113281, -1476.5269775391, 17.018213272095), blipcolor = 64, blipsprite = 514, blipscale = 0.7, blipdisp = 514, blipcat = nil,
			garage = { spawn = vec4(0, 0, 0, 0),
			out = vec4( 0, 0, 0, 0),
				list = { "stalion2" } },
		},
	},
}

CraftingKoi = {

	Chop = {
		[1] = { ['slicedonion'] = {
			['onion'] = 1  } },


	},
	--[[ Fish_process = {
		[1] = { ['arabicacoffeepowder'] = { ['illfish'] = 1, } },
		[2] = { ['robustabeanffeepowder'] = { ['robustabean'] = 1, } },
		[3] = { ['typicacoffeepowder'] = { ['typicabean'] = 1, } },

	}, ]]
	Fry = {
		[1] = { ['tempurashrimp'] = { --[[ cost 80  consume 60 ]]

				['shrimp'] = 5,
				['tempura'] = 1,
				['fishoil'] = 1,

		} },
	},

	Fish_cooking = {
		[1] = { ['smokedsalmon'] = { --[[ cost 100  consume 75 ]]

			['fishoil'] = 2,
			['rawsalmon'] = 1,
			['coal'] = 1,
			['soyasauce'] = 1,
	} },

	},

	Process = {
		[1] = { ['californiarol'] = { ['sushirice'] = 1, ['slicedonion'] = 1,  ['shrimp'] = 1,} },
		[2] = { ['philadelphiaroll'] = { ['wasabi'] = 1, ['noriseaweed'] = 1, ['illfish'] = 1, ['fishoil'] = 1,} },
		[3] = { ['rainbowsushi'] = { ['sushirice'] = 1, ['rawsalmon'] = 1, ['wasabi'] = 1, ['salmonnigiri'] = 1,} },
		[4] = { ['spicytuna'] = { ['tuna'] = 1, ['spicymayo'] = 1,['soyasauce'] = 1, ['fishoil'] = 1,} },
		[5] = { ['vegetableroll'] = { ['avocado'] = 1, ['carrot'] = 1, ['soyasauce'] = 1,['slicedonion'] = 1, } },

	},
}

Loc = {}


-- [4] = { ['spicytuna'] = { ['tuna'] = 1, ['spicymayos'] = 1,['soyasauce'] = 1, ['fishoil'] = 1,} },
