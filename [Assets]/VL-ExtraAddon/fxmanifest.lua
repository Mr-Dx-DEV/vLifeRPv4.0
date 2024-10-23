fx_version 'cerulean'
game 'gta5'
author 'CyclopsGM'
description ' Addon Resources merged into one'
lua54 'yes'
shared_script 'config.lua'
client_scripts {
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
    "client/*.lua",
}
server_script {
    '@oxmysql/lib/MySQL.lua',
    "server/*.lua",
} 
ui_page 'html/ui.html'
files {
    'html/ui.html',
    'html/fonts/*.ttf',
    'html/css/style.css',
    'html/js/script.js'
}
exports {
    "UpdateSkill",
    "GetCurrentSkill"
}
