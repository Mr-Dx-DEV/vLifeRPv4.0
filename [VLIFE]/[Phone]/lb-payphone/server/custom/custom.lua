if Config.Framework ~= "custom" then
    return
end

function RemoveMoney(source, amount)
    if amount <= 0 then
        return
    end

    return true
end

function GetMoney(source)
    return 1000
end

function Notify(source, message)
    TriggerClientEvent("payphone:notify", source, message)
end
