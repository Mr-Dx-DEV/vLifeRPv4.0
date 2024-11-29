fx_version 'cerulean'

game 'gta5'

author 'Lusty94'

name "lusty94_mushrooms"

description 'Magic Mushroom Script For QB Core'

version '2.0.1'

lua54 'yes'

client_script {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/mushrooms_client.lua',
    'shared/menus.lua',
}


server_scripts { 
    'server/mushrooms_server.lua',
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