--  ██████╗ ███╗   ██╗███████╗██╗  ██╗    ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗
-- ██╔═══██╗████╗  ██║██╔════╝╚██╗██╔╝    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
-- ██║   ██║██╔██╗ ██║█████╗   ╚███╔╝     ███████╗██║     ██████╔╝██║██████╔╝   ██║   ███████╗
-- ██║   ██║██║╚██╗██║██╔══╝   ██╔██╗     ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ╚════██║
-- ╚██████╔╝██║ ╚████║███████╗██╔╝ ██╗    ███████║╚██████╗██║  ██║██║██║        ██║   ███████║
--  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝
-- ===================== Official Information ================================================
name 'Onex Resource Module : Interaction'
description 'Player Interaction'
author 'Frostfire#3400'
PowerdBy 'Onex Scripts'
-- ====================== Game Configuration =================================================
fx_version 'cerulean'
game 'gta5'
version '0.5'
-- ====================  Resource UI  ========================================================
ui_page 'web/build/index.html'
files {'web/build/index.html', 'web/build/assets/*.*'}
-- ==================== Resource Configuration ===============================================
shared_scripts {'script/shared/config.lua'}
client_scripts {'script/client/client.lua'}
server_scripts {'script/server/server.lua'}
escrow_ignore {'script/shared/config.lua' , 'dev_ignore.lua'}
-- ==================== Resource Code Configuration  =============================================
lua54 'yes'
dependency '/assetpacks'