---Function that loads the client config scheme
local function loadConfig()
    for _, v in pairs(CL_CONFIG.AlertCommands) do
        if v.enabled then
            if v.anonymous then
                local args_rewrapped
                RegisterCommand(v.command, function(source, args, rawCommand)
                    if v.prepared_args then
                        args_rewrapped = v.prepared_args
                    else
                        args_rewrapped = '{distance} - ' .. table.concat(args, ' ')
                    end
                    if v.job_restricted then
                        local jobMatch = false
                        if type(v.job_restricted) == "table" then
                            for _, job in ipairs(v.job_restricted) do
                                if job == GLOBALS.CHARACTER.JOB then
                                    jobMatch = true
                                    break
                                end
                            end
                        elseif type(v.job_restricted) == "string" then
                            if v.job_restricted == GLOBALS.CHARACTER.JOB then
                                jobMatch = true
                            end
                        end

                        if not jobMatch then
                            return
                        end
                    end
                    PrepareAlert(args_rewrapped, v.job,
                        {
                            code = v.code,
                            default_priority = v.default_priority,
                            sos = v.sos,
                            blip_time = v.blip_time or nil,
                            custom_sound = v.custom_sound or nil
                        },
                        v.blip or nil)
                end)
            else
                local args_rewrapped
                RegisterCommand(v.command, function(source, args, rawCommand)
                    if v.prepared_args then
                        args_rewrapped = v.prepared_args
                    else
                        args_rewrapped = FRAMEWORK.GetPlayerName() ..
                            ' ' .. FRAMEWORK.GetPlayerLastname() .. ' -' .. ' {distance} - ' .. table.concat(args, ' ')
                    end
                    if v.job_restricted then
                        local jobMatch = false
                        if type(v.job_restricted) == "table" then
                            for _, job in ipairs(v.job_restricted) do
                                if job == GLOBALS.CHARACTER.JOB then
                                    jobMatch = true
                                    break
                                end
                            end
                        elseif type(v.job_restricted) == "string" then
                            if v.job_restricted == GLOBALS.CHARACTER.JOB then
                                jobMatch = true
                            end
                        end

                        if not jobMatch then
                            return
                        end
                    end
                    PrepareAlert(args_rewrapped, v.job,
                        {
                            code = v.code,
                            default_priority = v.default_priority,
                            sos = v.sos,
                            blip_time = v.blip_time or nil,
                            custom_sound = v.custom_sound or nil
                        },
                        v.blip or nil)
                end)
            end
        end
    end
    for command_type, v in pairs(CL_CONFIG.UtilityCommands) do
        if v.enabled then
            if command_type == 'toggle_switchboard' then
                RegisterCommand(v.command, function(source, args, rawCommand)
                    ToggleSwitchboard()
                end)
            elseif command_type == 'open_nui_map' then
                RegisterCommand(v.command, function(source, args, rawCommand)
                    OpenNuiMap()
                end)
            elseif command_type == 'switchboard_config' then
                RegisterCommand(v.command, function(source, args, rawCommand)
                    OpenSwitchBoardConfig()
                end)
            end
        end
    end
end

CreateThread(loadConfig)
