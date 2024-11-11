local statsInited = false

local function setupStats()
    if not CONFIG.RCoreStatsIntegration then return end

    if not statsInited then
        statsInited = true

        TriggerEvent('rcore_stats:api:ensureCategory', 'crime', 'Crime', function()
            TriggerEvent('rcore_stats:api:ensureStatType', 'rcore_dispatch_stolen_cars', 'Dispatch - Stolen Cars',
                'player', nil,
                'crime', true, nil, function()
                    TriggerEvent('rcore_stats:api:ensureAchievement', 'rcore_dispatch_stolen_cars_1', 'Grand Theft Auto',
                        'Steal your first vehicle', 'car', 'rcore_dispatch_stolen_cars', 1)
                    TriggerEvent('rcore_stats:api:ensureAchievement', 'rcore_dispatch_stolen_cars_10', 'Hot Wheels',
                        'Steal 10 vehicles', 'car', 'rcore_dispatch_stolen_cars', 10)
                    TriggerEvent('rcore_stats:api:ensureAchievement', 'rcore_dispatch_stolen_cars_30',
                        'Stolen car collector',
                        'Steal 30 vehicles', 'car', 'rcore_dispatch_stolen_cars', 30)
                end)

            TriggerEvent('rcore_stats:api:ensureStatType', 'rcore_dispatch_total_stolen_cars',
                'Dispatch - Total Stolen Cars', 'server', nil, 'crime', true, 'rcore_dispatch_stolen_cars', nil)

            TriggerEvent('rcore_stats:api:ensureStatType', 'rcore_dispatch_bank_robberies', 'Dispatch - Bank Robberies',
                'player', nil,
                'crime', true, nil, function()
                    TriggerEvent('rcore_stats:api:ensureAchievement', 'rcore_dispatch_bank_robberies_1',
                        'Payday',
                        'Rob your first bank!', 'landmark', 'rcore_dispatch_bank_robberies', 1)
                    TriggerEvent('rcore_stats:api:ensureAchievement', 'rcore_dispatch_bank_robberies_5',
                        "Robbin' Hood",
                        'Rob 5 banks', 'landmark', 'rcore_dispatch_bank_robberies', 5)
                    TriggerEvent('rcore_stats:api:ensureAchievement', 'rcore_dispatch_bank_robberies_10',
                        'Bonnie and Clyde',
                        'Rob 10 banks', 'landmark', 'rcore_dispatch_bank_robberies', 10)
                end)

            TriggerEvent('rcore_stats:api:ensureStatType', 'rcore_dispatch_total_bank_robberies',
                'Dispatch - Total Bank Robberies', 'server', nil, 'crime', true, 'rcore_dispatch_bank_robberies', nil)

            TriggerEvent('rcore_stats:api:ensureStatType', 'rcore_dispatch_shop_robberies', 'Dispatch - Shop Robberies',
                'player', nil,
                'crime', true, nil, function()
                    TriggerEvent('rcore_stats:api:ensureAchievement', 'rcore_dispatch_shop_robberies_1',
                        'Sticky Fingers',
                        'Rob your first shop!', 'landmark', 'rcore_dispatch_shop_robberies', 1)
                    TriggerEvent('rcore_stats:api:ensureAchievement', 'rcore_dispatch_shop_robberies_5',
                        '100% Discount',
                        'Rob 5 shops', 'landmark', 'rcore_dispatch_shop_robberies', 5)
                    TriggerEvent('rcore_stats:api:ensureAchievement', 'rcore_dispatch_shop_robberies_10',
                        'Bargain Bandit',
                        'Rob 10 shops', 'landmark', 'rcore_dispatch_shop_robberies', 10)
                end)

            TriggerEvent('rcore_stats:api:ensureStatType', 'rcore_dispatch_total_shop_robberies',
                'Dispatch - Total Shop Robberies', 'server', nil, 'crime', true, 'rcore_dispatch_shop_robberies', nil)
        end)
    end
end

AddEventHandler('rcore_stats:api:ready', setupStats)

CreateThread(function()
    if not CONFIG.RCoreStatsIntegration then return end

    if GetResourceState('rcore_stats') == 'started' or GetResourceState('rcore_stats') == 'starting' then
        while not statsInited do
            TriggerEvent('rcore_stats:api:isReady', function(isReady)
                if isReady then
                    setupStats()
                end
            end)
            Wait(1000)
        end
    end
end)
