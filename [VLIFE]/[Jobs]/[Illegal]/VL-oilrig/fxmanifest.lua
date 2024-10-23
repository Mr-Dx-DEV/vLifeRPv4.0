fx_version 'cerulean'
game 'gta5'
Author 'Samuel#0008 & phade#9756'
Version '1.3.5'
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua',
}
shared_scripts {
    '@sd_lib/shared/lang.lua',
    'locales/en.lua', -- change en to your language
    'config.lua',
}
server_scripts {
    'server/*.lua',
} 
lua54 'yes'
escrow_ignore { 
    'config.lua',
}
dependency '/assetpacks'
dependency '/assetpacks'