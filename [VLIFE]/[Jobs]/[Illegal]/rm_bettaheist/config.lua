Config = {}

Config['BettaHeist'] = {
    ['framework'] = {
        name = 'QB', -- Only ESX or QB.
        scriptName = 'qb-core', -- Only for QB users.
        eventName = 'esx:getSharedObject', -- Only for ESX users.
        targetScript = 'qb-target' -- Target script name (qtarget or qb-target)
    },
    ['setjobForPolice'] = 'police', -- Setjob for check police count and police alert.
    ['requiredPoliceCount'] = 1, -- Required police count for start heist.
    ['nextRob'] = 10, -- Seconds for next heist
    ['startHeist'] ={ -- Heist start coords
        pos = vector3(-1419.7, -676.23, 26.7605),
        peds = {
            {pos = vector3(-1419.7, -676.23, 26.7605), heading = 78.4, ped = 's_m_m_highsec_01'},
            {pos = vector3(-1420.3, -675.34, 26.7246), heading = 168.78, ped = 's_m_m_highsec_02'},
            {pos = vector3(-1420.5, -676.88, 26.7605), heading = 356.42, ped = 's_m_m_fiboffice_02'}
        }
    },
    ['requiredItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names.
        'bag',
        'drill',
        'big_drill',
        'thermite',
        'bolt_cutter'
    },
    ['rewardItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names. You can add more items for lockboxes.
        {itemName = 'gold', count = 1, sellPrice = 1000}, -- For lockboxes.
        {itemName = 'diamond', count = 1, sellPrice = 1000}, -- For lockboxes.
    },
    ['rewardMoneys'] = {
        ['stacks'] = function()
            return math.random(50000, 100000) -- Per grab in stacks.
        end,
    },
    ['rewardLockbox'] = function()
        local random = math.random(#Config['BettaHeist']['rewardItems'])
        local lockboxBag = {
            item = Config['BettaHeist']['rewardItems'][random]['itemName'],
            count = math.random(1, 5), -- For lockbox reward items count
        }
        return lockboxBag
    end,
    ['drillTime'] = 30, --Seconds for second door big drill wait time
    ['moneyItem'] = { -- If your server have money item, you can set it here.
        status = false,
        itemName = 'cash'
    },
    ['black_money'] = {  -- If change true, all moneys will convert to black. QBCore players can change itemName.
        status = false,
        itemName = 'black_money'
    },
    ['finishHeist'] = { -- Heist finish coords.
        buyerPos = vector3(1104.28, -2287.5, 29.1784)
    },
}

Config['BettaSetup'] = {
    ['main'] = vector3(-1220.7, -341.21, 37.7323),
    ['trollys'] = {
        {coords = vector3(-1221.6, -343.99, 36.7322), heading = 343.0, type = 'diamond'},
        {coords = vector3(-1219.5, -342.73, 36.7322), heading = 118.0, type = 'gold'},
    },
    ['actions'] = {
        ['lockbox_1']      =  {coords  = vector3(-1220.7, -341.21, 37.7323), heading = 27.0, length = 1.8,  width = 0.5, debugPoly = false, minZ = 37.2160, maxZ = 38.960, options = {{type = "client", event = "bettaheist:client:actions", icon = "fa-solid fa-hand", label = "Drill lockbox", scene = 'lockbox_1',      job = "all", canInteract = function() return not HeistSync['lockbox_1'] end}},     distance = 1.5},
        ['lockbox_2']      =  {coords  = vector3(-1222.3, -341.22, 37.7403), heading = 117.0, length = 1.8, width = 0.5, debugPoly = false, minZ = 37.2160, maxZ = 38.960, options = {{type = "client", event = "bettaheist:client:actions", icon = "fa-solid fa-hand", label = "Drill lockbox", scene = 'lockbox_2',      job = "all", canInteract = function() return not HeistSync['lockbox_2'] end}},     distance = 1.5},
        ['trolly_1']       =  {coords  = vector3(-1221.6, -343.99, 36.7322), heading = 77.0, length = 1.0,  width = 0.5, debugPoly = false, minZ = 37.2160, maxZ = 38.960, options = {{type = "client", event = "bettaheist:client:actions", icon = "fa-solid fa-hand", label = "Grab trolly",   scene = 'trolly_1',       job = "all", canInteract = function() return not HeistSync['trolly_1'] end}},      distance = 1.5},
        ['trolly_2']       =  {coords  = vector3(-1219.5, -342.73, 36.7322), heading = 27.0, length = 1.0,  width = 0.5, debugPoly = false, minZ = 37.2160, maxZ = 38.960, options = {{type = "client", event = "bettaheist:client:actions", icon = "fa-solid fa-hand", label = "Grab trolly",   scene = 'trolly_2',       job = "all", canInteract = function() return not HeistSync['trolly_2'] end}},      distance = 1.5},
        ['stack']          =  {coords  = vector3(-1218.7, -345.93, 37.7322), heading = 27.0, length = 1.0,  width = 1.0, debugPoly = false, minZ = 37.5160, maxZ = 37.960, options = {{type = "client", event = "bettaheist:client:actions", icon = "fa-solid fa-hand", label = "Grab stack",    scene = 'stack',          job = "all", canInteract = function() return not HeistSync['stack'] end}},         distance = 1.5},
        ['bolt_cutter']    =  {coords  = vector3(-1220.2, -343.99, 37.7322), heading = 27.0, length = 0.2,  width = 0.2, debugPoly = false, minZ = 37.5160, maxZ = 38.160, options = {{type = "client", event = "bettaheist:client:actions", icon = "fa-solid fa-hand", label = "Cut lock",      scene = 'bolt_cutter',    job = "all", canInteract = function() return not HeistSync['bolt_cutter'] end}},   distance = 1.5},
        ['vault_drill']    =  {coords  = vector3(-1223.7, -343.42, 37.7322), heading = 27.0, length = 1.5,  width = 1.0, debugPoly = false, minZ = 36.5160, maxZ = 38.960, options = {{type = "client", event = "bettaheist:client:actions", icon = "fa-solid fa-hand", label = "Place drill",   scene = 'vault_drill',    job = "all", canInteract = function() return not HeistSync['vault_drill'] end}},   distance = 1.5},
        ['enter_thermite'] =  {coords  = vector3(-1230.1, -337.27, 37.6160), heading = 27.0, length = 0.5,  width = 2.0, debugPoly = false, minZ = 36.5160, maxZ = 38.960, options = {{type = "client", event = "bettaheist:client:actions", icon = "fa-solid fa-hand", label = "Plant thermite",scene = 'enter_thermite', job = "all", canInteract = function() return not HeistSync['enter_thermite'] end}},distance = 1.5},
    }
}

Strings = {
    ['betta_blip'] = 'Betta Bank',
    ['heist_info'] = 'Go to the location marked on the GPS.',
    ['heist_info2'] = 'Required things for heist: A lots of bag, drills, thermite and bolt cutter.',
    ['drill_bar'] = 'DRILLING',
    ['wait_nextrob'] = 'You have to wait this long to undress again',
    ['minute'] = 'minute.',
    ['need_this'] = 'You need this: ',
    ['need_police'] = 'Not enough police in the city.',
    ['total_money'] = 'You got this: ',
    ['police_alert'] = 'Betta bank robbery alert! Check your gps.',
    ['not_cop'] = 'You are not cop!',
    ['buyer_blip'] = 'Buyer',
    ['deliver_to_buyer'] = 'Deliver the loot to the buyer. Check gps.',

    ['t_heist'] = 'Betta Bank Heist'
}