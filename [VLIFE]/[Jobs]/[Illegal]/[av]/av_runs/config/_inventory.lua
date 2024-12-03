Config = Config or {}
Config.Inventory = false -- false it will auto detect your inventory, or set manually your inventory name "qb-inventory", "ox_inventory", etc.
Config.OldQBInventory = false -- true if you are using old qb-inventory (check the fxmanifest.lua, version should be 1.x)

CreateThread(function()
    if Config.Inventory then return end

    if GetResourceState("ox_inventory") ~= "missing" then
        Config.Inventory = "ox_inventory"
        return
    end
    if GetResourceState("qb-inventory") ~= "missing" then
        Config.Inventory = "qb-inventory"
        return
    end
    if GetResourceState("lj-inventory") ~= "missing" then
        Config.Inventory = "lj-inventory"
        return
    end
    if GetResourceState("ps-inventory") ~= "missing" then
        Config.Inventory = "ps-inventory"
        return
    end
    if not Config.Inventory then
        print("^2[ERROR] We couldn't find a compatible inventory, this resource will just stop working...")
        print("^2[ERROR] We couldn't find a compatible inventory, this resource will just stop working...")
        print("^2[ERROR] We couldn't find a compatible inventory, this resource will just stop working...")
    end
end)