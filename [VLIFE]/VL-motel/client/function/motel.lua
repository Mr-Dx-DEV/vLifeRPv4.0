local entering = false
SpawnedShell = nil
local POIOffsets = nil
local ShellZone = nil
local InsideZone = {}

---@param motel string
---@return boolean
function IsMotelOwner(motel)
    if not motel then return false end
    local config = Config.Motel[motel]
    if not config then return false end
    local identifier = Functions.GetIdentifier()
    local job = Functions.GetJob()
    if not job then return false end
    if config.owner == identifier or (config.owner == job.name and job.isboss) then
        return true
    end
    return false
end

function StartLockpick(motel, room)
    LockPickAnim()
    local res = StartMinigame()
    if res then
        TriggerServerEvent('lazy-motel:server:toggleStash', motel, room)
    end
    ClearPedTasks(PlayerPedId())
end

function RaidMotel(motel, room)
    RaidAnimation()
    local res = StartMinigame()
    if res then
        local send = lib.callback.await("lazy-motel:server:raidmotel", false, motel, room)
        Notification(send?.text, send?.type)
    end
    ClearPedTasks(PlayerPedId())
end

function KnockDoor(motel, room)
    local res = lib.callback.await("lazy-motel:server:requestknock", false, motel, room)
    if not res then
        return Notification("You already knocked this door...", "error")
    end
    local anim = lib.requestAnimDict("timetable@jimmy@doorknock@")
    TaskPlayAnim(PlayerPedId(), anim, "knockdoor_idle", 8.0, 8.0, -1, 1, 1.0, false, false, false)
    SetTimeout(2000, function()
        ClearPedTasks(PlayerPedId())
    end)
end

function OpenDoorMenu(motel, room)
    if not motel or not room then return end
    local config = Config.Motel[motel]?.motel[room]
    local job = Functions.GetJob()
    if not config then return end
    local opts = {
        {
            title = "Knock door",
            description = "Knock this door...",
            icon = "fas fa-door-open",
            onSelect = function()
                KnockDoor(motel, room)
            end
        }
    }
    if job and Config.Police[job.name] then
        opts[#opts + 1] = {
            title = "Raid",
            description = "Raid this motel",
            icon = 'fas fa-building-shield',
            onSelect = function(data)
                CreateThread(function()
                    return RaidMotel(data.motel, data.room)
                end)
            end,
            args = {
                motel = motel,
                room = room
            }
        }
    end
    lib.registerContext({
        id = 'lazy-motel-doormenu',
        title = config.label,
        options = opts
    })
    lib.showContext('lazy-motel-doormenu')
end

function ResetInside()
    if #InsideZone > 0 then
        for i, v in ipairs(InsideZone) do
            local target = CheckTargetResource()
            if v.type == 'zone' then
                v.data:remove()
            elseif v.type == 'target' then
                if target == 'qb' then
                    exports['qb-target']:RemoveZone(v.data.name)
                elseif target == 'ox' then
                    exports.ox_target:removeZone(v.data)
                end
            end
        end
        table.wipe(InsideZone)
    end
end

function EnterMotel(motel, room, isnew)
    if entering then return end
    local config = Config.Motel[motel].motel[room]
    if not config then return end
    entering = true
    Anim()
    local coords = vec3(config.enter.x, config.enter.y, config.enter.z - Config.MinZOffset)
    TriggerEvent("lazy-motel:client:onMotelEnter", motel, room)
    local data = SpawnShell(coords, Config.Motel[motel].shell or 1)
    IsInside = true
    TriggerServerEvent('lazy-motel:server:setInsideMeta', motel, room, true)
    entering = false
    SpawnedShell = data[1]
    POIOffsets = data[2]
    ShellZone = data[3]
    SetupInside(motel, room, coords)
    if isnew then
        SetTimeout(500, function()
            TriggerEvent('qb-clothes:client:CreateFirstCharacter')
        end)
    end
    NearestMotel = motel
    NearestDoor = room
end

function LeaveMotel(motel, room)
    local config = Config.Motel[motel].motel[room]
    if not config then return end
    Anim()
    local ExitCoords = config.enter
    DoScreenFadeOut(1000)
    while not IsScreenFadedOut() do
        Wait(100)
    end
    SetEntityCoords(PlayerPedId(), ExitCoords.x, ExitCoords.y, ExitCoords.z, true, false, false, false)
    SetEntityHeading(PlayerPedId(), ExitCoords?.w)
    DespawnShell(SpawnedShell, function()
        ResetInside()
        TriggerServerEvent('lazy-motel:server:setInsideMeta', motel, room, false)
        DoScreenFadeIn(500)
    end)
