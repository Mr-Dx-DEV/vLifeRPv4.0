local QBCore = exports['qb-core']:GetCoreObject()

--[[
  This is PlayerSlots here we define the Category of the weapons that goes on the Player
  This means that instead of giving each weapon a designated slot on the back, we can just add a weapon with the designated slot
  This will also allow for weapons to feel and look more natural when added.

  All items that go on your back -> MUST have a SLOT CATEGORY, everything that we CARRY must have Carry = true
]]
local PlayerSlots = {
	[1] = { -- Bigger weapons such as bats, crowbars, Assaultrifles, and also good place for wet weed.
		[1] = { bone = 24817, x = 0.04, y = -0.15, z = 0.12, xr = 0.0, yr = 0.0, zr = 0.0, isBusy = false },
		[2] = { bone = 24817, x = 0.04, y = -0.17, z = 0.02, xr = 0.0, yr = 0.0, zr = 0.0, isBusy = false },
		[3] = { bone = 24817, x = 0.04, y = -0.15, z = -0.12, xr = 0.0, yr = 0.0, zr = 0.0, isBusy = false },
	},

	[2] = { -- Use this for katana knives etc. stuff that goes sideways on the players body
		[1] = { bone = 24817, x = -0.13, y = -0.16, z = -0.14, xr = 5.0, yr = 62.0, zr = 0.0, isBusy = false },
		[2] = { bone = 24817, x = -0.13, y = -0.15, z = 0.10, xr = 5.0, yr = 124.0, zr = 0.0, isBusy = false },
	},

	[3] = { -- Contraband like Drugs and shit
		[1] = { bone = 24817, x = -0.28, y = -0.14, z = 0.15, xr = 0.0, yr = 92.0, zr = -13.0 },
		[2] = { bone = 24817, x = -0.27, y = -0.14, z = 0.15, xr = 0.0, yr = 92.0, zr = 13.0 },
	},

	[4] = { -- I use this for the pelts for hunting
		[1] = { bone = 24817, x = -0.18, y = -0.26, z = -0.02, xr = 0.0, yr = 91.0, zr = 5.0 },
		[2] = { bone = 24817, x = 0.10, y = -0.26, z = -0.02, xr = 0.0, yr = 91.0, zr = 5.0 },
		[3] = { bone = 24817, x = 0.38, y = -0.21, z = -0.02, xr = 0.0, yr = 91.0, zr = 5.0 },
	},

	[5] = { -- I use this for chains, make sure your CHAIN is a CUSTOM prop, will NOT work with a clothing item, if you want to add a CHAIN make sure to have a chain = true as it will not work the same as weapons --
		[1] = { bone = 10706, x = 0.11, y = 0.080, z = -0.473, xr = -366.0, yr = 19.0, zr = -163.0 },
	},
}



