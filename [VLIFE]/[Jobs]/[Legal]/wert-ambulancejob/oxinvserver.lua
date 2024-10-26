-- # Register Shop And Stash
CreateThread(function()
    Wait(200)
    local inventory = {}
    for k,v in pairs(Config.Items.items) do inventory[#inventory+1] = {name = v.name, price = v.price} end
    exports.ox_inventory:RegisterShop('ambulancearmorywe', {
        name = Config.Items.label,
        inventory = inventory,
        locations = nil,
        groups = nil,
    })
    Wait(200)
    local stash = {
        id = 'ambulancestashwe',
        label = 'Ambulance Main Stash',
        slots = 50,
        weight = 100000,
        owner = nil
    }
    exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner)
end)
