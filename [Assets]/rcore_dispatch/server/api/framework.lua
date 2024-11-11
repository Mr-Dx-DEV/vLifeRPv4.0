GetPlayerFromId = nil

local function loadESX()
    ESX = exports['es_extended']:getSharedObject()
    if not ESX then return dbg.error('[rcore_dispatch] [error] Are you sure that you are using ESX?') end
    GetPlayerFromId = function(source)
        if not source then return nil end
        dbg.info('GetPlayerFromId: ' .. source)
        local xPlayer = {}
        local xplayer = ESX.GetPlayerFromId(source)
        xPlayer.addMoney = function(money)
            return xplayer.addMoney(money)
        end
        xPlayer.removeMoney = function(money)
            return xplayer.removeMoney(money)
        end
        xPlayer.getMoney = function(money)
            if not xplayer then
                dbg.error('xplayer is nil')
                return nil
            end
            return xplayer.getMoney()
        end
        xPlayer.getRank = function()
            if not xplayer then
                dbg.error('xplayer is nil')
                return nil
            end
            local jobData = xplayer.getJob()
            return jobData.grade, jobData.grade_label
        end
        xPlayer.getJob = function()
            if not xplayer then
                dbg.error('xplayer is nil')
                return nil
            end
            local jobData = xplayer.getJob()
            return jobData.name, jobData.label
        end
        xPlayer.getSurname = function()
            if not xplayer then
                dbg.error('xplayer is nil')
                return nil
            end
            local surname = xplayer.get('lastName')
            if not surname then
                dbg.error('surname is nil')
                return ''
            end
            return surname
        end
        xPlayer.HasItem = function(item)
            if not xplayer then
                dbg.error('xplayer is nil')
                return nil
            end
            local itemData = xplayer.getInventoryItem(item)
            if itemData then
                if itemData.count >= 1 then
                    return itemData.count
                end
            end
            return false
        end
        return xPlayer
    end
    --- Event that loads the player into the dispatch
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
        local job = xPlayer.getJob().name
        if not xPlayer.source then return dbg.critical('No source detected in player with id ' .. playerId) end
        if not job then return dbg.critical('No job detected in player with id ' .. xPlayer.source) end
        if CONFIG.JOBS[job] then
            LoadPlayer(xPlayer.source, job)
        end
    end)
    RegisterNetEvent('esx:setJob') -- The stored data does not sync with the framework unless we tell it to
    AddEventHandler('esx:setJob', function(playerId, job)
        if not playerId then return end
        if job then
            if CONFIG.JOBS[job.name] then
                LoadPlayer(tonumber(playerId), job.name)
            else
                UnloadPlayer(tonumber(playerId), job.name)
            end
        end
    end)
end

local function loadQBCORE()
    QBCore = exports['qb-core']:GetCoreObject()
    if not QBCore then return dbg.error('[rcore_dispatch] [error] Are you sure that you are using QBCore?') end
    GetPlayerFromId = function(source)
        local xPlayer = {}
        local qbPlayer = QBCore.Functions.GetPlayer(tonumber(source))
        local attempts = 0
        while qbPlayer == nil and attempts < 10 do
            Wait(5)
            attempts = attempts + 1
            qbPlayer = QBCore.Functions.GetPlayer(tonumber(source))
        end
        ---------
        xPlayer.identifier = qbPlayer.PlayerData.citizenid
        ---------
        xPlayer.license = qbPlayer.PlayerData.license
        ---------
        xPlayer.job = {
            name = qbPlayer.PlayerData.job.name,
            label = qbPlayer.PlayerData.job.label,
            grade = {
                name = qbPlayer.PlayerData.job.grade.name or 'none',
                level = qbPlayer.PlayerData.job.grade.level or -1,
            },
        }
        xPlayer.getRank = function()
            if not qbPlayer then
                return nil
            end
            return xPlayer.job.grade.level, xPlayer.job.grade.name
        end
        xPlayer.HasItem = function(item)
            if not qbPlayer then
                return nil
            end
            local hasItem = false
            if qbPlayer.Functions.GetItemByName(item) then
                hasItem = true
            end
            return hasItem
        end
        xPlayer.getJob = function()
            if not qbPlayer then
                return nil
            end
            if not qbPlayer.PlayerData.job.onduty then
                return xPlayer.job.name .. '_offduty'
            end
            return xPlayer.job.name
        end
        xPlayer.getSurname = function()
            if not qbPlayer then
                return nil
            end
            local surname = qbPlayer.PlayerData.charinfo.lastname
            return surname
        end
        return xPlayer
    end
    RegisterNetEvent('QBCore:ToggleDuty', function()
        local src = source
        CreateThread(function()
            Wait(1500)
            local Player = QBCore.Functions.GetPlayer(src)
            if not Player then return end
            if Player.PlayerData.job.onduty then
                local job = Player.PlayerData.job
                if CONFIG.JOBS[job.name] then
                    LoadPlayer(src, job.name)
                else
                    UnloadPlayer(src, job.name)
                end
            else
                UnloadPlayer(src, Player.PlayerData.job.name .. '_offduty')
            end
        end)
    end)
    RegisterNetEvent('rcore_dispatch:server:setJob') -- The stored data does not sync with the framework unless we tell it to
    AddEventHandler('rcore_dispatch:server:setJob', function()
        local playerId = source
        CreateThread(function()
            Wait(1500)
            local player = QBCore.Functions.GetPlayer(playerId)
            local job = player.PlayerData.job
            local name = job.name
            if not job.onduty then
                name = job.name .. '_offduty'
            end
            if job then
                if CONFIG.JOBS[name] then
                    LoadPlayer(playerId, name)
                else
                    UnloadPlayer(playerId, name)
                end
            end
        end)
    end)
    RegisterNetEvent('rcore_dispatch:server:loadClient')
    AddEventHandler('rcore_dispatch:server:loadClient', function()
        local playerId = source
        local player = QBCore.Functions.GetPlayer(playerId)
        local job = player.PlayerData.job
        local name = job.name
        if not job.onduty then
            name = job.name .. '_offduty'
        end
        if not job then return dbg.critical('No job detected in player with id ' .. source) end
        if CONFIG.JOBS[name] then
            LoadPlayer(source, name)
        end
    end)
end

local function loadCustom()
    -- Your code here
end

if CONFIG.Framework == Framework.ESX then
    if not pcall(loadESX) then
        dbg.danger('ESX could not be loaded, trying QBCORE')
        if not pcall(loadQBCORE) then
            dbg.danger('QBCORE could not be loaded')
        else
            dbg.success('QBCORE loaded')
        end
    end
elseif CONFIG.Framework == Framework.QBCore then
    if not pcall(loadQBCORE) then
        dbg.danger('QBCORE could not be loaded, trying ESX')
        if not pcall(loadESX) then
            dbg.danger('ESX could not be loaded')
        else
            dbg.success('ESX loaded')
        end
    end
elseif CONFIG.Framework == Framework.Custom then
    loadCustom()
end
