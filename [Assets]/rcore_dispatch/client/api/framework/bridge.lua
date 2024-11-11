FRAMEWORK = {}

CreateThread(function()
    dbg.info('Loading framework bridge...')
    local function loadESX()
        ESX = exports['es_extended']:getSharedObject()
        FRAMEWORK.GetPlayerName = function()
            return ESX.GetPlayerData().firstName or ''
        end
        FRAMEWORK.GetPlayerLastname = function()
            return ESX.GetPlayerData().lastName or ''
        end
        FRAMEWORK.GetPlayerJob = function()
            if ESX.GetPlayerData().job == nil then
                return nil
            end
            return ESX.GetPlayerData().job.name
        end
        FRAMEWORK.GetPlayerJobGrade = function()
            return ESX.GetPlayerData().job.grade
        end
        RegisterNetEvent('esx:onPlayerLogout') -- When a player logs out (multicharacter), reset their data
        AddEventHandler('esx:onPlayerLogout', function()
            TriggerServerEvent('rcore_dispatch:server:removePlayer')
        end)
        FRAMEWORK.HasItem = function(item)
            local hasItem = ESX.SearchInventory(item, 1)
            if hasItem >= 1 then
                return true
            else
                return false
            end
        end
    end

    local function loadQBCORE()
        QBCore = exports['qb-core']:GetCoreObject()

        FRAMEWORK.GetPlayerName = function()
            local Player = QBCore.Functions.GetPlayerData()
            return Player.charinfo.firstname
        end

        FRAMEWORK.GetPlayerLastname = function()
            local Player = QBCore.Functions.GetPlayerData()
            return Player.charinfo.lastname
        end

        FRAMEWORK.GetPlayerJob = function()
            local Player = QBCore.Functions.GetPlayerData()
            if not Player.job.onduty then
                return Player.job.name .. '_offduty'
            end
            return Player.job.name
        end

        FRAMEWORK.GetPlayerJobGrade = function()
            local Player = QBCore.Functions.GetPlayerData()
            return Player.job.grade.level
        end

        FRAMEWORK.HasItem = function(item)
            local has_item = QBCore.Functions.HasItem(item)
            return has_item
        end

        RegisterNetEvent('QBCore:Client:OnPlayerUnload') -- When a player logs out (multicharacter), reset their data
        AddEventHandler('QBCore:Client:OnPlayerUnload', function()
            TriggerServerEvent('rcore_dispatch:server:removePlayer')
        end)

        RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
            TriggerServerEvent('rcore_dispatch:server:setJob')
        end)

        RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
            TriggerServerEvent('rcore_dispatch:server:loadClient')
        end)
    end

    local function loadCustom()
        -- Your code here
    end

    if CONFIG.Framework == Framework.ESX then
        if not pcall(loadESX) then
            dbg.error('Failed to load ESX, attempting to load QBCore')
            if not pcall(loadQBCORE) then
                dbg.error('Failed to load QBCore')
            else
                dbg.success('Loaded QBCore')
            end
        end
    elseif CONFIG.Framework == Framework.QBCore then
        if not pcall(loadQBCORE) then
            dbg.error('Failed to load QBCore, attempting to load ESX')
            if not pcall(loadESX) then
                dbg.error('Failed to load ESX')
            else
                dbg.success('Loaded ESX')
            end
        end
    elseif CONFIG.Framework == Framework.Custom then
        loadCustom()
    end
end)
