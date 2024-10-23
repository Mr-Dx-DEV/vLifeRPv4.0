
--[[
    All the roles here can access the admin menu
    Only the GOD can set the panels for the other roles
    There are 3 options
    1. God -> can access all the commands
    
    IMPORTANT: DO NOT REMOVE GOD ROLE, IF YOU DO SO, YOU WILL NOT BE ABLE TO ACCESS THE ADMIN MENU AT ALL

    If you have a new role, you can add it here and select to give either God, Admin or Moderator or any of the custom perms you want

    eg. ["new_role"] = "God",
    eg. ["dev"] = "Admin",
]]--
Config.GodRoles = {
    ["god"] = "God", -- This is the biggest role (DO NOT REMOVE THIS ROLE)
    ["admin"] = "Admin", -- This is just a custom role
    ["mod"] = "Moderator", -- This is just a custom role
    -- ["new_role1"] = "Test", -- if you want to add more roles just add them here
    -- ["new_role2"] = "Test", -- if you want to add more roles just add them here
    -- ["new_role3"] = "Test",
    -- if you want to add more roles just add them here
    -- ["NEW_ROLE_HERE"] = "God",
    -- ["NEW_ROLE_HERE"] = "Admin",
    -- ["NEW_ROLE_HERE"] = "Moderator",
}

-- Original Permissions table for information on all possible available options
Config.Permissions = {
    
    ["discord:1159468436905275432"] = "god", -- GM
    ["discord:464336271494610946"] = "god", -- RBN
    ["discord:811436286006657025"] = "god", -- Mr_Dx
    ["steam:11000013f26aa4e"] = "god", -- Mr_Dx
    ["discord:505462181899403295"] = "god", -- Ric
    ["license:0ffe4f6fac44db25240bbea4634e379b535f1a31"] = "god", -- UtshoBoy

   -- ["discord:1218125319211581454"] = "god", -- shady
    ["discord:454581126128861184"] = "god", -- gojo
    ["discord:503863003909718016"] = "god", -- raka
    ["discord:567939816721874957"] = "god", -- Crimson
    ["license:97ca8e6e56621cb5cbc16c3bc92b281d644a44ee"] = "god", -- Raka
    ["license:e4a2071027c359bb0d6fe260a9a855332016a853"] = "god", -- Kochi
    ["discord:1030816907487612928"] = "god", -- Almiir
    ["license:9fea4d27fcb69642ec77d8ea6a666becd1ce2182"] = "god", -- Hamim 
    ["license:aadcb51a8a297b180e7d4b9702824700a7fc5f3f"] = "god", -- Tufan 
    ["discord:926131495431712778"] = "god", -- TOXIC TANVIR
    ["discord:534296836618452992"] = "god", -- fire wall
    
    ["license:91e750dd43ff972ed7887994c415e915533c966d"] = "god", -- themis

    ["discord:728344454142099476"] = "god", -- hydrogen12

    ["discord:500372148641333249"] = "god", -- Achiles



    ["license:6d3b6254a50416697dcaa91878e2eb03d9112302"] = "god", -- the role god, admin or mod should be the key from Config.GodRoles which means the values that are added in square brackets.
    ["fivem:1234"] = "god",
    ["steam:1234"] = "god",
    ["124584938326312"] = "god", -- discord roles (copy the role id and paste it here) (If you want to use the discord roles, you need to add the bot token and server id in sv_perms.lua at the top)
    ["XY123456"] = "god", -- citizenid for qbcore
    ["char1:12334"] = "god", -- charid for ESX

   
    -- ["license:6d3b6254a50416697dcaa91878e2eb03d9112302"] = {"mod", "admin"}, -- the role god, admin or mod should be the key from Config.GodRoles which means the values that are added in square brackets.
    -- ["license:1234"] = "admin",
    -- ["license:1234"] = "mod",
    -- ["license:1234"] = "new_role1",
    -- ["license:1234"] = "new_role2",
    -- ["license:1234"] = "new_role3",
}