-- Add your items here --
local props = {

	["weapon_tec9s"]           = { model = "w_sb_tec9s", hash = joaat("weapon_tec9s"), tier = 1 },
["weapon_t1911"]           = { model = "w_pi_t1911", hash = joaat("weapon_t1911"), tier = 1 },
["weapon_m500"]            = { model = "w_sg_m500", hash = joaat("weapon_m500"), tier = 1 },
["weapon_lbtarp"]          = { model = "w_ar_lbtarp", hash = joaat("weapon_lbtarp"), tier = 1 },
["weapon_bar15"]           = { model = "w_ar_bar15", hash = joaat("weapon_bar15"), tier = 1 },

["weapon_blackarp"]        = { model = "w_ar_blackarp", hash = joaat("weapon_blackarp"), tier = 1 },
["weapon_blueglocks"]      = { model = "w_pi_blueglocks", hash = joaat("weapon_blueglocks"), tier = 1 },
["weapon_dmk18"]           = { model = "w_ar_dmk18", hash = joaat("weapon_dmk18"), tier = 1 },
["weapon_glockbeams"]      = { model = "w_pi_glockbeams", hash = joaat("weapon_glockbeams"), tier = 1 },
["weapon_redarp"]          = { model = "w_ar_redarp", hash = joaat("weapon_redarp"), tier = 1 },

["weapon_bscar"]           = { model = "w_ar_bscar", hash = joaat("weapon_bscar"), tier = 1 },
["weapon_krissvector"]     = { model = "w_sb_krissvector", hash = joaat("weapon_krissvector"), tier = 1 },
["weapon_tglock19"]        = { model = "w_pi_tglock19", hash = joaat("weapon_tglock19"), tier = 1 },
["weapon_thompson"]        = { model = "w_sb_thompson", hash = joaat("weapon_thompson"), tier = 1 },
["weapon_woarp"]           = { model = "w_ar_woarp", hash = joaat("weapon_woarp"), tier = 1 },

	---- ** Drugs ** ----
	-- Weed
	["marijuana_crop_low"] = { model = "bkr_prop_weed_drying_02a", hash = joaat("bkr_prop_weed_drying_02a"), tier = 1, yr = 90.0 }, -- This is more of an item that deserves a
	["weedpackage"] =  { carry = true, model = "hei_prop_heist_weed_block_01", bone = 28422, x = 0.01, y = -0.02, z = -0.12, xr = 0.0,
  						yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true}, 
	-- meth
	["meth"] = { model = "hei_prop_pill_bag_01", hash = joaat("hei_prop_pill_bag_01"), tier = 3 },
	--[[ ["coke_brick"] = { model = "bkr_prop_coke_cutblock_01", hash = joaat("bkr_prop_coke_cutblock_01"), tier = 3 }, ]]

	-- Contraband
	["markedbills"] = { model = "prop_money_bag_01", hash = joaat("prop_money_bag_01"), tier = 3, x = -0.47, zr = 0 }, -- If you put any x,y,z,xr,yr,zr it will offset it from the slots to make it fit perfectly

	-- Custom Weapons Tier 1
	["weapon_m4wagesofsin"]    = { model = "w_ar_m4wagesofsin", hash = joaat("weapon_m4wagesofsin"), tier = 1 },
	["weapon_yellowm4a1s"]     = { model = "w_ar_yellowm4a1s", hash = joaat("weapon_yellowm4a1s"), tier = 1 },
	["weapon_tacticalak47"]    = { model = "w_ar_tacticalak47", hash = joaat("weapon_tacticalak47"), tier = 1 },
	["weapon_grau"]            = { model = "w_ar_grau", hash = joaat("weapon_grau"), tier = 1 },
	["weapon_pq15"]            = { model = "w_ar_pq15", hash = joaat("weapon_pq15"), tier = 1 },
	["weapon_pdmk18"]          = { model = "w_ar_pdmk18", hash = joaat("weapon_pdmk18"), tier = 1 },
	["weapon_ar15"]            = { model = "w_ar_ar15", hash = joaat("weapon_ar15"), tier = 1 },
	["weapon_hk416"]           = { model = "w_ar_hk416", hash = joaat("weapon_hk416"), tier = 1 },
	["WEAPON_Ak74X"]           = { model = "w_ar_Ak74X", hash = joaat("WEAPON_Ak74X"), tier = 1 },
	["WEAPON_RPG"]             = { model = "w_ar_RPG", hash = joaat("WEAPON_RPG"), tier = 1 },
	["weapon_1928bar"]         = { model = "w_ar_1928bar", hash = joaat("weapon_1928bar"), tier = 1 },
	["weapon_an94"]            = { model = "w_ar_an94", hash = joaat("weapon_an94"), tier = 1 },
	["weapon_darkknightak"]    = { model = "w_ar_dadarkknightak", hash = joaat("weapon_darkknightak"), tier = 1 },
	["weapon_icedrake"]        = { model = "w_ar_icedrake", hash = joaat("weapon_icedrake"), tier = 1 },
	["weapon_kn57"]            = { model = "w_ar_kn57", hash = joaat("weapon_kn57"), tier = 1 },
	["weapon_m249playmaker"]   = { model = "w_ar_m249playmaker", hash = joaat("weapon_m249playmaker"), tier = 1 },
	["weapon_gak"]             = { model = "w_ar_gak", hash = joaat("weapon_gak"), tier = 1 },
	["weapon_minigun"]             = { model = "w_ar_gak", hash = joaat("weapon_gak"), tier = 1 },

	["weapon_assaultrifle"]    = { model = "w_ar_assaultrifle", hash = joaat("weapon_assaultrifle"), tier = 1 },
	["weapon_carbinerifle"]    = { model = "w_ar_carbinerifle", hash = joaat("weapon_carbinerifle"), tier = 1 },
	["weapon_advancedrifle"]   = { model = "w_ar_advancedrifle", hash = joaat("weapon_advancedrifle"), tier = 1 },
	["weapon_combatpdw"]       = { model = "w_sb_mpx", hash = joaat("weapon_combatpdw"), tier = 1 },
	["weapon_compactrifle"]    = { model = "w_ar_draco", hash = joaat("weapon_compactrifle"), tier = 1 },
	["weapon_m4"]              = { model = "w_ar_m4", hash = joaat("weapon_m4"), tier = 1 },
	["weapon_ak47"]            = { model = "w_ar_ak47", hash = joaat("weapon_ak47"), tier = 1 },
	["weapon_ballas_cr"]       = { model = "w_ar_carbinerifle", hash = joaat("weapon_ballas_cr"), tier = 1 },
	["weapon_m70"]             = { model = "w_ar_m70", hash = joaat("weapon_m70"), tier = 1 },
	["weapon_remington"]       = { model = "w_sg_remington", hash = joaat("weapon_remington"), tier = 1 },
	["weapon_m110"]            = { model = "w_sr_m110", hash = joaat("weapon_m110"), tier = 1 },
	["weapon_huntingrifle"]    = { model = "w_sr_huntingrifle", hash = joaat("weapon_huntingrifle"), tier = 1 },
	["weapon_uzi"]             = { model = "w_sb_uzi", hash = joaat("weapon_uzi"), tier = 1 },
	["weapon_mp9"]             = { model = "w_sb_mp9", hash = joaat("weapon_mp9"), tier = 1 },
	["weapon_mk14"]            = { model = "w_sr_mk14", hash = joaat("weapon_mk14"), tier = 1 },
	["weapon_mossberg"]        = { model = "w_sg_mossberg", hash = joaat("weapon_mossberg"), tier = 1 },
	["weapon_scarh"]           = { model = "w_ar_scarh", hash = joaat("weapon_scarh"), tier = 1 },
	["weapon_mac10"]           = { model = "w_sb_mac10", hash = joaat("weapon_mac10"), tier = 1 },
	["weapon_aks74"]           = { model = "w_ar_assaultrifle_aks74", hash = joaat("weapon_aks74"), tier = 1 },
	["weapon_mp5"]             = { model = "w_sb_mp5", hash = joaat("weapon_mp5"), tier = 1 },
	["weapon_smg"]             = { model = "w_sb_smg", hash = joaat("weapon_smg"), tier = 1 },
	["weapon_pumpshotgun_mk2"] = { model = "w_sg_pumpshotgun", hash = joaat("weapon_pumpshotgun_mk2"), tier = 1 },
	["weapon_ak74"]            = { model = "w_ar_ak74", hash = joaat("weapon_ak74"), tier = 1 },
	["weapon_victusxmr"]       = { model = "victusxmr", hash = joaat("weapon_victusxmr"), tier = 2, zr = 180.0, xr = 0.0, yr = -150.0 },
	["weapon_a15rc"]           = { model = "w_ar_a15rc", hash = joaat("weapon_a15rc"), tier = 1 },
	["weapon_ak4k"]            = { model = "w_ar_ak4k", hash = joaat("weapon_ak4k"), tier = 1 },
	["weapon_ak47s"]           = { model = "w_ar_ak47s", hash = joaat("weapon_ak47s"), tier = 1 },
	["weapon_akmkh"]           = { model = "w_ar_akmkh", hash = joaat("weapon_akmkh"), tier = 1 },
	["weapon_arc15"]           = { model = "w_ar_arc15", hash = joaat("weapon_arc15"), tier = 1 },
	["weapon_arma1"]           = { model = "w_ar_arma1", hash = joaat("weapon_arma1"), tier = 1 },
	["weapon_ars"]             = { model = "w_ar_ars", hash = joaat("weapon_ars"), tier = 1 },
	["weapon_aug"]             = { model = "w_ar_aug", hash = joaat("weapon_aug"), tier = 1 },
	["weapon_awp"]             = { model = "w_sr_awp", hash = joaat("weapon_awp"), tier = 2, zr = 180.0, xr = 0.0, yr = -150.0 },
	["weapon_bulldog"]         = { model = "w_ar_bulldog", hash = joaat("weapon_bulldog"), tier = 1 },
	["weapon_casr"]            = { model = "w_ar_casr", hash = joaat("weapon_casr"), tier = 1 },
	["weapon_cfs"]             = { model = "w_ar_cfs", hash = joaat("weapon_cfs"), tier = 1 },
	["weapon_drh"]             = { model = "w_ar_drh", hash = joaat("weapon_drh"), tier = 1 },
	["weapon_famasu1"]         = { model = "w_ar_famasu1", hash = joaat("weapon_famasu1"), tier = 1 },
	["weapon_fmr"]             = { model = "w_ar_fmr", hash = joaat("weapon_fmr"), tier = 1 },
	["weapon_fn42"]            = { model = "w_ar_fn42", hash = joaat("weapon_fn42"), tier = 1 },
	["weapon_g36"]             = { model = "w_ar_g36", hash = joaat("weapon_g36"), tier = 1 },
	["weapon_g3_2"]            = { model = "w_ar_g3_2", hash = joaat("weapon_g3_2"), tier = 1 },
	["weapon_galilar"]         = { model = "w_ar_galilar", hash = joaat("weapon_galilar"), tier = 1 },
	["weapon_groza"]           = { model = "w_ar_groza", hash = joaat("weapon_groza"), tier = 1 },
	["weapon_h2smg"]           = { model = "w_sb_h2smg", hash = joaat("weapon_h2smg"), tier = 1 },
	["weapon_hfsmg"]           = { model = "w_sb_hfsmg", hash = joaat("weapon_hfsmg"), tier = 1 },
	["weapon_howa_2"]          = { model = "w_ar_howa_2", hash = joaat("weapon_howa_2"), tier = 1 },
	["weapon_iar"]             = { model = "w_ar_iar", hash = joaat("weapon_iar"), tier = 1 },
	["weapon_idw"]             = { model = "w_sb_idw", hash = joaat("weapon_idw"), tier = 1 },
	["weapon_jrbak"]           = { model = "w_ar_jrbak", hash = joaat("weapon_jrbak"), tier = 1 },
	["weapon_lr300"]           = { model = "w_ar_lr300", hash = joaat("weapon_lr300"), tier = 1 },
	["weapon_m16a3"]           = { model = "w_ar_m16a3", hash = joaat("weapon_m16a3"), tier = 1 },
	["weapon_m133"]            = { model = "w_ar_m133", hash = joaat("weapon_m133"), tier = 1 },
	["weapon_mza"]             = { model = "w_ar_mza", hash = joaat("weapon_mza"), tier = 1 },
	["weapon_ms32"]            = { model = "w_sb_ms32", hash = joaat("weapon_ms32"), tier = 1 },
	["weapon_nanite"]          = { model = "w_ar_nanite", hash = joaat("weapon_nanite"), tier = 1 },
	["weapon_neva"]            = { model = "w_ar_neva", hash = joaat("weapon_neva"), tier = 1 },
	["weapon_m416p"]           = { model = "w_ar_m416p", hash = joaat("weapon_m416p"), tier = 1 },
	["weapon_safak"]           = { model = "w_ar_safak", hash = joaat("weapon_safak"), tier = 1 },
	["weapon_sar"]             = { model = "w_ar_sar", hash = joaat("weapon_sar"), tier = 1 },
	["weapon_sarb"]            = { model = "w_ar_sarb", hash = joaat("weapon_sarb"), tier = 1 },
	["weapon_sb4s"]            = { model = "w_sb_sb4s", hash = joaat("weapon_sb4s"), tier = 1 },
	["weapon_sf2"]             = { model = "w_ar_sf2", hash = joaat("weapon_sf2"), tier = 1 },
	["weapon_sfak"]            = { model = "w_ar_sfak", hash = joaat("weapon_sfak"), tier = 1 },
	["weapon_sfrifle"]         = { model = "w_ar_sfrifle", hash = joaat("weapon_sfrifle"), tier = 1 },
	["weapon_slr15"]           = { model = "w_ar_slr15", hash = joaat("weapon_slr15"), tier = 1 },
	["weapon_sr47"]            = { model = "w_ar_sr47", hash = joaat("weapon_sr47"), tier = 1 },
	["weapon_sunda"]           = { model = "w_ar_sunda", hash = joaat("weapon_sunda"), tier = 1 },
	["weapon_ue4"]             = { model = "w_sb_ue4", hash = joaat("weapon_ue4"), tier = 1 },
	["weapon_ditdg"]           = { model = "w_sr_ditdg", hash = joaat("weapon_ditdg"), tier = 2, zr = 180.0, xr = 0.0, yr = -150.0 },
	["grapple"]                = { model = "w_sr_sniperrifle", hash = joaat("grapple"), tier = 2, zr = -152.0, xr = -100.0, yr = -150.0 },

	["weapon_l85_christmas"]   = { model = "w_ar_l85_christmas", hash = joaat("weapon_l85_christmas"), tier = 1 },
	["weapon_nvrifle_purple"]  = { model = "w_ar_nvrifle_purple", hash = joaat("weapon_nvrifle_purple"), tier = 1 },
	["weapon_vector"]          = { model = "w_sb_vector", hash = joaat("weapon_vector"), tier = 1 },

	["weapon_m4_tactical_red"]            = { model = "w_ar_m4_tactical_red", hash = joaat("weapon_m4_tactical_red"), tier = 1 },
	["weapon_grauv2"]            = { model = "w_ar_grauv2", hash = joaat("weapon_grauv2"), tier = 1 },
	["weapon_hfsmgv2"]            = { model = "w_sb_hfsmgv2", hash = joaat("weapon_hfsmgv2"), tier = 1 },

	-- tier2
	["weapon_bats"]      = { model = "w_me_baseball_bat_barbed", hash = joaat("weapon_bats"), tier = 2 },
	["weapon_katana"]    = { model = "w_me_katana", hash = joaat("weapon_katana"), tier = 2, zr = 180.0, xr = 0.0, yr = -120.0,
		y = -0.15, x = -0.2, z = 0.12 },
	["weapon_golfclub"]  = { model = "w_me_gclub", hash = joaat("weapon_golfclub"), tier = 2 },
	["weapon_battleaxe"] = { model = "w_me_battleaxe", hash = joaat("weapon_battleaxe"), tier = 2 },
	["weapon_crowbar"]   = { model = "w_me_crowbar", hash = joaat("weapon_crowbar"), tier = 2 },
	["weapon_wrench"]    = { model = "w_me_wrench", hash = joaat("weapon_wrench"), tier = 2, blockCar = true, blockRun = true },
	--[[ ["skateboard"]    = { model = "v_res_skateboard", hash = joaat("v_res_skateboard"), tier = 2, zr = 200.0, xr = 90.0, yr = -10.0,
	y = -0.30, x = 0.0, z = 0.10 }, ]]
	["weapon_thermal_katana"] = { model = "w_me_thermal_katana", hash = joaat("weapon_thermal_katana"), tier = 2 },




	-- These Utilize the NoPixel pelts from their packages get them here: https://3dstore.nopixel.net/package/5141816 --
	["deer_pelt_1"] = { model = "hunting_pelt_01_a", hash = joaat("hunting_pelt_01_a"), tier = 4 },
	["deer_pelt_2"] = { model = "hunting_pelt_01_b", hash = joaat("hunting_pelt_01_b"), tier = 4 },
	["deer_pelt_3"] = { model = "hunting_pelt_01_c", hash = joaat("hunting_pelt_01_c"), tier = 4 },


	-- I use these for my house robbery when they steal the objects --
	["telescope"]      = { carry = true, model = "prop_t_telescope_01b", bone = 24817, x = -0.23, y = 0.43, z = 0.05,
		xr = -10.0, yr = 93.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true, },
	["pcequipment"]    = { carry = true, model = "prop_dyn_pc_02", bone = 24817, x = 0.09, y = 0.43, z = 0.05, xr = 91.0,
		yr = 0.0, zr = -265.0, blockAttack = true, blockCar = true, blockRun = true },
	["coffeemaker"]    = { carry = true, model = "prop_coffee_mac_02", bone = 24817, x = 0.00, y = 0.43, z = 0.05,
		xr = 91.0, yr = 0.0, zr = -265.0, blockAttack = true, blockCar = true, blockRun = true },
	["musicequipment"] = { carry = true, model = "prop_speaker_06", bone = 24817, x = 0.00, y = 0.43, z = 0.05, xr = 91.0,
		yr = 0.0, zr = -265.0, blockAttack = true, blockCar = true, blockRun = true },
	["microwave"]      = { carry = true, model = "prop_microwave_1", bone = 24817, x = -0.20, y = 0.43, z = 0.05, xr = 91.0,
		yr = 0.0, zr = -265.0, blockAttack = true, blockCar = true, blockRun = true },
	--[[ ["package"]      = { carry = true, model = "hei_prop_heist_box", bone = 28422, x = 0.01, y = -0.05, z = 0, xr = 0.0,
		yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true }, ]]
	["stolentv"]      = { carry = true, model = "prop_tv_flat_01", bone = 28422, x = 0.01, y = -0.05, z = 0, xr = 0.0,
		yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true },
	["stolenpc"]      = { carry = true, model = "prop_dyn_pc_02", bone = 28422, x = 0.01, y = -0.05, z = 0, xr = 0.0,
		yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true },
	["stolenmicro"]      = { carry = true, model = "prop_micro_01", bone = 28422, x = 0.01, y = -0.05, z = 0, xr = 0.0,
		yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true },
	["stolenart"]      = { carry = true, model = "ex_mp_h_acc_artwalll_02", bone = 28422, x = 0.01, y = -0.05, z = 0, xr = 0.0,
		yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true },
	["stolenlaptop"]      = { carry = true, model = "prop_laptop_02_closed", bone = 28422, x = 0.01, y = -0.05, z = -0.15, xr = 0.0,
		yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true },
	["stolencoffee"]      = { carry = true, model = "prop_coffee_mac_02", bone = 28422, x = 0.01, y = -0.05, z = 0, xr = 0.0,
		yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true },
	["stolenscope"]      = { carry = true, model = "prop_t_telescope_01b", bone = 28422, x = 0.01, y = -0.05, z = 0, xr = 0.0,
		yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true },
	["stolensafe"]      = { carry = true, model = "prop_ld_int_safe_01", bone = 28422, x = 0.01, y = -0.25, z = 0.35, xr = 0.0,
		yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true },
}

