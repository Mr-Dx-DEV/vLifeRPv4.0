if Config.Framework ~= "esx" then
    return
end

DebugPrint("Loading ESX")

local export, ESX = pcall(function()
    return exports.es_extended:getSharedObject()
end)

if not export then
    TriggerEvent("esx:getSharedObject", function(obj)
        ESX = obj
    end)
end

DebugPrint("Loaded ESX")

function RemoveMoney(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer or amount <= 0 then
        return
    end

    local cash, bank = xPlayer.getMoney(), xPlayer.getAccount("bank").money

    if cash < amount then
        if bank < amount then
            return
        end

        xPlayer.removeAccountMoney("bank", amount)
    else
        xPlayer.removeMoney(amount)
    end

    return true
end

function GetMoney(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    local cash, bank = xPlayer.getMoney(), xPlayer.getAccount("bank").money

    return cash > bank and cash or bank
end

function Notify(source, message)
    TriggerClientEvent("payphone:notify", source, message)
end
