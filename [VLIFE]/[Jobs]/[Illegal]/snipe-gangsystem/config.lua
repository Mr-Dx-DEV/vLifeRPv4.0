Config = {}

Config.Core = "QBCore"
Config.OldQBCore = false
Config.CoreFolderName = "qb-core" 

Config.Target = "qb-target"

-- ██ ████████ ███████ ███    ███ ███████      █████  ███    ██ ██████       ██████   █████  ███    ██  ██████  ███████ 
-- ██    ██    ██      ████  ████ ██          ██   ██ ████   ██ ██   ██     ██       ██   ██ ████   ██ ██       ██      
-- ██    ██    █████   ██ ████ ██ ███████     ███████ ██ ██  ██ ██   ██     ██   ███ ███████ ██ ██  ██ ██   ███ ███████ 
-- ██    ██    ██      ██  ██  ██      ██     ██   ██ ██  ██ ██ ██   ██     ██    ██ ██   ██ ██  ██ ██ ██    ██      ██ 
-- ██    ██    ███████ ██      ██ ███████     ██   ██ ██   ████ ██████       ██████  ██   ██ ██   ████  ██████  ███████

Config.FirstFlagProp = "tr_prop_tr_flag_01a" -- first flag prop for each gang (these will not be targetable or anything)

-- Please follow the comments while creating new gangs. Also make sure to add the items and prop name properly while doing it.

Config.GangFlags = {
    ["rbit"] = { -- gang name (should be in qb-core/shared/gangs.lua)
        Item = "rbit_flag", -- item to give to player
        FirstItem = "rbit_first_flag", --  item to give to player to place the first flag
        Prop = "rbit_flag", -- prop to spawn
        blipColor = 1, -- blip color
        ped = {"g_m_y_ballasout_01", "g_m_y_ballaeast_01"}, -- ped to spawn
        url = "https://i.ibb.co.com/gdYR1Fy/5-KI1-MIX-R2qbbh-PVm4ad1-A-processed.png" -- image that will be visible on the tablet
    },
   
    
    ["tokyomanji"] = {
        Item = "tokyomanji_flag",
        FirstItem = "tokyomanji_first_flag", -- item to give to player to place the first flag
        Prop = "tokyomanji_flag",
        blipColor = 38, -- blip color
        ped = {"g_m_y_lost_01", "g_m_y_lost_02"},
        url = "https://media.discordapp.net/attachments/1103650225844928573/1279405996695093312/tokyomanji.png?ex=66d4532f&is=66d301af&hm=3a7a96b08a9a951e32c284a66633fb05dad949519a50d1442d87c30b4a7c4a23&=&format=webp&quality=lossless"
    },
    ["thehightable"] = {
        Item = "lthehightable_flag",
        FirstItem = "thehightable_first_flag", -- item to give to player to place the first flag
        Prop = "thehightable_flag",
        blipColor = 55, -- blip color
        ped = {"g_m_y_lost_01", "g_m_y_lost_02"},
        url = "https://media.discordapp.net/attachments/1103650225844928573/1279405997839880316/thehightable.jpg?ex=66d45330&is=66d301b0&hm=7c6871df2c857ea50ca6ec1711f784a58ed530f792a8686c2bfd7c89d9172936&=&format=webp&width=560&height=560"
    },
    ["outcast"] = {
        Item = "loutcast_flag",
        FirstItem = "outcast_first_flag", -- item to give to player to place the first flag
        Prop = "outcast_flag",
        blipColor = 55, -- blip color
        ped = {"g_m_y_lost_01", "g_m_y_lost_02"},
        url = "https://media.discordapp.net/attachments/1103650225844928573/1279405997839880316/outcast.jpg?ex=66d45330&is=66d301b0&hm=7c6871df2c857ea50ca6ec1711f784a58ed530f792a8686c2bfd7c89d9172936&=&format=webp&width=560&height=560"
    },
    ["thefamily"] = {
        Item = "lthefamily_flag",
        FirstItem = "thefamily_first_flag", -- item to give to player to place the first flag
        Prop = "thefamily_flag",
        blipColor = 55, -- blip color
        ped = {"g_m_y_lost_01", "g_m_y_lost_02"},
        url = "https://media.discordapp.net/attachments/1103650225844928573/1279405997839880316/thefamily.jpg?ex=66d45330&is=66d301b0&hm=7c6871df2c857ea50ca6ec1711f784a58ed530f792a8686c2bfd7c89d9172936&=&format=webp&width=560&height=560"
    },
    ["theorder"] = {
        Item = "ltheorder_flag",
        FirstItem = "theorder_first_flag", -- item to give to player to place the first flag
        Prop = "theorder_flag",
        blipColor = 55, -- blip color
        ped = {"g_m_y_lost_01", "g_m_y_lost_02"},
        url = "https://media.discordapp.net/attachments/1103650225844928573/1279405997839880316/theorder.jpg?ex=66d45330&is=66d301b0&hm=7c6871df2c857ea50ca6ec1711f784a58ed530f792a8686c2bfd7c89d9172936&=&format=webp&width=560&height=560"
    },
    
}

