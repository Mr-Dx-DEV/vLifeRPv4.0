Config = Config or {}
-- Ingredients Config
Config.MaxIngredients = 5    -- max ingredients u can select when u register an item
Config.RequireIngredients = true -- true/false player needs at least 1 ingredient to craft food
Config.Ingredients = {       -- You need to register this items in your Framework/Inventory, this ones are just EXAMPLES
    -- value = item name (exactly how is named in your inventory/framework)
    -- label = item label 
    -- jobs = table with allowed jobs to use this ingredient or false to make it available for everyone
    -- type = table with ItemTypes, this needs to be a table
    -- For ingredient effects please check config/effects.lua

    { value = "water",     label = "Water",      jobs = { "uwucafe", "burgershot" }, type = {"drink"} },
    { value = "sugar",     label = "Sugar",      jobs = { "uwucafe", "burgershot" }, type = {"drink", "food"} },
    { value = "chocolate", label = "Chocolate",  jobs = false, type = {"drink", "food"} },
    { value = "milk",      label = "Milk",       jobs = false, type = {"drink", "food"} },
    { value = "ice",       label = "Ice",        jobs = false, type = {"drink"} },
    { value = "banana",    label = "Banana",     jobs = false,  type = {"drink", "food"} },
}