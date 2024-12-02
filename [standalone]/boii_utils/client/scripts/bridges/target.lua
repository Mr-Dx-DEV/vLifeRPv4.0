--- @todo Build target bridge

local TARGET = config.target

--- Entity zones.
local function entity_zone(options)
    if not options then print('Options missing.') return end
    
    if TARGET == 'boii_target' then
        exports.boii_target:add_entity_zone({ obj }, {
            id = entity_id,
            icon = 'fa-solid fa-hand',
            distance = 2.5,
            debug = false,
            sprite = false,
            actions = {
                {
                    label = 'Pick Up ' .. drop_data.amount .. 'x '.. drop_data.label,
                    icon = 'fa-solid fa-box-open',
                    action_type = 'server',
                    action = 'boii_items:sv:pick_up_item',
                    params = { 
                        unique_id = entity_id, 
                        net_id = entity_net_id 
                    }
                },
            }
        })

    end
end

--- Remove target.
--- @param entity: The entity to remove zone for.
--- @param net_id: Net ID for entity. This is required by ox_target.
local function remove_entity_zone(entity, net_id)
    if TARGET == 'boii_target' then
        exports.boii_target:remove_target(entity)
    elseif TARGET == 'qb-target' then
        exports['qb-target']:RemoveZone(entity)
    elseif TARGET == 'ox_target' then
        exports.ox_target:removeEntity(net_id, entity)
    end
end

exports('target_remove_entity_zone', remove_entity_zone)
utils.target.remove_entity_zone = remove_entity_zone