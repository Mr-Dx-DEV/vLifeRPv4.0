local QBCore = exports['qb-core']:GetCoreObject() -- Get QB-Core Object

local webhook = "https://discordapp.com/api/webhooks/1296361202318053386/uCnLFPp4dw_GvAofgNhZeYG7ndCH5buB2N4_9FkTiKtLK1a9SwCzBIDy9U5FkS7XTXp6" -- Define your webhook URL here
local webhook2 = "https://discordapp.com/api/webhooks/1296377637261934623/LsAZmP56csSUCR0iEpxV6ujyQFT1Z2jZnxPPtoUdLFLmWquJv6bTcf_VDAMwOEQsJhlS" -- Define your webhook URL here2
local discordLogImage = "https://cdn.discordapp.com/attachments/873184959400149072/890646026044731412/dollar-black-poster.png"

--current todo is fetch player ip but not in plan because of TOS on my country privacy breach and steam maybe---

RegisterServerEvent('damagebone')
AddEventHandler('damagebone', function(damage)
    local playerId = source
    LogDamage(playerId, damage)
end)

RegisterServerEvent('totaldamage')
AddEventHandler('totaldamage', function(damage1)
    local playerId = source
    totaldamage(playerId, damage1)
end)

-- Function to log damage and include QB-Core character ID and citizen ID
function LogDamage(playerId, damage)
    -- Get the player's identifiers
    local identifiers = GetPlayerIdentifiers(playerId)
    local steamIdentifier, license, discord, xbl, live, ip

    -- Get QB-Core player info
    local Player = QBCore.Functions.GetPlayer(playerId)
    local citizenID = Player and Player.PlayerData.citizenid or "N/A"
    local charID = Player and Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname or "N/A"

    -- Loop through the identifiers to find the required ones
    for _, identifier in ipairs(identifiers) do
        if string.find(identifier, "steam:") then
            steamIdentifier = identifier
        elseif string.find(identifier, "license:") then
            license = identifier
        elseif string.find(identifier, "discord:") then
            discord = identifier
        elseif string.find(identifier, "xbl:") then
            xbl = identifier
        elseif string.find(identifier, "live:") then
            live = identifier
        elseif string.find(identifier, "ip:") then
            ip = string.sub(identifier, 4) -- Remove the "ip:" prefix
        end
    end

    local logInfo = {
        color = "66666", 
        author = {
            name = "Damage Logs!",
            icon_url = discordLogImage
        },
        type = "rich", 
        title = "Damage Logs", 
        description = damage .. "\n **IP : **" .. (ip or "N/A") .. "\n **SteamID: **" .. (steamIdentifier or "N/A") .. "\n **License: **" .. (license or "N/A") .. "\n **Discord: **" .. (discord or "N/A") .. "\n **XBL: **" .. (xbl or "N/A") .. "\n **Live: **" .. (live or "N/A") .. "\n **Citizen ID: **" .. citizenID .. "\n **Character: **" .. charID,
        footer = { 
            text = "Damage Logs!!  |  " .. os.date("%m/%d/%Y") 
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) 
        if err then
            print("[Damage logs] Error sending message to webhook: "..err)
        end
    end, "POST", json.encode({username = "Heavens!", avatar_url = avatar_url, embeds = {logInfo}}), {["Content-Type"] = "application/json"})
end

-- Function to log total damage and include QB-Core character ID and citizen ID
function totaldamage(playerId, damage1)
    -- Get the player's identifiers
    local identifiers = GetPlayerIdentifiers(playerId)
    local steamIdentifier, license, discord, xbl, live, ip

    -- Get QB-Core player info
    local Player = QBCore.Functions.GetPlayer(playerId)
    local citizenID = Player and Player.PlayerData.citizenid or "N/A"
    local charID = Player and Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname or "N/A"

    -- Loop through the identifiers to find the required ones
    for _, identifier in ipairs(identifiers) do
        if string.find(identifier, "steam:") then
            steamIdentifier = identifier
        elseif string.find(identifier, "license:") then
            license = identifier
        elseif string.find(identifier, "discord:") then
            discord = identifier
        elseif string.find(identifier, "xbl:") then
            xbl = identifier
        elseif string.find(identifier, "live:") then
            live = identifier
        elseif string.find(identifier, "ip:") then
            ip = string.sub(identifier, 4) -- Remove the "ip:" prefix
        end
    end

    local logInfo = {
        color = "66666", 
        author = {
            name = "Damage Logs!",
            icon_url = discordLogImage
        },
        type = "rich", 
        title = "Total Damage Logs", 
        description = damage1 .. "\n **IP : **" .. (ip or "N/A") .. "\n **SteamID: **" .. (steamIdentifier or "N/A") .. "\n **License: **" .. (license or "N/A") .. "\n **Discord: **" .. (discord or "N/A") .. "\n **XBL: **" .. (xbl or "N/A") .. "\n **Live: **" .. (live or "N/A") .. "\n **Citizen ID: **" .. citizenID .. "\n **Character: **" .. charID,
        footer = { 
            text = "Damage Logs indicator!!  |  " .. os.date("%m/%d/%Y") 
        }
    }

    PerformHttpRequest(webhook2, function(err, text, headers) 
        if err then
            print("[Damage logs] Error sending message to webhook: "..err)
        end
    end, "POST", json.encode({username = "Heavens!", avatar_url = avatar_url, embeds = {logInfo}}), {["Content-Type"] = "application/json"})
end

AddEventHandler('weaponDamageEvent', function(sender, data)
    local damage = data.weaponDamage
    local isKill = data.willKill
   	TriggerClientEvent('damagelogs', sender, data.weaponDamage, sender, isKill)
end)
