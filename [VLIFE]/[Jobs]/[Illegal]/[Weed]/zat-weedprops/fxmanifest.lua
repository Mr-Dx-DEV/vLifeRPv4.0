fx_version 'cerulean'
game { 'gta5' }
author 'ZaT'
description 'ZaT - Weed props'
version '1.1.0'



data_file 'DLC_ITYP_REQUEST' 'stream/prop_garden.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/prop_water_setup.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/prop_rack_dryer_s.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/prop_weed_rack_xs.ytyp'

escrow_ignore {
    'stream/**/*.ytd',
}
lua54 'yes'
dependency '/assetpacks'