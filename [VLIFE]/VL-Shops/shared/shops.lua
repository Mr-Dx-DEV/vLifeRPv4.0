Locations = {
	["vipmembership"] = {
        ["label"] = "VOP Shop",
		["type"] = "items",
		["model"] = {
			`ig_trafficwarden`,
		},
		["killable"] = false,
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(-1147.038, -1613.143, 4.393, 112.712),
			
		},
		["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["products"] = Products["vipmembership"],
        ["blipsprite"] = 458,
		["blipcolour"] = 5,
		["hideblip"] = true,
    },
	["policeshop"] = {
        ["label"] = "Police Shop",
		["type"] = "items",
		["model"] = {
			`ig_trafficwarden`,
		},
		["killable"] = false,
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(485.125, -999.147, 30.69, 2.593),
			
		},
		["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["products"] = Products["policeshop"],
        ["blipsprite"] = 458,
		["blipcolour"] = 5,
		["hideblip"] = true,
    },
	["emsshop"] = {
        ["label"] = "EMS Shop",
		["type"] = "items",
		["model"] = {
			`s_m_m_doctor_01`,
		},
		["killable"] = false,
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(-458.13, -312.46, 34.80, 19.66),
			
		},
		["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["products"] = Products["policeshop"],
        ["blipsprite"] = 458,
		["blipcolour"] = 5,
		["hideblip"] = true,
    },
	
	["gangshop"] = {
        ["label"] = "Gang Shop",
		["type"] = "items",
		["model"] = {
			`S_M_M_StrVend_01`,
		},
		["killable"] = false,
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(5133.418, -4615.896, 2.094, 350.718),
		},
		["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["products"] = Products["gangshop"],
        ["blipsprite"] = 458,
		["blipcolour"] = 5,
		["hideblip"] = false,
    },
	["farmingshop"] = {
        ["label"] = "Farm Shop",
		["type"] = "items",
		["model"] = {
			`S_M_M_StrVend_01`,
		},
		["killable"] = false,
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(862.954, 3675.97, 32.796, 340.447),
		},
		["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["products"] = Products["farmingshop"],
        ["blipsprite"] = 458,
		["blipcolour"] = 5,
		["hideblip"] = false,
    },
	["weedshop"] = {
        ["label"] = "Smoke On The Water",
		["type"] = "items",
		["model"] = {
			`a_m_y_hippy_01`,
		},
		["killable"] = false,
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(-1168.26, -1573.2, 4.66, 105.24),
		},
		["scenario"] = "WORLD_HUMAN_AA_SMOKE",
        ["products"] = Products["weedshop"],
        ["blipsprite"] = 140,
		['blipscale'] = 0.5,
		["blipcolour"] = 0,
		["hideblip"] = false,
    },

	--[[ ["leisureshop"] = {
        ["label"] = "Leisure Shop",
		["type"] = "items",
		["model"] = {
			`a_m_y_beach_01`,
		},
		["killable"] = false,
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(-1505.91, 1511.95, 115.29, 257.13),
		},
		["scenario"] = "WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE",
        ["products"] = Products["leisureshop"],
        ["blipsprite"] = 52,
		['blipscale'] = 0.5,
		["blipcolour"] = 0,
		["hideblip"] = false,
    }, ]]

	--[[ ["contract"] = {
        ["label"] = "PDM Store",
		["type"] = "items",
		["model"] = {
			`cs_solomon`,
		},
		["killable"] = false,
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(-31.9889, -1099.8458, 27.2744, 69.8242),
		},
		["scenario"] = "WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE",
        ["products"] = Products["contract"],
        ["blipsprite"] = 121,
		['blipscale'] = 0.5,
		["blipcolour"] = 48,
		["hideblip"] = true,
    }, ]]

	["collectors"] = {
        ["label"] = "Collectors",
		["type"] = "items",
		["model"] = {
			`cs_solomon`,
		},
		["killable"] = false,
		["logo"] = "https://i.imgur.com/bPcM0TM.png",
        ["coords"] = {
			vector4(-147.41, 219.08, 94.98, 262.88),
		},
		["scenario"] = "WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE",
        ["products"] = Products["collectors"],
        ["blipsprite"] = 121,
		['blipscale'] = 0.5,
		["blipcolour"] = 48,
		["hideblip"] = true,
		["job"] = "collectors",
    },
    
}

