insideHouse = false

exports('insideHouse', function()
    return insideHouse
end)

-- not really an export, just in case you want to trigger something when a player enters/leaves a house

function inHouse()
    -- do something? is optional
end

function leaveHouse()
    -- do something? is optional
end