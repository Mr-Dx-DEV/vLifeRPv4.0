local botSettings = {
    name = 'NukeXD Logs',
    image = 'https://r2.fivemanage.com/pub/x4qrwwtulw5j.gif'
}

local webhooks = {
    -- actions
    ['me'] = 'https://discord.com/api/webhooks/1292969982656905328/_maIeXKXRNa9xhOksIxbskyjznvswA00uYNm6sTSLv7aW-YE6RC4CZfBn067Hh2tHuYM',
    ['do'] = '',
    ['ooc'] = '', -- general text chat and ooc

    -- jobs
    ['emschat'] = '',
    ['pdchat'] = '',

    -- Other
    ['generalChat'] = '', -- right side chat

    -- Login
    ['join-leave'] = 'https://discord.com/api/webhooks/1292969906588881039/VtquKqdd0e7bk6gjw-Ui4v7yniAVm55AjWDmyRzUIKLHnO9AliHRsgRrNetsr5jPrhyn',
}

local colors = {
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ['lightgreen'] = 65309,
}

---@param src string
---@param type string
---@return string
local function getIdentifier(src, type)
    local identifier = GetPlayerIdentifierByType(src, type) or 'unknown'
    return identifier:gsub(type .. ':', '') or identifier
end

---@param src string
local function userInformation(src)
    local information =
        '### 👤 User Information' .. '\n' ..
        '**[id]: **' .. tostring(src) .. '\n' ..
        '**[name]: **' .. GetPlayerName(src) .. '\n' ..
        '**[discord]: ** ||' .. getIdentifier(src, 'discord') .. '||\n' ..
        '**[steam]: ** ||' .. getIdentifier(src, 'steam') .. '||\n' ..
        '**[license]: ** ||' .. getIdentifier(src, 'license') .. '||\n' ..
        '**[license2]: ** ||' .. getIdentifier(src, 'license2') .. '||\n'

    return information
end

---@param data table
local function sendWebHook(data)
    local timestamp = os.date("%c")

    local message = {
        {
            ["color"] = data.color,
            ["title"] = data.title,
            ["description"] = "" .. data.message .. "",
            ["footer"] = {
                ["text"] = timestamp .. ' | version 1.5.0',
                ["icon_url"] = botSettings.image,
            },
        }
    }

    local jsonData = json.encode({ username = botSettings.name, avatar_url = botSettings.image, embeds = message })

    PerformHttpRequest(data.link, function(_, _, _)
    end, 'POST', jsonData, { ['Content-Type'] = 'application/json' })
end

---@param src string
---@param type string
---@param command string
---@param colorType string
RegisterNetEvent('um-chat:server:logs:addLogs', function(src, type, command, colorType)
    if webhooks[type] == '' or webhooks[type] == nil then return end
    local data = {
        link = webhooks[type],
        title = '📌 [' .. type .. ']',
        color = colors[colorType] or 655104,
        message = userInformation(src or source) .. '### 💬 Message \n ### ' .. command .. ' \n'
    }

    sendWebHook(data)
end)
