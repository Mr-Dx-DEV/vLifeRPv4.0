author "CyclopsGM"
description "VLife Atoms"
fx_version "cerulean"
game "gta5"
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/*.lua'
}
server_scripts { 'server/*.lua' }
shared_scripts { 'config.lua', 'locales/*.lua*' }
lua54 'yes'
