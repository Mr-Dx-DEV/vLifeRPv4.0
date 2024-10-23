local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("911r", function(source, args, rawCommand)
    local src = source
	local target = tonumber(args[1])
	local msg = rawCommand:sub(7)
    local Player = QBCore.Functions.GetPlayer(src)
	local job = Player.PlayerData.job.name
    if job == 'police' or job == 'ambulance' then
        if args[1] then
		    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if Player then
                local fname = Player.PlayerData.charinfo.firstname
                local lname = Player.PlayerData.charinfo.lastname
                local phone = Player.PlayerData.charinfo.phone
                if string.len(msg) > 0 then
                    TriggerClientEvent('chat:addMessage', target, {
                        template = '<div style="padding: 0.3vw;  margin: 0.2vw; background-color: rgba(150, 40, 15, 0.8); border-radius: 4px;"><i style="font-size:15px;color:grey"></i> <b><font color="#ffffff">911 | LSPD | ({0}) -> {1} |{2} # {3} : <font color="white">{4}</font></div>',
                        args = { source, fname, lname, phone, msg }
                    })
                    TriggerClientEvent('chat:addMessage', source, {
                        template = '<div style="padding: 0.3vw;  margin: 0.2vw; background-color: rgba(150, 40, 15, 0.8); border-radius: 4px;"><i style="font-size:15px;color:grey"></i> <b><font color="#ffffff">911 | LSPD | ({0}) -> {1} |{2} # {3} : <font color="white">{4}</font></div>',
                        args = { source, fname, lname, phone, msg }
                    })
                    discordLogs3(author, src, fname, lname, phone, msg)
                else
                    TriggerClientEvent('QBCore:Notify', source, "Message can't be empty!")
                end 
            else
                TriggerClientEvent('QBCore:Notify', source, "Player is not online!")
            end
        else
            TriggerClientEvent('QBCore:Notify', source, "Invalid ID!")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "You are not allowed to use this command!")
    end
end)

TriggerClientEvent('chat:addSuggestion', '/911r', 'Job chat for reply', {
    { name="[ID]", help="Target ID" },
    { name="[MESSAGE]", help="Message to recipient" }
})

TriggerClientEvent('chat:addSuggestion', '/311r', 'Job chat for reply', {
    { name="[ID]", help="Target ID" },
    { name="[MESSAGE]", help="Message to recipient" }
})

RegisterCommand("311r", function(source, args, rawCommand)
    local src = source
	local target = tonumber(args[1])
	local msg = rawCommand:sub(7)
    local Player = QBCore.Functions.GetPlayer(src)
	local job = Player.PlayerData.job.name
    if job == 'ambulance' or job == 'police' then
        if args[1] then
		    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if Player then
                local fname = Player.PlayerData.charinfo.firstname
                local lname = Player.PlayerData.charinfo.lastname
                local phone = Player.PlayerData.charinfo.phone
                if string.len(msg) > 0 then
                    TriggerClientEvent('chat:addMessage', target, {
                        template = '<div style="padding: 0.3vw;  margin: 0.2vw; background-color: rgba(190, 90, 15, 0.8); border-radius: 4px;"><i style="font-size:15px;color:grey"></i> <b><font color="#ffffff">311 | EMS | ({0}) -> {1} |{2} # {3} : <font color="white">{4}</font></div>',
                        args = { source, fname, lname, phone, msg }
                    })
                    TriggerClientEvent('chat:addMessage', source, {
                        template = '<div style="padding: 0.3vw;  margin: 0.2vw; background-color: rgba(190, 90, 15, 0.8); border-radius: 4px;"><i style="font-size:15px;color:grey"></i> <b><font color="#ffffff">311 | EMS | ({0}) -> {1} |{2} # {3} : <font color="white">{4}</font></div>',
                        args = { source, fname, lname, phone, msg }
                    })                  
                    discordLogs3(author, src, fname, lname, phone, msg)
                else
                    TriggerClientEvent('QBCore:Notify', source, "Message can't be empty!")
                end 
            else
                TriggerClientEvent('QBCore:Notify', source, "Player is not online!")
            end
        else
            TriggerClientEvent('QBCore:Notify', source, "Invalid ID!")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "You are not allowed to use this command!")
    end
