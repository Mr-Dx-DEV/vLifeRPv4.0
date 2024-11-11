CL_CONFIG = {}
CL_CONFIG.EnableInfoContainer = false        -- Enable an small info container at the bottom of the screen
CL_CONFIG.InfoContainerVerticalPosition = 50 -- The vertical position of the info container in pixels
CL_CONFIG.EnableUnitOnHeader = true          -- Enable the unit on the header of the dispatch

-- Priority 'low', 'medium' or 'high'
-- Car robbery, shop robbery and bank robbery can be found inside client/api/alert_handlers.lua
CL_CONFIG.AlertCommands = {
    {
        command = '911',
        job = { 'police' },
        code = '10-13',
        default_priority = 'medium',
        enabled = true,
        anonymous = false,
    },
    {
        command = 'anon911',
        job = { 'police' },
        code = '10-13',
        default_priority = 'medium',
        enabled = true,
        anonymous = true,
    },
    {
        command = 'sos',
        code = 'P2',
        job = { 'police', 'ambulance' },
        prepared_args = 'A officer is in need of assistance, please come as fast as possible.',
        default_priority = 'high',
        enabled = true,
        anonymous = true,
        blip_time = 5,
        -- job_restricted = 'police',  or { 'police', 'ambulance' } (optional)
        sos = true,
        blip = { -- Optional parameter to override the default blip
            sprite = 84,
            colour = 3,
            scale = 0.7,
            flashes = true,
            text = '10-13 - Officer in distress',
        }
    },
    {
        command = 'emergency',
        code = 'P2',
        job = { 'police', 'ambulance' },
        default_priority = 'high',
        enabled = true,
        anonymous = false,
    }
}

CL_CONFIG.MaxDrawVertices = 10             -- The max amout of vertices that a single draw can have
CL_CONFIG.SubscribeAlertWithoutUnit = true -- With this enabled, if you are not in a unit the alert will be marked in the map
CL_CONFIG.DispatchRouteColor = 1           -- The color of the route in the dispatch map


CL_CONFIG.GunshotAlerts = {
    enabled = true,
    near_peds = {
        enabled = true,
        distance = 50.0
    },
    whitelisted_jobs = {
        'police'
    },
    areas = {
        { coords = vector3(2170.38, 2749.54, 45.27), radius = 20 }
    },
    whitelisted_weapons = {
        [`WEAPON_FLARE`] = true,
        [`WEAPON_FLAREGUN`] = true,
        [`WEAPON_PETROLCAN`] = true,
        [`WEAPON_STUNGUN`] = true,
        [`WEAPON_FIREEXTINGUISHER`] = true,
    },
    labels = {
        [`WEAPON_ASSAULTRIFLE`] = 'AK-47',
        [`WEAPON_BULLPUPRIFLE`] = 'Bullpup Rifle',
        [`WEAPON_COMBATPISTOL`] = 'Combat Pistol',
        [`WEAPON_CARBINERIFLE`] = 'Carbine Rifle',
        [`WEAPON_PISTOL`] = 'Pistol',
        [`WEAPON_CARBINERIFLE_MK2`] = 'Carbine Rifle mk2',
        [`WEAPON_HEAVYPISTOL`] = 'Heavy Pistol',
        [`WEAPON_MICROSMG`] = 'Mini Uzi',
        [`WEAPON_MUSKET`] = 'Musket Rifle',
    },
}

CL_CONFIG.UtilityCommands = {
    ['toggle_switchboard'] = {
        command = 'dispatch',
        enabled = true,
    },
    ['open_nui_map'] = {
        command = 'panel',
        enabled = true,
    },
    ['switchboard_config'] = {
        command = 'config_switch',
        enabled = true,
    }
}


CL_CONFIG.EnableRadioOnPanel = true  -- Enable the radio on the panel
CL_CONFIG.HideIfNoAlerts = false     -- Hide the dispatch if there are no alerts
CL_CONFIG.AlertSound = true          -- Enable the alert sound
CL_CONFIG.CanBeFixed = true          -- When a user joins an alert, the alert will be fixed in the switchboard
CL_CONFIG.MoveOnConfigSwitch = true  -- Move when opening the fast access tab in the dispatch
CL_CONFIG.SetAlsoUnit = true         -- Set the unit when setting the radio from the fast access tab in the dispatch
CL_CONFIG.CarRobberyPicture = true   -- Enable car robbery picture (if you have screenshot-basic resource)
CL_CONFIG.UsingMilesPerHour = false  -- If you are using miles per hour, set this to true
CL_CONFIG.EnableRadioOnAssign = true -- Enable radio on assignation
CL_CONFIG.RadioAsItem = false        -- Enable the radio as an item
CL_CONFIG.RadioItemName = 'radio'    -- The name of the radio item (string or table)
CL_CONFIG.RemoveNormalMarker = true  -- Remove the normal marker when a user removes from an alert
CL_CONFIG.OpenPanelWithItem = false  -- Open the dispatch panel with an item
CL_CONFIG.ItemToOpenPanel = 'panel'  -- The item that will open the dispatch panel
CL_CONFIG.EnableTimeAgo = true       -- Enable the time ago in the alerts

