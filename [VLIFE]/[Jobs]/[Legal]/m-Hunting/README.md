# m-Hunting script for QB

| If you are intested in recieving updates join the community on **[Discord](https://discord.gg/svmzYehU8R)**! |


# About
- Optimized
- Enable / Disable zones to hunt
- Random Loot
- Utilizes qb-target, qb-menu

# Info
- 9 Drops
- Level System on knife
- Level System on tent

# Level System
- There are 5 knife available, from level 1 to level 5, when they start working, they receive a level 1 knife but, after fishing some fishs, they can evolve to the level 2 knife that will give more items.


**qb-core/shared/items.lua**
```
        -- m-Hunting
    -- Meat
    ['badmeat']                 = {['name'] = 'badmeat',                ['label'] = 'Low Quality Meat',             ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'badmeat.png',                  ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    ['medmeat']                 = {['name'] = 'medmeat',                ['label'] = 'Medium Quality Meat',          ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'medmeat.png',                  ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    ['maxmeat']                 = {['name'] = 'maxmeat',                ['label'] = 'Maximum Quality Meat',         ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'maxmeat.png',                  ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    
    -- Leather
    ['badleather']              = {['name'] = 'badleather',             ['label'] = 'Low Quality Leather',          ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'badleather.png',               ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    ['medleather']              = {['name'] = 'medleather',             ['label'] = 'Medium Quality Leather',       ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'medleather.png',               ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    ['maxleather']              = {['name'] = 'maxleather',             ['label'] = 'Maximum Quality Leather',      ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'maxleather.png',               ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
     
     -- Horns
    ['badhorns']                = {['name'] = 'badhorns',               ['label'] = 'Low Quality Horns',            ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'badhorns.png',                 ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    ['medhorns']                = {['name'] = 'medhorns',               ['label'] = 'Medium Quality Horns',         ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'medhorns.png',                 ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    ['maxhorns']                = {['name'] = 'maxhorns',               ['label'] = 'Maximum Quality Horns',        ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'maxhorns.png',                 ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},   

    -- Knifes
    ['knifelevel1']             = {['name'] = 'knifelevel1',            ['label'] = 'Knife Level 1',                ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'knifelevel1.png',              ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    ['knifelevel2']             = {['name'] = 'knifelevel2',            ['label'] = 'Knife Level 2',                ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'knifelevel2.png',              ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    ['knifelevel3']             = {['name'] = 'knifelevel3',            ['label'] = 'Knife Level 3',                ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'knifelevel3.png',              ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    ['knifelevel4']             = {['name'] = 'knifelevel4',            ['label'] = 'Knife Level 4',                ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'knifelevel4.png',              ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    ['knifelevel5']             = {['name'] = 'knifelevel5',            ['label'] = 'Knife Level 5',                ['weight'] = 20,        ['type'] = 'item',      ['image'] = 'knifelevel5.png',              ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},  
    -- Bait
    ["huntingbait"]             = {["name"] = "huntingbait",            ["label"] = "Animal Nait",                  ["weight"] = 25,        ["type"] = "item",      ["image"] = "huntingbait.png",              ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""}, 
    
    -- Bait
    ["huntinglegalbait"]        = {["name"] = "huntinglegalbait",       ["label"] = "Legal Bait",                   ["weight"] = 25,        ["type"] = "item",      ["image"] = "huntinglegalbait.png",         ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
    ["huntingillegalbait"]      = {["name"] = "huntingillegalbait",     ["label"] = "Ilegal Bait",                  ["weight"] = 25,        ["type"] = "item",      ["image"] = "huntingillegalbait.png",       ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

 ``` 