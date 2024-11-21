# Pug Royale.
For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.
For any of my other scripts you can purchase here: https://pug-webstore.tebex.io/category/custom-scripts

# Installation
Run the GameItems.sql before doing anything else IF YOU HAVE NOT DONE THIS FOR PAINTBALL ALREADY.
Download the island from here https://github.com/FranczeK/cayoperico-island. Credits to #FranczeK
Read through the config.lua thoroughly and adjust everything to match your server. (VERY IMPORTANT)
Make sure you have the dependencies installed. (Polyzone, qb-target OR ox_target, qb-inventory OR ox_inventory, qb-menu OR ps-ui OR ox_lib, qb-input OR ps-ui OR ox_lib)
Place the sound files provided in ["pug-battleroyale/soundfiles"] into InteractSound\client\html\sounds
for the vr headset download here and add its hat clothing number to Config.VrHeadSetPropMale and Config.VrHeadSetPropFemale https://www.gta5-mods.com/player/oculus-rift-cv1-eup

--
# Put this in qb-weathersync/client/client.lua right below [ local disable = Config.Disabled ] It Should look like this: https://i.imgur.com/D4A3xKq.png
RegisterNetEvent('Pug:client:ToggleWeatherSyncOff', function()
    disable = true
end)
RegisterNetEvent('Pug:client:ToggleWeatherSyncOn', function()
    disable = false
end)
# OR if you are using cd_easytime put this at the bottom oc cd_easytime/client.lua
RegisterNetEvent('Pug:client:ToggleWeatherSyncOff', function()
    TriggerEvent("cd_easytime:PauseSync", true)
end)
RegisterNetEvent('Pug:client:ToggleWeatherSyncOn', function()
    TriggerEvent("cd_easytime:PauseSync")
end)
--

--
# OX_INVENTORY USERS: If you are using ox_inventory you will NEED to go ox_inventory/client.lua and around line 1341 you will need to find what looks like this and replace it with this
if weaponType ~= 0 and weaponType ~= `GROUP_UNARMED` then
    if not exports["pug-battleroyale"]:IsInBattleRoyale() then
        Weapon.Disarm(currentWeapon, true)
    end
end
--

--
# OX_INVENTORY USERS: If you are using ox_inventory you will NEED to go ox_inventory/client.lua and around line 1341 you will need to find what looks like this and replace it with this
if not exports["pug-battleroyale"]:IsInBattleRoyale() then
    if not EnableWeaponWheel then
        HudWeaponWheelIgnoreSelection()
        DisableControlAction(0, 37, true)
    end
end
--

--
# (OPTIONAL) If you want the med kit and slurp juice to remove the bleeding This goes at the very bottom of qb-ambulancejob/client/wounding.lua
RegisterNetEvent("Pug:Client:StopBleeding", function()
    isBleeding = 0
end)
--

--
# (ONLY DO THIS IF YOUR QB-SMALLRESOURCES IS OLDER AND LOOKS LIKE THIS. ELSE IGNORE THIS ENTIRELY AND SKIP THIS STEP) replaces EVERYTHING in qb-smallresources/client/hudcomponents.lua and make Config.UsingNewerSmallResources false
local InRoyaleMatch = false
RegisterNetEvent('Pug:client:SmallResourcesInBattleRoyale',function()
	InRoyaleMatch = not InRoyaleMatch
end)
CreateThread(function()-- https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    while true do
		HideHudComponentThisFrame(1) -- 1 : WANTED_STARS
		HideHudComponentThisFrame(2) -- 2 : WEAPON_ICON
		HideHudComponentThisFrame(3) -- 3 : CASH
		HideHudComponentThisFrame(4) -- 4 : MP_CASH
		-- HideHudComponentThisFrame(5)			-- 5 : MP_MESSAGE
		-- HideHudComponentThisFrame(6)			-- 6 : VEHICLE_NAME
		HideHudComponentThisFrame(7) -- 7 : AREA_NAME
		-- HideHudComponentThisFrame(8)			-- 8 : VEHICLE_CLASS
		HideHudComponentThisFrame(9) -- 9 : STREET_NAME
		-- HideHudComponentThisFrame(10)		-- 10 : HELP_TEXT
		-- HideHudComponentThisFrame(11)		-- 11 : FLOATING_HELP_TEXT_1
		-- HideHudComponentThisFrame(12)		-- 12 : FLOATING_HELP_TEXT_2
		HideHudComponentThisFrame(13) -- 13 : CASH_CHANGE
		if not InRoyaleMatch then
			HideHudComponentThisFrame(14) -- 14 : RETICLE
			HideHudComponentThisFrame(19) -- 19 : WEAPON_WHEEL
			HideHudComponentThisFrame(20) -- 20 : WEAPON_WHEEL_STATS
			HideHudComponentThisFrame(21) -- 21 : HUD_COMPONENTS
			HideHudComponentThisFrame(22) -- 22 : HUD_WEAPONS
			DisableControlAction(1, 37)
		end
		-- HideHudComponentThisFrame(15)		-- 15 : SUBTITLE_TEXT
		-- HideHudComponentThisFrame(16)		-- 16 : RADIO_STATIONS
		HideHudComponentThisFrame(17) -- 17 : SAVING_GAME
		-- HideHudComponentThisFrame(18)		-- 18 : GAME_STREAM
		DisplayAmmoThisFrame(true)

		Wait(4)
    end
end)
--

