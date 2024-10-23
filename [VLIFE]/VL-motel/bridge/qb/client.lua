---@diagnostic disable: duplicate-set-field
local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}
IsPlayerLoaded = false


AddEventHandler('onResourceStart', function(resource)
    if resource ~= cache.resource then return end
    if LocalPlayer.state.isLoggedIn then
        PlayerData = QBCore.Functions.GetPlayerData()
        IsPlayerLoaded = true
    end
    if GetResourceState("ox_inventory"):match("start") then
        exports.ox_inventory:displayMetadata({
            motel_label = "Motel",
            room_label = "Room",
        })
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Functions.OnPlayerLoaded()
    PlayerData = QBCore.Functions.GetPlayerData()
    IsPlayerLoaded = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    Functions.OnPlayerDropped()
    IsPlayerLoaded = false
    table.wipe(PlayerData)
end)

RegisterNetEvent("QBCore:Player:SetPlayerData", function(val)
    PlayerData = val
end)

Functions = {}

function Functions.GetName()
    local data = PlayerData.charinfo
    return ("%s %s"):format(data.firstname, data.lastname)
end

function Functions.GetLicense()
    return PlayerData.license
end

function Functions.GetIdentifier()
    return PlayerData.citizenid
end

function Functions.GetJob()
    return {
        name = PlayerData.job.name,
        grade = PlayerData.job.grade.level,
        isboss = PlayerData.job.isboss,
    }
end

function Functions.OnPlayerLoaded()
    if GetResourceState("ox_inventory"):match("start") then
        exports.ox_inventory:displayMetadata({
            motel_label = "Motel",
            room_label = "Room",
        })
    end
    TriggerEvent("lazy-motel:client:getConfig")
end

function Functions.OnPlayerDropped()
    if SpawnedShell then
        DespawnShell(SpawnedShell, function()
            ResetInside()
        end)
    end
end

RegisterNetEvent("apartments:client:setupSpawnUI", function(cData, isnew)
    if not Config.ReplaceApartment then
        return
    end
    if not isnew then
        TriggerEvent("qb-spawn:client:setupSpawns", cData, false, nil)
    else
        local translated = {}
        local count = 0
        for k, v in pairs(Config.Motel) do
            if v.type == "shell" then
                translated[k] = {
                    label = v.label,
                    name = k,
                    coords = v.rent.coords,
                }
                count = count + 1
            end
        end
        if count >= 1 then
            TriggerEvent("qb-spawn:client:setupSpawns", cData, true, translated)
        else
            TriggerEvent("qb-spawn:client:setupSpawns", cData, false, nil)
        end
    end
    TriggerEvent("qb-spawn:client:openUI", true)
end)