local items_attatched = {}
local itemSlots = {}
local override = false

local PlayerData = QBCore.Functions.GetPlayerData()

local FullyLoaded = LocalPlayer.state.isLoggedIn



local function loadmodel(hash)
	if HasModelLoaded(hash) then return end
	RequestModel(hash)
	while not HasModelLoaded(hash) do
		Wait(0)
	end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ** Weapon Functions ** --


local function getFreeSlot(tier)
	local amount = 0

	for i = 1, #PlayerSlots[tier] do
		if not PlayerSlots[tier][i].isBusy then
			amount = amount + 1
		end
	end

	return amount
end

local function UseSlot(tier)
	local slot = nil
	for i = 1, #PlayerSlots[tier] do
		if not PlayerSlots[tier][i].isBusy then
			PlayerSlots[tier][i].isBusy = true
			slot = i
			break
		end
	end

	return slot
end

local function calcOffsets(x, y, z, xr, yr, zr, item)
	local X, Y, Z, XR, YR, ZR = x, y, z, xr, yr, zr

	if props[item].x then
		X = props[item].x
	end

	if props[item].y then
		Y = props[item].y
	end

	if props[item].z then
		Z = props[item].z
	end

	if props[item].xr then
		XR = props[item].xr
	end


	if props[item].yr then
		YR = props[item].yr
	end

	if props[item].zr then
		ZR = props[item].zr
	end

	return X, Y, Z, XR, YR, ZR
