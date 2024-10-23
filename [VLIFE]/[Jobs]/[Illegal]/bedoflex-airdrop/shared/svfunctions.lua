locale = bedoflex.Locales[bedoflex.Locale]

bedoflex.ClientCallbacks = {}

bedoflex.LogSettings = {
    Webhooks = {
        ["delete"] = "https://discordapp.com/api/webhooks/1295340018663034910/qooNloY8X82MpggOB3wiF31sdOYkwEeRWvzHOlG8K_puMVynPE8X0bCLjjIZ4iJI9-9Z",
        ["start"] = "https://discordapp.com/api/webhooks/1295340018663034910/qooNloY8X82MpggOB3wiF31sdOYkwEeRWvzHOlG8K_puMVynPE8X0bCLjjIZ4iJI9-9Z",
        ["take"] = "https://discordapp.com/api/webhooks/1295340018663034910/qooNloY8X82MpggOB3wiF31sdOYkwEeRWvzHOlG8K_puMVynPE8X0bCLjjIZ4iJI9-9Z"
    },
    WebhookAvatar = "https://i.resim.tc/GHcvf.png"
}

bedoflex.Log = function(name, title, message, source)
    if source ~= nil then
        source = tonumber(source)
        local Player = nil
        if bedoflex.Framework == "qb" or bedoflex.Framework == "oldqb" then
            Player = Core.Functions.GetPlayer(source)
        elseif bedoflex.Framework == "esx" or bedoflex.Framework == "newesx" then
            Player = Core.GetPlayerFromId(source)
        end
        if Player == nil then
            print("^1[bedoflex-airdrop] ^0Log error: "..name.."")
            return
        end
        local fullName = nil
        if bedoflex.Framework == "qb" or bedoflex.Framework == "oldqb" then
            fullName = Player.PlayerData.charinfo["firstname"].. " " .. Player.PlayerData.charinfo["lastname"]
        elseif bedoflex.Framework == "esx" or bedoflex.Framework == "newesx" then
            fullName = Player.getName()
        end
        local steam = GetPlayerIdentifierByType(source, 'steam')
        local discord = "Unknown"
        for k, v in ipairs(GetPlayerIdentifiers(source)) do
            if string.match(v, "discord:") then
                discord = v
                break
            end
        end
        local fields = {}
        if bedoflex.Framework == "qb" or bedoflex.Framework == "oldqb" then
            local citizenid = Player.PlayerData.citizenid
            fields = {
                [1] = {
                    ["name"] = title,
                    ["value"] = "",
                    ["inline"] = false
                },
                [2] = {
                    ["name"] = "Steam Name",
                    ["value"] = GetPlayerName(source),
                    ["inline"] = true
                },
                [3] = {
                    ["name"] = "Steam Hex",
                    ["value"] = steam,
                    ["inline"] = true
                },
                [4] = {
                    ["name"] = "Discord",
                    ["value"] = "<@"..discord:gsub('discord:', '') .. ">",
                    ["inline"] = true
                },
                [5] = {
                    ["name"] = "Citizen ID",
                    ["value"] = ""..citizenid,
                    ["inline"] = true
                },
                [6] = {
                    ["name"] = "In Game ID",
                    ["value"] = source,
                    ["inline"] = true
                },
                [7] = {
                    ["name"] = "Full Name",
                    ["value"] = fullName,
                    ["inline"] = true
                },
                [8] = {
                    ["name"] = "Message",
                    ["value"] = message,
                    ["inline"] = false
                },
            }
        elseif bedoflex.Framework == "esx" or bedoflex.Framework == "newesx" then
            fields = {
                [1] = {
                    ["name"] = title,
                    ["value"] = "",
                    ["inline"] = false
                },
                [2] = {
                    ["name"] = "Steam Name",
                    ["value"] = GetPlayerName(source),
                    ["inline"] = true
                },
                [3] = {
                    ["name"] = "Steam Hex",
                    ["value"] = steam,
                    ["inline"] = true
                },
                [4] = {
                    ["name"] = "Discord",
                    ["value"] = "<@"..discord:gsub('discord:', '') .. ">",
                    ["inline"] = true
                },
                [5] = {
                    ["name"] = "In Game ID",
                    ["value"] = source,
                    ["inline"] = true
                },
                [6] = {
                    ["name"] = "Full Name",
                    ["value"] = fullName,
                    ["inline"] = true
                },
                [7] = {
                    ["name"] = "Message",
                    ["value"] = message,
                    ["inline"] = false
                },
            }
        end
        local webHook = bedoflex.LogSettings.Webhooks[name]
        if webHook == nil then
            print("^1[bedoflex-airdrop] ^0Log not found: "..name.."")
            return
        end
        embed = {{
            ["color"] = math.random(1000, 9000),

            ["fields"] = fields,

            ["footer"] = {
                ['text'] =  "bedoflex Airdrop | " .. os.date('%c'),
            }
        }}
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'bedoflex Airdrop - Log System', embeds = embed}), { ['Content-Type'] = 'application/json' })        
    else
        local webHook = bedoflex.LogSettings.Webhooks[name]
        if webHook == nil then
            print("^1[bedoflex-airdrop] ^0Log not found: "..name.."")
            return
        end
        embed = {{
            ["color"] = math.random(1000, 9000),

            ["fields"] = {
				[1] = {
                    ["name"] = ""..title,
                    ["value"] = "",
                    ["inline"] = false
                },
                [2] = {
                    ["name"] = "Message",
                    ["value"] = message.."\n",
                    ["inline"] = true
                },
            },
            ["footer"] = {
                ['text'] =  "bedoflex Airdrop | " .. os.date('%c'),
            }
        }}
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'bedoflex Airdrop - Log System', embeds = embed}), { ['Content-Type'] = 'application/json' })          
    end
