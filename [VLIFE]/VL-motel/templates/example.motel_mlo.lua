-- EXAMPLE FOR MLO MOTEL

Config.Motel['yourmotel'] = {
    renew = '1w',
    owner = 'yourjob', -- Job name or citizenid (qb) or player identifier (esx)
    label = "Your Shiny motel",
    mlo = true,
    rent = {
        coords = vector4(43.59, -280.55, 58.12, 10.0)
    },
    -- Use target
    Target = {
        outfit = false,
        stash = true,
        logout = true
    },
    price = 3000,
    motel = {
        ["yourshiny-motel:1"] = {
            enter = vec3(43.59, -280.55, 58.12), -- door coordinates, take it from ox_doorlock db or qb-doorlock
            -- don't touch this
            locked = true,
            owned = false,
            --
            -- CREATED WITH OX LIB ZONES
            stash = {
                name = "yourshiny-motel:stash:1",
                coords = vec3(374.6, -1792.9, 29.0),
                size = vec3(1.5, 1.4, 1.0),
                rotation = 35.0,
            },
            outfit = {
                name = "yourshiny-motel:outfit:1",
                coords = vec3(373.0, -1797.0, 29.0),
                size = vec3(1, 1, 2.5),
                rotation = 39.0,
            },
            logout = {
                name = "yourshiny-motel:1:logout",
                coords = vec3(371.4, -1798.4, 29.0),
                size = vec3(0.4, 0.35, 1.0),
                rotation = 42.0,
            }
        },
        -- add more motel here
    }
}
