QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	unemployed = { label = 'Civilian', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Freelancer', payment = 10 } } },
	bus = { label = 'Bus', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	judge = { label = 'Honorary', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Judge', payment = 100 } } },
	lawyer = { label = 'Law Firm', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Associate', payment = 50 } } },
	reporter = { label = 'Reporter', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Journalist', payment = 50 } } },
	trucker = { label = 'Trucker', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	tow = { label = 'Towing', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	garbage = { label = 'Garbage', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Collector', payment = 50 } } },
	vineyard = { label = 'Vineyard', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Picker', payment = 50 } } },
	hotdog = { label = 'Hotdog', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Sales', payment = 50 } } },
	

    
	['lspd'] = {
		label = 'LSPD',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Officer',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Officer',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Commander',
                payment = 1500
            },
            ['8'] = {
                name = 'Deputy Chief',
                payment = 2000
            },
            ['9'] = {
                name = 'Asst. Chief',
                isboss = true,
                
                payment = 2500
            },
            ['10'] = {
                name = 'Chief',
                isboss = true,
                
                payment = 3500
            },
            ['11'] = {
                name = 'Deputy Commissioner',
                isboss = false,
                payment = 4000
            },
            ['12'] = {
                name = 'Commissioner',
                isboss = false,
                payment = 5000
            },
        },
	},
        ['bcso'] = {
		label = 'BCSO',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Deputy',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Deputy',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Major',
                payment = 1500
            },
            ['8'] = {
                name = 'Chief Deputy',
                payment = 2000
            },
            ['9'] = {
                name = 'Under Sheriff',
                isboss = true,
                
                payment = 2500
            },
            ['10'] = {
                name = 'Sheriff',
                isboss = true,
                
                payment = 3500
            },
        },
	},
    --[[     ['sahp'] = {
		label = 'SAHP',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Officer',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Officer',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Commander',
                payment = 1500
            },
            ['8'] = {
                name = 'Major',
                payment = 2000
            },
            ['9'] = {
                name = 'Lt Colonel',
                isboss = true,
                
                payment = 2500
            },
            ['10'] = {
                name = 'Colonel',
                isboss = true,
                
                payment = 3500
            },
        },
	},
        ['lsso'] = {
		label = 'LSSO',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Deputy',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Deputy',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Major',
                payment = 1500
            },
            ['8'] = {
                name = 'Chief Deputy',
                payment = 2000
            },
            ['9'] = {
                name = 'Under Sheriff',
                isboss = true,
                
                payment = 2500
            },
            ['10'] = {
                name = 'Sheriff',
                isboss = true,
                
                payment = 3500
            },
        },
	},
        ['safw'] = {
		label = 'SAFW',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Officer',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Officer',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Commander',
                payment = 1500
            },
            ['8'] = {
                name = 'Deputy Chief',
                payment = 2000
            },
            ['9'] = {
                name = 'Asst. Chief',
                isboss = true,
                
                payment = 2500
            },
            ['10'] = {
                name = 'Chief',
                isboss = true,
                
                payment = 3500
            },
        },
	},
        ['sadoc'] = {
		label = 'SADOC',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'CO Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Correction Officer',
                payment = 500
            },
            ['2'] = {
                name = 'Senior Correction Officer',
                payment = 600
            },
            ['3'] = {
                name = 'Corporal',
                payment = 700
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 900
            },
            ['6'] = {
                name = 'Captain',
                payment = 1000
            },
            ['7'] = {
                name = 'Major',
                payment = 1500
            },
            ['8'] = {
                name = 'Colonel',
                payment = 2000
            },
            ['9'] = {
                name = 'Deputy Warden',
                isboss = true,
                
                payment = 2500
            },
            ['10'] = {
                name = 'Warden',
                isboss = true,
                
                payment = 3500
            },
        },
	},
        ['usms'] = {
		label = 'USMS',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit Marshal',
                payment = 400
            },
            ['1'] = {
                name = 'Marshal',
                payment = 600
            },
            ['2'] = {
                name = 'Senior Marshal',
                payment = 900
            },
            ['3'] = {
                name = 'Marshal In Charge',
                payment = 1000
            },
            ['4'] = {
                name = 'Tactical Opps Div',
                payment = 1200
            },
            ['5'] = {
                name = 'Investigation Div',
                payment = 1200
            },
            ['6'] = {
                name = 'Witness Security Div',
                payment = 1200
            },
            ['7'] = {
                name = 'Judicial Security Div',
                payment = 1500
            },
            ['8'] = {
                name = 'Associate Director',
                payment = 2000
            },
            ['9'] = {
                name = 'Deputy Director',
                isboss = true,
                
                payment = 2500
            },
            ['10'] = {
                name = 'Director',
                isboss = true,
                
                payment = 3500
            },
        },
	}, ]]
        ['fbi'] = {
		label = 'FBI',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit Special Agent',
                payment = 400
            },
            ['1'] = {
                name = 'Special Agent ',
                payment = 600
            },
            ['2'] = {
                name = 'Senior Special Agent',
                payment = 900
            },
            ['3'] = {
                name = 'Supervisory Special Agent',
                payment = 1000
            },
            ['4'] = {
                name = 'Tactical/Training SAIC',
                payment = 1200
            },
            ['5'] = {
                name = 'Criminal Investigation SAIC',
                payment = 1200
            },
            ['6'] = {
                name = 'Labor/Finance SAIC',
                payment = 1200
            },
            ['7'] = {
                name = 'National Security SAIC',
                payment = 1200
            },
            ['8'] = {
                name = 'Associat Deputy Director',
                payment = 2000
            },
            ['9'] = {
                name = 'Deputy Director',
                isboss = true,
                
                payment = 2500
            },
            ['10'] = {
                name = 'Director',
                isboss = true,
                
                payment = 3500
            },
        },
	},
    --[[     ['dhs'] = {
		label = 'DHS',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit BPA',
                payment = 350
            },
            ['1'] = {
                name = 'Senior Agent',
                payment = 500
            },
            ['2'] = {
                name = 'Lead Agent',
                payment = 600
            },
            ['3'] = {
                name = 'Supervisor Agent',
                payment = 700
            },
            ['4'] = {
                name = 'Field Opps Super ',
                payment = 800
            },
            ['5'] = {
                name = 'Special Operations Supervisor',
                payment = 900
            },
            ['6'] = {
                name = 'Special Agent in Charge',
                payment = 1000
            },
            ['7'] = {
                name = 'Deputy Chief',
                payment = 1500
            },
            ['8'] = {
                name = 'Chief',
                payment = 2000
            },
            ['9'] = {
                name = 'Deputy Diector',
                isboss = true,
                
                payment = 2500
            },
            ['10'] = {
                name = 'Director',
                isboss = true,
                
                payment = 3500
            },
        },
	},
    ['ss'] = {
		label = 'SS',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 350
            },
            ['1'] = {
                name = 'Officer',
                payment = 500
            },
            ['2'] = {
                name = 'Sergeant',
                payment = 600
            },
            ['3'] = {
                name = 'Lieutenant',
                payment = 700
            },
            ['4'] = {
                name = 'Agent IPO',
                payment = 800
            },
            ['5'] = {
                name = 'Special Agent',
                payment = 900
            },
            ['6'] = {
                name = 'Special special Agent',
                payment = 1000
            },
            ['7'] = {
                name = 'Deputy SAiC',
                payment = 1500
            },
            ['8'] = {
                name = 'Special Agent in Charge',
                payment = 2000
            },
            ['9'] = {
                name = 'Deputy Director',
                isboss = true,
                
                payment = 2500
            },
            ['10'] = {
                name = 'Director',
                isboss = true,
                
                payment = 3500
            },
        },
	},
	


     ]]
	police = {
		label = 'Law Enforcement',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = "SASP Trainee", payment = 4500 },
            ['1'] = { name = 'LSPD Cadet',  payment = 4750 },
            ['2'] = { name = 'LSPD Officer',payment = 5000 },
            ['3'] = { name = 'BCSO Deputy', payment = 5000 },
            ['4'] = { name = 'LSPD Senior Officer', payment = 5250 },
            ['5'] = { name = 'BCSO Senior Deputy', payment = 5250 },
            ['6'] = { name = 'LSPD Corporal', payment = 5500 },
            ['7'] = { name = 'BCSO Corporal', payment = 5500 },
            ['8'] = { name = 'LSPD Sergeant', payment = 5750 },
            ['9'] = { name = 'BCSO Sergeant', payment = 5750 },
            ['10'] = { name = 'LSPD Head Sergeant', payment = 6000 },
            ['11'] = { name = 'BCSO Head Sergeant', payment = 6000 },
            ['12'] = { name = 'LSPD Lieutenant', payment = 6250 },
            ['13'] = { name = 'BCSO Colonel', payment = 6250 },
            ['14'] = { name = 'LSPD Captain', payment = 6500 },
            ['15'] = { name = 'BCSO Major', payment = 6500 },
            ['16'] = { name = 'LSPD Assistant Chief', payment = 6750 },
            ['17'] = { name = 'Under Sheriff', payment = 6750 },
            ['18'] = { name = 'LSPD Chief', payment = 7000 },
            ['19'] = { name = 'Sheriff', payment = 7000 },
            ['20'] = { name = 'Trooper Lieutenant', payment = 6500 },
            ['21'] = { name = 'Trooper Captain', isboss = true, payment = 7000, },
            ['22'] = { name = 'Deputy Commissioner', isboss = true, payment = 7500 },
            ['23'] = { name = 'Commissioner', isboss = true, payment = 20000 },
        },
	},
    vcorporation = {
        label = 'VCorporation LTD',
        type = 'corporation',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            ['0'] = { name = 'Executive Officer', payment = 1000 },
            ['1'] = { name = 'Body Guard', payment = 1000 },
            ['2'] = { name = 'Account', payment = 2000 },
            ['3'] = { name = 'Tax Officer', payment = 2000 },
            ['4'] = { name = 'Real Estate Officer', payment = 2000 },
            ['5'] = { name = 'Business Audit Officer', payment = 2000 },
            ['6'] = { name = 'Loan Department Officer', payment = 2000 },
            ['7'] = { name = 'Event Management Officer', payment = 2000 },
            ['8'] = { name = 'Manager', payment = 2500 },
            ['9'] = { name = 'Department Head', payment = 3000 },
            ['10'] = { name = 'CEO', isboss = true,  payment = 3500 },
            ['11'] = { name = 'Managing Director', isboss = true,  payment = 4000 },
            ['12'] = { name = 'Chairman', isboss = true,  payment = 5000 },
        },
    },
    
	-- police = {
	-- 	label = 'Law Enforcement',
	-- 	type = 'leo',
	-- 	defaultDuty = true,
	-- 	offDutyPay = false,
	-- 	grades = {
    --         ['0'] = { name = 'Trainee',  payment = 4500 },
    --         ['1'] = { name = 'Cadet',  payment = 4750 },
    --         ['2'] = { name = 'Trooper',payment = 5000 },
    --         ['3'] = { name = 'Trooper Master', payment = 5250 },
    --         ['4'] = { name = 'Trooper First Class', payment = 5500 },
    --         ['5'] = { name = 'Sergeant', payment = 5750 },
    --         ['6'] = { name = 'Sergeant First Class', payment = 6000 },
    --         ['7'] = { name = 'Lieutenant', payment = 6250 },
    --         ['8'] = { name = 'Captain', isboss = true,  payment = 6500 },
    --         ['9'] = { name = 'Deputy Commissioner', isboss = true,  payment = 6750 },
    --         ['10'] = { name = 'Commissioner', isboss = true,  payment = 7000 },
	-- 	},
	-- },
	--[[ bcso = {
		label = 'Blaine County Sheriff Office',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'SDSO Solo Cadet', payment = 4118 },
            ['1'] = { name = "SDSO Deputy", payment = 4707 },
            ['2'] = { name = 'SDSO Senior Deputy', payment = 5295 },
            ['3'] = { name = 'SDSO Corporal', payment = 5883 },
            ['4'] = { name = 'SDSO Sergeant', payment = 6471 },
            ['5'] = { name = 'SDSO Head Sergeant', payment = 7059 },
            ['6'] = { name = 'SDSO Major', payment = 7648 },
            ['7'] = { name = 'SDSO Colonel', payment = 8237 },
            ['8'] = { name = 'Under Sheriff', payment = 9237 },
            ['9'] = { name = 'Sheriff', payment = 10237 },
		},
	}, ]]
	['doj'] = {
		label = 'Department of Justice',
        type = 'doj',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Attorney',
                payment = 2000
            },
            ['1'] = {
                name = 'Secretary',
                payment = 1900
            },
			['2'] = {
                name = 'Assistant District Attorney',
                payment = 2250
            },
			['3'] = {
                name = 'District Attorney',
                payment = 2500
            },
			['4'] = {
                name = 'District Judge',
             --   
                payment = 2800
            },
			['5'] = {
                name = 'Appellate Judge',
              --  
                payment = 3100
            },
			['6'] = {
                name = 'Deputy Chief Justice',
                isboss = true,
                
                payment = 3500
            },
			['7'] = {
                name = 'Chief Justice',
                isboss = true,
                
                payment = 3900
            },
        },
	},
	--[[ sasp = {
		label = 'San Andreas State Police',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = "Recruit", payment = 3530 },
            ['1'] = { name = 'Trooper', payment = 10826 },
            ['2'] = { name = 'Master Trooper', payment = 11415 },
            ['3'] = { name = 'Trooper First Class', payment = 12004 },
            ['4'] = { name = 'Trooper Sergeant', payment = 12593 },
            ['5'] = { name = 'Trooper Sergeant First Class', payment = 13182 },
            ['6'] = { name = 'Trooper Lieutenant', payment = 13771 },
            ['7'] = { name = 'Trooper Captain', isboss = true,  payment = 14360, },
            ['8'] = { name = 'Deputy Commissioner', isboss = true,  payment = 15360 },
            ['9'] = { name = 'Commissioner', isboss = true,  payment = 16360 },
		},
	}, ]]
	ambulance = {
		label = 'EMS',
		type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'EMT', payment = 4500 },
			['1'] = { name = 'EMT Advance', payment = 5000 },
			['2'] = { name = 'Sergeant', payment = 5500 },
            ['3'] = { name = 'Lead-Paramedic', payment = 6000 },
			['4'] = { name = 'Specialist', payment = 7000 },
			['5'] = { name = 'Lieutenant', payment = 7500 },
            ['6'] = { name = 'Captain', payment = 8000 },
			['7'] = { name = 'Assistant Chief', isboss = true, payment = 8500 },
			['8'] = { name = 'Deputy Chief', isboss = true, payment = 9000 },
			['9'] = { name = 'Chief of EMS', isboss = true,   payment = 9000 },
		},
	},
	senator = {
		label = 'Senator',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Boss', isboss = true,  payment = 3000 },
		},
	},
	realestate = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'House Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Broker', payment = 125 },
			['4'] = { name = 'Manager', isboss = true,  payment = 150 },
		},
	},
	['tax'] = {
		label = 'Government Tax',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Tax Staff',
                payment = 160
            },
        },
	},
    ['mtaxi'] = {
		label = 'Mahin Taxi',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 160
            },
            ['1'] = {
                name = 'Owner',
                payment = 3200
            },
        },
	},
	taxi = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Driver', payment = 75 },
			['2'] = { name = 'Event Driver', payment = 100 },
			['3'] = { name = 'Sales', payment = 125 },
			['4'] = { name = 'Manager', isboss = true,  payment = 150 },
		},
	},
	cardealer = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true,  payment = 150 },
		},
	},
    pdmmechancis = {
		label = 'PDM Mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true,  payment = 150 },
		},
	},
	--[[ bennys = {
		label = 'Benny\'s Original Motor Works',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true,  payment = 150 },
		},
	}, ]]
	urbanmechanic = {
		label = 'Urban Mechanics',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Advanced', payment = 125 },
			['3'] = { name = 'Manager', isboss = true,  payment = 150 },
		},
	},
    countymechanic = {                             --- petelo
		label = 'County Mechanics',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Advanced', payment = 125 },
			['3'] = { name = 'Manager', isboss = true,  payment = 150 },
		},
	},
    mechanic = {                             --- petelo
		label = 'Mechanics',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Advanced', payment = 125 },
			['3'] = { name = 'Manager', isboss = true,  payment = 150 },
		},
	},
	
	
	['nexuslawfirm'] = {
		label = 'Nexus Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Security',
                payment = 700
            },
            ['1'] = {
                name = 'Secretary',
                payment = 800
            },
            ['2'] = {
                name = 'Attorney',
                payment = 900
            },
            ['3'] = {
                name = 'Senior Attorney',
                payment = 1000
            },
            ['4'] = {
                name = 'CEO',
                payment = 1300,
                isboss = true,
                bankAuth = true
            },
        },
	},
    ['blackfuego'] = {
		label = 'Black & Fuego Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Security',
                payment = 700
            },
            ['1'] = {
                name = 'Secretary',
                payment = 800
            },
            ['2'] = {
                name = 'Attorney',
                payment = 900
            },
            ['3'] = {
                name = 'Senior Attorney',
                payment = 1000
            },
            ['4'] = {
                name = 'CEO',
                payment = 1300,
                isboss = true,
                bankAuth = true
            },
        },
	},
	['mirror'] = {
		label = 'Mirror Pizza',
		defaultDuty = true,
        offDutyPay = false,
		grades = {
            ['0'] = { name = 'New Hire', payment = 2000 },
			['1'] = { name = 'Employee', payment = 2300 },
			['2'] = { name = 'Supervisor', payment = 2600 },
			['3'] = { name = 'Manager', payment = 2900 },
			['4'] = { name = 'Owner', isboss = true,  payment = 3200 },
        },
	},
    ['henhouse'] = {
		label = 'Hen House',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 2000 },
			['1'] = { name = 'Novice', payment = 2300 },
			['2'] = { name = 'Experienced', payment = 2600 },
			['3'] = { name = 'Advanced', payment = 2900 },
			['4'] = { name = 'Manager', isboss = true,  payment = 3200 },
        },
	},
    
    ['beanmachine'] = {
		label = 'Bean Machine',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'New Hire', payment = 2000 },
			['1'] = { name = 'Employee', payment = 2300 },
			['2'] = { name = 'Supervisor', payment = 2600 },
			['3'] = { name = 'Manager', payment = 2900 },
			['4'] = { name = 'Owner', isboss = true,  payment = 3200 },
        },
	},
    ['lsbeanmachine'] = {
		label = 'Bean Machine',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'New Hire', payment = 2000 },
			['1'] = { name = 'Employee', payment = 2300 },
			['2'] = { name = 'Supervisor', payment = 2600 },
			['3'] = { name = 'Manager', payment = 2900 },
			['4'] = { name = 'Owner', isboss = true,  payment = 3200 },
        },
	},
    ['customcaffe'] = {
		label = 'Custom Caffe',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'New Hire', payment = 2000 },
			['1'] = { name = 'Employee', payment = 2300 },
			['2'] = { name = 'Supervisor', payment = 2600 },
			['3'] = { name = 'Manager', payment = 2900 },
			['4'] = { name = 'Owner', isboss = true,  payment = 3200 },
        },
	},
	--[[ beeker = {
		label = 'Beeker\'s Garage',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true,  payment = 150 },
		},
	}, ]]
	burgershot = {
		label = 'BurgerShot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 5 },
			['1'] = { name = 'Cashier', payment = 7 },
			['2'] = { name = 'Chef', payment = 10 },
			['3'] = { name = 'Manager', isboss = true,  payment = 12 },
		},
	},
	catcafe = {
		label = 'Cat Cafe',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 5 },
			['1'] = { name = 'Cashier', payment = 7 },
			['2'] = { name = 'Chef', payment = 10 },
			['3'] = { name = 'Manager', isboss = true,  payment = 12 },
		},
	},
    diner = {
		label = 'Pops Diner',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 50 },
			['1'] = { name = 'Cashier', payment = 75 },
			['2'] = { name = 'Chef', payment = 100 },
			['3'] = { name = 'Manager', isboss = true,  payment = 125 },
		},
	},
	vwupnatom = {
		label = 'Up Atoms',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 50 },
			['1'] = { name = 'Cashier', payment = 75 },
			['2'] = { name = 'Chef', payment = 100 },
			['3'] = { name = 'Manager', isboss = true,  payment = 125 },
		},
	},
    bwsaloon = {
		label = 'Black Wood Saloon',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 50 },
			['1'] = { name = 'Cashier', payment = 75 },
			['2'] = { name = 'Chef', payment = 100 },
			['3'] = { name = 'Manager', isboss = true,  payment = 125 },
		},
	},
    gsupnatom = {
		label = 'Up-N-Atom',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 50 },
			['1'] = { name = 'Cashier', payment = 75 },
			['2'] = { name = 'Chef', payment = 100 },
			['3'] = { name = 'Manager', isboss = true,  payment = 125 },
		},
	},
    mpburgershot = {
		label = 'Burgershot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 50 },
			['1'] = { name = 'Cashier', payment = 75 },
			['2'] = { name = 'Chef', payment = 100 },
			['3'] = { name = 'Manager', isboss = true,  payment = 125 },
		},
	},
    rfclucking = {
		label = 'Clucking Bell',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 50 },
			['1'] = { name = 'Cashier', payment = 75 },
			['2'] = { name = 'Chef', payment = 100 },
			['3'] = { name = 'Manager', isboss = true,  payment = 125 },
		},
	},
    ssburgershot = {
		label = 'Burgershot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 50 },
			['1'] = { name = 'Cashier', payment = 75 },
			['2'] = { name = 'Chef', payment = 100 },
			['3'] = { name = 'Manager', isboss = true,  payment = 125 },
		},
	},
    vpburgershot = {
		label = 'Burgershot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 50 },
			['1'] = { name = 'Cashier', payment = 75 },
			['2'] = { name = 'Chef', payment = 100 },
			['3'] = { name = 'Manager', isboss = true,  payment = 125 },
		},
	},    
	pearls = {
		label = 'Sea Pearls',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 50 },
			['1'] = { name = 'Cashier', payment = 75 },
			['2'] = { name = 'Chef', payment = 100 },
			['3'] = { name = 'Manager', isboss = true,  payment = 125 },
		},
	},
	--[[ bennysmechanic = {
		label = 'Bennys Mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 50 },
			['1'] = { name = 'Cashier', payment = 75 },
			['2'] = { name = 'Chef', payment = 100 },
			['3'] = { name = 'Manager', isboss = true,  payment = 125 },
		},
	}, ]]



	['lplucker'] = {
		label = 'Lucky Plucker',
		defaultDuty = true,
        offDutyPay = false,
		grades = {
            ['0'] = { name = 'New Hire', payment = 2000 },
			['1'] = { name = 'Employee', payment = 2300 },
			['2'] = { name = 'Supervisor', payment = 2600 },
			['3'] = { name = 'Manager', payment = 2900 },
			['4'] = { name = 'Owner', isboss = true,  payment = 3200 },
        },
	},
    ['rexdiner'] = {
		label = 'Rex Diner',
		defaultDuty = true,
        offDutyPay = false,
		grades = {
            ['0'] = { name = 'New Hire', payment = 2000 },
			['1'] = { name = 'Employee', payment = 2300 },
			['2'] = { name = 'Supervisor', payment = 2600 },
			['3'] = { name = 'Manager', payment = 2900 },
			['4'] = { name = 'Owner', isboss = true,  payment = 3200 },
        },
	},
    ['hornys'] = {
		label = 'Hornys Burger',
		defaultDuty = true,
        offDutyPay = false,
		grades = {
            ['0'] = { name = 'New Hire', payment = 2000 },
			['1'] = { name = 'Employee', payment = 2300 },
			['2'] = { name = 'Supervisor', payment = 2600 },
			['3'] = { name = 'Manager', isboss = true,  payment = 2900 },
			['4'] = { name = 'Owner', isboss = true,  payment = 3200 },
        },
	},
    ['vanilla'] = {
		label = 'Vanilla Unicorn',
		defaultDuty = true,
        offDutyPay = false,
		grades = {
            ['0'] = { name = 'Bouncer', payment = 2000 },
			['1'] = { name = 'DJ', payment = 2240 },
			['2'] = { name = 'Dancer', payment = 2480 },
			['3'] = { name = 'Bar Tender', payment = 2720 },
			['4'] = { name = 'Manager', payment = 2960 },
            ['5'] = { name = 'CEO', isboss = true,  payment = 3200 },
        },
	},
    ['tropical'] = {
		label = 'Tropical Heights',
		defaultDuty = true,
        offDutyPay = false,
		grades = {
            ['0'] = { name = 'Bouncer', payment = 2000 },
			['1'] = { name = 'DJ', payment = 2240 },
			['2'] = { name = 'Dancer', payment = 2480 },
			['3'] = { name = 'Bar Tender', payment = 2720 },
			['4'] = { name = 'Manager', payment = 2960 },
            ['5'] = { name = 'CEO', isboss = true,  payment = 3200 },
        },
	},
    ['skyclub'] = {
        label = 'Sky Club',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Event Planner',
                payment = 2000
            },
            ['1'] = {
                name = 'Specialist',
                payment = 2150
            },
            ['2'] = {
                name = 'DJ',
                payment = 2450
            },
            ['3'] = {
                name = 'Security',
                payment = 2600
            },
            ['4'] = {
                name = 'Bartender',
                payment = 2300
            },
            ['5'] = {
                name = 'Senior Bartender',
                payment = 2750
            },
            ['6'] = {
                name = 'Manager',
                payment = 2900
            },
            ['7'] = {
                name = 'Senior Manager',
                payment = 3050
            },
            ['8'] = {
                name = 'Owner',
                payment = 3200,
                isboss = true, 
            },
        },
    },
    ['tequilala'] = {
        label = 'Tequila-La',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Bartender',
                payment = 2000
            },
            ['1'] = {
                name = 'DJ',
                payment = 2300
            },
            ['2'] = {
                name = 'Bouncer',
                payment = 2600
            },
            ['3'] = {
                name = 'Manager',
                payment = 2900
            },
            ['4'] = {
                name = 'Owner',
                payment = 3200,
                isboss = true, 
            },
        },
    },
    ['radioshop'] = {
		label = 'Radio Shop',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 2000
            },
			['1'] = {
                name = 'Novice',
                payment = 2300
            },
			['2'] = {
                name = 'Experienced',
                payment = 2600
            },
			['3'] = {
                name = 'Manager',
                payment = 2900
            },
			['4'] = {
                name = 'Owner',
				isboss = true,
                
                payment = 3200
            },
        },
	},
    --[[ ['mechanicredline'] = {
		label = 'RedLine Performance',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 300
            },
			['1'] = {
                name = 'Novice',
                payment = 500
            },
			['2'] = {
                name = 'Experienced',
                payment = 600
            },
			['3'] = {
                name = 'Manager',
                payment = 700
            },
			['4'] = {
                name = 'Owner',
				isboss = true,
                
                payment = 800
            },
        },
	}, ]]
    ['casino'] = {
        label = 'Casino',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Novice', payment = 100 },
            ['1'] = { name = 'Experienced', payment = 100 },
            ['2'] = { name = 'Boss', isboss = true,  payment = 200 },
        },
    },
    ['bahamas'] = {
        label = 'Bahama Mamas',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 2000
            },
            ['1'] = {
                name = 'Dancer',
                payment = 2100
            },
            ['2'] = {
                name = 'Bartender',
                payment = 2300
            },
            ['3'] = {
                name = 'Security',
                payment = 2500
            },
            ['4'] = {
                name = 'Lead dancer',
                payment = 2600
            },
            ['5'] = {
                name = 'Head of security',
                payment = 2800
            },
            ['6'] = {
                name = 'Assistant manager',
                payment = 3000
            },
            ['7'] = {
                name = 'Owner',
                payment = 3200,
                isboss = true, 
                
            },
        },
    },
    ['cityhall'] = {
        label = 'CityHall',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Clerk',
				isboss = false,
                payment = 800
            },
            ['1'] = {
                name = 'Mayor Secretary',
				isboss = false,
                payment = 1000
            },
            ['2'] = {
                name = 'Government Staff',
				isboss = false,
                payment = 1000
            },
            ['3'] = {
                name = 'Deputy Mayor',
				isboss = true, 
                payment = 1500
            },
			['4'] = {
                name = 'Mayor',
				isboss = true, 
                payment = 2000
            },
		},
    },
   
    ['port'] = {
		label = 'Port Delivery',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Deliver Man',
                payment = 50
            },
        },
	},
    ['oiltruck'] = {
		label = 'Oil Trunker',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 25
            },
        },
	},
    ['fisher'] = {
		label = 'Fisher Man',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Fisher',
                payment = 25
            },
        },
	},
    ['postal'] = {
		label = 'Go Postal',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Delivery Man',
                payment = 25
            },
        },
	},
    ['farm'] = {
		label = 'Farmer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Boss',
                payment = 10
            },
            ['1'] = {
                name = 'Employee',
                payment = 10
            },
        },
    },
    ['hunter'] = {
		label = 'LS Hunters', --- change if you like
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Hunter',
                payment = 50
            },
        },
	},
    ['blazeit'] = {
		label = 'Blaze It!',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 2000
            },
			['1'] = {
                name = 'Deliveries',
                payment = 2240
            },
			['2'] = {
                name = 'Sales',
                payment = 2480
            },
			['3'] = {
                name = 'Grower',
                payment = 2720
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 2960,
                bankAuth = false
            },
			['5'] = {
                name = 'Owner',
				isboss = true,
                payment = 3200,
                bankAuth = true
            },
        },
	},

    ['whitewidow'] = {
		label = 'White Widow',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 2000
            },
			['1'] = {
                name = 'Deliveries',
                payment = 2200
            },
			['2'] = {
                name = 'Sales',
                payment = 2400
            },
			['3'] = {
                name = 'Grower',
                payment = 2600
            },
			['4'] = {
                name = 'Assistant Manager',
                payment = 2800
            },
			['5'] = {
                name = 'Manager',
				isboss = true, 
                payment = 3000
            },
			['6'] = {
                name = 'Owner',
				isboss = true, 
                payment = 3200
            },
        },
	},
    ['ppp'] = {
		label = 'Puff Puff Pass',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 2000
            },
			['1'] = {
                name = 'Deliveries',
                payment = 2240
            },
			['2'] = {
                name = 'Sales',
                payment = 2480
            },
			['3'] = {
                name = 'Grower',
                payment = 2720
            },
			['4'] = {
                name = 'Manager',
                payment = 2960
            },
			['5'] = {
                name = 'Owner',
				isboss = true, 
                payment = 3200
            },
        },
	},

    ['pkart'] = {
		label = 'Plasma Kart',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Enginier',
                payment = 2000
            },
			['1'] = {
                name = 'Hoster',
                payment = 2500
            },
			['2'] = {
                name = 'Manager',
                payment = 2800
            },
			['3'] = {
                name = 'Owner',
                isboss = true, 
                payment = 3200
            },
			
        },
	},

    ['costalclove'] = {
        label = 'Costal Clove',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 2000
            },
            ['1'] = {
                name = 'Cook',
                payment = 2300
            },
            ['2'] = {
                name = 'Host/Hostess',
                payment = 2600
            },
            ['3'] = {
                name = 'Assistant Manager',
                payment = 2900,
            },
            ['4'] = {
                name = 'Manager',
                payment = 3000,
            },
            ['5'] = {
                name = 'CEO',
                payment = 3200,
                
                isboss = true
            },
        },
    },

    ['koi'] = {
        label = 'Koi Restaurant',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Delivery',
                payment = 2000
            },
            ['1'] = {
                name = 'Server',
                payment = 2300
            },
            ['2'] = {
                name = 'Cook',
                payment = 2600
            },
            ['3'] = {
                name = 'Assistant Manager',
                payment = 2900,
            },
            ['4'] = {
                name = 'Manager',
                payment = 3000,
            },
            ['5'] = {
                name = 'CEO',
                payment = 3200,
                
                isboss = true
            },
        },
    },

    ['vapeshop'] = {
        label = 'SmoKing Vape Shop',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Trainie',
                payment = 2000
            },
            ['1'] = {
                name = 'Sales',
                payment = 2300
            },
            ['2'] = {
                name = 'Senior Sales',
                payment = 2600
            },
            ['3'] = {
                name = 'Manager',
                payment = 2900,
            },
            ['4'] = {
                name = 'CEO',
                payment = 3200,
                
                isboss = true
            },
        },
    },

    ['collectors'] = {
        label = 'Collectors Corner',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Tranie',
                payment = 2000
            },
            ['1'] = {
                name = 'Sales Man',
                payment = 2300
            },
            ['2'] = {
                name = 'Card Maker',
                payment = 2600
            },
            ['3'] = {
                name = 'Manager',
                payment = 2900,
            },
            ['4'] = {
                name = 'CEO',
                payment = 3200,
                
                isboss = true
            },
        },
    },
}
