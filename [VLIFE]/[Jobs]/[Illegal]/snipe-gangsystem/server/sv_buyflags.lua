local FlagsBuy = {}

local AlreadyBought = {}
local AlreadyBoughtRemoval = {}

local function StoreFlagsBuyTable()
    SaveResourceFile(GetCurrentResourceName(), "flagsbuy.json", json.encode(FlagsBuy), -1)
end

Citizen.CreateThread(function()
    Citizen.Wait(100)
    local LoadJson = json.decode(LoadResourceFile(GetCurrentResourceName(), 'flagsbuy.json'))
    FlagsBuy = LoadJson
    for k, v in pairs(Config.GangFlags) do
        AlreadyBought[k] = false
        AlreadyBoughtRemoval[k] = false
    end
end)

RegisterServerEvent("snipe-gangsystem:server:buyFlags", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local gang = Player.PlayerData.gang.name
    local flags = 0
    local price = Config.MinimumFlagPrice
    if FlagsBuy[gang] then
        flags = FlagsBuy[gang]
    else
        FlagsBuy[gang] = 0
    end
    if flags ~= 0 then
        price = Config.MinimumFlagPrice * (flags * Config.FlagPriceIncrease)
    end
    if not AlreadyBought[gang] or Config.AllowMultipleBuys then
        if Player.Functions.RemoveMoney(Config.CashType["buyflags"], price) then
            if Player.Functions.AddItem(Config.GangFlags[gang].Item, 1) then
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.GangFlags[gang].Item], "add")
                if FlagsBuy[gang] == nil then
                    FlagsBuy[gang] = 1
                else
                    FlagsBuy[gang] = FlagsBuy[gang] + 1
                end
                AlreadyBought[gang] = true
                StoreFlagsBuyTable()
            else
                ShowNotification(source, Config.Locale["inventory_full"], "error")
                AlreadyBought[gang] = false
                FlagsBuy[gang] = FlagsBuy[gang] - 1
                Player.Functions.AddMoney("cash", price)
                StoreFlagsBuyTable()
            end
        else
            ShowNotification(source, Config.Locale["not_enough_money"].. ": "..price , "error")
        end
    else
        ShowNotification(source, Config.Locale["gang_already_bought_flag"], "error")
    end
end)

RegisterServerEvent("snipe-gangsystem:server:buyRemoval", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local gang = Player.PlayerData.gang.name   

    if not AlreadyBoughtRemoval[gang] or Config.AllowMultipleBuys then
        if Player.Functions.RemoveMoney(Config.CashType["buyremoval"], Config.RemovalItem.price) then
            if Player.Functions.AddItem(Config.RemovalItem.item, 1) then
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RemovalItem.item], "add")
                AlreadyBoughtRemoval[gang] = true
            else
                ShowNotification(source, Config.Locale["inventory_full"], "error")
                AlreadyBoughtRemoval[gang] = false
                Player.Functions.AddMoney("cash", Config.RemovalItem.price)
            end
        else
            ShowNotification(source, Config.Locale["not_enough_money"].. ": "..Config.RemovalItem.price , "error")
        end
    else
        ShowNotification(source, Config.Locale["gang_already_bought_removal"], "error")
    end
end)