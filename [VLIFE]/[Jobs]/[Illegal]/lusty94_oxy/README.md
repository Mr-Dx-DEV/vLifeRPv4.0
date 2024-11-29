## Lusty94_Oxy


<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PLEASE MAKE SURE TO READ THIS ENTIRE FILE AS IT COVERS SOME IMPORTANT INFORMATION

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

======================================
SCRIPT SUPPORT VIA DISCORD: https://discord.gg/BJGFrThmA8
======================================




## Features

- Deliver suspcious packages to various peds around the city in exchange for oxy
- Use oxy to heal yourself or use the burnerphone [if enabled] to request delivery missions for cash!
- Inbuilt XP system allowing players to earn more cash when selling
- Toggleable blip for starting locations
- Multiple random locations for the starting ped
- Multiple random locations for the supsicious package delivery locations
- Multiple random locations for the oxy sale mission locations
- Random peds for every interaction
- Chance for police to be called if oxy delivery ped doesnt want the product or a local watches you hand over a suspicious package




## INSTALLATION

- Add the ##ITEMS snippet below into your core items.lua file
- Add all .png images inside [images] folder into your inventory images folder
- Ensure all listed dependencies start BEFORE lusty94_oxy



## DEPENDENCIES

- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
- [qb-policejob](https://github.com/qbcore-framework/qb-policejob)
- [ox_lib](https://github.com/overextended/ox_lib/releases)
- [polyzone](https://github.com/mkafrin/PolyZone)





## XP
If you are using the inbuilt XP system then you must add the metadata lines below to your player.lua file in core
- new qb method is via the config but you might need to edit how metadata is assigned in server files

- look for the lines that are similair for the hunger and thirst  and stress or other xp types etc
- do not forget to edit this if you have changed your `MetaDataName` inside `config.lua`

```

#old core

PlayerData.metadata['oxyxp'] = PlayerData.metadata['oxyxp'] or 0 -- Added for lusty94_oxy

#new core

oxyxp = 0,

```




## QB-CORE ITEMS

```
    --oxy
    oxy                          = { name = 'oxy',               label = 'Prescription Oxy',    weight = 0, type = 'item', image = 'oxy.png',               unique = false, useable = true, shouldClose = true, combinable = nil, description = 'The Label Has Been Ripped Off' },
    
    suspiciouspackage            = { name = 'suspiciouspackage', label = 'Suspicious Package',  weight = 0, type = 'item', image = 'suspiciouspackage.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A Suspicious Package' },
    
    burnerphone                  = { name = 'burnerphone',       label = 'Oxy Burner Phone',        weight = 0, type = 'item', image = 'burnerphone.png',       unique = true,  useable = true, shouldClose = true, combinable = nil, description = 'A Burner Phone Used To Sell Oxy' },

```


## OX_INVENTORY ITEMS

```

	["burnerphone"] = {
		label = "Oxy Burner Phone",
		weight = 0,
		stack = false,
		close = true,
		description = "A Burner Phone Used To Sell Oxy",
		client = {
			image = "burnerphone.png",
		}
	},

	["suspiciouspackage"] = {
		label = "Suspicious Package",
		weight = 0,
		stack = true,
		close = true,
		description = "A Suspicious Package",
		client = {
			image = "suspiciouspackage.png",
		}
	},

	["oxy"] = {
		label = "Prescription Oxy",
		weight = 0,
		stack = true,
		close = true,
		description = "The Label Has Been Ripped Off",
		client = {
			image = "oxy.png",
		}
	},

```