Config.RemovalItem = {
    item = "shovel",
    price = 1000000,
}

-- ██████  ██████  ██    ██  ██████  ███████ 
-- ██   ██ ██   ██ ██    ██ ██       ██      
-- ██   ██ ██████  ██    ██ ██   ███ ███████ 
-- ██   ██ ██   ██ ██    ██ ██    ██      ██ 
-- ██████  ██   ██  ██████   ██████  ███████
Config.Drugs = {
    
    
    ["cokebaggy"] = {
        price = 1000, 
        maxAmount = 1,
    },
    ["weed_bag"] = {
        price = 500, 
        maxAmount = 1,
    },

    ["kq_meth_low"] = {
        price = 3000, 
        maxAmount = 1,
    },
    ["kq_meth_mid"] = {
        price = 4000, 
        maxAmount = 1,
    },
    ["kq_meth_high"] = {
        price = 5000, 
        maxAmount = 1,
    },


    ["zatpackedweed"] = {
        price = 2000, 
        maxAmount = 1,
    },


    ["moon_moonshine"] = {
        price = 2500, 
        maxAmount = 1,
    },

    
   --[[  ["weed_skunk"] = {
        price = 100, -- price if the gang has Config.MinimumFlagsForDrugs (if flags increase, price will increase)
        maxAmount = 1, -- max amount that can be sold at one time
    }, ]]
}

-- ██    ██  █████  ██████  ██  █████  ██████  ██      ███████ ███████ 
-- ██    ██ ██   ██ ██   ██ ██ ██   ██ ██   ██ ██      ██      ██      
-- ██    ██ ███████ ██████  ██ ███████ ██████  ██      █████   ███████ 
--  ██  ██  ██   ██ ██   ██ ██ ██   ██ ██   ██ ██      ██           ██ 
--   ████   ██   ██ ██   ██ ██ ██   ██ ██████  ███████ ███████ ███████

Config.NumberOfFlagsCanBeDestroyed = 1 -- number of flags that can be destroyed per restart
Config.NumberOfFlagsGangCanDestroy = 1 -- number of flags that a gang can destroy per restart
Config.SpawnPedToBuyFlag = true -- if true, the ped will spawn to buy the flag

