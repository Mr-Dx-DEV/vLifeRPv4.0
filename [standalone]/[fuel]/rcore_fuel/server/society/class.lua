function GetMoneyFromSociety(society)
    local promise = promise:new()

    if Config.Framework.Active == Framework.QBCORE then
        xpcall(function()
            local societyMoney = exports["qb-banking"]:GetAccountBalance(society)
            promise:resolve(societyMoney)
        end, function(error)
            xpcall(function()
                local societyMoney = exports["qb-management"]:GetAccount(society)
                promise:resolve(societyMoney)
            end, function(error)
                local societyMoney = exports["qb-bossmenu"]:GetAccount(society)
                promise:resolve(societyMoney)
            end)
        end)
    end

    if Config.Framework.Active == Framework.ESX then
        TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
            if account then
                promise:resolve(account.money)
            else
                print(string.format("^1[%s][ERROR]^7 Society ^1'%s'^7 do not exists!", GetCurrentResourceName(), society))
                promise:resolve(0)
            end
        end)
    end

    return Citizen.Await(promise)
end

function RemoveMoneyFromSociety(money, society)
    if Config.Framework.Active == Framework.QBCORE then
        money = math.ceil(money)
        xpcall(function()
            exports["qb-banking"]:RemoveMoney(society, money)
        end, function(error)
            xpcall(function()
                exports["qb-management"]:RemoveMoney(society, money)
            end, function(error)
                TriggerEvent("qb-bossmenu:server:removeAccountMoney", society, money)
            end)
        end)
    end

    if Config.Framework.Active == Framework.ESX then
        TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
            if account then
                account.removeMoney(money)
            else
                print(string.format("^1[%s][ERROR]^7 Society ^1'%s'^7 do not exists!", GetCurrentResourceName(), society))
            end
        end)
    end
end

function GiveMoneyToSociety(money, society)
    if Config.Framework.Active == Framework.QBCORE then
        money = math.ceil(money)
        xpcall(function()
            exports["qb-banking"]:AddMoney(society, money)
        end, function(error)
            xpcall(function()
                exports["qb-management"]:AddMoney(society, money)
            end, function(error)
                TriggerEvent("qb-bossmenu:server:addAccountMoney", society, money)
            end)
        end)
    end

    if Config.Framework.Active == Framework.ESX then
        TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
            if account then
                account.addMoney(money)
            else
                print(string.format("^1[%s][ERROR]^7 Society ^1'%s'^7 do not exists!", GetCurrentResourceName(), society))
            end
        end)
    end
end