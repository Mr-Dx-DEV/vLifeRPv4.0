robbedGangTable = {}

function StoreRobbedGangTable()
    SaveResourceFile(GetCurrentResourceName(), "robbedLocal.json", json.encode(robbedGangTable), -1)
end

Citizen.CreateThread(function()
    Citizen.Wait(100)
    local LoadJson = json.decode(LoadResourceFile(GetCurrentResourceName(), 'flagsbuy.json'))
    robbedGangTable = LoadJson
end)

QBCore.Functions.CreateCallback("snipe-gangsystem:client:hasDrugs", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(Config.Drugs) do        
        local item = Player.Functions.GetItemByName(k)
        if item and item.amount >= 1 then
            cb({true, k})
        end
    end
    cb({false, nil})
end)

RegisterServerEvent("snipe-gangsystem:server:sellDrugs", function(gang, itemName)
    local flags = GetGangFlags(gang)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local randomAmount = 0
    if Player then
        local item = Player.Functions.GetItemByName(itemName)
        if item.amount >= Config.Drugs[itemName].maxAmount then
            randomAmount = math.random(1, Config.Drugs[itemName].maxAmount)
        else
            randomAmount = math.random(1, item.amount)
        end
        Player.Functions.RemoveItem(item.name, randomAmount)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
        if not robbedGangTable[gang] then
            robbedGangTable[gang] = 0
        end
        local money = GetMoneyForDrugSell(flags, robbedGangTable[gang], randomAmount, Config.Drugs[itemName].price, Config.MinimumFlagsForDrugs)
        money = math.ceil(money)
        Player.Functions.AddMoney(Config.CashType["selldrugs"], money)
        if robbedGangTable[gang] - 1 >= 1 then
            robbedGangTable[gang] = robbedGangTable[gang] - 1
        else
            robbedGangTable[gang] = 0
        end
        StoreRobbedGangTable()
    end
end)

RegisterServerEvent("snipe-gangsystem:server:notifyGang", function(gang, coords)
    for k, v in pairs(GangCountTable[gang]) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player then
            TriggerClientEvent("snipe-gangsystem:client:notifyGang", Player.PlayerData.source, coords)
        end
    end
end)

RegisterServerEvent("snipe-gangsystem:server:robMember", function(gang)
    
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local activeGangMembers = #GangCountTable[gang]
    local randomAmount = 0
    if activeGangMembers == 0 or activeGangMembers == 1 then
        randomAmount = Config.RobLocalAmount
    else
        randomAmount = Config.RobLocalAmount * math.random(1, activeGangMembers)
    end
    if robbedGangTable[gang] then
        robbedGangTable[gang] = robbedGangTable[gang] + 1
    else
        robbedGangTable[gang] = 1
    end
    StoreRobbedGangTable()
    Player.Functions.AddMoney(Config.CashType["robLocal"], randomAmount)
end)