Config.MinimumFlagsForDrugs = 3 -- minimum amount of flags to be able to get Config.Drugs price (read Config.Drugs)
Config.RobTime = 180000 -- time in ms to rob the flag
Config.PickUpTime = 5000 -- time in ms to pick the flag
Config.RequiredGangMembers = 5 -- gang members required so other gangs can destroy the gang flags
Config.RobLocalTime = 180000 -- time in ms to rob the locals
Config.ChanceToRobLocal = 70 -- chance to rob local gang members
Config.ChanceToSellDrugsAtCornerSelling = 70 -- chance that local will buy your drugs
Config.ShowBlip = true -- show blip on map with BlipColors
Config.RobLocalAmount = 3000 -- amount you get when you rob local gang members which is multiplied by random value between 1 and the number of active gang members 
Config.RequiredGangMembersToRobLocals = 2 -- gang members required to rob locals
Config.MinimumFlagPrice = 250000 -- minimum price for a flag ( will be multiplied as the number of flags bought increases (check code in server/sv_buyflags.lua))
Config.FlagPriceIncrease = 2 -- as the number of flags increase, the price of the flags will be increased by number of Flags * Config.FlagPriceIncrease (for 1 flag - 2x, for 2 flags - 4x, etc)
Config.AllowMultipleBuys = false -- if set to true, gangs can buy multiple flags and removals every tsunami, if set to false, gangs can only buy one flag and removal every tsunami
Config.AllowCommand = true -- command to enable command (/getflags) which spawns flags, etc if you restart the script. Make sure to get the gang again if you restart. 
Config.Debug = false -- to print 
Config.RobReputation = 1000 --if your 1000 locals have been robbed, you will get 0 dollars for the drug sale you make. The logic is as follows (Do not set this to zero at any cost!!!)
Config.WaitToRobAnotherLocal = 3 -- time in minutes to wait to rob anothe local
--[[
local money = (randomAmount * Config.Drugs[itemName].price) * (flags/ Config.MinimumFlagsForDrugs) * (1 - (robbedGangTable[gang] / Config.RobReputation))

randomAmount = random number between 1 and Config.Drugs[itemName].maxAmount
Config.Drugs[itemName].price = price of the drug you are cornerselling
Config.MinimumFlagsForDrugs = minimum amount of flags to be able to get Config.Drugs price (read Config.Drugs)
flags = amount of flags your gang have
robbedGangTable[gang] = number of time your locals have been robbed successfully
Config.RobReputation = value mentioned IsMouseCursorAboveInstructionalButtons

So the more flags you have and less locals are robbed of yours, the more money you make with cornerselling the drugs. 
Also your robbedGangTable[gang] goes down as you sell more drugs. Doesnt go in negative.
]]--



-- ██       ██████   ██████  █████  ██      ███████ 
-- ██      ██    ██ ██      ██   ██ ██      ██      
-- ██      ██    ██ ██      ███████ ██      █████   
-- ██      ██    ██ ██      ██   ██ ██      ██      
-- ███████  ██████   ██████ ██   ██ ███████ ███████


Config.Locale = {
    --notify and progressbar
    ["cancel"] = "Cancelled..",
    ["inside"] = "Cannot Place inside Apartments or Houses",
    ["placing_info"] = "Press E to place or Backspace to cancel or arrow keys to rotate",
    ["placing"] = "Placing Flag",
    ["too_far"] = "You are trying to place the flag too far!",
    ["inventory_full"] = "Inventory is full",
    ["do_not_have_shovel"] = "You do not have shovel, probably dropped it!",

    ["cannot_place_here"] = "Cannot Place here, Flags have to be 100-140 units away from your own flag",
    
    ["not_your_gang"] = "You cannot place other gang's flag",
    ["no_item_to_remove"] = "You do not have the item to remove flags",
    ["destroy"] = "Destroying the flag",
    ["not_enough_gang_members"] = "Not enough gang members available to Rob",
    ["pick_up"] = "Picking Up the flag",

    ["already_sold_to_local"] = "Already Sold to this local",
    ["no_drugs_to_sell"] = "You do not have drugs to sell",
    ["already_robbed_local"] = "Already Robbed this person",
    ["cannot_rob_locals_now"] = "Cannot Rob Local Right now",
    ["on_cooldown"] = "Wait some time before robbing another local",
    ["local_rejected_offer"] = "Local Rejected the offer to buy drugs",

    ["gang_already_bought_flag"] = "Someone from your gang already bought the flag",
    ["not_enough_money"] = "You do not have enough money, Required", -- this will have the price at the end of notify
    ["gang_already_bought_removal"] = "Someone from your gang already bought the removal",

    ["cannot_destroy_now"] = "Cannot Destroy the flag now!",
    ["limit_reached_to_destroy"] = "You have already reached your limit to destroy flags",

    --Management notify
    ["removed_from_gang"] = "You have been removed from the gang!",
    ["role_changed"] = "Your role in gang has been changed!",
    -- UI notifications
    ["no_role_selected"] = "Please select the right grade!",
    ["already_in_gang"] = "The player you are trying to hire, is already in a gang.",
    ["cannot_find_player"] = "Invalid player id",
    ["error"] = "Error",
}

