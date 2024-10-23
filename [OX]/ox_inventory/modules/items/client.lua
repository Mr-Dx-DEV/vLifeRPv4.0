if not lib then return end

local Items = require 'modules.items.shared' --[[@as table<string, OxClientItem>]]

local function sendDisplayMetadata(data)
    SendNUIMessage({
		action = 'displayMetadata',
		data = data
	})
end

--- use array of single key value pairs to dictate order
---@param metadata string | table<string, string> | table<string, string>[]
---@param value? string
local function displayMetadata(metadata, value)
	local data = {}

	if type(metadata) == 'string' then
        if not value then return end

        data = { { metadata = metadata, value = value } }
	elseif table.type(metadata) == 'array' then
		for i = 1, #metadata do
			for k, v in pairs(metadata[i]) do
				data[i] = {
					metadata = k,
					value = v,
				}
			end
		end
	else
		for k, v in pairs(metadata) do
			data[#data + 1] = {
				metadata = k,
				value = v,
			}
		end
	end

    if client.uiLoaded then
        return sendDisplayMetadata(data)
    end

    CreateThread(function()
        repeat Wait(100) until client.uiLoaded

        sendDisplayMetadata(data)
    end)
end

exports('displayMetadata', displayMetadata)

---@param _ table?
---@param name string?
---@return table?
local function getItem(_, name)
    if not name then return Items end

	if type(name) ~= 'string' then return end

    name = name:lower()

    if name:sub(0, 7) == 'weapon_' then
        name = name:upper()
    end

    return Items[name]
end

setmetatable(Items --[[@as table]], {
	__call = getItem
})

---@cast Items +fun(itemName: string): OxClientItem
---@cast Items +fun(): table<string, OxClientItem>

local function Item(name, cb)
	local item = Items[name]
	if item then
		if not item.client?.export and not item.client?.event then
			item.effect = cb
		end
	end
end

local ox_inventory = exports[shared.resource]
-----------------------------------------------------------------------------------------------
-- Clientside item use functions
-----------------------------------------------------------------------------------------------

Item('bandage', function(data, slot)
	local maxHealth = GetEntityMaxHealth(cache.ped)
	local health = GetEntityHealth(cache.ped)
	ox_inventory:useItem(data, function(data)
		if data then
			SetEntityHealth(cache.ped, math.min(maxHealth, math.floor(health + maxHealth / 16)))
			lib.notify({ description = 'You feel better already' })
		end
	end)
end)

Item('armour', function(data, slot)
	if GetPedArmour(cache.ped) < 100 then
		ox_inventory:useItem(data, function(data)
			if data then
				SetPlayerMaxArmour(PlayerData.id, 100)
				SetPedArmour(cache.ped, 100)
			end
		end)
	end
end)

client.parachute = false
Item('parachute', function(data, slot)
	if not client.parachute then
		ox_inventory:useItem(data, function(data)
			if data then
				local chute = `GADGET_PARACHUTE`
				SetPlayerParachuteTintIndex(PlayerData.id, -1)
				GiveWeaponToPed(cache.ped, chute, 0, true, false)
				SetPedGadget(cache.ped, chute, true)
				lib.requestModel(1269906701)
				client.parachute = {CreateParachuteBagObject(cache.ped, true, true), slot?.metadata?.type or -1}
				if slot.metadata.type then
					SetPlayerParachuteTintIndex(PlayerData.id, slot.metadata.type)
				end
			end
		end)
	end
end)

Item('phone', function(data, slot)
	local success, result = pcall(function()
		return exports.npwd:isPhoneVisible()
	end)

	if success then
		exports.npwd:setPhoneVisible(not result)
	end
end)

Item('clothing', function(data, slot)
	local metadata = slot.metadata

	if not metadata.drawable then return print('Clothing is missing drawable in metadata') end
	if not metadata.texture then return print('Clothing is missing texture in metadata') end

	if metadata.prop then
		if not SetPedPreloadPropData(cache.ped, metadata.prop, metadata.drawable, metadata.texture) then
			return print('Clothing has invalid prop for this ped')
		end
	elseif metadata.component then
		if not IsPedComponentVariationValid(cache.ped, metadata.component, metadata.drawable, metadata.texture) then
			return print('Clothing has invalid component for this ped')
		end
	else
		return print('Clothing is missing prop/component id in metadata')
	end

	ox_inventory:useItem(data, function(data)
		if data then
			metadata = data.metadata

			if metadata.prop then
				local prop = GetPedPropIndex(cache.ped, metadata.prop)
				local texture = GetPedPropTextureIndex(cache.ped, metadata.prop)

				if metadata.drawable == prop and metadata.texture == texture then
					return ClearPedProp(cache.ped, metadata.prop)
				end

				-- { prop = 0, drawable = 2, texture = 1 } = grey beanie
				SetPedPropIndex(cache.ped, metadata.prop, metadata.drawable, metadata.texture, false);
			elseif metadata.component then
				local drawable = GetPedDrawableVariation(cache.ped, metadata.component)
				local texture = GetPedTextureVariation(cache.ped, metadata.component)

				if metadata.drawable == drawable and metadata.texture == texture then
					return -- item matches (setup defaults so we can strip?)
				end

				-- { component = 4, drawable = 4, texture = 1 } = jeans w/ belt
				SetPedComponentVariation(cache.ped, metadata.component, metadata.drawable, metadata.texture, 0);
			end
		end
	end)
end)

