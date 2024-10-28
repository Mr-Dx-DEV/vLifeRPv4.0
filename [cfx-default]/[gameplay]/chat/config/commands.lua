--[[
        Actions:
        Examples such as /me /do are found here, every command you add to actions will be ?automatically added,

        You can add extra things like /me and /do to indicate status

        Or you can add only chatMessage like ooc no drawtext, for this delete drawText table
        https://docs.uyuyorumstore.com/scripts/um-chat/addActions
    ]]
return {
    actions = {
        --[[ Default Commands: ]]
        ['me'] = {
            status = true,
            command = {
                help = 'This is a help message for /me command.',
                params = {
                    { name = 'message', type = 'longString' }
                }
            },
            distance = 5,
            showID = false,
            drawText = {
                rect = 0.025,
                z = 0.10,
                color = { r = 0, g = 0, b = 0 }
            },
            --[[ tag = {
                name = 'ME',
                background = '#fbbf24'
            }, ]]
            logs = false,
        },
        ['do'] = {
            status = true,
            command = {
                help = 'This is a help message for /do command.',
                params = {
                    { name = 'message', type = 'longString' }
                }
            },
            distance = 5,
            showID = true,
            drawText = {
                rect = 0.025,
                z = 0.30,
                color = { r = 255, g = 131, b = 129 },
            },
            tag = {
                name = 'DO',
                background = '#f87171'
            },
            logs = false,
        },
        ['ooc'] = {
            status = false,
            command = {
                help = 'This is a help message for /ooc command.',
                params = {
                    { name = 'message', type = 'longString' }
                }
            },
            distance = 15,
            showID = true,
            tag = {
                name = 'OOC',
                background = '#0ea5e9'
            },
            logs = false,
        },
        --[[ Games Commands ]]
        ['rps'] = {
            status = true,
            command = false,
            distance = 5,
            drawText = {
                font = 7,
                rect = 0.045,
                z = 0.80,
                color = { r = 0, g = 0, b = 0 }
            },
            anim = {
                dict = 'anim@mp_player_intcelebrationmale@wank',
                clip = 'wank',
                duration = 1500
            },
            message = function()
                local rpsItems = {
                    '✊ Rock',
                    '✋ Paper',
                    '✌️ Scissors'
                }
                return rpsItems[math.random(1, #rpsItems)]
            end
        },
        ['dice'] = {
            status = true,
            command = false,
            distance = 5,
            drawText = {
                font = 7,
                rect = 0.045,
                z = 0.80,
                color = { r = 0, g = 0, b = 0 }
            },
            anim = {
                dict = 'anim@mp_player_intcelebrationmale@wank',
                clip = 'wank',
                duration = 1500
            },
            message = function()
                return '🎲 ' .. math.random(1, 12)
            end
        },
        --[[ Jobs Commands: ]]
        ['emschat'] = {
            status = false,
            command = {
                help = 'This is a ems chat',
                params = {
                    { name = 'message', type = 'longString' }
                }
            },
            job = {
                name = 'ambulance',
                gradeShow = true,
                callsignShow = false,
                onlyOnDuty = true
            },
            tag = {
                name = '🚑 EMS CHAT',
                background = '#f32837'
            },
            logs = false
        },
        ['pdchat'] = {
            status = false,
            command = {
                help = 'This is a pd chat',
                params = {
                    { name = 'message', type = 'longString' }
                }
            },
            job = {
                name = 'police',
                gradeShow = true,
                callsignShow = true,
                onlyOnDuty = true
            },
            tag = {
                name = '🚨 LSPD CHAT',
                background = '#135DD8'
            },
            logs = false
        },

    },

    --[[
        Custom Commands:
        These are [not added automatically] and are your individual commands, you must create them yourself
    ]]
    customs = {
        ['pm'] = false
    }
}