end

local function AttachWeapon(attachModel, modelHash, tier, item)
	local hash = joaat(attachModel)
	local slot = UseSlot(tier)
	if not slot then return end

	local v = PlayerSlots[tier][slot]
	local bone = GetPedBoneIndex(PlayerPedId(), v.bone)

	loadmodel(hash)

	items_attatched[attachModel] = {
		hash = modelHash,
		handle = CreateObject(attachModel, 1.0, 1.0, 1.0, true, true, false),
		slot = slot,
		tier = tier
	}

	local x, y, z, xr, yr, zr = calcOffsets(v.x, v.y, v.z, v.xr, v.yr, v.zr, item)

	AttachEntityToEntity(items_attatched[attachModel].handle, PlayerPedId(), bone, x, y, z, xr, yr, zr, 1, 1, 0, 0, 2, 1)
	SetModelAsNoLongerNeeded(hash)
	SetEntityCompletelyDisableCollision(items_attatched[attachModel].handle, false, true)
end

local WeapDelete = false
local function DeleteWeapon(item)
	local ped = PlayerPedId()
	local hash = items_attatched[item].hash
	if WeapDelete then return end

	WeapDelete = true
	local wait = 0 -- if above 3 seconds then return this function
	while GetSelectedPedWeapon(ped) ~= hash do
		Wait(100)
		wait = wait + 1
		if wait >= 30 then return end -- If they figure out a way to spam then this we just return the function
	end

	if items_attatched[item] then

		DeleteObject(items_attatched[item].handle)

		if items_attatched[item].slot then
			PlayerSlots[items_attatched[item].tier][items_attatched[item].slot].isBusy = false
		end

		items_attatched[item] = nil

	end
	WeapDelete = false
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local carryingBox = nil

