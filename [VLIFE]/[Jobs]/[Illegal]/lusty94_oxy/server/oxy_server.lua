local QBCore = exports['qb-core']:GetCoreObject()
local InvType = Config.CoreSettings.Inventory.Type
local NotifyType = Config.CoreSettings.Notify.Type
local Levels = Config.XP.Levels
local MetaDataName = Config.XP.MetaDataName



-------------------< FUNCTIONS >--------------------

--notification function
local function SendNotify(src, msg, type, time, title)
    if NotifyType == nil then print("Lusty94_Oxy: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Oxy" end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print("Notification Sent With No Message") return end
    if NotifyType == 'qb' then
        TriggerClientEvent('QBCore:Notify', src, msg, type, time)
    elseif NotifyType == 'okok' then
        TriggerClientEvent('okokNotify:Alert', src, title, msg, time, type, Config.CoreSettings.Notify.Sound)
    elseif NotifyType == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = type, text = msg, style = { ['background-color'] = '#00FF00', ['color'] = '#FFFFFF' } })
    elseif NotifyType == 'boii'  then
        TriggerClientEvent('boii_ui:notify', src, title, msg, type, time)
    elseif NotifyType == 'ox' then 
        TriggerClientEvent('ox_lib:notify', src, ({ title = title, description = msg, length = time, type = type, style = 'default'}))
    end
end



-- check active cops on duty
function activePoliceCounter()
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    local leoJobs = {
        police = true,
        sheriff = true,
        fbi = true,
        lspd = true,
        bcso = true,
        sahp = true,
        lsso = true,
        safw = true,
        sadoc = true,
        usms = true,
        dhs = true,
        ss = true
    }

    for _, Player in pairs(players) do
        if leoJobs[Player.PlayerData.job.name] and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    return amount
end



--remove items
local function removeItem(src, item, amount)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, item, amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove', amount)
        end
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, item, amount)
    end
end

--add items
local function addItem(src, item, amount)
    if InvType == 'qb' then
        if exports['qb-inventory']:AddItem(src, item, amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, item, amount) then
            exports.ox_inventory:AddItem(src, item, amount)
        else
            SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 5000)
        end
    end
end


--give xp
local function giveOxyXP()
    if Config.XP.Enabled then
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local MetaDataName = Config.XP.MetaDataName
        local OxyXP = Player.PlayerData.metadata[MetaDataName]
        local xpChance = Config.XP.XPChance
        local xpAmount = Config.XP.XPGain
        if xpChance >= math.random(1,100) then
            Player.Functions.SetMetaData(MetaDataName, (OxyXP + xpAmount))
            SendNotify(src,Config.Language.Notifications.EarnedXp, 'error', 2000)
        end
    end	
end

--return amount for events
local function calculateOxyXP(OxyXP)
    if Config.XP.Enabled then
        if OxyXP <= 150 then
            return math.random(1, 3)
        elseif OxyXP <= 500 then
            return math.random(3, 5)
        elseif OxyXP <= 750 then
            return math.random(5, 7)
        elseif OxyXP <= 1250 then
            return math.random(7, 9)
        elseif OxyXP <= 1500 then
            return math.random(9, 11)
        elseif OxyXP <= 2200 then
            return math.random(11, 13)
        end
    else
        return math.random(3,5) -- edit item reward amounts if not using XP here
    end
end

--------------------< USEABLE ITEMS >-----------------

--useable item for oxy
if Config.CreateUseableOxyItem then
    QBCore.Functions.CreateUseableItem('oxy', function(source, item)
        TriggerClientEvent("lusty94_oxy:client:TakeOxy", source)
    end)
end

--useable item for burner phone to sell oxy
if Config.CreateUseableBurnerPhone then
    QBCore.Functions.CreateUseableItem('burnerphone', function(source, item)
        TriggerClientEvent("lusty94_oxy:client:StartSelling", source)
    end)
end




-------------------< CALLBACKS >-------------------

-- callback to check for starting oxy delivery
QBCore.Functions.CreateCallback('lusty94_oxy:server:StartDelivery', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.money.cash >= Config.InteractionLocations.Settings.StartCost then
        local copsOnDuty = activePoliceCounter()
        local startCost = Config.InteractionLocations.Settings.StartCost
        if copsOnDuty >= Config.InteractionLocations.PoliceSettings.MinCops then
            if InvType == 'qb' then
                Player.Functions.RemoveMoney('cash', startCost, "oxy-delivery")
            elseif InvType == 'ox' then
                exports.ox_inventory:RemoveItem(src, 'money', startCost)
            end
            cb(true)
        else
            SendNotify(src, Config.Language.Notifications.NotEnoughPoliceName, 'error', 5000)
            cb(false)
        end
    else
        SendNotify(src,"You don't have enough cash on you!", 'error', 5000)
        cb(false)
    end
end)

