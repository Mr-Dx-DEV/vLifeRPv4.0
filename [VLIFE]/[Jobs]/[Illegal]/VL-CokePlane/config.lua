Config = {}
Config.Locale = 'en' -- English, German or Spanish - (en/de/es)

Config.useMythic = false -- change this if you want to use mythic_notify or not
Config.progBar = true -- change this if you want to use Progress Bar or not
Config.useCD = true -- change this if you want to have a global cooldown or not
Config.cdTime = 600000 -- global cooldown in ms. Set to 20 minutes by default - (https://www.timecalculator.net/minutes-to-milliseconds)
Config.doorHeading = 290.98 -- change this to the proper heading to look at the door you start the runs with
Config.price = 2000 -- amount you get after the run 
Config.amount = 2000 --amount you have to pay to start a run 
Config.cokeTime = 60000 -- time in ms the effects of coke will last for
Config.pickupTime = 5000 -- time it takes to pick up the delivery 
Config.randBrick = math.random(1,2) -- change the numbers to how much coke you want players to receive after breaking down bricks
Config.takeBrick = 1 -- amount of brick you want to take after processing
Config.getCoords = false -- gets coords with /mycoords
Config.pilotPed = "s_m_m_pilot_02" -- change this to have a different ped as the planes pilot - (lsit of peds: https://wiki.rage.mp/index.php?title=Peds)
Config.landPlane = true -- change this if you want the plane to fly and land or if it should spawn on the ground

Config.locations = {
	[1] = {
		fuel = {x = 4491.63, y = -4499.82, z = 4.19}, -- location of the jerry can/waypoint
		landingLoc = {x = 4491.63, y = -4499.82, z = 4.19}, -- don't mess with this unless you know what you're doing
		plane = {x = 4491.63, y = -4499.82, z = 4.19, h = 25.8}, -- don't mess with this unless you know what you're doing
		runwayStart = {x = 1709.604, y = 3251.045, z = 41.03549}, -- don't mess with this unless you know what you're doing
		runwayEnd = {x = 1064.045, y = 3076.735, z = 41.16898}, -- don't mess with this unless you know what you're doing
		fuselage = {x = 1729.039, y = 3311.423, z = 41.2235}, -- location of the 3D text to fuel the plane
		stationary = {x = 4491.63, y = -4499.82, z = 4.19, h = 25.8}, -- location of the plane if Config.landPlane is false
		delivery = {x = -1600.19, y = -3911.5, z = 1.14}, -- delivery location vector3(-974.6, -3551.73, 13.96)
		hangar = {x = 4521.69, y = -4473.44, z = 4.18}, -- end location
		parking = {x = 4491.63, y = -4499.82, z = 4.19}, -- don't mess with this unless you know what you're doing
	},
	[2] = {
		fuel = {x = 4491.63, y = -4499.82, z = 4.19}, -- location of the jerry can/waypoint
		landingLoc = {x = 4491.63, y = -4499.82, z = 4.19}, -- don't mess with this unless you know what you're doing
		plane = {x = 4491.63, y = -4499.82, z = 4.19, h = 25.8}, -- don't mess with this unless you know what you're doing
		runwayStart = {x = 1709.604, y = 3251.045, z = 41.03549}, -- don't mess with this unless you know what you're doing
		runwayEnd = {x = 1064.045, y = 3076.735, z = 41.16898}, -- don't mess with this unless you know what you're doing
		fuselage = {x = 1729.039, y = 3311.423, z = 41.2235}, -- location of the 3D text to fuel the plane
		stationary = {x = 4491.63, y = -4499.82, z = 4.19, h = 25.8}, -- location of the plane if Config.landPlane is false
		delivery = {x = 3137.53, y = -1433.33, z = 2.45}, -- delivery location vector3(-974.6, -3551.73, 13.96)
		hangar = {x = 4521.69, y = -4473.44, z = 4.18}, -- end location
		parking = {x = 4491.63, y = -4499.82, z = 4.19}, -- don't mess with this unless you know what you're doing
	},


}