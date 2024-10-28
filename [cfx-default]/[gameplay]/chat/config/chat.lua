return {
    debug = false,            -- If you want to see the debug information, set this to true.

    framework = 'qbox', -- standalone, qbox, qb-core, es_extended

    commandGeneral = {
        forwardSlash = '/', -- If you want to use a different character for commands, you can change it here.
        onlyCommand = {
            status = true,  -- If you want to use only commands, set this to true, or like text chat using set false
            executeChat = 'ooc',
        }
    },

    clearCommand = 'clearchat', -- If you want to clear the chat, you can use this command.

    chatLogs = {
        joinLeave = {
            status = true,                 -- If you want to save the join and leave logs, set this to true.
            firstMessageShowWindow = false, -- If you want to send a message to the player when they first join or leave the server, set this to true.
        },
        generalChat = {
            status = false, -- If you want to save the general chat logs, set this to true.
        }
    },

    adminChat = {
        status = true,         -- If you want to use the admin chat, set this to true.
        command = {
            name = 'staffchat', -- If you want to use a different command for the admin chat, you can change it here.
            help = 'Open Staff Chat',
        },
        -- If you want to use a different key for the admin chat, you can change it here.
        -- If dont work check ESC > Settings > Keybindings > FiveM > chat
        key = 'F4',
        permission = 'group.mod', -- If you want to use a different permission for the admin chat, you can change it here.
    }
}