end)   

RegisterServerEvent('qb-jobchat:server:police')
AddEventHandler('qb-jobchat:server:police', function(job, fname, lname, phone, msg)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fname = Player.PlayerData.charinfo.firstname
    local lname = Player.PlayerData.charinfo.lastname
    local phone = Player.PlayerData.charinfo.phone
    TriggerClientEvent('qb-jobchat:client:police', -1, src, fname, lname, phone, msg)
    discordLogs(author, fname, lname, phone, msg)
end)


RegisterServerEvent('qb-jobchat:server:ambulance')
AddEventHandler('qb-jobchat:server:ambulance', function(job, fname, lname, phone, msg)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fname = Player.PlayerData.charinfo.firstname
    local lname = Player.PlayerData.charinfo.lastname
    local phone = Player.PlayerData.charinfo.phone
    TriggerClientEvent('qb-jobchat:client:ambulance', -1, src, fname, lname, phone, msg)
    discordLogs2(author, fname, lname, phone, msg)
end)


function discordLogs(author, fname, lname, phone, msg)
    
    url = "https://discord.com/api/webhooks/1042887637276561449/Lc2qAhUzb4h_sQi5-Mbv-1Eb5LwZSgkaFuNk8aa6jQ8pKbBR1wjdOEsMInnBic5axUNE"

    local embeds = {
        {
            ["author"] = {
                ["name"] = "Los Santos Police Department",
                ["icon_url"] = "https://static.wikia.nocookie.net/gtawiki/images/7/7f/LSPD_logo_GTA_V.png/revision/latest?cb=20150425201508",
            },
            ["title"] = "Incoming 911 Call",
            ["description"] =  "Caller: "..fname.." "..lname.." | Phone#: "..phone.." | Transcript: "..msg,
            ["type"] = "rich", 
            ["color"] = 2507775, 
            ["footer"] = {
                ["text"] = "Timestamp: "..os.date("%x %X %p"), 
            },
        }
    }
    PerformHttpRequest(url, function (err, msg, headers) end, 'POST', json.encode({username = author, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function discordLogs2(author, fname, lname, phone, msg)
    
    url = "https://discord.com/api/webhooks/1042887637276561449/Lc2qAhUzb4h_sQi5-Mbv-1Eb5LwZSgkaFuNk8aa6jQ8pKbBR1wjdOEsMInnBic5axUNE"

    local embeds = {
        {
            ["author"] = {
                ["name"] = "Los Santos Police Department",
                ["icon_url"] = "https://static.wikia.nocookie.net/gtawiki/images/7/7f/LSPD_logo_GTA_V.png/revision/latest?cb=20150425201508",
            },
            ["title"] = "Incoming 311 Call",
            ["description"] =  "Caller: "..fname.." "..lname.." | Phone#: "..phone.." | Transcript: "..msg,
            ["type"] = "rich", 
            ["color"] = 16741926, 
            ["footer"] = {
                ["text"] = "Timestamp: "..os.date("%x %X %p"), 
            },
        }
    }
    PerformHttpRequest(url, function (err, msg, headers) end, 'POST', json.encode({username = author, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function discordLogs3(author, src, fname, lname, phone, msg)
    
    url = "https://discord.com/api/webhooks/1042887637276561449/Lc2qAhUzb4h_sQi5-Mbv-1Eb5LwZSgkaFuNk8aa6jQ8pKbBR1wjdOEsMInnBic5axUNE"

    local embeds = {
        {
            ["author"] = {
                ["name"] = "Los Santos Police Department",
                ["icon_url"] = "https://static.wikia.nocookie.net/gtawiki/images/7/7f/LSPD_logo_GTA_V.png/revision/latest?cb=20150425201508",
            },
            ["title"] = "Outgoing 911 Call",
            ["description"] =  "Dispatch: ("..src..") -> Caller: "..fname.." "..lname.. " | Phone#: "..phone.." | Transcript: "..msg,
            ["type"] = "rich", 
            ["color"] = 16723494, 
            ["footer"] = {
                ["text"] = "Timestamp: "..os.date("%x %X %p"), 
            },
        }
    }
    PerformHttpRequest(url, function (err, msg, headers) end, 'POST', json.encode({username = author, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function discordLogs4(author, src, fname, lname, phone, msg)
    
    url = "https://discord.com/api/webhooks/1042887637276561449/Lc2qAhUzb4h_sQi5-Mbv-1Eb5LwZSgkaFuNk8aa6jQ8pKbBR1wjdOEsMInnBic5axUNE"

    local embeds = {
        {
            ["author"] = {
                ["name"] = "Los Santos Police Department",
                ["icon_url"] = "https://static.wikia.nocookie.net/gtawiki/images/7/7f/LSPD_logo_GTA_V.png/revision/latest?cb=20150425201508",
            },
            ["title"] = "Outgoing 311 Call",
            ["description"] =  "Dispatch: ("..src..") -> Caller: "..fname.." "..lname.. " | Phone#: "..phone.." | Transcript: "..msg,
            ["type"] = "rich", 
            ["color"] = 16723494, 
            ["footer"] = {
                ["text"] = "Timestamp: "..os.date("%x %X %p"), 
            },
        }
    }
    PerformHttpRequest(url, function (err, msg, headers) end, 'POST', json.encode({username = author, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end


RegisterCommand("jobc", function(source, args, rawCommand)
    local src = source
	local msg = rawCommand:sub(6)
    local Player = QBCore.Functions.GetPlayer(src)
	local job = Player.PlayerData.job.name
    if job == 'police' then
        local fname = Player.PlayerData.charinfo.firstname
        local lname = Player.PlayerData.charinfo.lastname
        local phone = Player.PlayerData.charinfo.phone
        if string.len(msg) > 0 then
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.3vw;  margin: 0.2vw; background-color: rgba(0, 0, 132, 1.00); border-radius: 4px;"><i style="font-size:15px;color:grey"></i> <b><font color="#ffffff">911 | Los Santos Police Department | -> <font color="white">{0}</font></div>',
                args = { msg }
            })
            discordLogs3(author, src, fname, lname, phone, msg)
        else
            TriggerClientEvent('QBCore:Notify', source, "Message can't be empty!")
        end 
    elseif job == 'ambulance' then
        local fname = Player.PlayerData.charinfo.firstname
        local lname = Player.PlayerData.charinfo.lastname
        local phone = Player.PlayerData.charinfo.phone
        if string.len(msg) > 0 then
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.3vw;  margin: 0.2vw; background-color: rgba(255, 0, 0, 1.00); border-radius: 4px;"><i style="font-size:15px;color:grey"></i> <b><font color="#ffffff">911 | Los Santos Emergency Service | -> <font color="white">{0}</font></div>',
                args = { msg }
            })
            discordLogs3(author, src, fname, lname, phone, msg)
        else
            TriggerClientEvent('QBCore:Notify', source, "Message can't be empty!")
        end 
    elseif job == 'tuner' then
        local fname = Player.PlayerData.charinfo.firstname
        local lname = Player.PlayerData.charinfo.lastname
        local phone = Player.PlayerData.charinfo.phone
        if string.len(msg) > 0 then
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.3vw;  margin: 0.2vw; background-color: rgba(0, 191, 0, 1.00); border-radius: 4px;"><i style="font-size:15px;color:grey"></i> <b><font color="#ffffff">311 | Los Santos Mechanic Service | -> <font color="white">{0}</font></div>',
                args = { msg }
            })
            discordLogs3(author, src, fname, lname, phone, msg)
        else
            TriggerClientEvent('QBCore:Notify', source, "Message can't be empty!")
        end
    elseif job == 'uwu' then
        local fname = Player.PlayerData.charinfo.firstname
        local lname = Player.PlayerData.charinfo.lastname
        local phone = Player.PlayerData.charinfo.phone
        if string.len(msg) > 0 then
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.3vw;  margin: 0.2vw; background-color: rgba(255, 170, 255, 1.00); border-radius: 4px;"><i style="font-size:15px;color:grey"></i> <b><font color="#ffffff">🧁 | UwU CAT CAFE | -> <font color="white">{0}</font></div>',
                args = { msg }
            })
            discordLogs3(author, src, fname, lname, phone, msg)
        else
            TriggerClientEvent('QBCore:Notify', source, "Message can't be empty!")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "You are not allowed to use this command!")
    end
end)