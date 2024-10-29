local WebHooks = {
    ["hire"] = "https://discordapp.com/api/webhooks/1287439750537547786/qMVbAHq6uyiWK1ZhEUIEHBQuvLgMQlbS000fcsquLEOznn1q9_tZjoeAsgHNvYUeqc4X",
    ["fire"] = "https://discordapp.com/api/webhooks/1287439750537547786/qMVbAHq6uyiWK1ZhEUIEHBQuvLgMQlbS000fcsquLEOznn1q9_tZjoeAsgHNvYUeqc4X",
    ["changerole"] = "https://discordapp.com/api/webhooks/1287439750537547786/qMVbAHq6uyiWK1ZhEUIEHBQuvLgMQlbS000fcsquLEOznn1q9_tZjoeAsgHNvYUeqc4X",
}

function SendLogs(source, type, cid, otherPlayerName, gangName, oldRank, newRank)
    local message = ""
    local colorcode = 5763719
   
    if type == "fire" then
        colorcode = 16711680
        message = "**"..otherPlayerName.."** ("..cid..") was fired from **"..gangName.."**"
    elseif type == "changerole" then
        colorcode = 16776960
        message = "**"..otherPlayerName.."** ("..cid..") was promoted from **"..oldRank.."** to **"..newRank.."** in **"..gangName.."**"
    elseif type == "hire" then
        message = "**"..otherPlayerName.."** ("..cid..") was hired to **"..gangName.."** ".. " with the role **"..newRank.."**" 
    end
    local description = ""
    if source == 0 then
        description = "**"..message.."**"
    else
        description = "**"..GetPlayerName(source).."** ("..source..")\n"..message
    end
    local embedData = {
        {
            ["title"] = "Gang System Logs" ,
            ["color"] = colorcode,
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            ["description"] = description,
            ["author"] = {
            ["name"] = 'Gang System Logs',
            },
        }
    }
    PerformHttpRequest(WebHooks[type], function(err, text, headers) end, 'POST', json.encode({ username = "Snipe Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end
