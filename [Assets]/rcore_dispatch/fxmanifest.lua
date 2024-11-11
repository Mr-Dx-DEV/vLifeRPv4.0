fx_version 'cerulean'
game 'gta5'

author 'guillerp <info@rcore.cz>'
description 'Dispatch resource from rcore.cz'
version '1.3.10'

lua54 'yes'

files {
    'zones.gfx',
    'web/dist/*.html',
    'web/dist/*.js',
    'web/dist/*.css',
    'web/dist/*.png',
    'web/dist/*.svg',
    'web/dist/assets/*.svg',
    'web/dist/*.mp3',
    'web/dist/*.ttf',
    'web/dist/*.woff',
    'web/dist/*.woff2',
    'web/dist/*.json',
}

data_file 'SCALEFORM_DLC_FILE' 'zones.gfx'

shared_scripts {
    'shared/**',
    'locales/**',
    'configs/sh_config.lua',
}

client_scripts {
    'configs/cl_config.lua',
    'client/api/**',
    'client/lib/*.lua',
    'client/cl_main.lua'
}

server_scripts {
    'configs/sv_config.lua',
    'server/api/*.lua',
    'server/lib/*.lua',
    'server/classes/*.lua',
    'server/sv_main.lua'
}

ui_page 'web/dist/index.html'

escrow_ignore {
    'client/api/framework/*.lua',
    'client/api/voice/*.lua',
    'client/api/*.lua',
    'server/api/*.lua',
    'configs/*.lua',
    'locales/*.lua',
}

dependency '/assetpacks'