-- callback to check for sus package
QBCore.Functions.CreateCallback('lusty94_oxy:get:GetPackage', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local package = Player.Functions.GetItemByName('suspiciouspackage')
    if package and package.amount >= 1  then
        cb(true)
    else
        cb(false)
    end
end)
-- callback to consume oxy
QBCore.Functions.CreateCallback('lusty94_oxy:get:Oxy', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local oxyItem = Player.Functions.GetItemByName('oxy')
    if oxyItem and oxyItem.amount >= 1  then
        cb(true)
    else
        cb(false)
    end
end)

-- callback to start selling oxy
QBCore.Functions.CreateCallback('lusty94_oxy:server:StartSelling', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local oxyItem = Player.Functions.GetItemByName('oxy')
    local maxSales = Config.InteractionLocations.Settings.MaxSales
    if not Player then return end
    if oxyItem and oxyItem.amount >= maxSales then
        local copsOnDuty = activePoliceCounter()
        if copsOnDuty >= Config.InteractionLocations.PoliceSettings.MinCops then
            cb(true)
        else
            SendNotify(src, Config.Language.Notifications.NotEnoughPoliceName, 'error', 5000)
            cb(false)
        end
    else
        SendNotify(src, "You need a minimum of ".. Config.InteractionLocations.Settings.MaxSales.. " oxy to request sales!", 'error', 5000)
        cb(false)
    end
end)




----------------------------< EVENTS >---------------------------


-- give suspicious packages when starting
RegisterNetEvent('lusty94_oxy:server:GetDeliveryPackage', function(packagesAmount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local packagesAmount = Config.InteractionLocations.Settings.MaxDelivery
    if not Player then return end
    addItem(src, 'suspiciouspackage', packagesAmount)
end)

-- reward for completing deliver mission
RegisterNetEvent('lusty94_oxy:server:deliveryReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local OxyXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    local rewardAmount = calculateOxyXP(OxyXP)
    removeItem(src,'suspiciouspackage', 1)
    addItem(src, 'oxy', rewardAmount)
    giveOxyXP()
end)


--remove oxy when consumed
RegisterNetEvent('lusty94_oxy:server:RemoveOxy', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    removeItem(src, 'oxy', 1)
end)

-- sell oxy and get cash
RegisterNetEvent('lusty94_oxy:server:sellOxy', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local OxyXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    if Config.XP.Enabled then
        if OxyXP >= 150 then
            payment = math.random(150,400)
        elseif OxyXP >= 500 then
            payment = math.random(200,500)
        elseif OxyXP >= 750 then
            payment = math.random(300,600)
        elseif OxyXP >= 1250 then
            payment = math.random(400,700)
        elseif OxyXP >= 1500 then
            payment = math.random(500,800)
        elseif OxyXP >= 2200 then
            payment = math.random(600,900)
        end
    else payment = math.random(350,700) end -- edit oxy payment if not using xp here
    removeItem(src, 'oxy', 1)
    if InvType == 'qb' then  
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['oxy'], "remove", 1)   
        Player.Functions.AddMoney('cash', payment, 'oxy-sales')
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'money', payment) then
            exports.ox_inventory:AddItem(src, 'money', payment)
        else
            SendNotify(src,Config.Language.Notifications.CantCarryName, 'error', 5000)
        end
    end
end)




---------------------< DONT TOUCH >--------------------

--/XP Command
if Config.XP.Enabled then
    if Config.XP.Command then
        QBCore.Commands.Add(MetaDataName, "Check Your Oxy XP Level", {}, true, function(source, args)
            local source = source
            local src = source
            local level = 1
            local Player = QBCore.Functions.GetPlayer(source)
            local data = Player.PlayerData.metadata[MetaDataName]
            if data ~= nil then
                for i=1, #Levels, 1 do
                    if data >= Levels[i] then
                        level = i + 1
                    end
                end
                SendNotify(src, "You Are Currently Level: " ..level.. " ( You have: " ..data.. " xp)", 'success', 2000)
            end
        end)
    end
end


local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Oxy/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^2Current^7: "..currentVersion.." ^2Latest^7: "..newestVersion..advice) end
	end)
end
CheckVersion()