-- FARMING
-- POTS
local Pots = {
	['farm_pot_xs'] = {
        model       = 'prop_milk_crate_xs',
    },
    ['farm_pot_s'] = {
        model       = 'prop_milk_crate_s',
    },
    ['farm_pot_m'] = {
        model       = 'prop_milk_crate_m',
    },
    ['farm_pot_l'] = {
        model       = 'prop_milk_crate_l',
    },    
}

for k, v in pairs(Pots) do 
	Item(k, function(data, slot)
		ox_inventory:useItem(data, function(data)
			if data then
				TriggerEvent("zat-farming:client:UseItem", slot.name, v.model, 'pots')
				TriggerServerEvent('zat-farming:server:removeitem', slot.name, 1, slot.slot)
			end
		end)
	end)
end
-- LAMPS

local Lights = { -- add any lights you want ...
	['farm_light_s'] = { 
		model       = 'h4_prop_x17_sub_lampa_small_blue',
	},                   
	['farm_light_l'] = { 
		model       = 'h4_prop_x17_sub_lampa_large_blue',
	}, 
}

for k, v in pairs(Lights) do 
	Item(k, function(data, slot)
		ox_inventory:useItem(data, function(data)
			if data then
				TriggerEvent("zat-farming:client:UseItem", slot.name, v.model, 'lights')
				TriggerServerEvent('zat-farming:server:removeitem', slot.name, 1, slot.slot)
			end
		end)
	end)
end

local FanProps = {
    [1] = "prop_fan_01",
    [2] = "v_res_fa_fan", 
    [3] = "prop_wall_vent_02"
}

Item('zatfan01', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, FanProps[1])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

Item('zatresfan', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, FanProps[2])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)	
end)

Item('zatwallfan', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, FanProps[3])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

local HeaterProps = {
    [1] = "prop_elec_heater_01",
    [2] = "prop_patio_heater_01", 
}

Item('zatheater', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, HeaterProps[1])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

Item('zatpatioheater', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, HeaterProps[2])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)


local LightProps = {
    [1] = "prop_wall_light_05a",
    [2] = "ch_prop_ch_lamp_ceiling_w_01a", 
    [3] = "h4_prop_x17_sub_lampa_small_blue"
}

Item('zatwalllight', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, LightProps[1])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

Item('zatceilinglight', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, LightProps[2])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

Item('zatbluelight', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, LightProps[3])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

local PlanterProps = {
    [1] = "prop_garden",
    [2] = "prop_weed_rack_xs",
    [3] = "prop_rack_dryer_s",
    [4] = "bkr_prop_weed_table_01a",
    [5] = "prop_water_setup"
}

Item('zatplanter', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, PlanterProps[1])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

Item('zatweedrackxs', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, PlanterProps[2])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

Item('zatweedracks', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, PlanterProps[3])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

Item('zatweedtable', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, PlanterProps[4])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

Item('zatwatersetup', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItemStrict", slot.name, PlanterProps[5])
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

---
Item('zatwaterbottleempty', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:fillWater")
		end
	end)
end)

local WeedProps = {
    [1] = "bkr_prop_weed_bud_01a",
    [2] = "bkr_prop_weed_med_01a",
    [3] = "bkr_prop_weed_med_01b",
    [4] = "bkr_prop_weed_lrg_01a",
    [5] = "bkr_prop_weed_lrg_01b"
}

Item('zatweedseed', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseItem", slot.name, WeedProps[1], slot.metadata)
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
			
		end
	end)
end)

Item('zatpackedweed', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			local count = ox_inventory:GetItemCount("zatrollingpaper")
			if count >= 5 then
				TriggerEvent("zat-weed:client:rollIt", slot.metadata)
				TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
				TriggerServerEvent("zat-weed:server:RemoveRollingPapersOx")
			end
		end
	end)
end)

Item('zatjoint', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent("zat-weed:client:UseJoint", slot.metadata.purity)
			TriggerServerEvent("zat-weed:server:RemoveItemOx", slot, nil)
		end
	end)
end)

-- FARMING
-- POTS
local Pots = {
	['farm_pot_xs'] = {
        model       = 'prop_milk_crate_xs',
    },
    ['farm_pot_s'] = {
        model       = 'prop_milk_crate_s',
    },
    ['farm_pot_m'] = {
        model       = 'prop_milk_crate_m',
    },
    ['farm_pot_l'] = {
        model       = 'prop_milk_crate_l',
    },    
}

