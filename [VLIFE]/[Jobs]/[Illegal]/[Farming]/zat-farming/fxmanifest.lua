fx_version 'cerulean'
games {"gta5", "rdr3"}
author "ZaT"
version '1.0.0'
lua54 'yes'
ui_page 'web/build/index.html'
files {
  'web/build/index.html',
  'web/build/**/*'
}
client_script {
  '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
  "client/**/*",
}
server_scripts {
  "server/**/*",
  '@oxmysql/lib/MySQL.lua'
}
shared_scripts {
  'shared/config.lua',        -------------> IMPORTANT ORDER (second)
  'shared/locales.lua',
  '@es_extended/imports.lua', -- only for ESX
}
escrow_ignore {
  'client/framework.lua',
  'client/inventories.lua',
  'client/progressbars.lua',
  'client/target.lua',
  'server/framework.lua',
  'server/consumebales.lua',
  'server/inventories.lua',
  'shared/**/*',
}
dependency '/assetpacks'