--[[
    * Notify Config
    * Set only one to true 
    * Config.QBCoreNotify - Uses default QBCore notify system
    * Config.okokNotify - Uses OkOkNotify system
    * Config.pNotify - Uses pNotify system

    * Config.pNotifyLayout - set layout of where the notification will show. Check the layouts below. 
    * Layouts:
                top
                topLeft
                topCenter
                topRight
                center
                centerLeft
                centerRight
                bottom
                bottomLeft
                bottomCenter
                bottomRight
    
    * Config.OkOkNotifyTitle - Title to show on okokNotify
]]--
Config.Notify = {
    ['QBCore'] = true, --(Default)
    ['okokNotify'] = false,
    ['pNotify'] = false,
}

Config.pNotifyLayout = "centerRight" --more options can be found in pNotify Readme. Make sure you put the right layout name.
Config.OkOkNotifyTitle = "Container" --Title that displays on okoknotify

-- ██████  ██████   ██████   ██████  ██████  ███████ ███████ ███████ ██████   █████  ██████      ██  ██████  ██████  ███    ██ ███████ 
-- ██   ██ ██   ██ ██    ██ ██       ██   ██ ██      ██      ██      ██   ██ ██   ██ ██   ██     ██ ██      ██    ██ ████   ██ ██      
-- ██████  ██████  ██    ██ ██   ███ ██████  █████   ███████ ███████ ██████  ███████ ██████      ██ ██      ██    ██ ██ ██  ██ ███████ 
-- ██      ██   ██ ██    ██ ██    ██ ██   ██ ██           ██      ██ ██   ██ ██   ██ ██   ██     ██ ██      ██    ██ ██  ██ ██      ██ 
-- ██      ██   ██  ██████   ██████  ██   ██ ███████ ███████ ███████ ██████  ██   ██ ██   ██     ██  ██████  ██████  ██   ████ ███████

-- icons if you use project sloth progressbar, if you use rectangular progressbar, do not worry about it
Config.ProgressBarIcons = {
    ["robbing_player"] = "fa-solid fa-user-secret",
    ["destroying"] = "fa-solid fa-hammer",
    ["picking"] = "fa-solid fa-hammer",
    ["placing"] = "fa-solid fa-flag"
}

-- ███    ███  ██████  ███    ██ ███████ ██    ██     ████████ ██    ██ ██████  ███████     ██████  ███████ ██       █████  ████████ ███████ ██████  
-- ████  ████ ██    ██ ████   ██ ██       ██  ██         ██     ██  ██  ██   ██ ██          ██   ██ ██      ██      ██   ██    ██    ██      ██   ██ 
-- ██ ████ ██ ██    ██ ██ ██  ██ █████     ████          ██      ████   ██████  █████       ██████  █████   ██      ███████    ██    █████   ██   ██ 
-- ██  ██  ██ ██    ██ ██  ██ ██ ██         ██           ██       ██    ██      ██          ██   ██ ██      ██      ██   ██    ██    ██      ██   ██ 
-- ██      ██  ██████  ██   ████ ███████    ██           ██       ██    ██      ███████     ██   ██ ███████ ███████ ██   ██    ██    ███████ ██████

-- what type of money type is required to do the following action
-- for eg., you need cash to buy flags
Config.CashType = {
    ["buyflags"] = "cash", --("bank", "crypto")
    ["buyremoval"] = "cash",  --("bank", "crypto")
    ["selldrugs"] = "cash", --("bank", "crypto")
    ["robLocal"] = "cash", --("bank", "crypto")
}


-- ██████  ██    ██ ██    ██ ███████ ██       █████   ██████      ██████  ███████ ██████  
-- ██   ██ ██    ██  ██  ██  ██      ██      ██   ██ ██           ██   ██ ██      ██   ██ 
-- ██████  ██    ██   ████   █████   ██      ███████ ██   ███     ██████  █████   ██   ██ 
-- ██   ██ ██    ██    ██    ██      ██      ██   ██ ██    ██     ██      ██      ██   ██ 
-- ██████   ██████     ██    ██      ███████ ██   ██  ██████      ██      ███████ ██████

Config.BuyFlagLocation = vector4(5089.18, -4685.49, 2.41, 296.83)
Config.BuyFlagModel = "csb_ramp_gang"


Config.UseCommandToOpenLaptop = true --if true, you can use /ganglaptop to open the laptop