end

function ConvertCoords(motel, room, offset)
    local door = Config.Motel[motel].motel[room].enter
    return vec3(door.x + offset.y, door.y + offset.y, door.z - (Config.MinZOffset + offset.z))
end

function SetupInside(motel, room, coords)
    local targetconfig = Config.Motel[motel].motel[room].target or Config.Target
    local stashcoords = POIOffsets.stash
    local outfitcoords = POIOffsets.outfit
    local exitcoords = POIOffsets.exit
    local logoutcoords = POIOffsets.logout
    if targetconfig.stash then
        InsideZone[#InsideZone + 1] = {
            type = 'target',
            data = SetupTarget('shell', 'stash', {
                [1] = {
                    motel = motel,
                    room = room
                },
                [2] = {
                    name = string.format('%s:stash', room),
                    coords = vec3(coords.x + stashcoords.x, coords.y + stashcoords.y, coords.z - stashcoords.z),
                    size = ShellZone.stash.size,
                    rotation = stashcoords.h
                }
            })
        }
    elseif not targetconfig.stash then
        local function OnEnter()
            if IsKeyHolders(motel, room) then
                ShowDrawtext("[E] Open Stash  \n[G] Lock/Unlock Stash")
            else
                ShowDrawtext("[E] Open Stash")
            end
        end
        local function OnExit()
            HideDrawtext()
        end
        local function Inside()
            if IsControlJustPressed(0, 46) then
                if not Config.Motel[motel].motel[room].stash.locked then
                    Anim()
                    TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
                    Wait(100)
                    OpenMotelInventory(motel, room)
                    HideDrawtext()
                else
                    Notification(locale('error_stash_locked'))
                end
            elseif IsControlJustPressed(0, 47) then
                if not IsKeyHolders(motel, room) then
                    return Notification("You don't have the key...",
                        'error')
                end
                -- HideDrawtext()
                Anim()
                TriggerServerEvent('lazy-motel:server:toggleStash', motel, room)
            end
        end
        InsideZone[#InsideZone + 1] = {
            type = 'zone',
            data = SetupZone({
                name = string.format("%s:stash", room),
                coords = vec3(coords.x + stashcoords.x, coords.y + stashcoords.y, coords.z - stashcoords.z),
                rotation = stashcoords.h,
                size = ShellZone.stash.size
            }, {
                enter = OnEnter,
                exit = OnExit,
                inside = Inside
            })
        }
    end
    if targetconfig.outfit then
        InsideZone[#InsideZone + 1] = {
            type = 'target',
            data = SetupTarget('shell', 'outfit', {
                [1] = {
                    motel = motel,
                    room = room
                },
                [2] = {
                    name = string.format('%s:outfit', room),
                    coords = vec3(coords.x + outfitcoords.x, coords.y + outfitcoords.y, coords.z - outfitcoords.z),
                    size = ShellZone.outfit.size,
                    rotation = outfitcoords.h
                }
            })
        }
    elseif not targetconfig.outfit then
        local function OnEnter()
            ShowDrawtext("[E] Open Wardobe")
        end
        local function OnExit()
            HideDrawtext()
        end
        local function Inside()
            if IsControlJustPressed(0, 46) then
                OpenOutfitMenu()
            end
        end
        InsideZone[#InsideZone + 1] = {
            type = 'zone',
            data = SetupZone({
                name = string.format("%s:outfit", room),
                coords = vec3(coords.x + outfitcoords.x, coords.y + outfitcoords.y, coords.z - outfitcoords.z),
                rotation = outfitcoords.h,
                size = ShellZone.outfit.size
            }, {
                enter = OnEnter,
                exit = OnExit,
                inside = Inside
            })
        }
    end
    if targetconfig.exit then
        InsideZone[#InsideZone + 1] = {
            type = 'target',
            data = SetupTarget('shell', 'exit', {
                [1] = {
                    motel = motel,
                    room = room
                },
                [2] = {
                    name = string.format('%s:exit', room),
                    coords = vec3(coords.x + exitcoords.x, coords.y + exitcoords.y, coords.z + exitcoords.z),
                    size = ShellZone.exit.size,
                    rotation = exitcoords.h
                }
            })
        }
    elseif not targetconfig.exit then
        local function OnEnter()
            ShowDrawtext("[E] Exit  \n[G] Open Menu")
            InExitZone = true
        end
        local function OnExit()
            HideDrawtext()
            InExitZone = true
        end
        local function Inside()
            if IsControlJustPressed(0, 46) then
                LeaveMotel(motel, room)
                HideDrawtext()
            elseif IsControlJustPressed(0, 47) then
                OpenInsideMenu(motel, room)
            end
        end
        InsideZone[#InsideZone + 1] = {
            type = 'zone',
            data = SetupZone({
                name = string.format("%s:exit", room),
                coords = vec3(coords.x + exitcoords.x, coords.y + exitcoords.y, coords.z + exitcoords.z),
                rotation = exitcoords.h,
                size = ShellZone.exit.size
            }, {
                enter = OnEnter,
                exit = OnExit,
                inside = Inside
            })
        }
    end
    if targetconfig.logout and not Config.DisableLogout then
        InsideZone[#InsideZone + 1] = {
            type = 'target',
            data = SetupTarget('shell', 'logout', {
                [1] = {
                    motel = motel,
                    room = room
                },
                [2] = {
                    name = string.format('%s:logout', room),
                    coords = vec3(coords.x + logoutcoords.x, coords.y + logoutcoords.y, coords.z - logoutcoords.z),
                    size = ShellZone.logout.size,
                    rotation = exitcoords.h
                }
            })
        }
    end
