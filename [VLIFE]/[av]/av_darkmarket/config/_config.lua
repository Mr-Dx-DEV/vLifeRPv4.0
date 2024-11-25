-- READ THE DOCS BEFORE USING THIS SCRIPT: https://docs.av-scripts.com/
Config = {}
Config.Debug = false
Config.RefreshItems = 60 -- Every X minutes, server will refresh the item list and show possible new items based in probability, false to disable it (Config.RandomizeItems = false)
Config.App = {
    name = "darkmarket",
    label = "Dark Market", -- You can rename the app by editing this field
    isEnabled = function()
        return true
    end
}
Config.MoneyAccounts = { -- Money accounts used to buy items
    {name = "cosmo", label = "Cosmo", icon = "fa-brands fa-ethereum"},
    {name = "bank", label = "Bank", icon = "fa-solid fa-wallet"},
}

--[[
    This is just an EXAMPLE on how to fill the metadata field:
    If u don't want metadata just leave it empty: metadata = {}
    probability = Chance (0-100%) for the item to be available in market.
    {name = "drug_package", label = "Drug Ingredients", metadata = {purity = "100%", strain = "AV Scripts"}, category = "drugs", stock = 5, price = 1, account = "cosmo", accountLabel = "Cosmo", probability = 100},
]]

Config.Categories = {
    ['hacker'] = { 
        label = "Hacker", -- category label, how the player will see it in laptop
        canAccess = function() -- do a client side check here, true/false if the player can access the category
            if exports['av_laptop']:getJob().name == "police" then
                return false
            end
            return true
        end,
        items = {
            {name = "dongle", label = "Dongle", metadata = {}, stock = 5, price = 50, account = "gne", accountLabel = "GNE", probability = 100},
            {name = "hacking_device", label = "Hacking Device", metadata = {}, stock = 5, price = 100, account = "cosmo", accountLabel = "Cosmo", probability = 100},
        }
    }, 
    ["drugs"] = { 
        label = "Drugs", -- category label, how the player will see it in laptop
        canAccess = function() -- do a client side check here, true/false if the player can access the category
            if exports['av_laptop']:getJob().name == "police" then
                return false
            end
            if GetResourceState('av_gangs') ~= "started" then
                return false
            end
            local gang = exports['av_gangs']:getGang()
            if gang and gang['name'] then -- If is member of any gang can access
                return true
            end
            return false
        end,
        items = {
            {name = "water", label = "Water", metadata = {}, category = "drugs", stock = 5, price = 1, account = "cosmo", accountLabel = "Cosmo", probability = 100},
        }
    },
    ["weapons"] = { 
        label = "Weapons", -- category label, how the player will see it in laptop
        canAccess = function() -- do a client side check here, true/false if the player can access the category
            if exports['av_laptop']:getJob().name == "police" then
                return false
            end
            if GetResourceState('av_gangs') ~= "started" then
                return false
            end
            local gang = exports['av_gangs']:getGang()
            if gang and gang['name'] == "ballas" then -- If is member of Ballas gang can access
                return true
            end
            return false
        end,
        items = {
            {name = "weapon_pistol", label = "Pistol", metadata = {}, category = "weapons", stock = 5, price = 5000, account = "cosmo", accountLabel = "Cosmo", probability = 100},
        }
    },
}