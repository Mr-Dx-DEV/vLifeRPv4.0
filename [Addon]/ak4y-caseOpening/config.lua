---- IMPORTANT ! ALL ITEMS ARE EXAMPLE FOR YOU, YOU SHOULD SET THOSE, IF YOU DONT SET PROBABLY ITS GONNA BE BROKEN. ! IMPORTANT
---- IMPORTANT ! ALL ITEMS ARE EXAMPLE FOR YOU, YOU SHOULD SET THOSE, IF YOU DONT SET PROBABLY ITS GONNA BE BROKEN. ! IMPORTANT
---- IMPORTANT ! ALL ITEMS ARE EXAMPLE FOR YOU, YOU SHOULD SET THOSE, IF YOU DONT SET PROBABLY ITS GONNA BE BROKEN. ! IMPORTANT

-- ak4y dev.

-- IF YOU HAVE ANY PROBLEM OR DO YOU NEED HELP PLS COME TO MY DISCORD SERVER AND CREATE A TICKET
-- IF YOU DONT HAVE ANY PROBLEM YET AGAIN COME TO MY DISCORD :)
-- https://discord.gg/kWwM3Bx

AK4Y = {}

AK4Y.Framework = "qb" -- / oldqb | qb = export system | oldqb = triggerevent system
AK4Y.Mysql = "oxmysql" -- Check fxmanifest.lua when you change it! | ghmattimysql / oxmysql / mysql-async
AK4Y.OpenCommand = "caseopening"

AK4Y.WeaponsAreItem = true -- If your weapons are item then you should set this TRUE.

AK4Y.NeededPlayTime = 60 -- MINUTES
AK4Y.PlayTimeRewardType = "SILVERCOIN" -- GOLDCOIN OR SILVERCOIN
AK4Y.PlayTimeRewardCoin = 10 

AK4Y.WebsiteLink = "https://www.google.com/"
AK4Y.DiscordLink = "https://discord.gg/ak4y/"

-- ITEM TYPES : "common", "uncommon", "rare", "mythical", "legendary"
AK4Y.LastItemCategories = {"uncommon", "rare", "mythical", "legendary"} -- When items of the type written on the left are won, they appear in the recently won items tab
AK4Y.ServerNotifyCategories = {"uncommon", "mythical", "legendary"} -- When items of the type written on the left are won, a notification is sent to the entire server

AK4Y.Translate = {
    title1 = "CASE",
    title2 = "OPENING",
    premium = "PREMIUM",
    standard = "STANDARD",
    cases = "CASES",
    website = "WEBSITE",
    discord = "DISCORD",
    premiumCases = "PREMIUM CASES",
 --   standardCases = "STANDARD CASES",
    openCase = "OPEN CASE",
    openFast = "OPEN FAST",
    coinShopTitle = "GC SHOP",
    new = "NEW",
    goBack = "GO BACK",
    caseItems = "CASE ITEMS",
    items = "ITEMS",
    congratulations = "CONGRATULATIONS",
    congDescription = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum assumenda, a minima reiciendis modi quo expedita dignissimos?",
    collect = "COLLECT",
  --  sell = "SELL",
    accept = "ACCEPT",
    creditLoaded = "Credit Successfully LOADED",
    failed = "FAILED",
    youDntHaveEnoughCredit = "YOU DONT HAVE ENOUGH CREDIT!",
}


