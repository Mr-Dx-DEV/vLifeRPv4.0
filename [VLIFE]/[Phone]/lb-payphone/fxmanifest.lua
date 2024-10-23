fx_version "cerulean"
game "gta5"
lua54 "yes"
use_experimental_fxv2_oal "yes"

shared_script "config/*.lua"
client_script "client/**/*"
server_script "server/**/*"

escrow_ignore {
    "config/*.lua",
    "client/custom/*.lua",
    "server/custom/*.lua"
}

dependency "loaf_lib"

dependency '/assetpacks'