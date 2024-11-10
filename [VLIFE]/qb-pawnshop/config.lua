Config = {}

Config.PawnLocation = {
    [1] = {
            coords = vector3(412.34, 314.81, 103.13),
            length = 1.5,
            width = 1.8,
            heading = 207.0,
            debugPoly = false,
            minZ = 100.97,
            maxZ = 105.42,
            distance = 3.0
        },
    }

Config.BankMoney = false -- Set to true if you want the money to go into the players bank
Config.UseTimes = false -- Set to false if you want the pawnshop open 24/7
Config.TimeOpen = 7 -- Opening Time
Config.TimeClosed = 17 -- Closing Time
Config.SendMeltingEmail = true

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.PawnItems = {
    [1] = {
        item = 'tablet',
        price = math.random(200, 300)
    },
    [2] = {
        item = 'iphone',
        price = math.random(200, 300)
    },
    [3] = {
        item = 'samsungphone',
        price = math.random(200, 300)
    },
    [4] = {
        item = 'coffeemachine',
        price = math.random(300, 400)
    },
    [5] = {
        item = 'laptop',
        price = math.random(300, 400)
    },
    [6] = {
        item = 'necklace',
        price = math.random(500, 550)
    },
    [7] = {
        item = 'goldbar',
        price = math.random(11000, 13000)
    },
    [8] = {
        item = 'goldchain',
        price = math.random(800, 900)
    },
    [9] = {
        item = '10kgoldchain',
        price = math.random(1000, 1100)
    },
    [10] = {
        item = 'rolex',
        price = math.random(1300, 1400)
    },
    [11] = {
        item = 'diamond',
        price = math.random(1500, 1600)
    },
    [12] = {
        item = 'diamond_ring',
        price = math.random(1900, 2000)
    },
    [13] = {
        item = 'painting',
        price = math.random(1900, 2000)
    },





    
    [14] = {
        item = 'md_bottlecap',
        price = math.random(5, 5)
    },
    [15] = {
        item = 'md_brokenjunk',
        price = math.random(5, 5)
    },
    [16] = {
        item = 'md_crushedcan',
        price = math.random(5, 5)
    },
    [17] = {
        item = 'md_lighter',
        price = math.random(5, 5)
    },
    [18] = {
        item = 'md_metalcan',
        price = math.random(5, 5)
    },
    [19] = {
        item = 'md_nails',
        price = math.random(10, 10)
    },
    [20] = {
        item = 'md_needle',
        price = math.random(10, 10)
    },
    [21] = {
        item = 'md_nut',
        price = math.random(10, 10)
    },
    [22] = {
        item = 'md_oldshotgunshell',
        price = math.random(10, 10)
    },
    [23] = {
        item = 'md_paperclip',
        price = math.random(10, 10)
    },
    [24] = {
        item = 'md_pulltab',
        price = math.random(15, 15)
    },
    [25] = {
        item = 'md_rustyball',
        price = math.random(15, 15)
    },
    [26] = {
        item = 'md_rustyironball',
        price = math.random(15, 15)
    },
    [27] = {
        item = 'md_rustyjunk',
        price = math.random(15, 15)
    },
    [28] = {
        item = 'md_rustynails',
        price = math.random(15, 15)
    },
    [29] = {
        item = 'md_rustypliers',
        price = math.random(20, 20)
    },
    [30] = {
        item = 'md_rustyring',
        price = math.random(20, 20)
    },
    [31] = {
        item = 'md_rustyscissors',
        price = math.random(20, 20)
    },
    [32] = {
        item = 'md_rustyscrewdriver',
        price = math.random(20, 20)
    },
    [33] = {
        item = 'md_rustyspring',
        price = math.random(30, 30)
    },
    [34] = {
        item = 'md_screw',
        price = math.random(30, 30)
    },
    [35] = {
        item = 'md_wheatpenny',
        price = math.random(30, 30)
    },
    [36] = {
        item = 'md_nickle',
        price = math.random(40, 40)
    },
    [37] = {
        item = 'md_silverdime',
        price = math.random(40, 40)
    },
    [38] = {
        item = 'md_quarter',
        price = math.random(50, 50)
    },
    [39] = {
        item = 'md_halfdollar',
        price = math.random(75, 75)
    },
    [40] = {
        item = 'md_blackwatch',
        price = math.random(125, 125)
    },
    [41] = {
        item = 'md_coppernugget',
        price = math.random(150, 150)
    },
    [42] = {
        item = 'md_ironnugget',
        price = math.random(175, 175)
    },
    [43] = {
        item = 'md_earpod',
        price = math.random(200, 200)
    },
    [44] = {
        item = 'md_relicrevolver',
        price = math.random(250, 250)
    },
    [45] = {
        item = 'md_silverearings',
        price = math.random(500, 500)
    },
    [46] = {
        item = 'md_silverring',
        price = math.random(500, 500)
    },
    [47] = {
        item = 'md_silverounce',
        price = math.random(750, 750)
    },
    [48] = {
        item = 'md_ancientcoin',
        price = math.random(1000, 1000)
    },
    [49] = {
        item = 'md_golddollar',
        price = math.random(1250, 1250)
    },
    [50] = {
        item = 'md_goldearings',
        price = math.random(1500, 1500)
    },
    [51] = {
        item = 'md_goldnecklace',
        price = math.random(1750, 1750)
    },
    [52] = {
        item = 'md_goldnugget',
        price = math.random(2000, 2000)
    },
    [53] = {
        item = 'md_goldounce',
        price = math.random(2250, 2250)
    },
    [54] = {
        item = 'md_goldring',
        price = math.random(2500, 2500)
    },
    [55] = {
        item = 'md_diamondearings',
        price = math.random(3000, 3000)
    },
    [56] = {
        item = 'md_diamondnecklace',
        price = math.random(3250, 3250)
    },
    [57] = {
        item = 'md_diamondring',
        price = math.random(3500, 3500)
    },
    [58] = {
        item = 'md_platinumnugget',
        price = math.random(4000, 4000)
    },
    [59] = {
        item = 'md_presidentialwatch',
        price = math.random(5000, 5000)
    },
    [60] = { item = 'romantic_book', price = math.random(20, 80) },
    [61] = { item = 'condom', price = math.random(20, 80) },
    [62] = { item = 'glassbottle', price = math.random(20, 80) },
    [63] = { item = 'notepad', price = math.random(20, 80) },
    [64] = { item = 'pencil', price = math.random(20, 80) },
    [65] = { item = 'emptycan', price = math.random(20, 80) },
    [66] = { item = 'bong', price = math.random(20, 80) },
    [67] = { item = 'cardboard', price = math.random(20, 80) },
    [68] = { item = 'emptypapercup', price = math.random(20, 80) },
    [69] = { item = 'earings', price = math.random(20, 80) },
    [70] = { item = 'gold_bracelet', price = math.random(20, 80) },
    [71] = { item = 'goldchain', price = math.random(20, 80) },
    [72] = { item = 'copper_wires', price = math.random(20, 80) },
    [73] = { item = 'condom', price = math.random(20, 80) },
    [74] = { item = 'gold_watch', price = math.random(20, 80) },
    [75] = { item = 'laptop_green', price = math.random(20, 80) },
    [76] = { item = 'gold_bracelet', price = math.random(20, 80) },
    [77] = { item = 'goldchain', price = math.random(20, 80) },
    [78] = { item = 'glassbottle', price = math.random(20, 80) },
    




    
}

Config.MeltingItems = { -- meltTime is amount of time in minutes per item
    --[[ [1] = {
        item = 'goldchain',
        rewards = {
            [1] = {
                item = 'goldbar',
                amount = 2
            }
        },
        meltTime = 0.15
    },
    [2] = {
        item = 'diamond_ring',
        rewards = {
            [1] = {
                item = 'diamond',
                amount = 1
            },
            [2] = {
                item = 'goldbar',
                amount = 1
            }
        },
        meltTime = 0.15
    },
    [3] = {
        item = 'rolex',
        rewards = {
            [1] = {
                item = 'diamond',
                amount = 1
            },
            [2] = {
                item = 'goldbar',
                amount = 1
            },
            [3] = {
                item = 'electronickit',
                amount = 1
            }
        },
        meltTime = 0.15
    },
    [4] = {
        item = '10kgoldchain',
        rewards = {
            [1] = {
                item = 'diamond',
                amount = 5
            },
            [2] = {
                item = 'goldbar',
                amount = 1
            }
        },
        meltTime = 0.15
    }, ]]
}