end
bedoflex.GetCore = function()
    local Core = nil
    if bedoflex.Framework == "oldqb" then
        while Core == nil do
            TriggerEvent("QBCore:GetObject", function(obj) Core = obj end)    
            Wait(200)
        end
    elseif bedoflex.Framework == "qb" then
        while Core == nil do
            Core = exports['qb-core']:GetCoreObject()
            Wait(200)
        end
    elseif bedoflex.Framework == "esx" then
        while Core == nil do
            TriggerEvent('esx:getSharedObject', function(obj) Core = obj end)
		    Wait(200)
        end
    elseif bedoflex.Framework == "newesx" then
        while Core == nil do
            Core = exports['es_extended']:getSharedObject()
            Wait(200)
        end
    else
        CreateThread(function()
            while true do
                print("^1[bedoflex-airdrop] ^0Framework not selected corretly.")
                Wait(5000)
            end
        end)
        return nil
    end
    return Core
end
bedoflex.BanFunction = function(source, reason)
    TriggerClientEvent("bedoflex:ban", source, reason)
end
bedoflex.Notify = function(message, type, source)
    if source then
        if bedoflex.Framework == "qb" or bedoflex.Framework == "oldqb" then
            TriggerClientEvent("QBCore:Notify", source, message, type)
            TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'cod', 0.3)
        elseif bedoflex.Framework == "esx" or bedoflex.Framework == "newesx" then
            TriggerClientEvent('esx:showNotification', source, message, type, 5000)
            TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'cod', 0.3)
        end
    end
end

bedoflex.AddItem = function(source, item, count)
    if bedoflex.Framework == "qb" or bedoflex.Framework == "oldqb" then
        local Player = Core.Functions.GetPlayer(source)
        if Player then
            Player.Functions.AddItem(item, count)
        end
    elseif bedoflex.Framework == "esx" or bedoflex.Framework == "newesx" then
        local Player = Core.GetPlayerFromId(source)
        if Player then
            Player.addInventoryItem(item, count)
        end
    end
end
bedoflex.GetPlayer = function(source)
    if bedoflex.Framework == "qb" or bedoflex.Framework == "oldqb" then
        local Player = Core.Functions.GetPlayer(source)
        if Player then
            return Player
        else
            return nil
        end
    elseif bedoflex.Framework == "esx" or bedoflex.Framework == "newesx" then
        local Player = Core.GetPlayerFromId(source)
        if Player then
            return Player
        else
            return nil
        end
    end
end