local function requestAnimDict(animDict)
	if not HasAnimDictLoaded(animDict) then
		RequestAnimDict(animDict)

		while not HasAnimDictLoaded(animDict) do
			Wait(0)
		end
	end
end

local function doAnim(item)
	if carryingBox then return end -- Only allow the function to be run once at a time
	carryingBox = item
	local ped = PlayerPedId()
	local dict, anim = props[item].dict or 'anim@heists@box_carry@', props[item].anim or 'idle'
	if not anim or not dict then return end

	requestAnimDict(dict)
	CreateThread(function()
		while carryingBox do
			if not IsEntityPlayingAnim(ped, dict, anim, 3) then
				TaskPlayAnim(ped, dict, anim, 8.0, -8, -1, 49, 0, 0, 0, 0)
			end

			if props[carryingBox].blockAttack then
				DisableControlAction(0, 24, true) -- disable attack
				DisableControlAction(0, 25, true) -- disable aim
				DisableControlAction(0, 47, true) -- disable weapon
				DisableControlAction(0, 58, true) -- disable weapon
				DisableControlAction(0, 263, true) -- disable melee
				DisableControlAction(0, 264, true) -- disable melee
				DisableControlAction(0, 257, true) -- disable melee
				DisableControlAction(0, 140, true) -- disable melee
				DisableControlAction(0, 141, true) -- disable melee
				DisableControlAction(0, 142, true) -- disable melee
				DisableControlAction(0, 143, true) -- disable melee
			end

			if props[carryingBox].blockCar and IsPedGettingIntoAVehicle(ped) then
				ClearPedTasksImmediately(ped) -- Stops all tasks for the ped
			end

			if props[carryingBox].blockRun then
				DisableControlAction(0, 22, true) -- disable jumping
				DisableControlAction(0, 21, true) -- disable sprinting
			end

			Wait(1)
		end

		ClearPedTasks(ped)
	end)
