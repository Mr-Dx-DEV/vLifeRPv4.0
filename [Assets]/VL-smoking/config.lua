Config = {}

Config.Language = 'en'

--Version 2.4
--Script by devcore
--To get fixes for the new version, come to our discord : https://discord.gg/zcG9KQj3sa
-- in the README you will find the text to insert into qb-core / shared.lua to create items


Config.EarCigCommand = 'earcig'
------------- 
Config.EnableGiveArmor = false
Config.EnableRemoveStress = true
Config.afterSmoking = true -- true if you want armor and stress after smoking false if you want armor and stress after each exhale
------------ 
Config.NotifyMenu = 'textstring'-- 3d | helpnotify | textstring
Config.ScaleText = 0.42 -- Text size
Config.Scale = 0.35 -- 3D text size
------------ 
Config.CigaretteExhale = 0.15
Config.CigarExhale = 0.15
Config.JointExhale = 0.15
Config.VapeExhale = 0.4
Config.BongExhale = 0.4
------------
Config.JointSmoke = 0.03
Config.CigarSmoke = 0.05
Config.CigaretteSmoke = 0.03

Config.SizeRemove = {min = 1, max = 3} -- how much size is removed after one exhalation
Config.ExhaleTime = {min = 1000, max = 1500}
------------- BUTTONS 
Config.DisableCombatButtons = true -- Deactivates the attack buttons while smoking
Config.SmokeButton = 38 -- E
Config.ThrowButton = 73 -- X
Config.MouthButton = 10 -- Page UP
Config.HandButton = 11 -- Page Down
Config.GiveButton = 121 -- INSERT
Config.ConfirmGiveButton = 38 -- E
Config.CancelGiveButton = 73 -- X
-------------
Config.Lighter = 'lighter'
--Vape
Config.ItemVapeLiquid = 'liquid'
Config.MaxLiquid = 6
Config.AddLiquidInVape = 3 -- How much ml is added after pouring the liquid into the vape
Config.VapeSizeRemove = 0.5 -- How much ml of liquid is removed from the vape after one coating
--Bong
Config.MaxWeed = 2 -- Max g weed in bong
Config.AddWeedInBong = 1 -- how much g is added to the bong after one grass
Config.BongSizeRemove = 1 -- How much g of grass is removed from the bong after one coating
-------------

function StressTrigger(stress) -- Put inside stress export or trigger
   TriggerServerEvent('hud:server:RelieveStress', stress)
end


Config.Smoke = { -- Item = 
    {Item = "cubancigar",  Prop = 'prop_cigar_01', Armor = 0, Stress = 3, Size = 20, Type = 'cigar', Time = 120},
    {Item = "davidoffcigar",  Prop = 'prop_cigar_01', Armor = 0, Stress = 3, Size = 20, Type = 'cigar', Time = 120},
    {Item = "redwcig",  Prop = 'ng_proc_cigarette01a', Armor = 0, Stress = 3, Size = 20, Type = 'cigarette', Time = 120},
    {Item = "cigarette",  Prop = 'ng_proc_cigarette01a', Armor = 0, Stress = 3, Size = 20, Type = 'cigarette', Time = 120},
    {Item = "marlboro",  Prop = 'ng_proc_cigarette01a', Armor = 0, Stress = 3, Size = 20, Type = 'cigarette', Time = 120},
    {Item = "vape",  Prop = 'ba_prop_battle_vape_01', Armor = 0, Stress = 4, Size = 0, Type = 'vape', Time = 0},
    --{Item = "bong",  Prop = 'prop_bong_01', Armor = 0, Stress = 2, Size = 0, Type = 'bong', Time = 0},
--    {Item = "joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 3, Size = 20, Type = 'joint', Time = 120},
    {Item = "blue_dream_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 3, Size = 20, Type = 'joint', Time = 120},
    -- {Item = "purple_haze_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 3,Size = 20, Type = 'joint', Time = 120},
    -- {Item = "banana_kush_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 3, Size = 20, Type = 'joint', Time = 120},
    -- whitewidow & bestbuds
    -- {Item = "afghankush_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 2, Size = 20, Type = 'joint', Time = 120},
    -- {Item = "bluedream_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 2, Size = 20, Type = 'joint', Time = 120},
    -- {Item = "granddaddypurple_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 2, Size = 20, Type = 'joint', Time = 120},
    -- {Item = "greencrack_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 2, Size = 20, Type = 'joint', Time = 120},
    -- {Item = "jackherrer_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 2, Size = 20, Type = 'joint', Time = 120},
    -- {Item = "sourdiesel_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 2, Size = 20, Type = 'joint', Time = 120},
    -- {Item = "weddingcake_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 2, Size = 20, Type = 'joint', Time = 120},
    -- {Item = "whitewidow_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 2, Size = 20, Type = 'joint', Time = 120},
    -- {Item = "bestbud_joint",  Prop = 'prop_sh_joint_01', Armor = 0, Stress = 2, Size = 20, Type = 'joint', Time = 120},
}


------------

Config.CigarettePack = { -- set the pack items here and which items you get from the pack
    {PackItem = "redw",  CigaretteItem = 'redwcig', Amount = 20},
    {PackItem = "marlboro",  CigaretteItem = 'marlborocig', Amount = 20},
    {PackItem = "cpack",  CigaretteItem = 'cigarette', Amount = 10},
}



Config.BongReloadItems = {
    {Items = "og_kush_weed"},
    {Items = "blue_dream_weed"},
    {Items = "banana_kush_weed"},
    {Items = "purple_haze_weed"},
}



--Rollings joints
Config.Rollingpaper = 'ocb_paper'

Config.RollingJoints = {  -- Weed bag -- amount = How many joints you get
    {Item = "banana_kush_bag",  GiveJoint = 'banana_kush_joint', Amount = 1},
    {Item = "blue_dream_bag",  GiveJoint = 'blue_dream_joint', Amount = 1},
    {Item = "og_kush_bag",  GiveJoint = 'og_kush_joint', Amount = 1},
    {Item = "purple_haze_bag",  GiveJoint = 'purple_haze_joint', Amount = 1},
}

-------------------------