for k, v in pairs(Pots) do 
	Item(k, function(data, slot)
		ox_inventory:useItem(data, function(data)
			if data then
				TriggerEvent("zat-farming:client:UseItem", slot.name, v.model, 'pots')
				TriggerServerEvent('zat-farming:server:removeitem', slot.name, 1, slot.slot)
			end
		end)
	end)
end
-- LAMPS

local Lights = { -- add any lights you want ...
	['farm_light_s'] = { 
		model       = 'h4_prop_x17_sub_lampa_small_blue',
	},                   
	['farm_light_l'] = { 
		model       = 'h4_prop_x17_sub_lampa_large_blue',
	}, 
}

for k, v in pairs(Lights) do 
	Item(k, function(data, slot)
		ox_inventory:useItem(data, function(data)
			if data then
				TriggerEvent("zat-farming:client:UseItem", slot.name, v.model, 'lights')
				TriggerServerEvent('zat-farming:server:removeitem', slot.name, 1, slot.slot)
			end
		end)
	end)
end

-- TOOLS 
local Tools = { -- add any lights you want ...
    ['farm_mil'] = { 
        model       = 'prop_farming_mil',
    },                   
    ['farm_compost'] = { 
        model       = 'prop_farming_compost',
    }, 
    ['farm_sink_s'] = { 
        model       = 'prop_ff_sink_02',
    }, 
    ['farm_sink_m'] = { 
        model       = 'prop_bar_sink_01',
    }, 
    ['moon_distillation'] = { 
        model       = 'prop_moonshine',
    },  
}

for k, v in pairs(Tools) do 
	Item(k, function(data, slot)
		ox_inventory:useItem(data, function(data)
			if data then
				TriggerEvent("zat-farming:client:UseItem", slot.name, v.model, 'tools')
				TriggerServerEvent('zat-farming:server:removeitem', slot.name, 1, slot.slot)
			end
		end)
	end)
end

-- Water Can

Item('farm_water', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			if slot.metadata.water == nil then
				slot.metadata.water = 0
			end
			if slot.metadata.water == 0 then
				-- Remove Item
				TriggerEvent('zat-farming:client:FillWater', slot)
			end
		end
	end)
end)

 
-- Moonshine
Item('moon_moonshine_pack', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			if slot.metadata.purity == nil then
				slot.metadata.purity = 0
			end
			TriggerServerEvent('zat-farming:server:additem', 'moon_moonshine', 6, slot.metadata)
			TriggerServerEvent('zat-farming:server:removeitem', slot.name, 1, slot.slot)
		end
	end)
end)

Item('moon_moonshine', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent('zat-farming:client:StartEffect', slot)
			TriggerServerEvent('zat-farming:server:removeitem', slot.name, 1, slot.slot)
		end
	end)
end)
-- TOOLS 
local Tools = { -- add any lights you want ...
    ['farm_mil'] = { 
        model       = 'prop_farming_mil',
    },                   
    ['farm_compost'] = { 
        model       = 'prop_farming_compost',
    }, 
    ['farm_sink_s'] = { 
        model       = 'prop_ff_sink_02',
    }, 
    ['farm_sink_m'] = { 
        model       = 'prop_bar_sink_01',
    }, 
    ['moon_distillation'] = { 
        model       = 'prop_moonshine',
    },  
}

for k, v in pairs(Tools) do 
	Item(k, function(data, slot)
		ox_inventory:useItem(data, function(data)
			if data then
				TriggerEvent("zat-farming:client:UseItem", slot.name, v.model, 'tools')
				TriggerServerEvent('zat-farming:server:removeitem', slot.name, 1, slot.slot)
			end
		end)
	end)
end

-- Water Can

Item('farm_water', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			if slot.metadata.water == nil then
				slot.metadata.water = 0
			end
			if slot.metadata.water == 0 then
				-- Remove Item
				TriggerEvent('zat-farming:client:FillWater', slot)
			end
		end
	end)
end)

 
-- Moonshine
Item('moon_moonshine_pack', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			if slot.metadata.purity == nil then
				slot.metadata.purity = 0
			end
			TriggerServerEvent('zat-farming:server:additem', 'moon_moonshine', 6, slot.metadata)
			TriggerServerEvent('zat-farming:server:removeitem', slot.name, 1, slot.slot)
		end
	end)
end)

Item('moon_moonshine', function(data, slot)
	ox_inventory:useItem(data, function(data)
		if data then
			TriggerEvent('zat-farming:client:StartEffect', slot)
			TriggerServerEvent('zat-farming:server:removeitem', slot.name, 1, slot.slot)
		end
	end)
end)

-----------------------------------------------------------------------------------------------

exports('Items', function(item) return getItem(nil, item) end)
exports('ItemList', function(item) return getItem(nil, item) end)

return Items
