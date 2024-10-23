fx_version 'cerulean'
games { 'gta5' }
author 'Danzo'
description 'The Torture Kit - Made by Danzo - Discord: https://discord.gg/8nFqCR4xVC'
version '1.0.0'
shared_scripts {
	'config.lua',
}
client_scripts {
	'client/main.lua',
	'escrow/client/*.lua',
}
server_scripts {
	'server/main.lua',
	'escrow/server/*.lua',
}
ui_page {
	'html/index.html'
}
files {
	'html/index.html',
	'html/style.css',
	'html/script.js',
}
escrow_ignore {
	'config.lua',
	'client/main.lua',
	'server/main.lua',
}
lua54 'yes'
dependency '/assetpacks'