end

function KickPerson(motel, room)
    if IsInside then
        LeaveMotel(motel, room)
    else
        local coords = Config.Motel[motel] and Config.Motel[motel].motel[room].enter
        if coords then
            SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, true, false, false, false)
        end
    end
    Notification("You've been kicked from motel", 'error')
end

function IsKeyHolders(motel, room)
    return lib.callback.await('lazy-motel:server:iskeyholders', false, motel, room)
end

--- It will return all list of your motel room
function GetPlayerRooms()
    return lib.callback.await('lazy-motel:server:getOwnedRooms', false)
end

exports('GetPlayerRooms', GetPlayerRooms)

---return table of {motel: string, room: string} if exist, nil if don't
---@param motel any
---@return {motel: string, room: string} | nil
function GetPlayerRoom(motel)
    return lib.callback.await('lazy-motel:server:getOwnedRoom', 1000, Functions.GetIdentifier(), motel)
end

exports('GetPlayerRoom', GetPlayerRoom)

function IsMotelFull(motel)
    local isfull = true
    for _, v in pairs(Config.Motel[motel].motel) do
        if not v.owned then
            isfull = false
            break
        end
    end
    return isfull
end

function RentMotel(motel, room)
    if not motel or not room then
        return {
            text = "You can't do this...",
            type = "error"
        }
    end
    if not Config.Motel[motel] or not Config.Motel[motel].motel[room] then
        return {
            text = "The motel or room that you're searching is invalid",
            type = "error"
        }
    end
    return lib.callback.await('lazy-motel:server:rentMotel', 1000, motel, room)
end

function ConvertedMotelData(motel)
    if not Config.Motel[motel] then return end
    local config = Config.Motel[motel]
    local converted = {}
    for k, v in pairs(config.motel) do
        if not v.label then
            print('bro no label', json.encode(v))
        end
        converted[#converted + 1] = {
            label = v.label,
            name = k,
            owned = v.owned,
            owner = v.owner,
            rent = v.renew,
            ownerinfo = v.ownerinfo or {}
        }
    end
    return {
        name  = motel,
        label = config.label,
        owner = config?.owner,
        price = config.price,
        rent  = config.renew or Config.Renew,
        room  = converted
    }
end

function UpdateUIData(motel)
    if NearestMotel ~= motel or not Display then return end
    SendNUIMessage({
        action = 'update-data',
        data = {
            type = 'motel',
            motel = NearestMotel
        }
    })
    SendNUIMessage({
        action = 'update-data',
        data = {
            type = 'user-motel',
            user = {
                roomname = GetPlayerRoom(NearestMotel)?.room
            }
        }
    })
end

function OpenMotelInventory(motel, room)
    if GetResourceState('ox_inventory'):match("start") then
        exports.ox_inventory:openInventory('stash', string.format('%s:%s', motel, room))
    else
        TriggerServerEvent("inventory:server:OpenInventory", "stash", string.format("%s:%s", motel, room),
            { maxweight = Config.Stash.maxweight, slots = Config.Stash.slot })
        TriggerEvent("inventory:client:SetCurrentStash", string.format("%s:%s", motel, room))
    end
end

function GetKnockRequest(motel, room)
    local res = lib.callback.await("lazy-motel:server:getknockrequest", false, motel, room)
    return res or {}
end

function GetNearByPlayers(motel, room)
    local list = lib.callback.await('lazy-motel:server:getNearbyPlayers', false, motel, room)
    return list or {}
