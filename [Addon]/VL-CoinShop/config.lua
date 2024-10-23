-- IF YOU HAVE ANY PROBLEM OR DO YOU NEED HELP PLS COME TO MY DISCORD SERVER AND CREATE A TICKET
-- IF YOU DONT HAVE ANY PROBLEM YET AGAIN COME TO MY DISCORD :)
-- https://discord.gg/NCHub

NCHub = {}

NCHub.Framework = "qb" -- qb / oldqb | qb = export system | oldqb = triggerevent system
NCHub.Mysql = "oxmysql" -- Check fxmanifest.lua when you change it! | ghmattimysql / oxmysql / mysql-async
NCHub.OpenCommand = "vcoin"
NCHub.DefaultGarage = "legionsquare" -- purchased vehicles will be sent to this garage
NCHub.RewardCoin = 2
NCHub.NeededPlayTime = 60 -- Minutes

NCHub.Language = {
    title1 = "VLife Coins",
    title2 = "Playtime",
    coin = "COIN",
    nextReward = "FOR THE NEXT COIN REWARD",
    exit = "EXIT",
    reward = "REWARD :",
    title3 = "TOP",
    title4 = "PLAYERS",
    title5 = "PLAYTIME",
    title6 = "SHOP",
    cancel = "CANCEL",
    buy = "BUY",
    accept = "ACCEPT",
    realCurrency = "৳",
    nextPage = "NEXT PAGE",
    previousPage = "PRIVIOUS PAGE",
    succesfully = "SUCCESSFULLY",
    purchased = "PURCHASED",
    invalidCode = "INVALID CODE!",
    thxForPurch = "Thanks for purchasing!",
    top = "TOP",
    youDntHvEngMoney = "YOU DONT HAVE ENOUGH MONEY!",
    text6 = "6",
}

NCHub.Categories = {
    { category = "items", icon = "fa-solid fa-cookie-bite", items = {} }, -- do not touch items section..
    { category = "weapons", icon = "fa-solid fa-gun", items = {} }, -- do not touch items section..
    { category = "vehicles", icon = "fa-solid fa-car", items = {} }, -- do not touch items section..
}

-- itemType : vehicle, weapon, item, money
NCHub.Items = {
    { id = 1, itemName = "weapon_katana", label = "Katana", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/katana.png" },
    { id = 2, itemName = "weapon_sledgehammer", label = "Sledge Hammer", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/sledgehammer.png" },
    { id = 3, itemName = "weapon_stone_hatchet", label = "Stone Hatchet", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_stone_hatchet.png" },

    { id = 15, itemName = "weapon_berserker", label = "Berserker", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_berserker_axe.png" },
    { id = 16, itemName = "weapon_bigaxe", label = "Bigaxe", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_bigaxe.png" },
    { id = 17, itemName = "weapon_pickaxe", label = "Pickaxe", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_pick_axe.png" },
    { id = 18, itemName = "weapon_usamachette", label = "USA Machete", price = 400, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_usamachette.png" },
    { id = 19, itemName = "weapon_tac_machette", label = "TAC Machete", price = 400, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_tac_machette.png" },
    { id = 20, itemName = "weapon_pipe", label = "Pipe", price = 400, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_pipe.png" },
    { id = 21, itemName = "weapon_steakknife", label = "Steak Knife", price = 400, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_steakknife.png" },
    { id = 22, itemName = "weapon_blue_katana", label = "Blue Katana", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_blue_katana.png" },
    { id = 23, itemName = "weapon_pickaxe_small", label = "Pickaxe Small", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_pickaxe_small.png" },
    { id = 24, itemName = "weapon_chinese", label = "Chinese Sowrd", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_chinese.png" },
    { id = 25, itemName = "weapon_double_axe", label = "Double Axe", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_double_axe.png" },
    { id = 26, itemName = "weapon_handsickle", label = "Handsickle", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_handsickle.png" },
    { id = 27, itemName = "weapon_kitetsu", label = "Kitetsu", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_Kitetsu.png" },
    { id = 29, itemName = "weapon_patreon", label = "Patreon", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_patreon.png" },
    { id = 30, itemName = "weapon_primal_machete", label = "Primal Machete", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_primal_machete.png" },
    { id = 31, itemName = "weapon_sheva", label = "Sheva", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_sheva.png" },
    { id = 32, itemName = "weapon_sowrd", label = "Assassin's Creed Sword", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_sowrd.png" },
    { id = 33, itemName = "weapon_tactical_axe", label = "Tactical Axe", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_tactical_axe.png" },
    { id = 34, itemName = "weapon_thermal_katana", label = "Red katana", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_thermal_katana.png" },
    { id = 35, itemName = "weapon_texas_hammer", label = "Texas Hammer", price = 400, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_texas_hammer.png" },


    -- { id = 4, itemName = "licenseplate", label = "License Plate", price = 400, count = 1, itemType = "item", category = "items", image = "./images/plate.png" },
    { id = 4, itemName = "advancedlockpick", label = "Advanced Lockpick", price = 30, count = 1, itemType = "item", category = "items", image = "./images/advancedlockpick.png" },
    { id = 5, itemName = "armor", label = "Armor", price = 35, count = 1, itemType = "item", category = "items", image = "./images/armor.png" },


    { id = 6, itemName = "675ltsp", label = "McLaren 675LT", price = 2000, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/mclaren_675lt.png" },
    { id = 7, itemName = "exor", label = "Chevrolet Camaro ZL1", price = 1220, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/chevrolet_camaro_zl1.png" },
    { id = 8, itemName = "urustc", label = "Lamborghini Urus", price = 1220, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/Lamborghini.png" },
    { id = 9, itemName = "demon", label = "Dodge Challenger", price = 1220, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/dodge_challenger.png" },
    --[[ { id = 11, itemName = "zx10", label = "Kawasaki ZX10", price = 1020, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/kawasaki_.png" }, ]]

    
    { id = 10, itemName = "husky", label = "Husky", price = 400, count = 1, itemType = "item", category = "items", image = "./images/A_C_Husky.png" },
    { id = 11, itemName = "poodle", label = "Poodle", price = 400, count = 1, itemType = "item", category = "items", image = "./images/A_C_Poodle.png" },
    { id = 12, itemName = "rottweiler", label = "Rottweiler", price = 400, count = 1, itemType = "item", category = "items", image = "./images/A_Rottweiler.png" },
    { id = 13, itemName = "cat", label = "Cat", price = 400, count = 1, itemType = "item", category = "items", image = "./images/A_C_Cat_01.png" },
    { id = 14, itemName = "pug", label = "Pug", price = 400, count = 1, itemType = "item", category = "items", image = "./images/A_C_Pug.png" },


}

NCHub.CoinList = {
    { coinCount = 100, realPrice = 50, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
    { coinCount = 200, realPrice = 100, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
    { coinCount = 300, realPrice = 150, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
    { coinCount = 400, realPrice = 200, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
    { coinCount = 500, realPrice = 250, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
    { coinCount = 1000, realPrice = 500, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
}