end

local function AttatchProp(item)
	if carryingBox then return end
	local ped = PlayerPedId()
	local attachModel = props[item].model
	local hash = joaat(props[item].model)
	local bone = GetPedBoneIndex(ped, props[item].bone)
	SetCurrentPedWeapon(ped, 0xA2719263)
	loadmodel(hash)

	items_attatched[attachModel] = {
		hash = hash,
		handle = CreateObject(attachModel, 1.0, 1.0, 1.0, true, true, false),
		carry = true
	}

	local x, y, z, xr, yr, zr = props[item].x, props[item].y, props[item].z, props[item].xr, props[item].yr, props[item].zr
	AttachEntityToEntity(items_attatched[attachModel].handle, ped, bone, x, y, z, xr, yr, zr, 1, 1, 0, 0, 2, 1)
	SetModelAsNoLongerNeeded(hash)
	SetEntityCompletelyDisableCollision(items_attatched[attachModel].handle, false, true)
	doAnim(item)
end

local tempBox = nil

-- Exports to trick the script into thinking we got an item we can carry --
local function carryProp(item)
	if not item then return print("ITEM NOT DEFINED") end
	if not props[item] then return print("ITEM NOT REGISTERED IN THE CONFIG") end
	if carryingBox then return print("PED IS ALREADY CARRYING AN OBJECT") end
	tempBox = item
	AttatchProp(item)
