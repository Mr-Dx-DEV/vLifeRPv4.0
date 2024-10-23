
Config = {}

------------------------------------------------------------------------------------------------------------------
---------------------------------------------- Framework Settings ------------------------------------------------

-- Framework
Config.Framework = "qbcore" -- Set you framework "qbcore" or "esx" or "" if you use standalone framework

-- QBCore Framework
Config.QBCoreName = "qb-core" -- You QBCore script name must be correct to work (only if you use QBCore Framework)

-- ESX Framework
Config.IsESXLegacy = false -- Set it true is you're using esx legacy (only if you use ESX Framework)
Config.ESXLegacyName = "es_extended" -- You ESX Legacy script name must be correct to work (only if you use ESX Legacy Framework)

-- Standalone Framework
Config.TortureSceneCommand = "torture_kit" -- You can use this command in a standalone framework. You can find this command code in the client/main.lua file and you can make some changes on it 

-- Torture Kit Item
Config.TortureKitItem = "torture_kit" -- Torture Kil item for inventory item usage. Pre-configured in server/main.lua file for QBCore and ESX frameworks

------------------------------------------------------------------------------------------------------------------
---------------------------------------------- Framework Settings ------------------------------------------------

-- Spawner Controls
Config.Controls = { -- FiveM Controls: https://docs.fivem.net/docs/game-references/controls/
	Spawn				= 24,	-- W for Qwerty / Z for Azerty
	Cancel				= 25,	-- S
	RotateLeft			= 174,	-- A for Qwerty / Q for Azerty
	RotateRight			= 175,	-- D
}

------------------------------------------------------------------------------------------------------------------
------------------------------------------------- Translation ----------------------------------------------------

Config.Transition = {
	-- Spawner
	['spawner_title']   	    		= 'Toture Kit Spawner',
	['spawner_spawn']      		    	= 'Spawn',
	['spawner_cancel']  	        	= 'Cancel',
	['spawner_rotate'] 	           		= 'Rotate',
	
	-- Notification
	['notif_you_went_far']				= 'You went far away from the torture scene',
	['notif_cant_tort_yourself']		= 'You can\'t torture yourself',
	['notif_you_already_in_tort']		= 'You are already in torture scene',
	['notif_other_already_in_tort']		= 'Target player already in torture scene',
	
	-- Interaction UI
	
	['inter_select_player']				= 'Select Player',
	['inter_remove_tort_kit']			= 'Remove Torture Kit',
	['inter_select_tort_scene']			= 'Select Torture Scene',
	['inter_end_tort_player']			= 'End Torture Player',
	['inter_closest_players']			= 'Closest Players:',
	
	-- Scenes UI
	['scene_wrench']					= 'Wrench',
	['scene_syringe']					= 'Syringe',
	['scene_waterboard']				= 'Waterboard',
	['scene_pulltooth']					= 'Tooth Pulling',
	['scene_electrocute']				= 'Electrocute',
	
	['scene_attack_left']				= 'Attack Left',
	['scene_attack_mid']				= 'Attack Middle',
	['scene_attack_right']				= 'Attack Right',
	
	['scene_drown_player']				= 'Drown Player',
	['scene_stop_drown']				= 'Stop Drown',
	
	['scene_pull_player_tooth']			= 'Pull Player Tooth',
	['scene_pull_tooth']				= 'Pull Tooth',
	
	['scene_elect_left']				= 'Electrocute Left',
	['scene_elect_both']				= 'Electrocute Both',
	['scene_elect_right']				= 'Electrocute Right',
	['scene_elect_spark']				= 'Electrocute Spark',
	['scene_stop_elect']				= 'Stop Electrocute',
	
	['scene_exit']						= 'Exit Scene',
}