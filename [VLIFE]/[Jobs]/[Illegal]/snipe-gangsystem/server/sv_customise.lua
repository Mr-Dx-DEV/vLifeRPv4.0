function ShowNotification(source, msg, type)
    if Config.Notify['QBCore'] then
        TriggerClientEvent(Config.Core..':Notify', source, msg, type)
    elseif Config.Notify['okokNotify'] then
        TriggerClientEvent('okokNotify:Alert', source, Config.OkOkNotifyTitle, msg, 5000, type)
    elseif Config.Notify['pNotify'] then
        TriggerClientEvent("pNotify:SendNotification", source, {
            text = msg,
            type = type,
            timeout = 5000,
            layout = Config.pNotifyLayout
        })
    end
end

-- this returns the number of gang members that are active. If you want to edit it to return the gang members that are alive, use the following snippet instead. Make sure you are using only of these callbacks.

--[[
    QBCore.Functions.CreateCallback("snipe-gangsystem:server:checkAvailableGangMembers", function(source, cb, gang)
        local alive = 0
        for k, v in pairs(GangCountTable[gang]) do
            local Player = QBCore.Functions.GetPlayer(v)
            if Player then
                if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"]  then
                    alive = alive + 1
                end
            end
        end
        cb(alive)
    end)
]]--

QBCore.Functions.CreateCallback("snipe-gangsystem:server:checkAvailableGangMembers", function(source, cb, gang)
    cb(#GangCountTable[gang])
end)


-- do not play with this logic if you are unsure what its doing. 
-- this logic has been written keeping in mind a lot of factors. So please ask question if you have doubts.
function IsAllowedToPlace(source, gang)
    if GetGangFlags(gang) > 100 then
        return false
    end
    local Player = GetPlayerPed(source)
    local coords = GetEntityCoords(Player)
    local isNearOwnFlag = false
    local isNearAnotherFlag = false
    local isNearAnyFlag = false
    for k,v in pairs(flagTable) do
        if v then
            if #(coords - v.coords) < 130 and #(coords - v.coords) > 110 and v.gang == gang then
                isNearOwnFlag = true
            elseif #(coords - v.coords) <= 200 and v.gang ~= gang then
                isNearAnotherFlag = true
            elseif #(coords - v.coords) <= 50 then
                isNearAnyFlag = true
            end
        end
    end
    -- print(isNearOwnFlag, isNearAnotherFlag, isNearAnyFlag)
    return isNearOwnFlag and not isNearAnotherFlag and not isNearAnyFlag
end

-- flags - amount of flags that the gang has placed
-- localsRobbed - number of locals robbed for that gang (saved in robbedLocal.json)
-- amountOfDrugs - amount of drugs that the member is selling
-- drugPrice - price for the drug saved in config.lua
-- minimumFlagsForDrugs - Config.MinimumFlagsForDrugs
function GetMoneyForDrugSell(flags, localsRobbed, amountOfDrugs, drugPrice, minimumFlagsForDrugs)
    return ((amountOfDrugs * drugPrice) * (flags/ minimumFlagsForDrugs) * (1 - (localsRobbed / Config.RobReputation)))
end


-- UI Callback
--[[
    You can edit this if you use some custom management system for gangs. This is configured to work with base qb-management system.
    Edit the functionality on your own. I wont be supporting any other custom management scripts.
]]--

QBCore.Functions.CreateCallback("snipe-gangsystem:server:getFundsData", function(source, cb, gangName)
    local data = {}
    local gangFund = exports["qb-management"]:GetGangAccount(gangName)
    data.funds = gangFund
    cb(data)
end)


QBCore.Functions.CreateCallback("snipe-gangsystem:server:depositToGangFunds", function(source, cb, fundData)
    local cannotDeposit = true
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local money = Player.PlayerData.money.bank
    if money >= tonumber(fundData.depositAmount) then
        Player.Functions.RemoveMoney("bank", tonumber(fundData.depositAmount), "gang-deposit")
        exports["qb-management"]:AddGangMoney(fundData.gangName, fundData.depositAmount)
        cannotDeposit = false
    end
    cb(cannotDeposit)
end)

QBCore.Functions.CreateCallback("snipe-gangsystem:server:withdrawFromGangFunds", function(source, cb, fundData)
    local cannotWithdraw = true
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local gangFund = exports["qb-management"]:GetGangAccount(fundData.gangName)
    if tonumber(fundData.withdrawAmount) <= gangFund then
        Player.Functions.AddMoney("bank", tonumber(fundData.withdrawAmount), "gang-withdraw")
        exports["qb-management"]:RemoveGangMoney(fundData.gangName, tonumber(fundData.withdrawAmount))
        cannotWithdraw = false
    end
    cb(cannotWithdraw)
end)

QBCore.Functions.CreateCallback("snipe-gangsystem:server:checkItem", function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local itemData = Player.Functions.GetItemByName(item)
    if itemData ~= nil then
        cb(true)
    else
        cb(false)
    end
end)