Config = {
    ReplaceApartment = true,
    Renew = '1w',
    DisableLogout = true,
    -- Wipe inventory when expire
    WipeOnExpire = false,
    OxDoorlock = true,
    -- Set Max Room (max motel to rent, if it's nil, then it doesn't affect anything...)
    MaxRooms = nil,
    Logs = true,
    KeyLimit = 3,
    Stash = {
        slot = 80,
        maxweight = 500000,
        -- it mean only the owner can unlock the stash
        owneronly = true
    },
    Icon = {
        stash = 'fas fa-briefcase',
        outfit = 'fas fa-tshirt',
        logout = 'fas fa-user',
        motel = 'fas fa-home',
        lock = 'fas fa-lock',
        unlock = 'fas fa-lock-open',
        lock_door = 'fas fa-door-closed',
        unlock_door = 'fas fa-door-open',
        inside_menu = 'fas fa-hand',
        exit = 'fas fa-door-open'
    },
    Police = {
        ['police'] = true
    },
    DebugPoly = false,
    Target = {
        stash = true,
        logout = true,
        outfit = true,
        exit = true,
        ped = true
    },
    MinZOffset = 30,
    Motel = {}
}