end

function InvitePlayerIn(motel, room, target)
    local res = lib.callback.await('lazy-motel:server:requestinvite', false, motel, room, target)
    return Notification(res.text, res.type)
end

function OpenInviteMenu(motel, room)
    local origin = string.format('%s:%s', motel, room)
    local list = GetNearByPlayers(motel, room)
    if not list[1] then return Notification("There is nobody near door") end
    local converted = {}
    for _, v in ipairs(list) do
        converted[#converted + 1] = {
            title = v.name,
            description = string.format("Invite %s in", v.name),
            onSelect = function()
                CreateThread(function()
                    InvitePlayerIn(motel, room, v.id)
                end)
            end
        }
    end
    converted[#converted + 1] = {
        title = "Everyone",
        description = "Invite everyone nearby",
        onSelect = function()
            TriggerServerEvent('lazy-motel:server:inviteeveryone', motel, room)
        end
    }
    lib.registerContext({
        id = string.format('%s:%s:invite', motel, room),
        title = "Invite",
        menu = origin,
        options = converted
    })
    lib.showContext(string.format('%s:%s:invite', motel, room))
end

function OpenKnockMenu(motel, room)
    local origin = string.format("%s:%s", motel, room)
    local list = GetKnockRequest(motel, room)
    if #list < 1 then return Notification("Nobody knock the door", "error") end
    local converted = {}
    for _, v in ipairs(list) do
        converted[#converted + 1] = {
            title = v.name,
            description = string.format("Invite %s in", v.name),
            onSelect = function()
                CreateThread(function()
                    TriggerServerEvent("lazy-motel:server:clearRequest", motel, room, v.id)
                    InvitePlayerIn(motel, room, v.id)
                end)
            end
        }
    end
    lib.registerContext({
        id = string.format("%s:%s:knock", motel, room),
        title = "Invite",
        menu = origin,
        options = converted
    })
    lib.showContext(string.format("%s:%s:knock", motel, room))
end

function OpenInsideMenu(motel, room)
    local options = {}
    local knock = GetKnockRequest(motel, room)
    if knock and knock[1] then
        options[#options + 1] = {
            title = "Knock Request",
            description = "Invite annoying person that knock the door",
            onSelect = function()
                OpenKnockMenu(motel, room)
            end
        }
    end
    options[#options + 1] = {
        title = "Invite",
        description = "Invite Someone In",
        onSelect = function()
            OpenInviteMenu(motel, room)
        end
    }
    lib.registerContext({
        id = string.format('%s:%s', motel, room),
        title = "Motel Menu",
        canClose = true,
        options = options
    })
    lib.showContext(string.format('%s:%s', motel, room))
end

---@param cb function
function Waiting(cb, motel, room)
    if IsInside then
        return cb({
            text = "The player is already inside motel",
            type = 'error'
        })
    end
    ShowDrawtext("You've been invited to the room  \n[E] Accept  \n[G] Deny")
    local running = true
    CreateThread(function()
        while running do
            local pos = GetEntityCoords(PlayerPedId())
            local motelpos = Config.Motel[motel].motel[room].enter.xyz
            local dist = #(pos - motelpos)
            if dist >= 3.0 then
                return cb({
                    text = "The player is too far",
                    type = 'error'
                })
            end
            if IsControlJustPressed(0, 46) then
                running = false
                EnterMotel(motel, room)
                return cb({
                    text = 'The player has accepted your invitation',
                    type = "success"
                })
            elseif IsControlJustPressed(0, 47) then
                running = false
                return cb({
                    text = "Your invite was denied",
                    type = "error"
                })
            end
            Wait(1)
        end
    end)
    SetTimeout(10000, function()
        HideDrawtext()
        if not running then return end
        return cb({
            text = "Timeout",
            type = "error"
        })
    end)
end

lib.callback.register('lazy-motel:client:sendInvite', function(motel, room)
    local p = promise:new()
    local reply
    Waiting(function(cb)
        p:resolve(cb)
    end, motel, room)
    reply = Citizen.Await(p)
    HideDrawtext()
    return reply
end)

RegisterNetEvent('lazy-motel:client:inviteeveryone', function(motel, room)
    if not motel or not room then return end
    if IsInside or not Config.Motel[motel] then return end
    local config = Config.Motel[motel].motel[room]
    if not config then return end
    local pos = GetEntityCoords(PlayerPedId())
    local dist = #(pos - config.enter.xyz)
    if dist <= 3.0 then
        Waiting(function(cb)
            -- print(json.encode(cb))
        end, motel, room)
    end
end)
