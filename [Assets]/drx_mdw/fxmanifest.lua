lua54 'yes'
fx_version 'adamant'
game 'gta5'

shared_scripts {
	'Config.lua'
}

ui_page 'client/html/index.html'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua',
	'server/extra.lua'
}

client_scripts {
	'client/client.lua',
	'client/extra.lua'
}

files {
	'client/html/images/*',
	'client/html/index.html',
	'client/html/stylesheets/*.css',
	'client/html/javascripts/*.js'
}

escrow_ignore {
	'Config.lua',
	'client/extra.lua',
	'server/extra.lua'
}
dependency '/assetpacks'