--
# in youR dispatch script, search up shots fired or discharge and add this if statement where you can to remove shots fired called wile in paintball. add "if not exports["pug-battleroyale"]:IsInBattleRoyale() then" to your shots fired call.
# if you are ps dispatch fine the "CEventGunShot" handler in ps-dispatch/client/cl_eventhandlers and replace it with here here:
AddEventHandler('CEventGunShot', function(witnesses, ped)
    if exports["pug-battleroyale"]:IsInBattleRoyale() then return end -- (THIS LINE HERE WAS ADDED)
    if IsPedCurrentWeaponSilenced(cache.ped) then return end
    if inNoDispatchZone then return end
    if BlacklistedWeapon(cache.ped) then return end
        
    WaitTimer('Shooting', function()
        if cache.ped ~= ped then return end

        if PlayerData.job.type == 'leo' then
            if not Config.Debug then
                return
            end
        end

        if inHuntingZone then
            exports['ps-dispatch']:Hunting()
            return
        end

        if witnesses and not isPedAWitness(witnesses, ped) then return end

        if cache.vehicle then
            exports['ps-dispatch']:VehicleShooting()
        else
            exports['ps-dispatch']:Shooting()
        end
    end)
end)
--

--
# IF YOU ARE HAVING AN ISSUE WHERE YOUR GUN GETS PUT AWAY WHEN THE MATCH STARTS AND ARE USING QB-ANTICHEAT FIND THIS LOOP IN QB-ANTICHEAT/CLIENT/MAIN.LUA AND REPLACE IT WITH THIS
CreateThread(function()	-- Check if ped has weapon in inventory --
    while true do
        Wait(5000)

        if LocalPlayer.state.isLoggedIn and not exports["pug-battleroyale"]:IsInBattleRoyale() then

            local PlayerPed = PlayerPedId()
            local player = PlayerId()
            local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
            local WeaponInformation = QBCore.Shared.Weapons[CurrentWeapon]

            if WeaponInformation ~= nil and WeaponInformation["name"] ~= "weapon_unarmed" then
                QBCore.Functions.TriggerCallback('qb-anticheat:server:HasWeaponInInventory', function(HasWeapon)
                    if not HasWeapon then
                        RemoveAllPedWeapons(PlayerPed, false)
                        TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Weapon removed!", "orange", "** @everyone " ..GetPlayerName(player).. "** had a weapon on them that they did not have in his inventory. QB Anticheat has removed the weapon.")
                    end
                end, WeaponInformation)
            end
        end
    end
end)
--

--
# The Battle Royale utilizes the weapon wheel for weapon selection. If your inventory keybind is tab then go to your gta 5 setting, key binding and then weapons select and change the weapon wheel keybind
it look like this https://imgur.com/tuaDBmo
--

