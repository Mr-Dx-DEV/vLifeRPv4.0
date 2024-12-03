local QBCore = exports['qb-core']:GetCoreObject()

--local hiddenprocess = vector3(5211.87, -5128.55, 6.21) -- Server-side process location
local hiddenprocess = vector3(00.00, 00.00, 00.00) -- Server-side process location
local hiddenstart = vector3(4493.53, -4526.08, 4.43)   -- Server-side start location

-- Discord webhook function to log events
local function sendDiscordLog(title, description, color)
    local webhookURL = "https://discord.com/api/webhooks/1278274086501617714/ulORkBKXo4V5HJpjZmNsb7sojg2o0sft028QDqtvvsiRzUIbSDyFFeGkzuBKc_85L9kc"  -- Replace with your Discord webhook URL
    local embed = {
        {
            ["title"] = title,
            ["description"] = description,
            ["color"] = color,
            ["footer"] = {
                ["text"] = "Coke Process Logs"
            },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")  -- Current time in ISO format
        }
    }

    PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode({username = "Server Logs", embeds = embed}), {['Content-Type'] = 'application/json'})
end

RegisterNetEvent('VL-CokePlaneL:updateTable')
AddEventHandler('VL-CokePlaneL:updateTable', function(bool)
    TriggerClientEvent('VL-CokePlaneL:syncTable', -1, bool)
end)

QBCore.Functions.CreateUseableItem('coke', function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) ~= nil then
 		TriggerClientEvent('VL-CokePlaneL:onUse', source)
	end
end)

QBCore.Functions.CreateCallback('VL-CokePlaneL:processcoords', function(source, cb)
    cb(hiddenprocess)
end)

QBCore.Functions.CreateCallback('VL-CokePlaneL:startcoords', function(source, cb)
    cb(hiddenstart)
end)

QBCore.Functions.CreateCallback('VL-CokePlaneL:pay', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local amount = Config.amount
	local cashamount = Player.PlayerData.money["cash"]
    local toamount = tonumber(amount)
   
	if cashamount >= amount then
		Player.Functions.RemoveMoney('cash', amount) 
    	cb(true)
	else
		TriggerClientEvent("QBCore:Notify", src, "You don't have enough Money to Start", "error", 4000)
		cb(false)
	end
end)

RegisterServerEvent("VL-CokePlaneL:processed")
AddEventHandler("VL-CokePlaneL:processed", function(x,y,z)
  	local src = source

	--[[ local item1 = exports['ox_inventory']:Search(src, 'count', 'coke_brick_gang')
	local item2 = exports['ox_inventory']:Search(src, 'count', 'empty_weed_bag')
    if not item1 >= 1 or not item2 >= 10 then
		print('No', item1)
		print('No', item2)
        --exports['qb-core']:ExploitBan(src, "Cocain Process Exploit")
        return
    end ]]

	if 	TriggerClientEvent("QBCore:Notify", src, "Made a Coke Bag!!", "Success", 8000) then
		exports['ox_inventory']:RemoveItem(src, 'coke_brick_gang', 1, false)
		exports['ox_inventory']:RemoveItem(src, 'empty_weed_bag', 10, false)	
		exports['ox_inventory']:AddItem(src, 'cokebaggy', 10)	

        -- Send a log to Discord for the processing
        sendDiscordLog("Coke Processed", "**Player ID:** " .. src .. " processed 1 coke brick into 10 coke baggies.", 65280)
	end
end)

QBCore.Functions.CreateCallback('VL-CokePlaneL:ingredient', function(source, cb)
	local src = source
	local Ply = QBCore.Functions.GetPlayer(src)
	local coke_brick_gang = Ply.Functions.GetItemByName("coke_brick_gang")
	local empty_weed_bag = Ply.Functions.GetItemByName("empty_weed_bag")
	if coke_brick_gang ~= nil and empty_weed_bag ~= nil then
		cb(true)
	else
		cb(false)
	end
end)

QBCore.Functions.CreateCallback('VL-CokePlaneL:process', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	 
	if Player.PlayerData.item ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "coke_brick_gang" then
					cb(true)
			    else
					TriggerClientEvent("QBCore:Notify", src, "You do not have any coke bricks", "error", 10000)
					cb(false)
				end
	        end
		end	
	end
end)

RegisterServerEvent("VL-CokePlaneL:GiveItem")
AddEventHandler("VL-CokePlaneL:GiveItem", function()
  	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local price = Config.price
	local brick = Config.randBrick

	Player.Functions.AddMoney('cash', price)
	Player.Functions.AddItem('coke_brick_gang', brick)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['coke_brick_gang'], "add")

    -- Send a log to Discord when a player gets coke bricks from a plane drive
    sendDiscordLog("Coke Brick Received", "**Player ID:** " .. src .. " received " .. brick .. " coke bricks from a plane drive.", 16776960)
end)
