## Lusty94_Cocaine


<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PLEASE MAKE SURE TO READ THIS ENTIRE FILE AS IT COVERS SOME IMPORTANT INFORMATION

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


## FEATURES 

- Process cocaine and crack to sell to other players or consume for configurable effects
- Pick coca leaves, get cement, get gasoline and hydrochloric acid to proceess into pure cocaine
- Process pure cocaine, sodium carbonate and bottled water into pure crack
- Bag up cocaine and crack with scales and empty baggies to sell to other players
- Consume cocaine and crack for visual screen effects and player buffs such as armour and stress removal
- A chance to overdose if consuming too many drugs with configurable effects
- Consumve overdose cure to reduce your chances of overdosing and coming to an untimely demise!
- Extensive config file
- Change core settings to suit your server
- Language settings for custom translations




## INSTALLATION

- Add the ##ITEMS snippet below into your core/shared/items.lua file
- Add all .png images inside [images] folder into your inventory/html/images folder - ox_inventory users place inside inventory/web/images


## IMPORTANT NOTES

- this script uses target models for various items, this could clash with other drug scripts that use the same model.
- to prevent errors or issues with other scripts remove the target model in one of the scripts and then use 1 item across other drug scripts
- for example hydrochloric acid, ether, gasoline and cement are used in multiple resources so could clash - make the given item names match throughout



## XP & OVERDOSE
If you are using the inbuilt XP & Overdose system then you must add the metadata lines below to your player.lua file in core
- new qb method is via the config but you might need to edit how metadata is assigned in server files

- look for the lines that are similair for the hunger and thirst  and stress or other xp types etc
- do not forget to edit this if you have changed your `MetaDataName` inside `config.lua`

```

## old core - core/server/player.lua

PlayerData.metadata['drugxp'] = PlayerData.metadata['drugxp'] or 0 -- Added for lusty94_cocaine
PlayerData.metadata['overdosexp'] = PlayerData.metadata['overdosexp'] or 0 -- Added for lusty94_cocaine

## new core - core/config.lua

drugxp = 0,
overdosexp = 0,

```

## OX INVENTORY USERS - SUPPLIES SHOP
- items list is below under ## OX_INVENTORY ITEMS
- this resource automatically creates the supply shop for you, to change item names or prices look in cocaine_server.lua for the function



## DEPENDENCIES


- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
- [qb-policejob](https://github.com/qbcore-framework/qb-policejob)
- [ox_lib](https://github.com/overextended/ox_lib/releases/)


## QB-CORE ITEMS

```

     --cocaine
    
    --REQUIRED ITEMS
    trowel                      = {name = 'trowel',               label = 'Trowel',                     weight = 100,        type = 'item',         image = 'trowel.png',                   unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    plasticjerrycan             = {name = 'plasticjerrycan',      label = 'Empty Plastic Jerry Can',    weight = 100,        type = 'item',         image = 'plasticjerrycan.png',          unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    cokeprocessingtable 		= {name = 'cokeprocessingtable',  label = 'Coke Processing Table', 		weight = 200, 		 type = 'item', 	    image = 'cokeprocessingtable.png', 		unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
    lighter 				    = {name = 'lighter', 			  label = 'Lighter', 				    weight = 0, 		 type = 'item', 		image = 'lighter.png', 				    unique = false, 	useable = true, 	shouldClose = true,	     combinable = nil,   description = ''},

    --MATERIALS
    cocaleaf                    = {name = 'cocaleaf',             label = 'Coca Leaf',                  weight = 100,        type = 'item',         image = 'cocaleaf.png',                 unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    cement                  = {name = 'cement',           label = 'Cement',                     weight = 100,        type = 'item',         image = 'cement.png',                   unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    gasoline                = {name = 'gasoline',         label = 'Gasoline',                   weight = 100,        type = 'item',         image = 'gasoline.png',                 unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    hydrochloricacid        = {name = 'hydrochloricacid', label = 'Hydrochloric Acid',          weight = 100,        type = 'item',         image = 'hydrochloricacid.png',         unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    sodiumcarbonate         = {name = 'sodiumcarbonate',  label = 'Sodium Carbonate',           weight = 100,        type = 'item',         image = 'sodiumcarbonate.png',          unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    pure_cocaine                = {name = 'pure_cocaine',         label = 'Pure Cocaine',               weight = 100,        type = 'item',         image = 'pure_cocaine.png',             unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    pure_crack                  = {name = 'pure_crack',           label = 'Pure Crack',                 weight = 100,        type = 'item',         image = 'pure_crack.png',               unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    water_bottle                = {name = 'water_bottle',         label = 'Bottled Water',              weight = 100,        type = 'item',         image = 'water_bottle.png',             unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
	emptybaggies 				= {name = 'emptybaggies', 	      label = 'Empty Baggies', 			    weight = 200, 		 type = 'item', 	    image = 'emptybaggies.png', 			unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
	scales 					    = {name = 'scales', 			  label = 'Scales', 			        weight = 200, 		 type = 'item', 	    image = 'scales.png', 				    unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
	acetone 				= {name = 'acetone', 		  label = 'Acetone', 			        weight = 200, 		 type = 'item', 	    image = 'acetone.png', 				    unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
	dimethylformamide 		= {name = 'dimethylformamide',label = 'Dimethylformamide', 	        weight = 200, 		 type = 'item', 	    image = 'dimethylformamide.png', 		unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
	iodine 			        = {name = 'iodine', 	      label = 'Iodine', 			        weight = 200, 		 type = 'item', 	    image = 'iodine.png', 		            unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
    cokeoverdosecure            = {name = 'cokeoverdosecure',     label = 'Coke Overdose Cure',              weight = 100,        type = 'item',         image = 'overdosecure.png',             unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    
    --DRUGS
    coke_baggy                 = {name = 'coke_baggy',            label = 'Bag of Cocaine',             weight = 100,        type = 'item',         image = 'coke_baggy.png',               unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    crack_baggy                = {name = 'crack_baggy',           label = 'Bag of Crack',               weight = 100,        type = 'item',         image = 'crack_baggy.png',              unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},

```



## OX_INVENTORY ITEMS

```



	["water_bottle"] = {
		label = "Bottled Water",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "water_bottle.png",
		}
	},

	["cokeprocessingtable"] = {
		label = "Coke Processing Table",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cokeprocessingtable.png",
		}
	},

	["coke_baggy"] = {
		label = "Bag of Cocaine",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "coke_baggy.png",
		}
	},

	["sodiumcarbonate"] = {
		label = "Sodium Carbonate",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "sodiumcarbonate.png",
		}
	},

	["scales"] = {
		label = "Scales",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "scales.png",
		}
	},

	["iodine"] = {
		label = "Iodine",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "iodine.png",
		}
	},

	["plasticjerrycan"] = {
		label = "Empty Plastic Jerry Can",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "plasticjerrycan.png",
		}
	},

	["crack_baggy"] = {
		label = "Bag of Crack",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "crack_baggy.png",
		}
	},

	["dimethylformamide"] = {
		label = "Dimethylformamide",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "dimethylformamide.png",
		}
	},

	["pure_cocaine"] = {
		label = "Pure Cocaine",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pure_cocaine.png",
		}
	},

	["emptybaggies"] = {
		label = "Empty Baggies",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "emptybaggies.png",
		}
	},

	["acetone"] = {
		label = "Acetone",
		weight = 200,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "acetone.png",
		}
	},

	["cement"] = {
		label = "Cement",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cement.png",
		}
	},

	["gasoline"] = {
		label = "Gasoline",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "gasoline.png",
		}
	},

	["cocaleaf"] = {
		label = "Coca Leaf",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "cocaleaf.png",
		}
	},

	["cokeoverdosecure"] = {
		label = "Coke Overdose Cure",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "overdosecure.png",
		}
	},

	["hydrochloricacid"] = {
		label = "Hydrochloric Acid",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "hydrochloricacid.png",
		}
	},

	["trowel"] = {
		label = "Trowel",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "trowel.png",
		}
	},

	["pure_crack"] = {
		label = "Pure Crack",
		weight = 100,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "pure_crack.png",
		}
	},

	["lighter"] = {
		label = "Lighter",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "lighter.png",
		}
	},

```