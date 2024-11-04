Config = {
    EnablePrint = true, -- If the resource should print what version you're on or not. (If you dont want to look at the print for some reason)
    PID = '', -- Your tebex payment id, used for error logging & easier support

    CoreObject = exports['qb-core']:GetCoreObject(),

    Database = {
        Tables = {
            Players = 'players',
            Vehicles = 'player_vehicles',
            Houses = 'player_houses'
        },
        Columns = {
            Identifier = 'citizenid',
            Charinfo = 'charinfo'
        }
    },

    Discord = {
        Open = { -- When a person opens the MDW
            Enable = false,
            Webhook = ''
        },
        Incident = {
            Create = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            },
            Delete = {
                Enable = false,
                Webhook = ''
            }
        },
        Report = {
            Create = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            },
            Delete = {
                Enable = false,
                Webhook = ''
            }
        },
        Evidence = {
            Create = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            },
            Delete = {
                Enable = false,
                Webhook = ''
            }
        },
        Staff = {
            Hire = {
                Enable = false,
                Webhook = ''
            },
            Fire = {
                Enable = false,
                Webhook = ''
            },
            Save = {
                Enable = false,
                Webhook = ''
            }
        },
        Config = {
            Message = {
                Enable = false,
                Webhook = ''
            }
        }
    },

    -- Basic
    Command = 'mdw', -- Command used to open the mdw
    Animation = true, -- Animation and tablet when opening it
    Button = 69, -- E / To turn the opacity true/false (Key codes can be found at: https://css-tricks.com/snippets/javascript/javascript-keycodes/)
    Opacity = 0.35, -- Percentage it'll show (0-1)
    
    -- If person is hired & online
    HiredJob = 'police', -- Job to assign
    HiredGrade = 0, -- Grade to assign

    -- If person is fired & online
    FiredJob = 'unemployed', -- Job to assign
    FiredGrade = 0, -- Grade to assign

    -- Citizens legislations
    Citizen = {
        Key = 38, -- Open key
        Text = '[E] - Open database system', -- Display text shown if you're near a point
        Locations = { -- Coordinates where it's possible to open
            {291.75, -610.11, 43.37},
            {285.71, -613.38, 43.38}
        },
    },

    -----------------------------
    -- // NUI CONFIGURABLES // --
    LoadingTimer = 100, -- Loading effect in ms + how long it takes to fetch the information
    EnableDuty = true,
    TimeFormat = '%d-%m-%Y %H:%M:%S', -- '%Y-%m-%d %H:%M:%S' for other countries format
    SelectedPage = 0, -- Selected page when you open it (Number value of the page)
    SelectedSubPage = 0, -- If etc "[8] STAFF" is selected, which sub page to be selected
    Pages = {
        [0] = {Page = 'DASHBOARD'},
        [1] = {Page = 'PROFILES'},
        [2] = {Page = 'INCIDENTS'},
        [3] = {Page = 'REPORTS'},
        [4] = {Page = 'EVIDENCE'},
        [5] = {Page = 'VEHICLES'},
        [6] = {Page = 'DISPATCH'},
        [7] = {Page = 'CHARGES'},
        [8] = {Page = 'STAFF',
            Subs = {
                [0] = {Page = 'EMPLOYEES'},
                [1] = {Page = 'ACADEMY SHEET'},
                [2] = {Page = 'DISCIPLINARY DATABASE'},
                [3] = {Page = '10 CODES / CMDS'}
            }},
        [9] = {Page = 'LEGISLATION'}
    },

    -- Cashboard Page
    SaveChat = true, -- Save the chat messages on resource stop
    SaveAnnouncements = true, -- Clear the announcements on each resource stop
    -- Cashboard Page

    -- Profiles page
    LoafHousing = false, -- If you're using loaf_properties, then turn this true
    LBPhone = false, -- If you're using LB Phone ,then turn this true
    Fingerprint = false, -- If fingerprint should be showed or not
    AvailableTags = { -- Available tags to add (id always has to be unique | label)
        {id = 1, label = 'Be aware'},
        {id = 2, label = 'Dangerous'},
        {id = 3, label = 'Wanted'},
        {id = 4, label = 'Im batman'},
        {id = 5, label = 'Bubble'}
    },
    -- Profiles page

    -- Incidents page
    IncidentTags = { -- Available tags to add (id always has to be unique | Label)
        {id = 1, label = 'Incident tag 1'},
        {id = 2, label = 'Incident tag 2'},
        {id = 3, label = 'Incident tag 3'},
        {id = 4, label = 'Incident tag 4'},
        {id = 5, label = 'Incident tag 5'},
        {id = 6, label = 'Incident tag 6'},
        {id = 7, label = 'Incident tag 7'},
        {id = 8, label = 'Incident tag 8'},
        {id = 9, label = 'Incident tag 9'}
    },
    -- Incidents page

    -- Report page
    Report = {
        Categories = {'Investigative Report', 'Standard Report', 'Bubbles Report', 'Bubbles'}, -- Available categories to select
        Tags = {
            {id = 1, label = 'Vagos', color = 'yellow'},
            {id = 2, label = 'Ballas', color = 'purple'},
            {id = 3, label = 'Families', color = 'green'},
            {id = 4, label = 'Suspecious', color = 'orange'},
            {id = 5, label = 'Suspecious Boxes', color = 'orange'},
            {id = 6, label = 'Weird??', color = 'red'}
        }
    },
    -- Report page

    -- Evidence page
    Evidence = {
        Types = {'Murder Case', 'Other'}, -- Available categories to select
        Tags = { -- Available tags to add (id always has to be unique | label)
            {id = 1, label = 'Vagos'},
            {id = 2, label = 'Ballas'},
            {id = 3, label = 'Families'}
        }
    },
    -- Evidence page

     -- Vehicles page
     Vehicles = {
        States = {
            {id = 0, label = 'Out'},
            {id = 1, label = 'Parked'},
            {id = 2, label = 'Depot'}
        },
        Tags = {
            {id = 1, label = 'Example 1'},
            {id = 2, label = 'Example 2'},
            {id = 3, label = 'Example 3'},
            {id = 4, label = 'Example 4'},
            {id = 5, label = 'Example 5'},
        }
    },
    -- Vehicles page

    -- Dispatch page
    DispatchHeaders = {

        -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- Fixed width on each table in the nui (If you want it to be automated based on content size, then remove the width (Example below))
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},

        {text = 'Call ID',        value = 'callid',   sortable = true,  width = 100, divider = true},
        {text = 'Type',           value = 'type',     sortable = true,  width = 100, divider = true},
        {text = 'Caller',         value = 'caller',   sortable = false, width = 100, divider = true},
        {text = 'Details',        value = 'details',  sortable = false, width = 385, divider = true},
        {text = 'Location',       value = 'location', sortable = false, width = 200, divider = true},
        {text = 'Date',           value = 'date',     sortable = true,  width = 130, divider = true},
        {text = 'Units Attached', value = 'unit',     sortable = true,  width = 150, divider = true},
        {text = 'Actions',        value = 'actions',  sortable = false, width = 120, divider = true}
    },
    -- Dispatch page

    -- Charges page
    Charges = { -- Charges (id always has to be unique | Label | Fine | Jail Time | Points | Color(rgb, rgba, colorcode#) | Description)
        { id = 1, Label = 'Assault', Fine = 300, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 2, Label = 'Battery', Fine = 600, Jail = 20, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 3, Label = 'Unlawful Imprisonment', Fine = 450, Jail = 15, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 4, Label = 'Grand Theft', Fine = 150, Jail = 5, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 5, Label = 'Receiving Stolen Property', Fine = 300, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 6, Label = 'Robbery', Fine = 600, Jail = 20, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 7, Label = 'Petty Theft', Fine = 250, Jail = 0, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 8, Label = 'Possession of a Stolen Identification', Fine = 350, Jail = 15, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 9, Label = 'Tampering With a Vehicle', Fine = 300, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 10, Label = 'Joyriding', Fine = 300, Jail = 10, Points = 0, Color = 'green', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },

        { id = 11, Label = 'Assault with deadly weapon', Fine = 900, Points = 0, Jail = 30, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 12, Label = 'Kidnapping', Fine = 600, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 13, Label = 'Attempting Murder', Fine = 1200, Jail = 40, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 14, Label = 'Attempted Manslaugther', Fine = 900, Jail = 30, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 15, Label = 'Grand Theft Auto', Fine = 600, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 16, Label = 'Possession of Stolen Goods', Fine = 600, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 17, Label = 'Accessory to Robbery', Fine = 600, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 18, Label = 'Extortion', Fine = 600, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 19, Label = 'Impersonation', Fine = 600, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 20, Label = 'Fraud', Fine = 600, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 21, Label = 'Identity Theft', Fine = 1800, Jail = 60, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 22, Label = 'Impersonating a Judge', Fine = 900, Jail = 30, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 23, Label = 'Vehicle Registration Fraud', Fine = 600, Jail = 20, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 24, Label = 'Impersonating a Peace Officer', Fine = 900, Jail = 30, Points = 0, Color = 'orange', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },

        { id = 25, Label = 'Accessory to First Degree Robbery', Fine = 1050, Jail = 35, Points = 2, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 26, Label = 'Manslaugther', Fine = 1200, Jail = 40, Points = 4, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 27, Label = 'First Degree Robbery', Fine = 1050, Jail = 35, Points = 1, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' },
        { id = 28, Label = 'Murder', Fine = 1500, Jail = 50, Points = 3, Color = 'red', Desc = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium natus doloribus, nam saepe autem fugiat facilis possimus facere voluptatibus consequuntur, eligendi, distinctio quibusdam recusandae quo eius! Cum est eaque veniam.' }
    },
    -- Charges page

    -- Staff page
    -- Staff page

    -- Staff Employees
        -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},
    StaffEmployees = {
        {text = 'Call Sign',        value = 'callsign',         sortable = true,  divider = true},
        {text = 'Name',             value = 'name',             sortable = false, divider = true},
        {text = 'Rank',             value = 'rank',             sortable = false, divider = true},
        {text = 'Phone number',     value = 'phone',            sortable = false, divider = true},
        {text = 'APU',              value = 'apu',              sortable = false, divider = true},
        {text = 'AIR',              value = 'air',              sortable = false, divider = true},
        {text = 'MC',               value = 'mc',               sortable = false, divider = true},
        {text = 'K9',               value = 'k9',               sortable = false, divider = true},
        {text = 'Strikes',          value = 'strikes',          sortable = false, divider = true},
        {text = 'Responsibilities', value = 'responsibilities', sortable = false, divider = true},
        {text = 'FTO',              value = 'fto',              sortable = false, divider = true},
        {text = 'Actions',          value = 'action',           sortable = false, divider = true}
    },
    -- Staff Employees

    -- Staff academy sheet
    -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},
    AcademySheet = {
        {text = 'Call Sign',        value = 'callsign', sortable = false, divider = true},
        {text = 'Name',             value = 'name',     sortable = false, divider = true},
        {text = 'Driving',          value = 'driving',  sortable = false, divider = true},
        {text = 'Shooting Training',value = 'shooting', sortable = false, divider = true},
        {text = 'Report Writing',   value = 'report',   sortable = false, divider = true},
        {text = 'MDW Access',       value = 'mdw',      sortable = false, divider = true},
        {text = 'Rights',           value = 'rights',   sortable = false, divider = true},
        {text = 'Intro course',     value = 'intro',    sortable = false, divider = true},
        {text = 'Theory Test',      value = 'theory',   sortable = false, divider = true},
        {text = 'Practical Test',   value = 'practical',sortable = false, divider = true},
        {text = 'Actions',          value = 'action',   sortable = false, divider = true}
    },
    -- Staff academy sheet

    -- Staff disciplinary database
    -- Change text to what you'd like to be displayed in the nui
        -- Do not change value
        -- Change if the item can be sorted or not (by clicking on it in the nui)
        -- If a divider should be shown, turn true, false ore remove it

        -- (EXAMPLE) VERY IMPORTANT THAT "text" AND "value" ALWAYS EXISTS! REST CAN BE REMOVED IF YOU WANT THAT
        -- {text = 'Call ID', value = 'callid',},
    Disciplinary = {
        {text = 'Call Sign',            value = 'callsign',     sortable = false, divider = true},
        {text = 'Name',                 value = 'name',         sortable = false, divider = true},
        {text = 'Department',           value = 'department',   sortable = false, divider = true},
        {text = 'Rank',                 value = 'rank',         sortable = false, divider = true},
        {text = 'Punishment',           value = 'punishment',   sortable = false, divider = true},
        {text = 'Date',                 value = 'date',         sortable = false, divider = true},
        {text = 'Given By',             value = 'givenby',      sortable = false, divider = true},
        {text = 'Reason for punishment',value = 'rfp',          sortable = false, divider = true},
        {text = 'Actions',              value = 'action',       sortable = false, divider = true}
    },
    -- Staff disciplinary database

    -- Staff 10 codes
    TenCodes = {
        {text = 'Code',         value = 'code', sortable = false, divider = true},
        {text = 'Description',  value = 'desc', sortable = false, divider = true},
    },
    TenCodesData = {
        {code = '10-0', desc = 'Something'},
        {code = '10-1', desc = 'Something'},
        {code = '10-2', desc = 'Something'},
        {code = '10-3', desc = 'Something'},
        {code = '10-4', desc = 'Something'},
    },

    CMDS = {
        {text = 'Command',      value = 'cmd', sortable = false, divider = true},
        {text = 'Description',  value = 'desc', sortable = false, divider = true},
    },
    CMDSData = {
        {cmd = '/cuff',   desc = 'Cuff player'},
        {cmd = '/sc',     desc = 'Cuff player, but in a dirty way'},
        {cmd = '/jail',   desc = 'Jail player'},
        {cmd = '/unjail', desc = 'Unjail player'},
        {cmd = '/mdw',    desc = 'Open the MDW'},
    },
    -- Staff 10 codes


    -- Legislation page
    Legislations = {
        Tags = {
            {id = 1, label = 'Example 1'},
            {id = 2, label = 'Example 2'},
            {id = 3, label = 'Example 3'},
            {id = 4, label = 'Example 4'},
            {id = 5, label = 'Example 5'},
        }
    },
    -- Legislation page

    -- Configuration page
    Message = { -- This will be shown if there's no message in the database
        Title = 'NO MESSAGE',
        Text = 'Theres currently no message to display, so how about you actually do some work around here?'
    },
    Announcement = {
        Tags = {
            {id = 1, label = 'Example 1'},
            {id = 2, label = 'Example 2'},
            {id = 3, label = 'Example 3'},
            {id = 4, label = 'Example 4'},
            {id = 5, label = 'Example 5'},
        }
    },
    -- Configuration page

    -- Staff roles
    PoliceRoles = { -- Assignable roles, that gives access to certain functions.
        {id = 0, access = false, role = 'Full Access'}, -- Only edit the "role"

        {id = 1, access = false, role = 'Edit Profiles'},

        {id = 2, access = false, role = 'Edit Incidents'},
        {id = 3, access = false, role = 'Create Incidents'},
        {id = 4, access = false, role = 'Delete Incidents'},
        
        {id = 5, access = false, role = 'Edit Reports'},
        {id = 6, access = false, role = 'Create Reports'},
        {id = 7, access = false, role = 'Delete Reports'},

        {id = 8, access = false, role = 'Edit Evidence'},
        {id = 9, access = false, role = 'Create Evidence'},
        {id = 10, access = false, role = 'Delete Evidence'},

        {id = 11, access = false, role = 'Edit Vehicles'},

        {id = 12, access = false, role = 'Staff Employees'},
        {id = 13, access = false, role = 'Academy Sheet'},
        {id = 14, access = false, role = 'Disciplinary Database'},

        {id = 15, access = false, role = 'Legislation'} -- Required if you want to add/delete/edit legislations, full access doesn't have access to this for roleplay reasons!
    }

    -- // NUI CONFIGURABLES // --
    -----------------------------
}

Notifications = {
    ERROR404 = {'something happend, contact the server owner', 'error'}, -- Something happend that shouldnt

    -- Officer notifications
    FiredTarget = {'Target fired and placed as unemployed', 'success'},
    HiredTarget = {'Target hired and placed as police', 'success'},
    FiredNoResult = {'Citizenid could not be found in the database', 'error'},
    SaveStaff = {'Staff profile was saved', 'success'},
    UnitExists = {'A unit with that name already exists', 'error'},

    -- Police notifications
    ProfileSaved = {'Profile was saved', 'success'},
    TargetFired = {'You were fired from the police', 'error'},
    TargetHired = {'You were hired to the police', 'success'},

    -- Basic notifications
    OnDuty = {'You are now on duty', 'success'},
    OffDuty = {'You are now off duty', 'success'},
    TargetOffline = {'Action can not be done, while the target is offline', 'error'},
}