--[[ 
    Use this function to process your lab by running your own code
    Don't use this function if you aren't experienced enough because no support will be provided... 
        is your responsability to make it work the way you want, otherwise use the default method from the script
    identifier: string = Lab identifier
    lab: table = Lab info
    ingredientStash: string = Stash name for ingredients
    productStash: string = Stash name for product

    Important: 
    - Ingredients stash will NOT be wiped if you run customProcess, is on you to wipe it
    - Is on you to retrieve the stash items, use exports['av_laptop']:getStashItems(ingredientStash)
    - Is on you to add the final product to productStash use exports['av_laptop']:addToStash(productStash, itemName, amount, metadata)
    - processed should return true if the lab was processed by your code, otherwise return false and the default script process will run
]]--
function customProcess(identifier, lab, gang, ingredientStash, productStash)
    local processed = false
--    print(identifier, json.encode(lab, {indent = true}), gang, ingredientStash, productStash)

    return processed
end