-- giveItemType's = "item", "vehicle", "money"
-- items in the case should have a chance total of 100 !! IMPORTANT !! IMPORTANT !! IMPORTANT !!
AK4Y.PremiumCases = {
    {
        uniqueId = 1, -- IDs must be different and sequential
        label = "Phantom Case",
        price = 150, 
        priceType = "GC", -- GC OR SC
        caseTheme = "red", -- red, blue, orange, purple, green
        caseType = "premium", -- do not touch!
        isNew = true,
        items = { -- giveItemType's = "item", "vehicle", "money", "weapon"
                  -- items in the case should have a chance total of 100 !! IMPORTANT !! IMPORTANT !! IMPORTANT !!
            { itemName = "WEAPON_BLUEGLOCKS", label = "BLUE GLOCKS", chance = 0.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/lockpick.png" },
            { itemName = "lockpick", label = "LOCKPICK", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/advancedlockpick.png" },
            { itemName = "gummy_rasberry", label = "Rasberry Kush Gummy", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/firstaid.png" },
            { itemName = "rifle_ammo", label = "Rifle Ammo", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 500, giveItemType = "item", image = "./images/items/joint.png" },
            { itemName = "pistol_ammo", label = "PISTOL AMMO", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 250, giveItemType = "item", image = "./images/items/pistol_ammo.png" },
            { itemName = "handcuffs", label = "Handcuffs", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/radio.png" },
            { itemName = "money", label = "50,000 cash", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 50000, giveItemType = "item", image = "./images/items/pistol_extendedclip.png" },
            { itemName = "sandwich", label = "Sandwich", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 10, giveItemType = "item", image = "./images/items/security_card_02.png" },
            { itemName = "water_bottle", label = "Bottle of Water", chance = 5, sellCredit = 40, itemType = "common", itemCount = 10, giveItemType = "weapon", image = "./images/items/weapon_knife.png" },
            { itemName = "bandage", label = "Bandage", chance = 5, sellCredit = 40, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_crowbar.png" },
           
            { itemName = "scrapmetal", label = "Scrap Metal", chance = 5, sellCredit = 40, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/armor.png" },
            { itemName = "steel", label = "Steel", chance = 5, sellCredit = 100, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_combatpistol.png" },
            { itemName = "copper", label = "Copper", chance = 5, sellCredit = 100, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_heavypistol.png" },
            
            { itemName = "at_clip_extended_pistol", label = "PISTOL Extended", chance = 5, sellCredit = 100, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_appistol.png" },
            
        },
    },
    {
        uniqueId = 2, -- IDs must be different and sequential
        label = "Weapon and Item Case",
        price = 300,
        priceType = "GC", -- GC OR SC
        caseTheme = "orange", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "WEAPON_STONE_HATCHET", label = "Stone Hatchet", chance = 10, sellCredit = 30, itemType = "medium rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/WEAPON_STONE_HATCHET.png" },
            { itemName = "Lockpick", label = "Lockpick", chance = 15, sellCredit = 5, itemType = "common", itemCount = 1, giveItemType = "tool", image = "./images/items/lockpick.png" },
            { itemName = "WEAPON_SLEDGEHAMMER", label = "Sledgehammer", chance = 7.5, sellCredit = 40, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/WEAPON_SLEDGEHAMMER.png" },
            { itemName = "rifle_ammo", label = "Rifle Ammo (1000)", chance = 8, sellCredit = 80, itemType = "common", itemCount = 1000, giveItemType = "ammo", image = "./images/items/rifle_ammo.png" },
            { itemName = "pistol_ammo", label = "Pistol Ammo (500)", chance = 10, sellCredit = 50, itemType = "common", itemCount = 500, giveItemType = "ammo", image = "./images/items/pistol_ammo.png" },
            { itemName = "casinochips", label = "Casino Chips (80000)", chance = 5, sellCredit = 100, itemType = "rare", itemCount = 80000, giveItemType = "currency", image = "./images/items/casinochips.png" },
            { itemName = "Burrito_custom", label = "Burrito Custom (PDM Van)", chance = 7.5, sellCredit = 50, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/burrito_custom.png" },
            { itemName = "WEAPON_KATANA", label = "Katana", chance = 5, sellCredit = 60, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/WEAPON_KATANA.png" },
            { itemName = "WEAPON_BLUEGLOCKS", label = "Blue Glocks", chance = 10, sellCredit = 40, itemType = "medium rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/WEAPON_BLUEGLOCKS.png" },
            { itemName = "Lockpick", label = "Lockpick", chance = 15, sellCredit = 5, itemType = "common", itemCount = 1, giveItemType = "tool", image = "./images/items/lockpick.png" },
            { itemName = "rifle_ammo", label = "Rifle Ammo (500)", chance = 10, sellCredit = 50, itemType = "common", itemCount = 500, giveItemType = "ammo", image = "./images/items/rifle_ammo.png" },
            { itemName = "pistol_ammo", label = "Pistol Ammo (250)", chance = 12, sellCredit = 25, itemType = "common", itemCount = 250, giveItemType = "ammo", image = "./images/items/pistol_ammo.png" },
            { itemName = "handcuffs", label = "Handcuffs", chance = 15, sellCredit = 20, itemType = "common", itemCount = 1, giveItemType = "tool", image = "./images/items/handcuffs.png" },
            { itemName = "money", label = "Cash (50,000)", chance = 8, sellCredit = 75, itemType = "medium rare", itemCount = 50000, giveItemType = "currency", image = "./images/items/money.png" },
            { itemName = "sandwich", label = "Sandwich", chance = 20, sellCredit = 2, itemType = "common", itemCount = 1, giveItemType = "food", image = "./images/items/sandwich.png" },
            { itemName = "bandage", label = "Bandage (20)", chance = 18, sellCredit = 20, itemType = "common", itemCount = 20, giveItemType = "medical", image = "./images/items/bandage.png" },
            { itemName = "armor", label = "Armor (5)", chance = 10, sellCredit = 50, itemType = "common", itemCount = 5, giveItemType = "armor", image = "./images/items/armor.png" },
            { itemName = "at_suppressor_light", label = "SMG Scope", chance = 10, sellCredit = 45, itemType = "medium rare", itemCount = 1, giveItemType = "attachment", image = "./images/items/smg_scope.png" },
            { itemName = "at_clip_extended_rifle", label = "Rifle Extended", chance = 7.5, sellCredit = 60, itemType = "rare", itemCount = 1, giveItemType = "attachment", image = "./images/items/rifle_extendedclip.png" },
            { itemName = "at_grip", label = "Grip", chance = 10, sellCredit = 50, itemType = "medium rare", itemCount = 1, giveItemType = "attachment", image = "./images/items/at_grip.png" },
        },
    },
    
    {
        uniqueId = 3, -- IDs must be different and sequential
        label = "Special Item Case",
        price = 230,
        priceType = "GC", -- GC OR SC
        caseTheme = "green", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_katana_g", label = "Golden Katana", chance = 7.5, sellCredit = 60, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_katana_g.png" },
            { itemName = "rifle_ammo", label = "Rifle Ammo (5000)", chance = 10, sellCredit = 75, itemType = "medium rare", itemCount = 5000, giveItemType = "ammo", image = "./images/items/rifle_ammo.png" },
            { itemName = "gummy_rasberry", label = "Gummy Raspberry (20)", chance = 12, sellCredit = 5, itemType = "common", itemCount = 20, giveItemType = "food", image = "./images/items/ww_rasberrygummies.png" },
            { itemName = "Corvet_C7", label = "Corvette C7", chance = 5, sellCredit = 100, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/corvette_c7.png" },
            { itemName = "WEAPON_MOLOTOV", label = "Molotov (10)", chance = 10, sellCredit = 40, itemType = "medium rare", itemCount = 10, giveItemType = "weapon", image = "./images/items/WEAPON_MOLOTOV.png" },
            { itemName = "edm_car_card", label = "EDM Car Card", chance = 5, sellCredit = 100, itemType = "rare", itemCount = 1, giveItemType = "special", image = "./images/items/edm_car_card.png" },
            { itemName = "pdm_bike_card", label = "PDM Bike Card", chance = 7.5, sellCredit = 60, itemType = "medium rare", itemCount = 1, giveItemType = "special", image = "./images/items/pdm_bike_card.png" },
            { itemName = "c4_bomb", label = "C4 Bomb", chance = 5, sellCredit = 120, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/c4_bomb.png" },
            { itemName = "WEAPON_STONE_HATCHET", label = "Stone Hatchet", chance = 10, sellCredit = 30, itemType = "medium rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/WEAPON_STONE_HATCHET.png" },
            { itemName = "lockpick", label = "Lockpick", chance = 15, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "tool", image = "./images/items/lockpick.png" },
            { itemName = "WEAPON_SLEDGEHAMMER", label = "Sledgehammer", chance = 7.5, sellCredit = 50, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/WEAPON_SLEDGEHAMMER.png" },
            { itemName = "rifle_ammo", label = "Rifle Ammo (1000)", chance = 10, sellCredit = 50, itemType = "common", itemCount = 1000, giveItemType = "ammo", image = "./images/items/rifle_ammo.png" },
            { itemName = "pistol_ammo", label = "Pistol Ammo (500)", chance = 10, sellCredit = 25, itemType = "common", itemCount = 500, giveItemType = "ammo", image = "./images/items/pistol_ammo.png" },
            { itemName = "casinochips", label = "Casino Chips (80,000)", chance = 8, sellCredit = 90, itemType = "medium rare", itemCount = 80000, giveItemType = "currency", image = "./images/items/casinochips.png" },
            { itemName = "WEAPON_GRENADE", label = "Grenade", chance = 12, sellCredit = 30, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/items/WEAPON_GRENADE.png" },
            { itemName = "Burrito_custom", label = "Burrito Custom", chance = 10, sellCredit = 75, itemType = "medium rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/burrito_custom.png" },
            { itemName = "WEAPON_KATANA", label = "Katana", chance = 7.5, sellCredit = 60, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/katana.png" },
            { itemName = "at_suppressor_light", label = "SMG Scope", chance = 10, sellCredit = 45, itemType = "medium rare", itemCount = 1, giveItemType = "attachment", image = "./images/items/smg_scope.png" },
            { itemName = "at_clip_extended_rifle", label = "Rifle Extended", chance = 7.5, sellCredit = 60, itemType = "rare", itemCount = 1, giveItemType = "attachment", image = "./images/items/rifle_extendedclip.png" },
            { itemName = "at_grip", label = "Grip", chance = 10, sellCredit = 50, itemType = "medium rare", itemCount = 1, giveItemType = "attachment", image = "./images/items/at_grip.png" },
        },
    },
    
    {
        uniqueId = 4, -- IDs must be different and sequential
        label = "Operation Case",
        price = 400,
        priceType = "GC", -- GC OR SC
        caseTheme = "blue", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "c4_bomb", label = "C4 Bomb", chance = 10, sellCredit = 50, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/items/c4_bomb.png" },
            { itemName = "WEAPON_GRENADE", label = "Grenade (20)", chance = 7.5, sellCredit = 40, itemType = "medium rare", itemCount = 20, giveItemType = "weapon", image = "./images/items/WEAPON_GRENADE.png" },
            { itemName = "rifle_ammo", label = "Rifle Ammo (5000)", chance = 10, sellCredit = 75, itemType = "common", itemCount = 5000, giveItemType = "ammo", image = "./images/items/rifle_ammo.png" },
            { itemName = "pistol_ammo", label = "Pistol Ammo (1000)", chance = 10, sellCredit = 50, itemType = "common", itemCount = 1000, giveItemType = "ammo", image = "./images/items/pistol_ammo.png" },
            { itemName = "WEAPON_MOLOTOV", label = "Molotov (10)", chance = 7.5, sellCredit = 40, itemType = "medium rare", itemCount = 10, giveItemType = "weapon", image = "./images/items/WEAPON_MOLOTOV.png" },
            { itemName = "weapon_katana_g", label = "Golden Katana", chance = 5, sellCredit = 60, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/weapon_katana_g.png" },
            { itemName = "heli_card", label = "Heli Card", chance = 2, sellCredit = 200, itemType = "onek besi rare", itemCount = 1, giveItemType = "special", image = "./images/items/heli_card.png" },
            { itemName = "money", label = "Cash (2 Crore)", chance = 2.5, sellCredit = 250, itemType = "rare", itemCount = 20000000, giveItemType = "currency", image = "./images/items/money.png" },
            { itemName = "one_of_one_car_card", label = "1 of 1 Car Choice Card", chance = 1, sellCredit = 500, itemType = "onek besi besi besi rare", itemCount = 1, giveItemType = "special", image = "./images/items/one_of_one_car_card.png" },
            { itemName = "boat_card", label = "Boat Card", chance = 2, sellCredit = 150, itemType = "onek besi rare", itemCount = 1, giveItemType = "special", image = "./images/items/boat_card.png" },
            { itemName = "gummy_rasberry", label = "Gummy Raspberry (50)", chance = 15, sellCredit = 5, itemType = "common", itemCount = 50, giveItemType = "food", image = "./images/items/ww_rasberrygummies.png" },
            { itemName = "WEAPON_BSCAR", label = "BS Car (5)", chance = 1.5, sellCredit = 300, itemType = "onek besi rare", itemCount = 5, giveItemType = "weapon", image = "./images/items/weapon_bscar.png" },
            { itemName = "WEAPON_BLUEGLOCKS", label = "Blue Glocks", chance = 10, sellCredit = 40, itemType = "medium rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/WEAPON_BLUEGLOCKS.png" },
            { itemName = "armor", label = "Armor (10)", chance = 12, sellCredit = 50, itemType = "common", itemCount = 10, giveItemType = "armor", image = "./images/items/armor.png" },
            { itemName = "edm_car", label = "EDM Car", chance = 2.5, sellCredit = 150, itemType = "onek besi rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/edm_car.png" },
            { itemName = "bandage", label = "Bandage (25)", chance = 15, sellCredit = 10, itemType = "common", itemCount = 25, giveItemType = "medical", image = "./images/items/bandage.png" },
            { itemName = "shinobi_pdm_bike", label = "Shinobi PDM Bike", chance = 10, sellCredit = 70, itemType = "medium rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/shinobi_pdm_bike.png" },
            { itemName = "personal_pet_card", label = "Personal Pet Card", chance = 1.5, sellCredit = 500, itemType = "onek besi rare", itemCount = 1, giveItemType = "special", image = "./images/items/personal_pet_card.png" },
            { itemName = "at_suppressor_light", label = "SMG Scope", chance = 10, sellCredit = 45, itemType = "medium rare", itemCount = 1, giveItemType = "attachment", image = "./images/items/smg_scope.png" },
            { itemName = "at_clip_extended_rifle", label = "Rifle Extended", chance = 7.5, sellCredit = 60, itemType = "rare", itemCount = 1, giveItemType = "attachment", image = "./images/items/rifle_extendedclip.png" },
            { itemName = "at_grip", label = "Grip", chance = 10, sellCredit = 50, itemType = "medium rare", itemCount = 1, giveItemType = "attachment", image = "./images/items/at_grip.png" },
        },
    },
    
    --[[ {
        uniqueId = 5, -- IDs must be different and sequential
        label = "Chrome Case",
        price = 500,
        priceType = "GC", -- GC OR SC
        caseTheme = "green", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol", label = "ITEM 1", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 2", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 3", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 4", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 5", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 6", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 7", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 8", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
        },
    },
    {
        uniqueId = 6, -- IDs must be different and sequential
        label = "Clutch Case",
        price = 600,
        priceType = "GC", -- GC OR SC
        caseTheme = "purple", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol", label = "ITEM 1", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 2", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 3", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 4", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 5", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 6", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 7", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 8", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
        },
    },
    {
        uniqueId = 7, -- IDs must be different and sequential
        label = "Gamma Case",
        price = 700,
        priceType = "GC", -- GC OR SC
        caseTheme = "blue", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol", label = "ITEM 1", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 2", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 3", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 4", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 5", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 6", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 7", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 8", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
        },
    },
    {
        uniqueId = 8, -- IDs must be different and sequential
        label = "Horizon Case",
        price = 800,
        priceType = "GC", -- GC OR SC
        caseTheme = "red", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol", label = "ITEM 1", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 2", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 3", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 4", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 5", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 6", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 7", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 8", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
        },
    }, ]]
}

AK4Y.StandardCases = {
   --[[  {
        uniqueId = 1,
        label = "Standard Case (1)",
        price = 150,
        priceType = "SC", -- GC OR SC
        caseTheme = "nude",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol", label = "ITEM 1", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 2", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 3", chance = 10, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 4", chance = 10, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 5", chance = 10, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 6", chance = 4.5, sellCredit = 20, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 7", chance = 4.5, sellCredit = 20, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 8", chance = 0.5, sellCredit = 25, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
        },
    },
    {
        uniqueId = 2,
        label = "Standard Case (2)",
        price = 150,
        priceType = "SC", -- GC OR SC
        caseTheme = "nude",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol", label = "ITEM 1", chance = 30, sellCredit = 10, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 2", chance = 30, sellCredit = 10, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 3", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 4", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 5", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 6", chance = 4.5, sellCredit = 20, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 7", chance = 4.5, sellCredit = 20, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 8", chance = 0.5, sellCredit = 25, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
        },
    },
    {
        uniqueId = 3,
        label = "Standard Case (3)",
        price = 150,
        priceType = "SC", -- GC OR SC
        caseTheme = "nude",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol", label = "ITEM 1", chance = 30, sellCredit = 10, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 2", chance = 30, sellCredit = 10, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 3", chance = 10, sellCredit = 15, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 4", chance = 10, sellCredit = 15, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 5", chance = 10, sellCredit = 15, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 6", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 7", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 8", chance = 0.5, sellCredit = 25, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
        },
    },
    {
        uniqueId = 4,
        label = "Standard Case (4)",
        price = 150,
        priceType = "SC", -- GC OR SC
        caseTheme = "nude",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol", label = "ITEM 1", chance = 30, sellCredit = 10, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 2", chance = 30, sellCredit = 10, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 3", chance = 10, sellCredit = 15, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 4", chance = 10, sellCredit = 15, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 5", chance = 10, sellCredit = 15, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 6", chance = 4.5, sellCredit = 20, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 7", chance = 4.5, sellCredit = 20, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 8", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
        },
    }, ]]
   --[[  {
        uniqueId = 5,
        label = "Standard Case (5)",
        price = 150,
        priceType = "SC", -- GC OR SC
        caseTheme = "nude",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol", label = "ITEM 1", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 2", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 3", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 4", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 5", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 6", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 7", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 8", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
        },
    },
    {
        uniqueId = 6,
        label = "Standard Case (6)",
        price = 150,
        priceType = "SC", -- GC OR SC
        caseTheme = "nude",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol", label = "ITEM 1", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 2", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 3", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 4", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 5", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 6", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 7", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 8", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
        },
    },
    {
        uniqueId = 7,
        label = "Standard Case (7)",
        price = 150,
        priceType = "SC", -- GC OR SC
        caseTheme = "nude",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol", label = "ITEM 1", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 2", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 3", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 4", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 5", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 6", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 7", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
            { itemName = "weapon_pistol", label = "ITEM 8", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/item.png" },
        },
    }, ]]
}

AK4Y.SellCoins = {
    {
        coinCount = 100,
        realPrice = 10,
        directLink = "https://www.google.com/1",
    },
    {
        coinCount = 200,
        realPrice = 20,
        directLink = "https://www.google.com/2",
    },
    {
        coinCount = 300,
        realPrice = 30,
        directLink = "https://www.google.com/3",
    },
    {
        coinCount = 400,
        realPrice = 40,
        directLink = "https://www.google.com/4",
    },
    {
        coinCount = 500,
        realPrice = 50,
        directLink = "https://www.google.com/5",
    },
    {
        coinCount = 600,
        realPrice = 60,
        directLink = "https://www.google.com/6",
    },
    {
        coinCount = 700,
        realPrice = 70,
        directLink = "https://www.google.com/7",
    },
    {
        coinCount = 1000,
        realPrice = 80,
        directLink = "https://ak4y.tebex.io/package/5348821",
    },
    
}

