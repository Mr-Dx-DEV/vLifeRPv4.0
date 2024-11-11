CONFIG = {}
CONFIG.Locale = 'en'
Framework = {
    ESX = 'esx',
    QBCore = 'qbcore',
    Custom = 'custom',
}
CONFIG.Framework = Framework.ESX -- esx or qbcore or custom
CONFIG.AlertIcon = './assets/siren.svg'
CONFIG.Debug = false
CONFIG.RCoreStatsIntegration = false

CONFIG.Features = {
    ['radio'] = true
}

--- The key of each job should be the name of the job
CONFIG.JOBS = {
    ['police'] = {
        Jobname = 'police',
        SharedBlips = { 'ambulance' }, -- Jobs that will share the map blips
        GlobalFrequency = 1,
        Ispolice = true,
        Ranks = {
            [0] = 'SASP Trainee',
            [1] = 'LSPD Cadet',
            [2] = 'LSPD Officer',
            [3] = 'BCSO Deputy',
            [4] = 'LSPD Senior Officer',
            [5] = 'BCSO Senior Deputy',
            [6] = 'LSPD Corporal',
            [7] = 'BCSO Corporal',
            [8] = 'LSPD Sergeant',
            [9] = 'BCSO Sergeant',
            [10] = 'LSPD Head Sergeant',
            [11] = 'BCSO Head Sergeant',
            [12] = 'LSPD Lieutenant',
            [13] = 'BCSO Colonel',
            [14] = 'LSPD Captain',
            [15] = 'BCSO Major',
            [16] = 'LSPD Assistant Chief',
            [17] = 'Under Sheriff',
            [18] = 'LSPD Chief',
            [19] = 'Sheriff',
            [20] = 'Trooper Lieutenant',
            [21] = 'Trooper Captain',
            [22] = 'Deputy Commissioner',
            [23] = 'Commissioner'
        },
        Blips = { -- Each vehicle type has a blip, and no vehicle is equals to 'none'
            ['automobile'] =
            './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg'
        },
        Perms = {
            ['Trooper Captain'] = true,
            ['Deputy Commissioner'] = true,
            ['Commissioner'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } }, -- At the right side, add the jobs which aren't the same job that you want to share unit
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC',     805, true },
        }
    },
    ['ambulance'] = {
        Jobname = 'ambulance',
        Ispolice = false,
        GlobalFrequency = 5,
        SharedBlips = { 'police' }, -- Jobs that will share the map blips
        Ranks = {
            [0] = 'EMT',
            [1] = 'EMT Advance',
            [2] = 'Sergeant',
            [3] = 'Lead-Paramedic',
            [4] = 'Specialist',
            [5] = 'Lieutenant',
            [6] = 'Captain',
            [7] = 'Assistant Chief',
            [8] = 'Deputy Chief',
            [9] = 'Chief of EMS'
        },
        
        Blips = {                     -- Each vehicle type has a blip, and no vehicle is equals to 'none'
            ['automobile'] =
            './assets/ambulance.svg', -- The path of the image, you can use a link or a local path
            ['bike'] = './assets/ambulance.svg',
            ['heli'] = './assets/ambulance.svg',
            ['none'] = './assets/ambulance.svg'
        },
        Perms = {
            ['Assistant Chief'] = true,
            ['Deputy Chief'] = true,
            ['Chief of EMS'] = true
        },
        Units = {
            { 'Command', 805, false, { 'police' } }, -- At the right side, add the jobs which aren't the same job that you want to share unit
            { 'Alfa',    806, false },
            { 'Bravo',   807, false },
            { 'Charlie', 808, false },
        }
    },

}

print('hola')

CONFIG.EnableCallsigns = true

CONFIG.EnableOwnUnitChange = true -- If you want to enable the change of unit for the own player without permissions

CONFIG.RelatedJobs = {            -- Jobs that will share the GLOBAL RADIO
    --[[     {t
        {
            job = 'police',
            label = 'Police',
        },
        {
            job = 'ambulance',
            label = 'EMS',
        }
    }, ]]
}
