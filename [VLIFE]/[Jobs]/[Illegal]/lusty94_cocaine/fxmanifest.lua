fx_version 'cerulean'

game 'gta5'

author 'Lusty94'

name "lusty94_cocaine"

description 'Cocaine & Crack Processing Script For QB Core'

version '2.0.1'

lua54 'yes'

client_script {
    'client/cocaine_client.lua',
    'shared/menus.lua',
}


server_scripts { 
    'server/cocaine_server.lua',
}


shared_scripts { 
	'shared/config.lua',
    '@ox_lib/init.lua',
}


escrow_ignore {
    'client/**.lua',
    'server/**.lua',
    'shared/**.lua',
}
dependency '/assetpacks'