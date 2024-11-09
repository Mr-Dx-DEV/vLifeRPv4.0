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

    { id = 4, itemName = "WEAPON_KATANA_R", label = "Red Blood katana", price = 800, count = 1, itemType = "item", category = "items", image = "./images/WEAPON_KATANA_R.png" },
    { id = 5, itemName = "WEAPON_KATANA_Y", label = "Yellow Fire Katana", price = 800, count = 1, itemType = "item", category = "items", image = "./images/WEAPON_KATANA_Y.png" },
    { id = 6, itemName = "WEAPON_KATANA_B", label = "Blue Electric Katana", price = 800, count = 1, itemType = "item", category = "items", image = "./images/WEAPON_KATANA_B.png" },
    { id = 7, itemName = "WEAPON_KATANA_G", label = "Green Butterfly Katana", price = 800, count = 1, itemType = "item", category = "items", image = "./images/WEAPON_KATANA_G.png" },

    { id = 8, itemName = "armor", label = "Armor", price = 35, count = 1, itemType = "item", category = "items", image = "./images/armor.png" },

    { id = 9, itemName = "weapon_berserker", label = "Berserker", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_berserker_axe.png" },
    { id = 10, itemName = "weapon_bigaxe", label = "Bigaxe", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_bigaxe.png" },
    { id = 11, itemName = "weapon_pickaxe", label = "Pickaxe", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_pick_axe.png" },
    { id = 12, itemName = "weapon_usamachette", label = "USA Machete", price = 400, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_usamachette.png" },
    { id = 13, itemName = "weapon_tac_machette", label = "TAC Machete", price = 400, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_tac_machette.png" },
    { id = 14, itemName = "weapon_pipe", label = "Pipe", price = 400, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_pipe.png" },
    { id = 15, itemName = "weapon_steakknife", label = "Steak Knife", price = 400, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_steakknife.png" },
    { id = 16, itemName = "weapon_blue_katana", label = "Blue Katana", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_blue_katana.png" },
    { id = 17, itemName = "weapon_pickaxe_small", label = "Pickaxe Small", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_pickaxe_small.png" },
    { id = 18, itemName = "weapon_chinese", label = "Chinese Sowrd", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_chinese.png" },
    { id = 19, itemName = "weapon_double_axe", label = "Double Axe", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_double_axe.png" },
    { id = 20, itemName = "weapon_handsickle", label = "Handsickle", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_handsickle.png" },
    { id = 21, itemName = "weapon_kitetsu", label = "Kitetsu", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_Kitetsu.png" },
    { id = 22, itemName = "weapon_patreon", label = "Patreon", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_patreon.png" },
    { id = 23, itemName = "weapon_primal_machete", label = "Primal Machete", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_primal_machete.png" },
    { id = 24, itemName = "weapon_sheva", label = "Sheva", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_sheva.png" },
    { id = 25, itemName = "weapon_sowrd", label = "Assassin's Creed Sword", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_sowrd.png" },
    { id = 26, itemName = "weapon_tactical_axe", label = "Tactical Axe", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_tactical_axe.png" },
    { id = 27, itemName = "weapon_thermal_katana", label = "Red katana", price = 600, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_thermal_katana.png" },
    { id = 28, itemName = "weapon_texas_hammer", label = "Texas Hammer", price = 400, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_texas_hammer.png" },


    
    
    


}

NCHub.CoinList = {
    { coinCount = 100, realPrice = 50, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
    { coinCount = 200, realPrice = 100, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
    { coinCount = 300, realPrice = 150, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
    { coinCount = 400, realPrice = 200, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
    { coinCount = 500, realPrice = 250, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
    { coinCount = 1000, realPrice = 500, link = "https://discord.gg/pmkZuApu6K", image = "./images/coin.png" },
}