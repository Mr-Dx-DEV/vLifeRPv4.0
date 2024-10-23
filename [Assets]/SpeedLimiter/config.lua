Config = {}
-- Set Config.kmh to false if you want to use mph
Config.kmh = false

-- Set Config.maxSpeed to false if you want to use same speed for all vehicles
-- Set the max speed for all vehicles on Config.maxSpeed
Config.useCategories = true
Config.maxSpeed = false

Config.pdm = 120 -- shop 'pdm'
Config.edm = 180 -- shop 'edm'
Config.Silver = 130 -- shop 'tuner'
Config.Gold = 140 -- shop '1o1'
Config.GoldTune = 145 -- shop '1o1'
Config.Diamond = 150 -- shop 'diamond'
Config.DiamondTune = 155 -- shop 'diamond'
Config.NonSportsBike = 140
Config.SportsBike = 120
Config.Police = 185   -- shop 'interceptor'
Config.Police2 = 140
Config.EMS = 130
Config.EMS2 = 140

Config.Categories = {
   
   --[[ -- COMPACTS
   {category = 0, maxSpeed = 100},
   -- SEDANS
   {category = 1, maxSpeed = 100},
   -- SUV'S
   {category = 2, maxSpeed = 100},
   -- COUPES
   {category = 3, maxSpeed = 100},
   -- MUSCLE
   {category = 4, maxSpeed = 100},
   -- SPORT CLASSIC
   {category = 5, maxSpeed = 100},
   -- SPORT
   {category = 6, maxSpeed = 100},
   -- SUPER
   {category = 7, maxSpeed = 100},
   -- MOTORCYCLES
   {category = 8, maxSpeed = 100},
   -- OFFROAD
   {category = 9, maxSpeed = 100},
   -- INDUSTRIAL
   {category = 10, maxSpeed = 100},
   -- UTILITY
   {category = 11, maxSpeed = 100},
   -- VANS
   {category = 12, maxSpeed = 100},
   -- BICYCLES
   {category = 13, maxSpeed = 100},
   -- BOATS
   {category = 14, maxSpeed = 100},

   --#region PLANES AND HELIS
   -- YOU MUST NOT LOCK THIS ONES OR YOU WON'T BE ABLE TO FLY THEM!!!
   {category = 15, maxSpeed = nil},
   {category = 16, maxSpeed = nil},
   --#endregion

   -- SERVICE
   {category = 17, maxSpeed = 100},
   -- EMERGENCY
   {category = 18, maxSpeed = 100},
   -- MILITARY
   {category = 19, maxSpeed = 100} ]]
}

-- DO NOT MODIFY
Config.kmhValue = 3.6
Config.mphValue = 2.23694