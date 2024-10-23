---@diagnostic disable: duplicate-set-field
local ESX = exports["es_extended"]:getSharedObject()
IsPlayerLoaded = false
PlayerData = {}


Functions = {}

function Functions.OnPlayerLoaded()
    IsPlayerLoaded = true
    exports.ox_inventory:displayMetadata({
        motel_label = "Motel",
        room_label = "Room",
    })
    TriggerEvent("lazy-motel:client:getConfig")
    local insideMotel = lib.callback.await("lazy-motel:server:esx_playerloaded", false)
    if insideMotel then
        local motel, room = insideMotel.motel, insideMotel.room
        if IsKeyHolders(motel, room) then
            EnterMotel(motel, room)
        else
            KickPerson(motel, room)
        end
    end
end

function Functions.OnPlayerDropped()
    IsPlayerLoaded = false
    if SpawnedShell then
        DespawnShell(SpawnedShell, function()
            ResetInside()
        end)
    end
end

function Functions.GetJob()
    return {
        name = PlayerData.job.name,
        grade = PlayerData.job.grade,
    }
end

function Functions.GetName()
    return string.format("%s %s", PlayerData.firstName, PlayerData.lastName)
end

function Functions.GetLicense()
    return PlayerData.identifier
end

function Functions.GetIdentifier()
    return PlayerData.identifier
end

AddEventHandler('onResourceStart', function(resource)
    if resource ~= cache.resource then return end
    IsPlayerLoaded = ESX.IsPlayerLoaded()
    if IsPlayerLoaded then
        PlayerData = ESX.GetPlayerData()
    end
    if GetResourceState("ox_inventory"):match("start") then
        exports.ox_inventory:displayMetadata({
            motel_label = "Motel",
            room_label = "Room",
        })
    end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
    PlayerData = xPlayer
    IsPlayerLoaded = true
    Wait(100)
    Functions:OnPlayerLoaded()
end)

RegisterNetEvent("esx:onPlayerLogout")
AddEventHandler("esx:onPlayerLogout", function()
    table.wipe(PlayerData)
    Wait(500)
    Functions:OnPlayerDropped()
end)