--
# Add these items to your qb-core/shared/items.lua
-- ROYALE ITEMS
["uav_royale"] 		 	 	 = {["name"] = "uav_royale",           		["label"] = "UAV",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "spyplane.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["armor1_royale"] 		 	 	 = {["name"] = "armor1_royale",           		["label"] = "Light armor",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "armor1.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["armor2_royale"] 		 	 	 = {["name"] = "armor2_royale",           		["label"] = "Medium armor",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "armor2.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["armor3_royale"] 		 	 	 = {["name"] = "armor3_royale",           		["label"] = "Heavy armor",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "armor3.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["bandage_royale"] 		 	 	 = {["name"] = "bandage_royale",           		["label"] = "Bandage",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "bandage.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["jump_royale"] 		 	 	 = {["name"] = "jump_royale",           		["label"] = "Super Jump",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "jump.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["juice_royale"] 		 	 	 = {["name"] = "juice_royale",           		["label"] = "Juice",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "bs_softdrink.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["pug_vr"] 		 	 	 		= {["name"] = "pug_vr",           		["label"] = "Vr Headset",	 		["weight"] = 2000, 		["type"] = "item", 		["image"] = "pug_vr.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 30.0,  ["description"] = "A simulation inside of a simulation."},
["rifle_ammo_royale"] 		 	 	 = {["name"] = "rifle_ammo_royale",           		["label"] = "Rifle ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "rifle_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["smg_ammo_royale"] 		 	 	 = {["name"] = "smg_ammo_royale",           		["label"] = "SMG ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["pistol_ammo_royale"] 		 	 	 = {["name"] = "pistol_ammo_royale",           		["label"] = "Pistol ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "pistol_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["shotgun_ammo_royale"] 		 	 	 = {["name"] = "shotgun_ammo_royale",           		["label"] = "Shotgun ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "shotgun_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["mg_ammo_royale"] 		 	 	 = {["name"] = "mg_ammo_royale",           		["label"] = "MG ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "mg_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["snp_ammo_royale"] 		 	 	 = {["name"] = "snp_ammo_royale",           		["label"] = "Sniper ammo",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "snp_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["armorroyale_royale"] 		 	 	 = {["name"] = "armorroyale_royale",           		["label"] = "Armor",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "armor.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
["healthroyale_royale"] 		 	 	 = {["name"] = "healthroyale_royale",           		["label"] = "Health Kit",	 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "firstaid.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil, ["created"] = nil, ["decay"] = 1.0,  ["description"] = "USED IN ROYALE ONLY."},
--


# Battle Royale.
For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.
For any of my other scripts you can purchase here: https://pug-webstore.tebex.io/category/custom-scripts

This script is using escrow encryption on only the main client.lua everything else is entirely open including the client/open.lua

PREVIEW HERE: https://youtu.be/aOvNlbYnNrc

CONFIG HERE: https://i.imgur.com/PEj17IN.png
README HERE: https://i.imgur.com/1EyEsNl.png

This completely configurable script consists of:

● Extremely extensive Config you can adjust!
● Players are placed in the games own dimension so they don't interrupt other players who are not playing the Royale in the server.
● 800+ different loot locations around the island. Configurable.
● VR headset option or ped option with a target to join the royal.
● VR headset creates a clone ped at your last position when entering the Royale and deletes when you finish the Royale.
● Loot random spawns as just ammo piles, gun and ammo piles, or just weapon/item piles. Configurable.
● A plane that brings the players in over the island, allowing them to drop where they like with multiple different random entering and exiting paths Configurable.
● UAV Killstreak reward after getting 3 kills.
● A custom ui that tracks players kills, position in the royal with updated player left as well, custom icons, icon that displays when the zone is shrinking or on cooldown.
● The custom ui fits perfectly all screen resolutions and also displays when a player has to reload or pickup loot.
● Random zones that shrink as the game proceeds and when you are outside of them a storm begins slowly killing the player. Configurable.
● A loot system that shoots all the players weapons, ammo, and items out of the player when they die for other players to pickup and loot.
● Loot removal on all players in the Royale being artificially synced when players loot an item from the ground.
● A custom gulag that players get sent to when they die on their first death. If the player wins the 1v1 gulag they get sent back into the match and the loser gets removed.
● A mechanic that makes the player only capable of having two primary weapons. Melee weapons, throwables, and other not primary type weapons do not apply and are configurable to decide on what is considered a primary.
● 6 helicopter spawn locations on the map, but only 3 helicopters spawn at a time. The script uses 3 random cards from 2 different tables to make it seem more random. Configurable.
● 62 vehicle spawn options around the island, but only 31 vehicles spawn at a time. The script uses 31 random cards from 2 different tables to make it seem more random Configurable.
● A mechanic that pickups up ammo and all none primary weapons when walking over them automatically.
● Runs at 0.0 ms resmon when not in a game and 0.03 when in a game.
● This script is completely open source other than the main client.lua.
● 0 known scuff. Was tested over and over with 10+ people to plug every issue that was found.
● Max player count is whatever your server player count is. Configurable.
● Players can choose the zone shrinking down time through the game menu, 6 options to choose from for faster or slower pace games.
● Mechanic to re-pull parachute multiple times after ejecting from the plane.
● A wager amount set to minimum $500 and maximum $25,000. Rearward at the end of the game gives 1st, 2nd, and 3rd a winning cash prized based off the amount of players X the wager X set percentage. Configurable.
● 50 weapon options and 7 different ammo options in the loot table. Configurable.
● 11 different car model options that spawn around the island. You can add as many car options as you like. Configurable.
● Custom sounds that are triggered in the Royale. (Sounds files will provide).
● Unlimited sprint. Configurable.
● The option to spectate players. Configurable.
● 7 unique Royale items that give special advantages
- Vr Headset
- UAV tablet item you can use to display a red dot on on your map that fades in and out for 30 seconds displaying the location of your enemy
- bullet proof heavy armor physical clothing vest that has 100 health and breaks after it receives enough damage
- bullet proof medium armor physical clothing vest that has 50 health and breaks after it receives enough damage
- bullet proof light armor physical clothing vest that has 20 health and breaks after it receives enough damage
- Slurp juice that regenerates health, armor, and gives a short speed boost to the player
- A Super jump item that gives the player a short 30 second super jump ability.

Requirements consist of:
QBCore
qb-menu OR ox_lib (ps-ui or any qb-menu resource name changed will work)
qb-target OR ox_target (any qb-inventory resource name changed will work)
Polyzone