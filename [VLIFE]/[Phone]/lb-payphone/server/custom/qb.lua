if Config.Framework ~= "qb" then
    return
end

DebugPrint("Loading QB")

local QB = exports["qb-core"]:GetCoreObject()

DebugPrint("Loaded QB")

function RemoveMoney(source, amount)
    local qPlayer = QB.Functions.GetPlayer(source)

    if not qPlayer or amount <= 0 then
        return
    end

    local cash, bank = qPlayer.Functions.GetMoney("cash"), qPlayer.Functions.GetMoney("bank")

    if cash < amount then
        if bank < amount then
            return
        end

        qPlayer.Functions.RemoveMoney("bank", amount, "payphone")
    else
        qPlayer.Functions.RemoveMoney("cash", amount, "payphone")
    end

    return true
end

function GetMoney(source)
    local qPlayer = QB.Functions.GetPlayer(source)

    if not qPlayer then
        return
    end

    local cash, bank = qPlayer.Functions.GetMoney("cash"), qPlayer.Functions.GetMoney("bank")

    return cash > bank and cash or bank
end

function Notify(source, message)
    TriggerClientEvent("payphone:notify", source, message)
end
