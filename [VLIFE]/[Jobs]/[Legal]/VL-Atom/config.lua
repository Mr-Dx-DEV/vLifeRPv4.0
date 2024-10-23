Config = {}

Config.Atoms = {
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
		slots = 7,
		items = {
			[1] = { name = 'beef', price = 40, amount = 200, info = {}, type = 'item', slot = 1, },
			[2] = { name = 'chicken', price = 30, amount = 200, info = {}, type = 'item', slot = 2, },
			[3] = { name = 'veg', price = 10, amount = 200, info = {}, type = 'item', slot = 3, },
			[4] = { name = 'rice', price = 20, amount = 200, info = {}, type = 'item', slot = 4, },
			[5] = { name = 'butter', price = 10, amount = 200, info = {}, type = 'item', slot = 5, },
			[6] = { name = 'lemon', price = 5, amount = 200, info = {}, type = 'item', slot = 6, },
			[7] = { name = 'oil', price = 5, amount = 200, info = {}, type = 'item', slot = 7, },
			[8] = {  name = "salt", price = 5, amount = 200, info = {}, type = "item", slot = 8, },
			[9] = {  name = "vinegar", price = 10, amount = 200, info = {}, type = "item", slot = 9, },
			[10] = {  name = "sprunk", price = 20, amount = 200, info = {}, type = "item", slot = 10, },
			[11] = {  name = "blueberry", price = 5, amount = 200, info = {}, type = "item", slot = 11, },
			[12] = {  name = "orange", price = 5, amount = 200, info = {}, type = "item", slot = 12, },
			[13] = {  name = "mint", price = 5, amount = 200, info = {}, type = "item", slot = 13, },
			[14] = {  name = "milk", price = 60, amount = 200, info = {}, type = "item", slot = 14, },
			[15] = {  name = "sugar", price = 5, amount = 200, info = {}, type = "item", slot = 15, },
			[16] = {  name = "bread", price = 10, amount = 200, info = {}, type = "item", slot = 16, },
			[17] = {  name = "potato", price = 10, amount = 200, info = {}, type = "item", slot = 17, },
			[18] = {  name = "onion", price = 10, amount = 200, info = {}, type = "item", slot = 18, },
			[19] = {  name = "sauce", price = 5, amount = 200, info = {}, type = "item", slot = 19, },			
		},
	},
	Locations = {
		[1] ={ 
			zoneEnable = true,
			job = "atoms",
			label = "",
			autoClock = { enter = false, exit = true, },
			zones = {
				vector2(93.619682312012, 258.6012878418),
				vector2(56.053554534912, 272.46322631836),
				vector2(64.231918334961, 293.54476928711),
				vector2(68.525688171387, 302.4030456543),
				vector2(84.69017791748, 315.20291137695),
				vector2(108.69412231445, 306.02398681641)
			},
			blip = vector3(86.74, 281.58, 110.20), blipcolor = 75, blipsprite = 76, blipscale = 0.7, blipdisp = 6, blipcat = nil,
			garage = { spawn = vec4(95.82674407959, 308.240234375, 110.02256011963, 156.83001708984), 
			out = vec4(95.82674407959, 308.240234375, 110.02256011963, 156.83001708984),  
				list = { "speedo4" } },
		},
	},
}

CraftingAtoms = {
	ChopBoard = {
		[1] = { ['slicedonion'] = { ['onion'] = 1, },
				['amount'] = 3 },
		[2] = { ['slicedpotato'] = { ['potato'] = 1, },
				['amount'] = 3 },
	},
	Fryer = {
		[1] = { ['friedbeef'] = { ['beef'] = 1, ['oil'] = 1, ['sauce'] = 1, } },  --[[ 50 ]]
		[2] = { ['saltedveg'] = { ['veg'] = 1, ['oil'] = 1, ['salt'] = 1, } }, --[[ 30 ]]
		[3] = { ['friedrice'] = { ['rice'] = 1, ['slicedonion'] = 1,  ['oil'] = 1,  } },--[[ 25 ]]
	},
	Grill = {
		[1] = { ['bbqchicken'] = { ['chicken'] = 1, ['sauce'] = 1, ['oil'] = 1,} }, --[[ 40 ]]
	},
	Prepare = {
		[1] = { ['shawarmaehabibi'] = {

				['bread'] = 1, --[[ 10 ]]
				['bbqchicken'] = 1, --[[ 40 ]]
				['veg'] = 1,         --[[  5 ]]
				['sauce'] = 1,        --[[ 5 ]]
				['slicedonion'] = 1,     --[[ 3 ]]
				
				--[[ 63 ]]  
		} },
		[2] = { ['vegshawarma'] = {

		        ['bread'] = 1, --[[ 10 ]]
		    	['veg'] = 1,   --[[  5 ]]
		    	['sauce'] = 1,   --[[ 5 ]]
		    	['slicedonion'] = 1, --[[  3 ]]
				
				--[[ 23 ]]
		} },
		[3] = { ['arabianshawarma'] = {

		    	['bread'] = 1, --[[ 10 ]]
			    ['veg'] = 1,   --[[ 20 ]]
		    	['sauce'] = 1,   --[[ 5 ]]
				['friedbeef'] = 1,   --[[ 50 ]]
				
				--[[ 85  ]]
		} },
		[4] = { ['alkebsa'] = {

				['friedrice'] = 1, --[[ 25 ]]
				['veg'] = 1,   --[[ 20 ]]
				['slicedpotato'] = 1, --[[ 3 ]]
				['slicedonion'] = 1, --[[ 3 ]]
				['bbqchicken'] = 1, --[[ 40 ]]
				['oil'] = 1, --[[ 5 ]]
				['salt'] = 1, --[[ 5 ]]
				['butter'] = 1, --[[ 10 ]]
				
				--[[ 110  ]]
		} },
		[5] = { ['alpilaf'] = {

				['friedrice'] = 1,  --[[ 25 ]]
				['friedbeef'] = 1, --[[ 50 ]]
				['slicedonion'] = 1, --[[ 3 ]]
				['slicedpotato'] = 1, --[[ 3 ]]
				['veg'] = 1,--[[  10 ]]
				['oil'] = 1, --[[ 5 ]]
				['salt'] = 1, --[[ 5 ]]
				['butter'] = 1, --[[ 10 ]]
				
				--[[ 121  ]]
		} },
	},
	
	Drink = {
		-- [1] = { ['mohito'] = { ['lemon'] = 2, ['sugar'] = 2, ['mint'] = 3, ['vinegar'] = 1, ['sprunk'] = 1,} }, --[[ 65 ]]
		-- [2] = { ['blueocean'] = { ['blueberry'] = 2, ['sprunk'] = 1, ['sugar'] = 1, ['vinegar'] = 1,} }, --[[ 40 ]]
		-- [3] = { ['orangehawaii'] = { ['orange'] = 2, ['sugar'] = 2, ['salt'] = 1, ['vinegar'] = 1, ['sprunk'] = 1,} }, --[[ 55  ]]
	},
}

Loc = {}

