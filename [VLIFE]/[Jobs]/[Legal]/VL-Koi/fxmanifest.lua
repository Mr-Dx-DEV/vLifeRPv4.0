name "VL-Koi"
author "UtshoBoy"
description "VL-Koi Job Script By UtshoBoy"
version "v1.0.0"
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