end

exports('carryProp', carryProp)

local function removeProp(item)
	if not item then return print("ITEM NOT DEFINED") end
	if not props[item] then return print("ITEM NOT REGISTERED IN THE CONFIG") end
	if carryingBox ~= item then return print("Item is not whats being carried...") end
	DeleteObject(items_attatched[props[item].model].handle)
	items_attatched[props[item].model] = nil
	carryingBox = nil
	tempBox = nil
end

exports('removeProp', removeProp)



local carryingChain = nil

local function AttatchChain(attachModel, modelHash, tier, item)
	if carryingChain then return end
	carryingChain = attachModel
	local slot = UseSlot(tier)
	if not slot then return end

	local v = PlayerSlots[tier][slot]
	local bone = GetPedBoneIndex(PlayerPedId(), v.bone)

	loadmodel(modelHash)

	ClearPedTasks(PlayerPedId())


	items_attatched[attachModel] = {
		hash = modelHash,
		handle = CreateObject(attachModel, 1.0, 1.0, 1.0, true, true, false),
		slot = slot,
		tier = tier,
		chain = true,
	}

	local x, y, z, xr, yr, zr = calcOffsets(v.x, v.y, v.z, v.xr, v.yr, v.zr, item)

	AttachEntityToEntity(items_attatched[attachModel].handle, PlayerPedId(), bone, x, y, z, xr, yr, zr, 1, 1, 0, 0, 2, 1)
	SetModelAsNoLongerNeeded(modelHash)
	SetEntityCompletelyDisableCollision(items_attatched[attachModel].handle, false, true)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--** Generic Functions **--

local function getItemByhash(hash)
	for k, v in pairs(props) do
		if v.hash == hash or hash == joaat(v.model) then
			return k
		end
	end
end

local function removeItems()
	if items_attatched then
		for k, v in pairs(items_attatched) do
			local hasitem = false
			local item = getItemByhash(v.hash)
			if item then
				if tempBox ~= item then
					if itemSlots[item] then
						hasitem = true
					end

					if not hasitem or (props[item] and props[item].busy) then
						DeleteObject(v.handle)

						if v.slot then
							PlayerSlots[v.tier][v.slot].isBusy = false
						end

						if v.chain then
							carryingChain = nil
						end

						if v.carry then
							carryingBox = nil
						end

						items_attatched[k] = nil
					end
				end
			end
		end
	end
end

