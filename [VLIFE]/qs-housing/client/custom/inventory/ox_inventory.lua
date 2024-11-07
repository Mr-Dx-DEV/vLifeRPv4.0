--[[
    Here you have the configuration of stashes, you can modify it or even
    create your own! In case your inventory is not here, you can ask the
    creator to create a file following this example and add it!
]]

if Config.Inventory ~= 'ox_inventory' then
    return
end

function HousingStash(id, other, mlo)
    if mlo then -- For MLO stashes
        TriggerServerEvent('housing:server:registerOxInventory', id, 50, 5000000)
        TriggerEvent('housing:client:registerOxInventory', id)
    else -- For IPL and Shell stashes
        TriggerServerEvent('housing:server:registerOxInventory', id, other.slots, other.weight)
        TriggerEvent('housing:client:registerOxInventory', id)
    end
end

--[[
    Furniture stash system, choose your own weight and slots!
]]

ObjectStash = {
    [`apa_mp_h_str_sideboardl_06`] = { weight = 1500000, slots = 60 },
    [`apa_mp_h_str_sideboardm_03`] = { weight = 1500000, slots = 60 },
    [`apa_mp_h_str_sideboardl_09`] = { weight = 1500000, slots = 30 },
    [`ex_prop_ex_toolchest_01`] = { weight = 1500000, slots = 60 },
    [`gr_prop_gr_tool_chest_01a`] = { weight = 1500000, slots = 60 },
    [`gr_prop_gr_tool_draw_01a`] = { weight = 1500000, slots = 30 },
    [`gr_prop_gr_tool_draw_01b`] = { weight = 1500000, slots = 60 },
    [`gr_prop_gr_tool_draw_01d`] = { weight = 1500000, slots = 60 },
    [`apa_mp_h_bed_chestdrawer_02`] = { weight = 1500000, slots = 30 },
    [`apa_mp_h_str_sideboardl_14`] = { weight = 1500000, slots = 60 },
    [`apa_mp_h_str_sideboardl_13`] = { weight = 1500000, slots = 60 },
    [`apa_mp_h_str_sideboardm_02`] = { weight = 1500000, slots = 30 },
    [`apa_mp_h_str_sideboards_02`] = { weight = 1500000, slots = 60 },
    [`hei_heist_bed_chestdrawer_04`] = { weight = 1500000, slots = 60 },
    [`hei_heist_str_sideboardl_02`] = { weight = 1500000, slots = 30 },
    [`p_v_43_safe_s`] = { weight = 1500000, slots = 60 },
}
