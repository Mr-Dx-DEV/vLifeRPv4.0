wx = {}

-- [ Basic Webhook Settings ]
wx.Webhook = 'https://discord.com/api/webhooks/1275186244921331843/JDERKmQL2BAAZe26nu25z4Jt2E0lLJy9u83C4HUDIrMi60Yh9Q383lFACawfDR4zg-bH' -- Webhook for logging
wx.WebhookUsername = '[vLife] TX Logs' -- Username of the webhook
wx.WebhookAvatar = 'https://cdn.discordapp.com/attachments/1115357914719338557/1115379557814505472/standard_3.gif' -- Image link (png, jpg, gif)


-- [ Color Settings ]

wx.Warn = 16744192 -- integer value - Use https://www.spycolor.com/
wx.Kick = 65535 -- integer value - Use https://www.spycolor.com/
wx.Ban = 16711680 -- integer value - Use https://www.spycolor.com/
wx.Heal = 65280 -- integer value - Use https://www.spycolor.com/
wx.Announcement = 8421504 -- integer value - Use https://www.spycolor.com/
wx.Restart = 16776960 -- integer value - Use https://www.spycolor.com/
wx.DM = 13938487 -- integer value - Use https://www.spycolor.com/
wx.Revoked = 255 -- integer value - Use https://www.spycolor.com/
wx.Whitelist = 255 -- integer value - Use https://www.spycolor.com/

-- [ Locale Settings ]

wx.Locale = {
    -- Webhook Titles
    RestartingNow = "Server is restarting NOW!",
    Restarting = "🔁 Server is restarting soon!",
    DM = "💬 Direct Message",
    Revoked = "⏪ Action Revoked",
    Kicked = "🚫 Player has been kicked",
    Warned = "❗ Player has been warned",
    Banned = "❌ Player has been banned",
    Heal = "🏥 Admin Heal",
    Announcement = "🔔 New server announcement",
    Whitelist = "📃 Whitelist Updated",

    -- Fields
    Permanent = "PERMANENT",
    MinutesRemaining = "Minutes Remaining",
    AdminName = "Admin Name",
    RevokedBy = "Revoked By",
    Target = "Target Player",
    Reason = "Reason",
    Ids = "Target Identifiers",
    Expiration = "Ban Expiration",
    BanID = "Ban ID",
    Announcer = "Announcer",
    Message = "Message",
    Type = "Action Type",
    License = "Player License",

    -- Other
    NotFound = "Not Found", -- When identifier is not found
    Ban = "Ban",
    Warn = "Warning"
}