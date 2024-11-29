## Lusty94_Mushrooms


<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PLEASE MAKE SURE TO READ THIS ENTIRE FILE AS IT COVERS SOME IMPORTANT INFORMATION

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


A magic mushroom picking and processing script for qb-core with lots of features

Players can find mushrooms growing in a defined zone, pick them for raw materials
Dry them into dried mushrooms, add chemicls to make 'magic mushrooms', Bag them up using baggies and scales to sell to other players
Make overdose cures and pick special mushrooms with a chance to trip you or kill you!

Eat the magic mushrooms for a chance to have a trip and overdose
Find Indigo Milk Cap mushrooms to create an overdose cure that decreases your overdose levels by a configurable amount for a chance to trip instead of overdose
Find Death Cap mushrooms for a chance to trip or have serious health effects [players will die]

Trips can be good or bad, good trips will give you armour, health and remove stress with customs sounds and effects with a chance to spawn a ped thgat attacks you
bad trips will give you crazy screen effects and has the chance to kill the player


- Extensive config file
- Change core settings to suit your server such as progressbar timers, notify lengths, event names and much more
- Language settings for custom translations




## INSTALLATION

- Add the ##ITEMS snippet below into your core/shared/items.lua file
- Add all .png images inside [images] folder into your inventory/html/images folder
- Add all .ogg files inside [interact-sounds] folder into your interact-sound/client/sounds folder



## OX INVENTORY USERS - SUPPLIES SHOP

- this resource automatically creates the supply shop for you, to change item names or prices look in mushrooms_server.lua for the function



## DRUG XP AND OVERDOSE XP
If you are using the inbuilt XP and overdose system then you must add the metadata lines below to your player.lua file in core
- new qb method is via the config but you might need to edit how metadata is assigned in server files

- look for the lines that are similair for the hunger and thirst  and stress or other xp types etc
- do not forget to edit this if you have changed your `MetaDataName` inside `config.lua`

```

#old core

PlayerData.metadata['drugxp'] = PlayerData.metadata['drugxp'] or 0 -- Added for lusty94_mushrooms
PlayerData.metadata['overdosexp'] = PlayerData.metadata['overdosexp'] or 0 -- Added for lusty94_mushrooms

#new core

drugxp = 0,
overdosexp = 0,

```

## DEPENDENCIES

- QB-CORE - https://github.com/qbcore-framework/qb-core
- QB-TARGET - https://github.com/qbcore-framework/qb-target
- QB-MENU - https://github.com/qbcore-framework/qb-menu
- QB-INVENTORY - https://github.com/qbcore-framework/qb-inventory
- OX_LIB - https://github.com/overextended/ox_lib/releases/
- INTERACT SOUND - https://github.com/plunkettscott/interact-sound


## INTERACT SOUND

- If set to true in the config then this script uses custom sounds that need to be placed inside of interact-sound resource

- Place ALL .ogg files inside [interact-sound] folder into your interact-sound/client/html/sounds folder

- Interact sound must be started BEFORE this resource in order to work correctly



## ITEMS

```

        --MAGIC MUSHROOMS
    libertycap_mushroom                = {name = 'libertycap_mushroom',               label = 'Liberty Cap Mushroom',           weight = 100,        type = 'item',         image = 'libertycap_mushroom.png',           unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    dried_libertycap_mushroom          = {name = 'dried_libertycap_mushroom',         label = 'Dried Liberty Cap Mushroom',     weight = 100,        type = 'item',         image = 'dried_libertycap_mushroom.png',     unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    indigomilkcap_mushroom             = {name = 'indigomilkcap_mushroom',            label = 'Indigo Milk Cap Mushroom',       weight = 100,        type = 'item',         image = 'indigomilkcap_mushroom.png',        unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    deathcap_mushroom                  = {name = 'deathcap_mushroom',                 label = 'Death Cap Mushroom',             weight = 100,        type = 'item',         image = 'deathcap_mushroom.png',             unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    indigo_mycota_cure                 = {name = 'indigo_mycota_cure',                label = 'Indigo Mycota Cure',             weight = 100,        type = 'item',         image = 'indigo_mycota_cure.png',            unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    magic_mushroom                     = {name = 'magic_mushroom',                    label = 'Magic Mushroom',                 weight = 100,        type = 'item',         image = 'magic_mushroom.png',                unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    mushroom_baggy                     = {name = 'mushroom_baggy',                    label = 'Bag of Magic Mushroom',          weight = 100,        type = 'item',         image = 'mushroom_baggy.png',                unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
	dryingrack 					       = {name = 'dryingrack', 			 	  	      label = 'Drying Rack', 			        weight = 200, 		 type = 'item', 	    image = 'dryingrack.png', 				     unique = false, 	 useable = true, 	 shouldClose = true,      combinable = nil,   description = ''},
	empty_weed_bag 					   = {name = 'empty_weed_bag', 			 	  	  label = 'Empty Baggies', 			        weight = 200, 		 type = 'item', 	    image = 'empty_weed_bag.png', 				 unique = false, 	 useable = true, 	 shouldClose = true,      combinable = nil,   description = ''},
	scales 					           = {name = 'scales', 			 	  	          label = 'Scales', 			            weight = 200, 		 type = 'item', 	    image = 'scales.png', 				         unique = false, 	 useable = true, 	 shouldClose = true,      combinable = nil,   description = ''},
	acetone 					       = {name = 'acetone', 			 	  	      label = 'Acetone', 			            weight = 200, 		 type = 'item', 	    image = 'acetone.png', 				         unique = false, 	 useable = true, 	 shouldClose = true,      combinable = nil,   description = ''},
	dimethylformamide 				   = {name = 'dimethylformamide', 			 	  label = 'Dimethylformamide', 			    weight = 200, 		 type = 'item', 	    image = 'dimethylformamide.png', 			 unique = false, 	 useable = true, 	 shouldClose = true,      combinable = nil,   description = ''},
	processingtable 				   = {name = 'processingtable', 			 	  label = 'Processing Table', 		        weight = 200, 		 type = 'item', 	    image = 'processingtable.png', 				 unique = false, 	 useable = true, 	 shouldClose = true,      combinable = nil,   description = ''},



```


