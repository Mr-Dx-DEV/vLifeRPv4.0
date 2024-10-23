Config = {}

-- target resource (only one of these can be true)
-------------------------------------------------------
Config.qbtarget = false  
Config.oxtarget = true  
-------------------------------------------------------


Config.pedmodel = 'a_m_m_prolhost_01' -- ped model hash

Config.scenario = 'WORLD_HUMAN_CLIPBOARD' -- scenario for ped to play, false to disable

Config.locations = {
    ['prison'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(1852.1954, 2582.2512, 45.6726, 273.8113),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['faggio2']        = {     -- vehicle model name
                price = 250,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/g2fjfemllvp7.png',      -- image for menu, false for no image
            },
            ['asea']        = {     -- vehicle model name
                price = 500,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/kz4ux1p26i00.png',      -- image for menu, false for no image
            },
            ['bison']       = {
                price = 1500, 
                image = 'https://r2.fivemanage.com/pub/dipuei15tglu.png',
            },
            ['patriot']     = {
                price = 2000, 
                image = 'https://r2.fivemanage.com/pub/rl6l5426npnb.png',
            },

        },

        vehiclespawncoords = vector4(1854.62, 2578.74, 45.67, 267.22), -- where vehicle spawns when rented

    },
    ['community'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-1048.33, 4914.68, 209.21, 201.5),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['faggio2']        = {     -- vehicle model name
                price = 250,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/g2fjfemllvp7.png',      -- image for menu, false for no image
            },
            ['asea']        = {     -- vehicle model name
                price = 500,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/kz4ux1p26i00.png',      -- image for menu, false for no image
            },
            ['bison']       = {
                price = 1500, 
                image = 'https://r2.fivemanage.com/pub/dipuei15tglu.png',
            },
            ['patriot']     = {
                price = 2000, 
                image = 'https://r2.fivemanage.com/pub/rl6l5426npnb.png',
            },

        },

        vehiclespawncoords = vector4(-1051.68, 4905.49, 210.41, 298.27), -- where vehicle spawns when rented

    },


    ['paleto'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-214.48, 6355.65, 31.49, 136.78),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['faggio2']        = {     -- vehicle model name
                price = 250,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/g2fjfemllvp7.png',      -- image for menu, false for no image
            },
            ['asea']        = {     -- vehicle model name
                price = 500,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/kz4ux1p26i00.png',      -- image for menu, false for no image
            },
            ['bison']       = {
                price = 1500, 
                image = 'https://r2.fivemanage.com/pub/dipuei15tglu.png',
            },
            ['patriot']     = {
                price = 2000, 
                image = 'https://r2.fivemanage.com/pub/rl6l5426npnb.png',
            },

        },

        vehiclespawncoords = vector4(-217.8561, 6348.7910, 31.6978, 222.4448), -- where vehicle spawns when rented

    },


    ['airport'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-1038.788, -2729.27, 20.169, 333.179),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['faggio2']        = {     -- vehicle model name
                price = 250,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/g2fjfemllvp7.png',      -- image for menu, false for no image
            },
            ['asea']        = {     -- vehicle model name
                price = 500,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/kz4ux1p26i00.png',      -- image for menu, false for no image
            },
            ['bison']       = {
                price = 1500, 
                image = 'https://r2.fivemanage.com/pub/dipuei15tglu.png',
            },
            ['patriot']     = {
                price = 2000, 
                image = 'https://r2.fivemanage.com/pub/rl6l5426npnb.png',
            },

        },

        vehiclespawncoords = vector4(-1022.88, -2736.541, 20.073, 238.928), -- where vehicle spawns when rented

    },


    ['legion'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(109.361, -1089.839, 29.302, 346.365),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['faggio2']        = {     -- vehicle model name
                price = 250,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/g2fjfemllvp7.png',      -- image for menu, false for no image
            },
            ['asea']        = {     -- vehicle model name
                price = 500,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/kz4ux1p26i00.png',      -- image for menu, false for no image
            },
            ['bison']       = {
                price = 1500, 
                image = 'https://r2.fivemanage.com/pub/dipuei15tglu.png',
            },
            ['patriot']     = {
                price = 2000, 
                image = 'https://r2.fivemanage.com/pub/rl6l5426npnb.png',
            },

        },

        vehiclespawncoords = vector4(104.49, -1078.84, 29.19, 339.46), -- where vehicle spawns when rented

    },
    ['cayo'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(4518.665, -4510.953, 4.509, 36.288),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['faggio2']        = {     -- vehicle model name
                price = 250,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/g2fjfemllvp7.png',      -- image for menu, false for no image
            },
            ['asea']        = {     -- vehicle model name
                price = 500,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/pub/kz4ux1p26i00.png',      -- image for menu, false for no image
            },
            ['bison']       = {
                price = 1500, 
                image = 'https://r2.fivemanage.com/pub/dipuei15tglu.png',
            },
            ['patriot']     = {
                price = 2000, 
                image = 'https://r2.fivemanage.com/pub/rl6l5426npnb.png',
            },

        },

        vehiclespawncoords = vector4(4552.666, -4487.801, 3.726, 284.086), -- where vehicle spawns when rented

    },

}

