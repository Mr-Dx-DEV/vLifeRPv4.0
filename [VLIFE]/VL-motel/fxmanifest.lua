fx_version 'cerulean'
game 'gta5'
author 'JustLazzy'
description 'Motel script for QBCore'
version '2.7.3'
client_scripts {
    'bridge/client.lua',
    'client/function/motel.lua',
    'client/function/blips.lua',
    'client/function/target.lua',
    'client/function/zone.lua',
    'client/function/shell.lua',
    'client/function/utils.lua',
    'client/nui.lua',
    'client/thread.lua',
    'client/client.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'bridge/server.lua',
    'server/function/routing.lua',
    'server/function/motel.lua',
    'server/function/logs.lua',
    'server/function/utils.lua',
    'server/server.lua',
    'server/convert.lua',
    'server/secret.lua',
    -- 'server/convert/*.lua'
}
shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/**/*.lua'
}
escrow_ignore {
    'client/function/*.lua',
    'client/client.lua',
    'client/thread.lua',
    'server/function/*.lua',
    'server/server.lua',
    'shared/config.lua',
    'shared/motel/*.lua',
    'templates/*.lua',
    'templates/**/*.lua',
    'bridge/*.lua',
    'bridge/**/*.lua',
    -- Open Source
    -- 'client/nui.lua',
    -- 'server/*.lua'
}
ui_page 'html/index.html'
files {
    'html/index.html',
    'html/js/*.js',
    'html/assets/*.css',
    'html/assets/pop.ogg',
    'locales/*.json',
    'bridge/**/client.lua'
}
dependencies {
    'ox_lib',
    'oxmysql'
}
lua54 'yes'
dependency '/assetpacks'