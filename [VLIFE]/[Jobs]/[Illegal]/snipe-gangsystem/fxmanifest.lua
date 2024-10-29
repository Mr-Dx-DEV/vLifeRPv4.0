fx_version 'cerulean'
game 'gta5'
description 'Gang System'
version '1.3.0'
author 'Snipe'
lua54 'yes'
ui_page 'html/index.html'
shared_scripts { 
	'config.lua'
}
files {
	'html/**/*',
}
client_scripts{
    'client/cl_main.lua',
    'client/cl_customise.lua',
    'client/cl_target.lua',
    'client/cl_cornerselling.lua',
    'client/cl_flagutils.lua',
    'client/cl_buyflags.lua',
    'client/cl_nui.lua',
    'client/cl_cornerselling_customise.lua'
} 
server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server/sv_main.lua',
    'server/sv_customise.lua',
    'server/sv_cornerselling.lua',
    'server/sv_flagutils.lua',
    'server/sv_buyflags.lua',
    'server/sv_nui.lua',
    'server/sv_webhooks.lua'
} 
escrow_ignore {
    'config.lua',
    'client/cl_customise.lua',
    'client/cl_target.lua',
    'client/cl_buyflags.lua',
    'client/cl_nui.lua',
    'client/cl_flagutils.lua',
    'server/sv_customise.lua',
    'server/sv_cornerselling.lua',
    'server/sv_flagutils.lua',
    'server/sv_buyflags.lua',
    'client/cl_cornerselling_customise.lua',
    'server/sv_webhooks.lua'
}
server_exports {
    'GetGangFlags', -- exports["snipe-gangsystem"]:GetGangFlags(gangName) - returns the amount of flags a gang has
    'GetGangMembersCount' -- exports["snipe-gangsystem"]:GetGangMembersCount(gangName) - returns the amount of members in a gang that are online
}
dependency '/assetpacks'