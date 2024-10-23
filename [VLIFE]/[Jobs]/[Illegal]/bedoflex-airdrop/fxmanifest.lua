fx_version "cerulean"
game "gta5"

name "bedoflex-airdrop"
description "bedoflex-airdrop | Airdrop Script"
author "bedoflex"
version '1.7.3'
lua54 'on'
this_is_a_map 'yes'

ui_page "ui/index.html"

data_file('DLC_ITYP_REQUEST')('stream/[ytyp]/jrbPUBG_Crate.ytyp')

files {
    "ui/**.**",
}

shared_scripts {
    "shared/config.lua",
    "shared/locales.lua",
}

client_scripts {
    "shared/clfunctions.lua",
    "client/main.lua",
}

server_scripts {
    "shared/svfunctions.lua",
    "server/main.lua",
}

escrow_ignore {
    "shared/*.lua",
}
dependency '/assetpacks'