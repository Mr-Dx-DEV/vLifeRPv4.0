SV_CONFIG = {}

-- nil = automatic detection, number = force to use this API instead.
-- 0 = oxmysql
-- 1 = ghmattimysql
-- 2 = mysql-async
SV_CONFIG.MysqlType = nil             -- We recommend letting this as nil

SV_CONFIG.SaveStatsTime = 5           -- In minutes
SV_CONFIG.TimeToCheckAlerts = 8       -- Will check in minutes to delete alerts
SV_CONFIG.TimeToDelete = 8            -- Time in minutes after an alert to be deleted in a server cleanup
SV_CONFIG.DrawLimit = 5               -- Draw limit x job
SV_CONFIG.DaysToSaveStats = 7         -- How much days will keep the dispatch tracked the stats
SV_CONFIG.JobBlipsEnabled = true      -- Enable the job blips refs
SV_CONFIG.ItemNeededToUseRefs = false -- If you need an item to use the refs
SV_CONFIG.ItemToUseRefs = 'gps'       -- The item to use the refs

SV_CONFIG.Logs = {
    enabled = false,
    webhook =
    'https://discord.com/api/webhooks/1205899938878201919/GT_2-CqGe8j-221fesasdb5r8U3D5yGhnTc8i_K1EglXux9hfsO5CAPQnmwuSeuUM4lIiblD',
    actions = {
        alert = 'The user sent the following alert: **__ %s __**',
        unit_changed = 'The user changed their unit to **__ %s __**',
        unit_user_changed = 'The user changed the unit of a player to **__ %s __**',
        subscribe_alert = 'The user subscribed to the following alert: **__ %s __**',
        unsubscribe_alert = 'The user unsubscribed from the following alert: **__ %s __**',
        add_paint = 'The user added a paint',
        remove_paint = 'The user removed a paint',
    }
}

SV_CONFIG.RefOnFoot = true -- Enable the ref when the vehicle is on foot
SV_CONFIG.WhitelistedVehicles = {
    enabled = false,
    vehs = {
        [`police`] = true,
        [`police2`] = true,
        [`police3`] = true,
        [`police4`] = true,
        [`policeb`] = true,
    }
}

if SV_CONFIG.RefOnFoot then
    SV_CONFIG.WhitelistedVehicles.enabled = false -- It does not make sense to have this enabled if the ref is on foot too
end

SV_CONFIG.UsingPSMDT = false -- If you are using PSMDT, set this to true (ask for files to the developer of rcore_dispatch)
