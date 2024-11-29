local QBCore = exports['qb-core']:GetCoreObject()
local MetaDataName = Config.XP.MetaDataName
local OverDoseName = Config.DrugSettings.Effects.OverDoseMetaDataName
local NotifyType = Config.CoreSettings.Notify.Type
local InvType = Config.CoreSettings.Inventory.Type
local Levels = Config.XP.Levels
local OverDoseLevels = Config.DrugSettings.OverDoseLevels


----------< USEABLE ITEMS >-------------

local useItems = {
    { name = 'mushroomprocessingtable',     event = 'lusty94_mushrooms:client:openProcessingTable'},
    { name = 'magic_mushroom',              event = 'lusty94_mushrooms:client:TakeMagicMushrooms'},
    { name = 'mushroomoverdosecure',        event = 'lusty94_mushrooms:client:TakeOverDoseCure'},
    { name = 'deathcap_mushroom',           event = 'lusty94_mushrooms:client:TakeDeathCapMushroom'},
}

for k,v in pairs(useItems) do
    QBCore.Functions.CreateUseableItem(v.name, function(source, item)
        TriggerClientEvent(v.event, source)
    end)
end


--notification function
local function SendNotify(src, msg, type, time, title)
    if not title then title = "Mushrooms" end
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
local function giveDrugXP()
    if Config.XP.Enabled then
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local MetaDataName = Config.XP.MetaDataName
        local DrugXP = Player.PlayerData.metadata[MetaDataName]
        local xpChance = Config.XP.XPChance
        local xpAmount = Config.XP.XPGain
        if xpChance >= math.random(1,100) then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src,Config.Language.Notifications.EarnedXp, 'error', 2000)
        end
    end	
end

--return amount for events
local function calculateDrugXP(DrugXP)
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            return math.random(1, 3)
        elseif DrugXP <= 500 then
            return math.random(3, 5)
        elseif DrugXP <= 750 then
            return math.random(5, 7)
        elseif DrugXP <= 1250 then
            return math.random(7, 9)
        elseif DrugXP <= 1500 then
            return math.random(9, 11)
        elseif DrugXP <= 2200 then
            return math.random(11, 13)
        end
    else
        return math.random(3,5) -- edit item reward amounts if not using XP here
    end
end


--------------CALL BACKS-----------
-- raw mushroom callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:RawMushroomItems', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Drying.RequiredItemName)
    local item2 = Player.Functions.GetItemByName(Config.Processing.Drying.RequiredItem2Name) -- drying rack is only checked for it doesnt remove it
    if item1 and item1.amount >= amount and item2 and item2.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

-- dried mushroom callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:MagicMushroomItems', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Processing.RequiredItemName)
    local item2 = Player.Functions.GetItemByName(Config.Processing.Processing.RequiredItem2Name)
    if item1 and item1.amount >= amount and item2 and item2.amount >= amount then
        cb(true)
    else
        cb(false)
    end
end)



--overdose cure callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:OverDoseCureItems', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItemName)
    local item2 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItem2Name)
    if item1 and item1.amount >= amount and item2 and item2.amount >= amount then
        cb(true)
    else
        cb(false)
    end
end)

--take magic mushrooms callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:TakeMagicMushrooms', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Processing.ProcessedItemName)
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

-- take overdose cure callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:TakeOverDoseCure', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.ProcessedItemName)
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)



-- deathcap mushroom callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:DeathcapMushroom', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName("deathcap_mushroom")
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)



----------EVENTS-------------

