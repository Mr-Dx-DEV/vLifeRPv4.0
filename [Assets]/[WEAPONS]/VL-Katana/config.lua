Config = {}

Config.framework = "qb-core" -- qb-core, Any other option here will go into custom mode where you can use your own functions

Config.itemNames = {"WEAPON_KATANA_R", "weapon_katana_b" , "weapon_katana_y", "weapon_katana_g"} -- DONT CHANGE THIS, its based on the model name.

Config.particles = true -- show particles

Config.particlesTime = 8 -- seconds

Config.propParticles = { -- particle table, you can change scale, move the particle or change the particle completely to something else
    -- these are based on the back item model name not on the weapon model name
    ["kizu_KATANA_Y"] = {pfxDict = "core", pfxName = "fire_petroltank_bike", scale = 0.3, offx = 0.05, offy = -0.02, offz = 0.12},
	["kizu_KATANA_R"] = {pfxDict = "core", pfxName = "ent_amb_abattoir_carcass", scale = 0.5, offx = -0.32, offy = 0.052, offz = -0.62},
    ["kizu_katana_b"] = {pfxDict = "core", pfxName = "ent_ray_finale_vault_sparks", scale = 1.0, offx = 0.05, offy = -0.02, offz = 0.12},
	["kizu_katana_g"] = {pfxDict = "core", pfxName = "ent_amb_butterflys_swarm", scale = 0.5, offx = 0.05, offy = -0.02, offz = 0.12},
}

Config.dualCommand = "dual"

Config.katanaHideCommand = "hidekatana"