--if Gabz locations are enabled, override their coords with these
if Config.Overrides.Gabz247 then
	Locations["247supermarket"]["coords"] = {
		vec4(24.91, -1346.86, 29.5, 268.37),
		vec4(-3039.64, 584.78, 7.91, 21.88),
		vec4(-3242.73, 1000.46, 12.83, 2.08),
		vec4(1728.44, 6415.4, 35.04, 243.26),
		vec4(1697.96, 4923.04, 42.06, 326.61),
		vec4(1960.26, 3740.6, 32.34, 300.45),
		vec4(548.67, 2670.94, 42.16, 101.0),
		vec4(2677.97, 3279.95, 55.24, 325.89),
		vec4(2556.8, 381.27, 108.62, 359.15),
		vec4(373.08, 326.75, 103.57, 253.14),
		vec4(161.2, 6641.74, 31.7, 221.02),
		vec4(812.86, -782.01, 26.17, 270.01),
	}
end
if Config.Overrides.GabzAmmu then
	Locations["ammunation"]["coords"] = {
		vec4(-659.16, -939.79, 21.83, 91.25),
		vec4(812.85, -2155.16, 29.62, 355.85),
		vec4(1698.04, 3757.43, 34.71, 136.69),
		vec4(-326.03, 6081.17, 31.45, 138.33),
		vec4(246.87, -51.3, 69.94, 335.47),
		vec4(18.71, -1108.24, 29.8, 158.71),
		vec4(2564.85, 298.83, 108.74, 283.17),
		vec4(-1112.4, 2697.08, 18.55, 152.96),
		vec4(841.16, -1028.63, 28.19, 294.2),
		vec4(-1310.71, -394.33, 36.7, 340.51),
	}
end
if Config.Overrides.BlackMarket then
	Locations["blackmarket"] = {
		["label"] = "Black Market",
		["type"] = "items",
		["model"] = {
			`mp_f_weed_01`,
			`MP_M_Weed_01`,
			`A_M_Y_MethHead_01`,
			`A_F_Y_RurMeth_01`,
			`A_M_M_RurMeth_01`,
			`MP_F_Meth_01`,
			`MP_M_Meth_01`,
		},
		["coords"] = {
			vec4(776.24, 4184.08, 41.8, 92.12),
			vec4(2482.51, 3722.28, 43.92, 39.98),
			vec4(462.67, -1789.16, 28.59, 317.53),
			vec4(-115.15, 6369.07, 31.52, 232.08),
			vec4(752.52, -3198.33, 6.07, 301.72)
		},
		["products"] = Products["blackmarket"],
		["hideblip"] = true,
	}
end

if Config.Overrides.VendOverride then
	Locations["vendingmachine"] = {
		["label"] = "Vending Machine",
		["targetIcon"] = "fas fa-calculator",
		["targetLabel"] = "Vending Machine",
		["type"] = "items",
		["logo"] = "https://static.wikia.nocookie.net/gtawiki/images/d/d4/Ecola-GTAO-LSTunersBanner.png",
		["model"] = { -- You can add more models to this, but these make the most sense for the vending machine stuff
			`prop_vend_soda_01`,
			`prop_vend_soda_02`,
			`prop_vend_snak_01`,
			`prop_vend_snak_01_tu`
		},
		["coords"] = { -- If you want to place custom vending machine locations
			vec4(131.13, -3007.16, 7.04, 0.0), -- GABZ LS Tuners
		},
		["products"] = Products["vending"],
	}
end