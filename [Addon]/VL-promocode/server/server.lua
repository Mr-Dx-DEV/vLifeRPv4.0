local QBCore = exports['qb-core']:GetCoreObject()

local function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

local function GiveVehicle(pData, vehicle, garage)
    local cid = pData.PlayerData.citizenid
    local plate = GeneratePlate()
    MySQL.Async.insert("INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage, in_garage, garage_id, garage_type, property, impound) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", {
        pData.PlayerData.license,
        cid,
        vehicle,
        GetHashKey(vehicle),
        '{}',
        plate,
        1,
        "pillboxgarage",
        1,
        "3210 - Legion",
        'car',
        0,
        0,
    })
end

QBCore.Commands.Add(Config.Redeem_Code_Command, "Redeem a promo code", { {name = 'code', help = 'For example: codegen:wlq129tsd866ofp193lcc683'} }, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)

    MySQL.Async.fetchAll('SELECT * FROM promocodes WHERE code = ?', {args[1]}, function(result)
        if result[1] then
            local redeemedplayers = result[1].redeemed_players

            if redeemedplayers == nil then
                redeemedplayers = {}
            else
                redeemedplayers = json.decode(result[1].redeemed_players)
            end

            local hasalreadyredeemed = false

            for k,v in pairs(redeemedplayers) do
                if Player.PlayerData.citizenid == v.cid then
                        hasalreadyredeemed = true
                end
            end

            if not hasalreadyredeemed then
                TriggerClientEvent("VL-promocodes:client:opengarageselector", source, result[1], args[1])
            else
                TriggerClientEvent("QBCore:Notify", src, "You have already redeemed this code...", "error", 6000)
            end
        else
            TriggerClientEvent("QBCore:Notify", src, "There is no such code!", "error", 3000)
        end
    end)
end)

RegisterNetEvent('VL-promocodes:server:redeemvehicle', function(args)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    print(args.result.uses)
    if args.result.uses >= 1 then
        local redeemedplayers = args.result.redeemed_players

        if redeemedplayers == nil then
            redeemedplayers = {}
        else
            redeemedplayers = json.decode(args.result.redeemed_players)
        end
        print(redeemedplayers)

        local hasalreadyredeemed = false

        for k,v in pairs(redeemedplayers) do
            if Player.PlayerData.citizenid == v.cid then
                hasalreadyredeemed = true
            end
        end

        if not hasalreadyredeemed then

            table.insert(redeemedplayers, {
                cid = Player.PlayerData.citizenid
            })
            print(cid)

            MySQL.Async.execute('UPDATE promocodes SET redeemed_players = ? WHERE code = ?', {json.encode(redeemedplayers), args.args})

            TriggerClientEvent("QBCore:Notify", src, "Succesfully redeemed "..args.result.amount.."x "..QBCore.Shared.Vehicles[args.result.item]['name'], "success", 6000)
            for count = 1, args.result.amount do
                GiveVehicle(Player, args.result.item, args.selectedgarage.selectedgarage)
            end

            if args.result.uses == 1 then
                MySQL.Async.execute('DELETE FROM promocodes WHERE code = ?', {args.args})
            else
                MySQL.Async.execute('UPDATE promocodes SET uses = ? WHERE code = ?', {(args.result.uses - 1), args.args})
            end

            sendToDiscord(16753920, "NukeXD Promo Codes | Code redeemed", Player.PlayerData.name.." redeemed "..args.result.amount.."x "..QBCore.Shared.Vehicles[args.result.item]['name'].." | There are "..(args.result.uses - 1).." uses left\n\n**Code:** "..args.args.."\n**Name:** "..Player.PlayerData.name.."\n**Character Name:** "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**License:** "..Player.PlayerData.license.."\n**Citizenid:** "..Player.PlayerData.citizenid.."\n**Ingame ID:** "..Player.PlayerData.cid, "Made by NukeXD", "redeemed")
        else
            TriggerClientEvent("QBCore:Notify", src, "You have already redeemed this code...", "error", 6000)
        end
    end
end)

function sendToDiscord(color, name, message, footer, type)
    local embed = {
            {
                ["color"] = color,
                ["title"] = "**".. name .."**",
                ["description"] = message,
                ["footer"] = {
                ["text"] = footer
            }
        }
    }
  
    if type == "created" then
        PerformHttpRequest(Config['Webhooks']['Created_Code'], function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
    elseif type == "redeemed" then
        PerformHttpRequest(Config['Webhooks']['Redeemed_Code'], function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
    end
end
