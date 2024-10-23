fx_version 'cerulean'
game 'gta5'
author '! marcinhu.#6158'
Description 'Hunting'
shared_scripts {
    'configs/**.lua',
}
client_script {
    'client/**.lua',
}
server_script {
    'server/**.lua',
}
escrow_ignore {
    "client/c_targets.lua",
    "client/c_qbmenu.lua",
    "server/s_editable.lua",
    "configs/**.lua",
    "fxmanifest.lua",
    "README.lua",
    "Images/**",
}
lua54 'yes'
dependency '/assetpacks'