-- This webhook is not a problem for hackers, as it is an irrelevant webhook used to uploading pictures.
-- You can use this webhook or use your own webhook (if you use your own, create an special channel for it and mute it)
CL_CONFIG.CarRobberyPictureWebhook =
'https://discord.com/api/webhooks/1205899938878201919/GT_2-CqGe8j-221feb5r8U3D5yGhnTc8i_K1EglXux9hfsO5CAPQnmwuSeuUM4lIiblD'



CL_CONFIG.AudioConfirmations = {
    ['own_frequency_changed'] = {
        enabled = true,
        url = ''
    },
    ['someone_joined_frequency'] = {
        enabled = true,
        url = ''
    },
    ['someone_left_frequency'] = {
        enabled = true,
        url = ''
    },
}

-- Custom suggestions
TriggerEvent('chat:addSuggestion', '/911', 'Call emergency services', {
    { name = 'report', help = 'Type your emergency report' }
})

TriggerEvent('chat:addSuggestion', '/anon911', 'Call emergency services anonymously', {
    { name = 'report', help = 'Type your emergency report' }
})

TriggerEvent('chat:addSuggestion', '/sos', 'Ask for help')

TriggerEvent('chat:addSuggestion', '/vehrob', 'Report a vehicle robbery', {})

TriggerEvent('chat:addSuggestion', '/panel', 'Open the dispatch panel', {})

TriggerEvent('chat:addSuggestion', '/config_switch', 'Open the dispatch configuration panel', {})

TriggerEvent('chat:addSuggestion', '/dispatch', 'Toggle the dispatch switchboard', {})

KEYS = {
    ['ESC'] = 322,
    ['F1'] = 288,
    ['F2'] = 289,
    ['F3'] = 170,
    ['F5'] = 166,
    ['F6'] = 167,
    ['F7'] = 168,
    ['F8'] = 169,
    ['F9'] = 56,
    ['F10'] = 57,
    ['~'] = 243,
    ['1'] = 157,
    ['2'] = 158,
    ['3'] = 160,
    ['4'] = 164,
    ['5'] = 165,
    ['6'] = 159,
    ['7'] = 161,
    ['8'] = 162,
    ['9'] = 163,
    ['-'] = 84,
    ['='] = 83,
    ['BACKSPACE'] = 177,
    ['TAB'] = 37,
    ['Q'] = 44,
    ['W'] = 32,
    ['E'] = 38,
    ['R'] = 45,
    ['T'] = 245,
    ['Y'] = 246,
    ['U'] = 303,
    ['P'] = 199,
    ['['] = 39,
    [']'] = 40,
    ['ENTER'] = 18,
    ['CAPS'] = 137,
    ['A'] = 34,
    ['S'] = 8,
    ['D'] = 9,
    ['F'] = 23,
    ['G'] = 47,
    ['H'] = 74,
    ['K'] = 311,
    ['L'] = 182,
    ['LEFTSHIFT'] = 21,
    ['Z'] = 20,
    ['X'] = 73,
    ['C'] = 26,
    ['V'] = 0,
    ['B'] = 29,
    ['N'] = 249,
    ['M'] = 244,
    [','] = 82,
    ['.'] = 81,
    ['LEFTCTRL'] = 36,
    ['LEFTALT'] = 19,
    ['SPACE'] = 22,
    ['RIGHTCTRL'] = 70,
    ['HOME'] = 213,
    ['PAGEUP'] = 10,
    ['PAGEDOWN'] = 11,
    ['DELETE'] = 178,
    ['LEFT'] = 174,
    ['RIGHT'] = 175,
    ['TOP'] = 27,
    ['DOWN'] = 173,
    ['NENTER'] = 201,
    ['N4'] = 108,
    ['N5'] = 60,
    ['N6'] = 107,
    ['N+'] = 96,
    ['N-'] = 97,
    ['N7'] = 117,
    ['N8'] = 61,
    ['N9'] = 118,
}

CL_CONFIG.Controls = { -- We recommend using keymapping instead of this
    next_alert = 'RIGHT',
    prev_alert = 'LEFT',
    accept_alert = 'DOWN',
    switch_config = 'F10'
}

CL_CONFIG.Colors = {
    { { 100, 5, 20 },  'RED' },
    { { 0, 57, 255 },  'BLUE' },
    { { 255, 143, 0 }, 'ORANGE' },
    { { 255, 251, 0 }, 'YELLOW' },
    { { 199, 0, 255 }, 'PINK' }
}


CL_CONFIG.UsingKeyMapping = true

RegisterKeyMapping('dispatch_next_alert', 'Dispatch next alert', 'keyboard', 'RIGHT')
RegisterKeyMapping('dispatch_previous_alert', 'Dispatch previous alert', 'keyboard', 'LEFT')
RegisterKeyMapping('dispatch_select_alert', 'Dispatch select alert', 'keyboard', 'DOWN')
RegisterKeyMapping(CL_CONFIG.UtilityCommands['switchboard_config'].command, 'Open switchboard configuration', 'keyboard',
    'f10')

CL_CONFIG.AutoCarRobbery = false
