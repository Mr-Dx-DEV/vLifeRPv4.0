fx_version 'cerulean'
game 'gta5'
author 'CyclopsGM'
description 'Vlife Addon Resources merged into one'
ui_page 'html/index.html'
files {
	'html/index.html',
	'html/script.js',
	'html/*.svg',
	'html/radio.png',
	'html/main.css',
}
client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	"client/*.lua"
}
server_scripts {
	'@mysql-async/lib/MySQL.lua',	
	"server/*.lua"
}
shared_scripts { 
	"config.lua",
}
lua54 'yes'