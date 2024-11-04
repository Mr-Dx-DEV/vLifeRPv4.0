Config = {}

---------------
-- Utilitys
---------------
Config.CoreName = "qb-core" -- Yoru core folder name
Config.EnableCallCops = true -- Enable police on illegal hunting?
Config.ChanceCallCops = 10 -- Chance to call cops
Config.Dispatch = 'cd_dispatch' -- "ps-dispatch" or "cd_dispatch"
Config.CoreSkillls = false -- If you need trigger core skills or other, on s_editable.
Config.Minigame = false -- Enable minigame when skin the animal? ( ps-ui )
Config.Debug = true -- If true you have the command /bait to spawn the animal
Config.Inventory = "ox" -- "qb" or "ox"
Config.Target = "qb" -- "qb" or "ox"
Config.InvLink = "ox_inventory/web/images/" -- Your directory inventory images
Config.CooldownBait = 1 -- | 1 Minute
Config.DistanceDelete = 75  -- If you move more than 75m away from the animal, it automatically turns off
Config.Radius = 25 -- Maximum distance the animal can spawn when baited.

---------------
-- Zones
---------------
Config.EnableZones = true
Config.Radius = 50 -- Radius of the zone if you use Enable Zones
Config.HuntingZones = {
	[1] = {coords = vector3(495.66, 5587.17, 794.22), illegal = true, blipEnable = true, blipSprie = 313, blipColour = 1, blipScale = 0.5, blipName = "Illegal Hunting" },
	[2] = {coords = vector3(-712.77, 5302.93, 72.27), illegal = false, blipEnable = true, blipSprie = 313, blipColour = 2, blipScale = 0.5, blipName = "Legal Hunting" }
}

---------------
-- Animals
---------------
Config.LegalAnimals = { -- https://docs.fivem.net/docs/game-references/ped-models/#animals
    'a_c_deer',
}

Config.IlegalAnimals = { -- https://docs.fivem.net/docs/game-references/ped-models/#animals
    'a_c_boar',
}

---------------
-- Drops on hunting
---------------
Config.LegalDrops = { 
	"badleather",
	"medleather",
	"badmeat",
	"medmeat",
	"badhorns",
	"medhorns",
}

Config.IlegalDrops = {
	"maxleather",
	"maxmeat",
	"maxhorns",
}

---------------
-- Rewards / Prices
---------------
-- Rewards
Config.RewardsKnife = {
	Level_01 = { Min = 1, Max = 1 },
	Level_02 = { Min = 1, Max = 2 },
	Level_03 = { Min = 1, Max = 3 },
	Level_04 = { Min = 1, Max = 4 },
	Level_05 = { Min = 1, Max = 5 },
}

-- Prices
Config.Payment = "cash" -- "cash" or "bank"
Config.SellingItems = {
	BeefBad = math.random(10,200),
	BeefMed = math.random(20,300),
	BeefMax = math.random(30,400),
	LeatherBad = math.random(10,200),
	LeatherMed = math.random(20,300),
	LeatherMax = math.random(30,400),
	HornsBad = math.random(10,200),
	HornsMed = math.random(20,300),
	HornsMax = math.random(30,400)
}

---------------
-- Upgrades
---------------
-- Knifes
Config.ItemUpNvl2 = "maxleather"
Config.AmountItemUpNvl2 = 30
Config.ItemUpNvl3 = "maxleather"
Config.AmountItemUpNvl3 = 60
Config.ItemUpNvl4 = "maxleather"
Config.AmountItemUpNvl4 = 90
Config.ItemUpNvl5 = "maxleather"
Config.AmountItemUpNvl5 = 120

---------------
-- Notifications
---------------
Language = {
	["Falhaste"] = "You failed.",
	["SemFaca"] = "You don't have a knife with you.",
	["JaTens"] = "You already have a knife with you",
	["NaoTensNecessario"] = "You don't have the right items.",
	["AnimalRanAway"] = "Animal ran away, you were too close",
	["NoJob"] = "You don't know how to use this",	-- When job is required and the player doesn't have
	["Cooldown"] = "You have cooldown please wait:",
	["UsingBait"] = "Using the bait...",
	["Skining"] = "Skining...",
	["WronZone"] = "Wrong zone!",
	["AnimalSkin"] = "The animal is not available to be skinned.",
	["AnimalBlip"] = "Animal",
}

---------------
-- Peds
---------------
Config.Peds = {
	[1] = { hash = GetHashKey("a_m_m_eastsa_01"), loc = vector3(-773.2, 5597.93, 32.61), heading = 192.02}, -- Ped to open the shop and buy the pickaxe
}

-----------------
-- Shop
-----------------
Config.HuntingShop = {
    [1] = { name = "huntinglegalbait",    price = 5, amount = 10, info = {}, type = "item", slot = 1 },
	[2] = { name = "huntingillegalbait",    price = 5, amount = 10, info = {}, type = "item", slot = 2 },
}                      
