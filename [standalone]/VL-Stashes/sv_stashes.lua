local ox_inventory = exports.ox_inventory

RegisterNetEvent('VL-Stashes:server:loadStashes', function (stashName, stashLabel, slots, maxWeight, coords)
    ox_inventory:RegisterStash(stashName, stashLabel, slots, maxWeight, false, false, coords)
end)