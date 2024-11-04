-- ███████╗██╗  ██╗██████╗ ██╗      ██████╗ ██████╗ ███████╗
-- ██╔════╝╚██╗██╔╝██╔══██╗██║     ██╔═══██╗██╔══██╗██╔════╝
-- █████╗   ╚███╔╝ ██████╔╝██║     ██║   ██║██████╔╝█████╗  
-- ██╔══╝   ██╔██╗ ██╔═══╝ ██║     ██║   ██║██╔══██╗██╔══╝  
-- ███████╗██╔╝ ██╗██║     ███████╗╚██████╔╝██║  ██║███████╗
-- ╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

-- Join us and support us
-- 🎮 Discord: https://discord.gg/MjTkbWb3Bd
-- ☕ BuyMeACoffee: https://buymeacoffee.com/gtaexplore
-- 📺 Youtube: https://www.youtube.com/@gta-explore

LANGUAGE = 'en'

POLICE_REQUIRED = 1
POLICE_JOBS = {     --job = minimum rank, Example: police = 0,
    police = 0,
    sheriff = 0
}

ROBBERY_INTERVAL = 1*60*60000 -- 2 Hours

BREAK_ITEM = "grinder"  -- Required item to break into containers.

QB_MAX_WEIGHT = 120000 -- Only For QB-Core

MONEY_TYPE = "money"

LOOT = {
    item = "gold_bar",    -- Item Name
    stack = 5,             -- Amount of gold ingots grabbed per stack
    price = 3000             -- Selling price
}

START_SCENE = {
    enable = true,
    ped = {
        model = "s_m_m_highsec_01",
        coords = vec3(-687.82, -2417.1, 12.9445),
        heading = 320.78
    }
}

GUARDS = {
    models = {
        "s_m_y_blackops_01"
    },
    amount = 15,
    spawn_range = 30.0,
    weapons = {
        "WEAPON_BLACKARP"
    },
    armour = 50,
    accuracy = 50
}

TRAIN = {
    position = vector3(-3.21, 3441.62, 49.58),
    heading = 59.28,
    length = 5,
    angle = 1.0
}

TRAIN_PARTS = {"freightcar", "freightcont1", "freightcont2", "freightgrain", "tankercar"}
