fx_version 'cerulean'

game 'gta5'

lua54 'yes'

author 'Lusty94'

description 'Oxy Run Script For QB-Core'

version '2.0.2'


client_scripts {
    'client/oxy_client.lua',
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
}

server_scripts {
    'server/oxy_server.lua',
} 

shared_scripts { 
	'shared/config.lua',
    '@ox_lib/init.lua'
}

escrow_ignore {
    'shared/**.lua',
    'client/**.lua',
    'server/**.lua',
}





dependency '/assetpacks'