Config = {}
Config.Debug = true

Config.Framework = "qb" -- esx, qb, or custom. default: auto

Config.InteractStyle = "ox_target" -- target or press (target works with qtarget, qb-target & ox_target)
Config.InputSystem = "ox_lib" -- default (gta v), ox_lib or framework
Config.MenuSystem = "ox_lib" -- ox_lib or framework
Config.NotificationSystem = "ox_lib" -- default (gta v), ox_lib or framework

Config.PricePerSecond = 3
Config.NoAnswerTimeout = 15 -- how long (seconds) until cancelling a call if no answer (max 30, min 5)
Config.CompanyCalls = true -- allow company calls? e.g calls to police
Config.ReplaceModels = true -- replace payphone models when in a call (to make a good animation?), if set to false a normal phone animation will be used

Config.LocationLocked = false -- only allow using specific payphones? can be set to an array of vector3 locations, see below
-- Config.LocationLocked = {
--     vector3(819.37396240234, -93.475769042969, 79.576477050781),
--     vector3(819.02301025391, -94.034393310547, 79.576477050781)
-- }

Config.Models = {
    `prop_phonebox_01b`,
    `p_phonebox_01b_s`,
    `prop_phonebox_01a`
}
