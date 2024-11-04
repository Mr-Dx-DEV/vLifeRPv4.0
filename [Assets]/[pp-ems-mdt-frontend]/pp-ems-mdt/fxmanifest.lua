fx_version "cerulean"
description "EMS MDT script by PixelPrecision"
author "PixelPrecision"
version '1.1.0'
lua54 'yes'
game "gta5"

ui_page 'web/build/index.html'
shared_script 'locales/*.lua'

client_scripts {
    "client/**/*"
}

server_scripts {
    'config/config_s.lua',
    'server/**/*',
    '@oxmysql/lib/MySQL.lua',
}

files {
    'config/config_c.lua',
    'config/config_ui.lua',
	'web/build/index.html',
	'web/build/**/*',
}

shared_scripts {
    '@pp-bridge/init.lua',
    '@ox_lib/init.lua'
}

dependencies {
    'pp-bridge',
    'ox_lib',
    'oxmysql',
    'pp-ems-mdt-prop'
}

escrow_ignore {
    'config/*.lua',
    'locales/*.lua'
}
dependency '/assetpacks'