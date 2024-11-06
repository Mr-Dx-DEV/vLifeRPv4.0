# ox_inventory

## data/items.lua

```lua
	["car_wheel"] = {
		label = "Wheel",
		weight = 10000,
		stack = false,
		close = false,
		description = "Wheel from a car",
		client = {
			image = "car_wheel.png",
		}
	},
	["car_door"] = {
		label = "Door",
		weight = 10000,
		stack = false,
		close = false,
		description = "Door from a car",
		client = {
			image = "car_door.png",
		}
	},
	["car_hood"] = {
		label = "Hood",
		weight = 10000,
		stack = false,
		close = false,
		description = "Hood from a car",
		client = {
			image = "car_hood.png",
		}
	},
	["car_trunk"] = {
		label = "Trunk",
		weight = 10000,
		stack = false,
		close = false,
		description = "Trunk from a car",
		client = {
			image = "car_trunk.png",
		}
	},
```

## data/weapons.lua

```lua
    ['WEAPON_DIGISCANNER'] = {
        label = 'Digital Scanner',
        weight = 125,
        durability = 0.1,
    },
```

# qb-core

## shared/items.lua

```lua
    car_wheel = { name = 'car_wheel', label = 'Wheel', weight = 10000, type = 'item', image = 'car_wheel.png', unique = true, useable = false, shouldClose = false, description = 'Wheel from a car' },

    car_door = { name = 'car_door', label = 'Door', weight = 10000, type = 'item', image = 'car_door.png', unique = true, useable = false, shouldClose = false, description = 'Door from a car' },

    car_hood = { name = 'car_hood', label = 'Hood', weight = 10000, type = 'item', image = 'car_hood.png', unique = true, useable = false, shouldClose = false, description = 'Hood from a car' },

    car_trunk = { name = 'car_trunk', label = 'Trunk', weight = 10000, type = 'item', image = 'car_trunk.png', unique = true, useable = false, shouldClose = false, description = 'Trunk from a car' },
```

## shared/weapons.lua

```lua
	weapon_digiscanner = {name = 'weapon_digiscanner', label= 'Digital Scanner', weight = 100, type = 'weapon', ammotype = nil, image = "WEAPON_DIGISCANNER.png", unique = true, useable = false, description = 'signal scanner'},
```

## For Codem-Inventory
Do the above steps first then the below steps

## codem-inventory/config/itemlist.lua
```lua
car_wheel = { name = 'car_wheel', label = 'Wheel', weight = 10000, type = 'item', image = 'car_wheel.png', unique = true, useable = false, shouldClose = false, description = 'Wheel from a car' },
car_door = { name = 'car_door', label = 'Door', weight = 10000, type = 'item', image = 'car_door.png', unique = true, useable = false, shouldClose = false, description = 'Door from a car' },
car_hood = { name = 'car_hood', label = 'Hood', weight = 10000, type = 'item', image = 'car_hood.png', unique = true, useable = false, shouldClose = false, description = 'Hood from a car' },
car_trunk = { name = 'car_trunk', label = 'Trunk', weight = 10000, type = 'item', image = 'car_trunk.png', unique = true, useable = false, shouldClose = false, description = 'Trunk from a car' },
weapon_digiscanner = {name = 'weapon_digiscanner', label= 'Digital Scanner', weight = 100, type = 'weapon', ammotype = nil, image = "WEAPON_DIGISCANNER.png", unique = true, useable = false, description = 'signal scanner'},
```
