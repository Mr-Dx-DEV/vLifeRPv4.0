# You can find an inventory image in the images folder if you need one.
# This is an item example here, you can change and fit the item to your inventory style, make sure to match item name to the ones in the config and dont change them, you change the label
# all edits you need to do will be in Config / client_shared / server_shared and they are either easy to understand or there are comments next to them to explain what they do.
# If you have any questions or you need help, this is the discord link: https://discord.gg/5bbZH8gXxn


	["weapon_katana_r"] = {
		name = "weapon_katana_r",
        type = "weapon",
        unique = false,
        useable = true,
        shouldClose = false,
		label = "Red Katana",
		weight = 500,
		stack = true,
		close = false,
		description = "",
		image = "weapon_katana_r.png",
	},
	["weapon_katana_y"] = {
		name = "weapon_katana_y",
        type = "weapon",
        unique = false,
        useable = true,
        shouldClose = false,
		label = "Yellow Katana",
		weight = 500,
		stack = true,
		close = false,
		description = "",
		image = "weapon_katana_y.png",
	},
    ["weapon_katana_b"] = {
		name = "weapon_katana_b",
        type = "weapon",
        unique = false,
        useable = true,
        shouldClose = false,
		label = "Blue Katana",
		weight = 500,
		stack = true,
		close = false,
		description = "",
		image = "weapon_katana_b.png",
	},
	["weapon_katana_g"] = {
		name = "weapon_katana_g",
        type = "weapon",
        unique = false,
        useable = true,
        shouldClose = false,
		label = "Green Katana",
		weight = 500,
		stack = true,
		close = false,
		description = "",
		image = "weapon_katana_g.png",
	},


#WEAPONS UPDATE RELATED

	- If you are using qb-ambulancejob
		config.weapons in qb-ambulancejob you can copy machete and paste it 4 times.
		and then replace it with WEAPON_KATANA_R, WEAPON_KATANA_B, WEAPON_KATANA_Y, WEAPON_KATANA_G 

	- If you are using qb-core
		in sharedf folder inside weapons.lua add these 4 under machete

			[`weapon_katana_r`] 				 = {['name'] = 'weapon_katana_r', 		['label'] = 'Katana', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
			[`weapon_katana_b`] 				 = {['name'] = 'weapon_katana_b', 		['label'] = 'Katana', 	['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
			[`weapon_katana_y`] 				 = {['name'] = 'weapon_katana_y', 		['label'] = 'Katana', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
			[`weapon_katana_g`] 				 = {['name'] = 'weapon_katana_g', 		['label'] = 'Katana', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},

	- If you re using qb-small resources
		in weapodraw.lua add 4 weapons

		'weapon_katana_r',
		'weapon_katana_b',
		'weapon_katana_y',
		'weapon_katana_g',

		in weapodrop.lua add 1 entry

    	`PICKUP_katana`,

	- if you are using qb-vehiclekeys you might need to add the weapons in the config for no car jacking idk.

	- if you are using qb-weapons
		in the durabilityMultiplier table under machete add this.

		['weapon_katana_r']               = 0.15,
		['weapon_katana_b']               = 0.15,
		['weapon_katana_y']               = 0.15,
		['weapon_katana_g']               = 0.15,

	- IMPORTANT EVEN IF  YOU ADDED THE SCRIPT BEFORE YOU NEED TO UDPATE THE QB-CORE ITEMS TO THE NEW LIST in qbcore items.lua so that the type is now weapon and not item as well as the name change for those weapons.