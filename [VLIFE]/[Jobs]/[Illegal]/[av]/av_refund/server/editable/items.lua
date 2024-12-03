function getItems()
    if Config.Inventory == "ox_inventory" then
        return exports['ox_inventory']:Items()
    else
        if Core and (Core.Shared and Core.Shared.Items) then
            return Core.Shared.Items
        end
    end
    return false
end