local QBCore = exports['qb-core']:GetCoreObject()

-- Webhook URL (replace with your actual webhook URL)
local discordWebhook = "https://discord.com/api/webhooks/1278270049303662593/yzbg00WScpbWULRCfV-vsS-_V5mypU7RSCKpnkJnf842MA9xHJiW0ClAv45GBCZp49RD"

-- Function to send webhook logs to Discord
local function sendDiscordLog(message)
    local embeds = {
        {
            ["title"] = "House Robbery Log",
            ["description"] = message,
            ["color"] = 16711680, -- Red color in Discord
            ["footer"] = {
                ["text"] = "House Robbery Logs"
            }
        }
    }

    PerformHttpRequest(discordWebhook, function(err, text, headers) end, 'POST', json.encode({username = "House Robbery Bot", embeds = embeds}), {['Content-Type'] = 'application/json'})
end

-- Functions

local function ResetHouseStateTimer(house)
    local num = math.random(3333333, 11111111)
    local time = tonumber(num)
    SetTimeout(time, function()
        Config.Houses[house]["opened"] = false
        for _, v in pairs(Config.Houses[house]["furniture"]) do
            v["searched"] = false
        end
        TriggerClientEvent('VL-HSRob:client:ResetHouseState', -1, house)
    end)
end

-- Callbacks

QBCore.Functions.CreateCallback('VL-HSRob:server:GetHouseConfig', function(_, cb)
    cb(Config.Houses)
end)

-- Events

RegisterNetEvent('VL-HSRob:server:SetBusyState', function(cabin, house, bool)
    Config.Houses[house]["furniture"][cabin]["isBusy"] = bool
    TriggerClientEvent('VL-HSRob:client:SetBusyState', -1, cabin, house, bool)
    
    -- Log to Discord
    sendDiscordLog("Cabin " .. cabin .. " in house " .. house .. " set to busy state: " .. tostring(bool))
end)

RegisterNetEvent('VL-HSRob:server:enterHouse', function(house)
    local src = source
    if not Config.Houses[house]["opened"] then
        ResetHouseStateTimer(house)
        TriggerClientEvent('VL-HSRob:client:setHouseState', -1, house, true)
    end
    TriggerClientEvent('VL-HSRob:client:enterHouse', src, house)
    Config.Houses[house]["opened"] = true
    
    -- Log to Discord
    sendDiscordLog("Player " .. GetPlayerName(src) .. " has entered house: " .. house)
end)
RegisterNetEvent('VL-HSRob:server:searchCabin', function(cabin, house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local luck = math.random(1, 10)
    local itemFound = math.random(1, 4)
    local itemCount = 1
    local cash = math.random(500, 10000)
    local Tier = Config.Houses[house]["tier"] or 1 -- Simplified tier determination

    if itemFound < 4 then
        if luck == 10 then
            itemCount = 3
        elseif luck >= 6 and luck <= 8 then
            itemCount = 2
        end

        for _ = 1, itemCount, 1 do
            local randomItemType = Config.Houses[house]["furniture"][cabin]["type"]
            local rewardList = Config.Rewards[Tier][randomItemType]

            if rewardList then
                local randomIndex = math.random(1, #rewardList)
                local randomItem = rewardList[randomIndex]
                local itemInfo = QBCore.Shared.Items[randomItem]

                if itemInfo then
                    if math.random(1, 100) == 69 then
                        randomItem = "lithium"
                        itemInfo = QBCore.Shared.Items[randomItem]
                        Player.Functions.AddItem(randomItem, 2)
                        TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                    elseif math.random(1, 100) == 35 then
                        randomItem = "acetone"
                        itemInfo = QBCore.Shared.Items[randomItem]
                        Player.Functions.AddItem(randomItem, 1)
                        TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                    elseif math.random(1, 100) == 22 then
                        Player.Functions.AddMoney("cash", cash)
                    else
                        if not itemInfo["unique"] then
                            local itemAmount = math.random(1, 3)
                            if randomItem == "gold_watch" then
                                itemAmount = math.random(2, 4)
                            end
                            Player.Functions.AddItem(randomItem, itemAmount)
                        else
                            Player.Functions.AddItem(randomItem, 1)
                        end
                        TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                    end
                else
                    print("Warning: Item not found in QBCore.Shared.Items - " .. tostring(randomItem))
                end
            else
                print("Warning: Reward list not found for tier " .. Tier .. " and type " .. tostring(randomItemType))
            end
            Wait(500)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.emty_box"), 'error')
    end

    Config.Houses[house]["furniture"][cabin]["searched"] = true
    TriggerClientEvent('VL-HSRob:client:setCabinState', -1, house, cabin, true)
    
    -- Log to Discord
    sendDiscordLog("Player " .. GetPlayerName(src) .. " searched cabin " .. cabin .. " in house " .. house)
end)


RegisterNetEvent('VL-HSRob:server:removeAdvancedLockpick', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('advancedlockpick', 1)
    
    -- Log to Discord
    sendDiscordLog("Player " .. GetPlayerName(source) .. " used an advanced lockpick.")
end)

RegisterNetEvent('VL-HSRob:server:removeLockpick', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem('lockpick', 1)
    
    -- Log to Discord
    sendDiscordLog("Player " .. GetPlayerName(source) .. " used a lockpick.")
end)

QBCore.Functions.CreateUseableItem("hack_laptop", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("VL-HSRob:client:househacking", src)
    
    -- Log to Discord
    sendDiscordLog("Player " .. GetPlayerName(src) .. " used a hacking laptop.")
end)

RegisterNetEvent('VL-HSRob:server:removehousehacking', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local src = source
    if Player.Functions.RemoveItem('hack_laptop', 1) then
        TriggerClientEvent('QBCore:Notify', src, "You Lost Your House Hacking Laptop", 'error')
        
        -- Log to Discord
        sendDiscordLog("Player " .. GetPlayerName(src) .. " lost their house hacking laptop.")
    end
end)

QBCore.Functions.CreateUseableItem("mansionlaptop", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("VL-HSRob:client:mansionhacking", src)
    
    -- Log to Discord
    sendDiscordLog("Player " .. GetPlayerName(src) .. " used a mansion hacking laptop.")
end)

RegisterNetEvent('VL-HSRob:server:removemansionhacking', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local src = source
    if Player.Functions.RemoveItem('mansionlaptop', 1) then
        TriggerClientEvent('QBCore:Notify', src, "You Lost Your Mansion Hacking Laptop", 'error')
        
        -- Log to Discord
        sendDiscordLog("Player " .. GetPlayerName(src) .. " lost their mansion hacking laptop.")
    end
end)
