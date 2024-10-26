fx_version 'cerulean'
game 'gta5'

description 'wert-ambulancejob'
version '1.0.0'

ui_page {'html/index.html'}
    
files {
	'data.json',
    'html/index.html',
    'html/js/*',
    'html/css/*',
    'html/images/*.png',
}

shared_scripts {
    'config.lua',
    'lang.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
	'client.lua',
    'target.lua',
    'garage.lua',
    'npcdoctor.lua',
    'blood.lua'
} 

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'server.lua',
}

escrow_ignore {
    'data.json',
    'target.lua',
    'config.lua',
    'lang.lua',
}

lua54 'yes'
dependency '/assetpacks'