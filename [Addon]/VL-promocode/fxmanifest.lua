fx_version 'cerulean'
game 'gta5'
author 'NukeXD'
description 'NukeXD'
version '1.3'
shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
}
client_scripts {
	'client/*.lua'
}
server_scripts {
	'server/*.lua',
	'@oxmysql/lib/MySQL.lua'
}
lua54 'yes'
