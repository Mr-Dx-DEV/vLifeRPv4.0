-- Zones for Menus
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'false' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    police = {
        vector3(460.74, -985.61, 30.73),
    },
    ambulance = {
        vector3(-504.448, -298.596, 42.321),
    },
    cardealer = {
        vector3(-32.94, -1114.64, 26.42),
    },
    mechanic = {
        vector3(0.0, 0.0, 0.0),
    },
    catcafe = {
        vector3(-578.23, -1067.65, 26.12),
    },
    burgershort = {
        vector3(-1202.11, -896.00, 13.88),
    },
    atoms = {
        vector3(81.446, 296.326, 110.249),
    },
    urbanmechanic = {
        vector3(81.87, -1734.17, 29.61),
    },
    countymechanic = {
        vector3(1073.45, 2717.52, 38.79),
    },
}

Config.GangMenus = {
    lostmc = {
        vector3(0, 0, 0),
    },
    ballas = {
        vector3(0, 0, 0),
    },
    vagos = {
        vector3(0, 0, 0),
    },
    cartel = {
        vector3(0, 0, 0),
    },
    families = {
        vector3(0, 0, 0),
    },
}
