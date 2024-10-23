print("^2Jim^7-^2DJBooth ^7v^41^7.^43^7.^42 ^2by ^1Jimathy^7")

Config = {
	Lan = "en",
	Debug = false, -- Set to true to show target locations

	Core = "qb-core",
	Menu = "ox",
	Notify = "ox",
	
	Locations = {

		{ -- bahama mamas
			job = "bahamas", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 50,
			coords = vec3(-1377.4, -608.03, 31.22),
			soundLoc = vec3(-1377.4, -608.03, 31.22), -- Add sound origin location if you don't want the music to play from the dj booth
		},

		{ -- bahama mamas
			job = "lustresort", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 50,
			coords = vec3(-563.19, 219.72, 86.24),
			soundLoc = vec3(-569.70, 222.53, 85.08), -- Add sound origin location if you don't want the music to play from the dj booth
		},
		
		{ -- bahama mamas
			job = "vanilla", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 50,
			coords = vec3(119.25, -1300.00, 29.21),
			soundLoc = vec3(118.62, -1290.98, 30.40), -- Add sound origin location if you don't want the music to play from the dj booth
		},

		{ -- WhiteWidow1
			job = "whitewidow", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 50,
			coords = vec3(-1375.91, -1242.23, 4.38),
			soundLoc = vec3(-1380.19, -1242.85, 4.30), -- Add sound origin location if you don't want the music to play from the dj booth
		},
		{ -- WhiteWidow2
			job = "whitewidow", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 50,
			coords = vec3(-1334.53, -1218.24, 5.98),
			soundLoc = vec3(-1339.48, -1222.18, 5.82), -- Add sound origin location if you don't want the music to play from the dj booth
		},
		
		{ -- Autos Mechanic
			job = "mechanicautos", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 50,
			coords = vec3(560.25, -169.32, 58.35),
			soundLoc = vec3(548.89, -184.05, 54.50), -- Add sound origin location if you don't want the music to play from the dj booth
		},
		

		{ -- Hen House
			job = "rexdiner", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 30,
			coords = vec3(2525.90, 2592.84, 38.67),
			soundLoc = vec3(2534.78, 2588.70, 38.49), -- Add sound origin location if you don't want the music to play from the dj booth
		},

		{ -- HMirror Pizza
			job = "mirror", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 50,
			coords = vec3(-1297.3700, -1036.9460, 13.1606),
			soundLoc = vec3(-1322.0400, -1051.5806, 12.4717), -- Add sound origin location if you don't want the music to play from the dj booth
		},

		{ -- Tropical Heights
			job = "tropical", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 50,
			coords = vec3(306.1683, -918.5784, 52.9932),
			soundLoc = vec3(300.9384, -925.4977, 54.0971), -- Add sound origin location if you don't want the music to play from the dj booth
		},

		{ -- JadeDragon
			job = "skyclub", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 70,
			coords = vec3(-886.57501220703, -438.09924316406, 161.14253234863),
			soundLoc = vec3(-891.72747802734, -440.9104309082, 160.98139953613), -- Add sound origin location if you don't want the music to play from the dj booth
		},

		{ -- JadeDragon
			job = "public", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 30,
			coords = vec3(-707.4166, -2491.7595, 13.9456),
			soundLoc = vec3(-716.6302, -2518.4468, 13.9468), -- Add sound origin location if you don't want the music to play from the dj booth
		},
		
		{ -- KOII
			job = "koi", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 70,
			coords = vec3(-1062.84, -1447.59, -1.42),
			soundLoc = vec3(-1059.6257324219, -1462.6069335938, -1.020287156105), -- Add sound origin location if you don't want the music to play from the dj booth
		},

		{ -- Tropical beach
			job = "costalclove", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 70,
			coords = vec3(-2167.60, -524.15, 12.05),
			soundLoc = vec3(-2157.67, -526.52, 12.15), -- Add sound origin location if you don't want the music to play from the dj booth
		},

		{ -- Tequilala
			job = "tequilala", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 20,
			coords = vec3(-550.48, 283.76, 82.98),
			soundLoc = vec3(-562.64, 289.04, 82.62), -- Add sound origin location if you don't want the music to play from the dj booth
		},


	},
}

Loc = {}