local PlayerId = PlayerId()
local doingCheck = false
local function DoItemCheck()
	if not FullyLoaded then return end
	if doingCheck then return end
	if IsPedShooting(ped) or IsPlayerFreeAiming(PlayerId) then return end -- reduces the shooting spamming
	doingCheck = true
	Wait(math.random(1, 100)) -- When shooting a gun, the event is called HUNDREDS of times, this here is to prevent that from affecting the players MS too much at a time.
	local ped = PlayerPedId()
	local items = PlayerData.items
	itemSlots = {}
	if items then
		for _, item in pairs(items) do
			item.name = item.name:lower()
			if item and item.name and props and props[item.name] and not itemSlots[item.name] then
				itemSlots[item.name] = props[item.name]
				if props[item.name].carry then
					if not carryingBox then
						AttatchProp(item.name)
					end
				elseif props[item.name].chain then
					if not carryingChain then
						AttatchChain(props[item.name].model, props[item.name].hash, props[item.name].tier, item.name)
					end
				elseif not items_attatched[props[item.name].model] and GetSelectedPedWeapon(ped) ~= props[item.name].hash and
					getFreeSlot(props[item.name].tier) >= 1 then
					AttachWeapon(props[item.name].model, props[item.name].hash, props[item.name].tier, item.name)
				end
			end
		end
	end

	removeItems()

	Wait(math.random(1, 100)) -- When shooting a gun, the event is called HUNDREDS of times, this here is to prevent that from affecting the players MS too much at a time.
	doingCheck = false
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ** EXPORTS ** --
local function toggleProps()
	if override then
		if items_attatched then
			for k, v in pairs(items_attatched) do

				DeleteObject(v.handle)

				if v.slot then
					PlayerSlots[v.tier][v.slot].isBusy = false
				end

				if v.carry then
					carryingBox = nil
				end

				if v.chain then
					carryingChain = nil
				end

				items_attatched[k] = nil
			end
		end
		override = false
	else
		override = true

		if items_attatched then
			for k, v in pairs(items_attatched) do

				DeleteObject(v.handle)

				if v.slot then
					PlayerSlots[v.tier][v.slot].isBusy = false
				end

				if v.carry then
					carryingBox = nil
				end

				if v.chain then
					carryingChain = nil
				end

				items_attatched[k] = nil
			end
		end
	end
end

exports("toggleProps", toggleProps)

local function isCarryingObject()
	return carryingBox ~= nil and true or false
end

exports('isCarryingObject', isCarryingObject)

local function isCarryingAnObject(item)
	if items_attatched[props[item].model] then return true else return false end
end

exports('isCarryingAnObject', isCarryingAnObject)

local function GetPlayerCarryItems()
	return items_attatched
end

exports('GetPlayerCarryItems', GetPlayerCarryItems)

local function refreshProps()
	if not FullyLoaded then return end
	if items_attatched then
		for k, v in pairs(items_attatched) do
			DeleteObject(v.handle)

			if v.slot then
				PlayerSlots[v.tier][v.slot].isBusy = false
			end

			if v.carry then
				carryingBox = nil
			end

			if v.chain then
				carryingChain = nil
			end

			items_attatched[k] = nil
		end
	end

	DoItemCheck()
end

exports('refreshProps', refreshProps)

local function makeObjectBusy(item, state)
	if not FullyLoaded then return end
	if not item or not state then return print("YOU ARE MISSING ARGS FOR THIS EXPORT") end
	if not props[item] then return print("ITEM: " .. item .. " DOES NOT EXIST") end
	if props[item] and props[item].busy == nil then return print("ITEM: " .. item .. " CANNOT BE SET TO BUSY") end
	props[item].busy = state
	DoItemCheck()
end

exports('makeObjectBusy', makeObjectBusy)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ** GENERIC EVENTS ** --
AddEventHandler('ox_inventory:currentWeapon', function(data)
	if not FullyLoaded then return end
	if override then return end
	if data then
		data.name = data.name:lower()
		if props[data.name] and items_attatched[props[data.name].model] then
			DeleteWeapon(props[data.name].model)
		end
	else
		Wait(1000)
		DoItemCheck()
	end
end)

RegisterNetEvent('weapons:client:SetCurrentWeapon', function(data)
	if data and LocalPlayer.state.isLoggedIn then
		if props[data.name] and items_attatched[props[data.name].model] then
			DeleteWeapon(props[data.name].model)
		end
	elseif not data and LocalPlayer.state.isLoggedIn then
		Wait(1000)
		if not override then DoItemCheck() elseif override and PlayerData.metadata.inside.apartment.apartmentId then DoItemCheck() end
	end
end)

-- Handles state right when the player selects their character and location.
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	Wait(20000)
	PlayerData = QBCore.Functions.GetPlayerData()
	FullyLoaded = true
	Wait(250)
	if not override then DoItemCheck() elseif override and PlayerData.metadata.inside.apartment.apartmentId then DoItemCheck() end
end)

-- Resets state on logout, in case of character change.
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	PlayerData = nil
	FullyLoaded = false
end)

-- Handles state when PlayerData is changed. We're just looking for inventory updates.
RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
	PlayerData = val
	Wait(50)
	if not override then DoItemCheck() elseif override and PlayerData.metadata.inside.apartment.apartmentId then DoItemCheck() end
end)

-- Handles state if resource is restarted live.
AddEventHandler('onResourceStart', function(resource)
	if GetCurrentResourceName() == resource then
		Wait(100)
		if not FullyLoaded then return end
		DoItemCheck()
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for key, attached_object in pairs(items_attatched) do
			DeleteObject(attached_object.handle)
			items_attatched[key] = nil
		end
	end
end)

