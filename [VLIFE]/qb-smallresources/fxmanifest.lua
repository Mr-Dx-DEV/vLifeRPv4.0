fx_version 'cerulean'
game 'gta5'
description 'QB-SmallResources'
version '1.3.1'
shared_scripts {
    '@qb-core/shared/locale.lua',
    '@ox_lib/init.lua',
    'locales/en.lua', -- Change to the language you want
    'config.lua'
}
server_script 'server/*.lua'
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}
data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'
data_file 'WEAPONCOMPONENTSINFO_FILE' 'weaponcomponents.meta'
data_file 'PED_PERSONALITY_FILE' 'pedpersonality.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'weaponanimations.meta'
data_file 'WEAPON_METADATA_FILE' 'weaponarchetypes.meta'
data_file 'WEAPONINFO_FILE' 'weapon_shoe.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapon_shoe.meta'
files {
    'events.meta',
    'popgroups.ymt',
    'relationships.dat',
    'weaponcomponents.meta',
	'pedpersonality.meta',
	'weaponanimations.meta',
	'weaponarchetypes.meta',
	'weapon_shoe.meta',
}
lua54 'yes'
use_experimental_fxv2_oal 'yes'
escrow_ignore {
    "config.lua",
}
