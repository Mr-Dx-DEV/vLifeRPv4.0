fx_version 'adamant'
game 'gta5'
Author 'Kizubwana'
lua54 'yes'
client_scripts {
    'client/*.lua'
}
server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/*.lua'
}
shared_scripts {
    'config.lua',
}
file 'stream/**.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/**.ytyp'
escrow_ignore {
    "client/client_shared.lua",
    "server/server_shared.lua",
    "config.lua",
}
dependency '/assetpacks'