-- pick raw mushroom
RegisterServerEvent('lusty94_mushrooms:server:PickMushrooms', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local items = { 'libertycap_mushroom', 'indigomilkcap_mushroom', 'deathcap_mushroom', }
    local selectedItems = items[math.random(#items)]
    local rewardAmount = calculateDrugXP(DrugXP)
    if not Player then return end
    addItem(src, selectedItems, rewardAmount)
    giveDrugXP()
end)


--dry mushrooms
RegisterServerEvent('lusty94_mushrooms:server:DryMushroom', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local requiredAmount = 1
    local rewardAmount = calculateDrugXP(DrugXP)
    if not Player then return end
    removeItem(src, Config.Processing.Drying.RequiredItemName, requiredAmount * amount)	
    Wait(500)
    addItem(src, Config.Processing.Drying.DriedItemName, amount * rewardAmount)
    giveDrugXP()	
end)


--make magic mushrooms
RegisterServerEvent('lusty94_mushrooms:server:MakeMagicMushrooms', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local requiredAmount = 1
    local rewardAmount = calculateDrugXP(DrugXP)
    if not Player then return end
    removeItem(src, Config.Processing.Processing.RequiredItemName, requiredAmount * amount)	
    Wait(500)
    removeItem(src, Config.Processing.Processing.RequiredItem2Name, requiredAmount * amount)	
    Wait(500)
    addItem(src, Config.Processing.Processing.ProcessedItemName, amount * rewardAmount)
    giveDrugXP()
end)


--make overdose cure
RegisterServerEvent('lusty94_mushrooms:server:MakeOverdoseCure', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local requiredAmount = 1
    local rewardAmount = calculateDrugXP(DrugXP)
    if not Player then return end
    removeItem(src, Config.Processing.Curing.RequiredItemName, requiredAmount * amount)	
    Wait(500)
    removeItem(src, Config.Processing.Curing.RequiredItem2Name, requiredAmount * amount)	
    Wait(500)
    addItem(src, Config.Processing.Curing.ProcessedItemName, amount * rewardAmount)
    giveDrugXP()
end)





-- take magic mushrooms
RegisterServerEvent('lusty94_mushrooms:server:TakeMagicMushrooms', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    removeItem(src, Config.Processing.Processing.ProcessedItemName, 1)
end)

-- take deathcap mushrooms
RegisterServerEvent('lusty94_mushrooms:server:TakeDeathCapMushrooms', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    removeItem(src, 'deathcap_mushroom', 1)
end)

-- update overdose
RegisterServerEvent('lusty94_mushrooms:server:OverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]

    Player.Functions.SetMetaData(OverDoseName, (OverDose + Config.DrugSettings.Effects.OverDoseAmount)) -- Edit overdose counter here dont go too high or players wont be able to consume that many magic mushrooms without overdosing each time
    if OverDose >= Config.DrugSettings.Effects.OverDoseLevel then -- ONCE A PLAYER REACHES THIS NUMBER OR GOES PAST IT THEY WILL ALWAYS OVERDOSE WHEN CONSUMING MAGIC MUSHROOMS SO BE CAREFUL WHEN SETTING THIS VALUE
        Wait(3000)       
        TriggerClientEvent('lusty94_mushrooms:client:OverDose', src)
    end    
end)

-- remove overdose
RegisterServerEvent('lusty94_mushrooms:server:CureOverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]
    local rewardAmount = calculateDrugXP(DrugXP)
    if not Player then return end
    if OverDose >= 1 then 
        removeItem(src, Config.Processing.Curing.ProcessedItemName, 1)
        Player.Functions.SetMetaData(OverDoseName, (OverDose - Config.DrugSettings.Effects.OverDoseCureAmount))
        SendNotify(src, Config.Language.Notifications.OverDoseCuredName, 'success', 2000)
    else
        SendNotify(src, Config.Language.Notifications.AlreadyCuredName, 'error', 2000)
    return
    end
end)


-- /commands
if Config.DrugSettings.Effects.OverDose then
    QBCore.Commands.Add(OverDoseName, "Check Your OverDose Level", {}, true, function(source, args)
        local source = source
        local src = source
        local level = 1
        local Player = QBCore.Functions.GetPlayer(source)
        local data = Player.PlayerData.metadata[OverDoseName]
        if data ~= nil then
            for i=1, #OverDoseLevels, 1 do
                if data >= OverDoseLevels[i] then
                    level = i + 1
                end
            end
            SendNotify(src, 'You Are Currently Level: ' ..level.. ' | You have: ' ..data.. ' xp |', 'error', 2000)
        end
    end)
end

-- /commands
if Config.XP.Enabled then
    if Config.XP.Command then
        QBCore.Commands.Add(MetaDataName, "Check Your Drug XP Level", {}, true, function(source, args)
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
                SendNotify(src, 'You Are Currently Level: ' ..level.. ' | You have: ' ..data.. ' xp |', 'error', 2000)
            end
        end)
    end
end


--------------------------< QB-INVENTORY SUPPLY SHOPS >--------------------

--supply shop
RegisterServerEvent('lusty94_mushrooms:server:SupplyShop', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local mushroomSupplies = {
        {name = "acetone",                 price = 250,  amount = 1000, info = {}, type = "item", slot = 1,},
        {name = "dimethylformamide",       price = 500,  amount = 1000, info = {}, type = "item", slot = 2,},
        {name = "dryingrack",              price = 100,  amount = 1000, info = {}, type = "item", slot = 3,},
        {name = "mushroomprocessingtable", price = 1000, amount = 1000, info = {}, type = "item", slot = 4,},
    }
    exports['qb-inventory']:CreateShop({
        name = 'mushroomSupplies',
        label = 'Magic Mushroom Supply Shop',
        slots = 4,
        items = mushroomSupplies
    })
    if Player then
        exports['qb-inventory']:OpenShop(source, 'mushroomSupplies')
    end
end)


--------------------------< OX_INVENTORY SUPPLY SHOPS >--------------------
--supplies shop
function MushroomSupplyStore()
    exports.ox_inventory:RegisterShop('MushroomSupplyStore', {
        name = 'Mushroom Supply Shop',
        inventory = {
            { name = 'acetone',             price = 250 },
            { name = 'dimethylformamide',   price = 500 },
            { name = 'dryingrack',          price = 100 },
            { name = 'mushroomprocessingtable',     price = 1000 },
        },
    })
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        if InvType == 'ox' then
            print('^5--<^3!^5>-- ^7| Lusty94_Mushrooms |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Inventory Type is set to ox |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Registering shops automatically |^5 ^5--<^3!^5>--^7')
            MushroomSupplyStore()
            print('^5--<^3!^5>-- ^7| Shops registered successfully |^5 ^5--<^3!^5>--^7')
        end
    end
end)
local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Mushrooms/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^2Current^7: "..currentVersion.." ^2Latest^7: "..newestVersion..advice) end
	end)
end
CheckVersion()