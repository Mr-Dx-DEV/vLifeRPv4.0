local QBCore = nil

if Config.framework == "qb-core" then
    QBCore = exports[Config.framework]:GetCoreObject()
else
    -- custom framework or different framework stuff here
end


-- function registerUseableItem(itemName, eventName)
--     if Config.framework == "qb-core" then
--         QBCore.Functions.CreateUseableItem(itemName, function(source, item)
--             TriggerClientEvent(eventName, source)
--         end)
--     else
--         -- custom framework or different framework stuff here
--     end
-- end