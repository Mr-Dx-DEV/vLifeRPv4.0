

lib.registerContext({
    id = 'MainMenuMushroom',
    title = 'Processing Main Menu',
    options = {
        {
            title = '💨 Process Mushrooms',
            event = 'lusty94_mushrooms:client:openProcessingMenu',
            arrow = true,
        },
        {
            title = '🍾 Create Overdose Cure',
            event = 'lusty94_mushrooms:client:openCuringMenu',
            arrow = true,
        },     
    }
})



lib.registerContext({
    id = 'ProcessingMenuMushroom',
    title = 'Process Mushroom Products',
    options = {
        {
            title = 'Dry ' ..Config.Processing.Drying.RequiredItemLabel,
            description = 'Required Items: \n' ..Config.Processing.Drying.RequiredItemLabel.. ' \n ' ..Config.Processing.Drying.RequiredItem2Label,
            event = 'lusty94_mushrooms:client:DryMushroom',
            arrow = true,
            icon = ItemImage('dried_libertycap_mushroom'),
            image = ItemImage('dried_libertycap_mushroom'),
        },
        {
            title = 'Make ' ..Config.Processing.Processing.ProcessedItemLabel,
            description = 'Required Items: \n' ..Config.Processing.Processing.RequiredItemLabel.. ' \n ' ..Config.Processing.Processing.RequiredItem2Label ,
            event = 'lusty94_mushrooms:client:MakeMagicMushrooms',
            arrow = true,
            icon = ItemImage('magic_mushroom'),
            image = ItemImage('magic_mushroom'),
        },
        {
            title = 'Main Menu',
            description = 'Return To The Main Menu',
            menu = 'MainMenuMushroom',
            arrow = false,
            icon = 'arrow-left',
        },     
    }
})






lib.registerContext({
    id = 'CuringMenuMushroom',
    title = 'Create Overdose Cure',
    options = {
        {
            title = '🍾 Process Overdose Cure',
            description = 'Required Items: \n' ..Config.Processing.Curing.RequiredItemLabel.. ' \n ' ..Config.Processing.Curing.RequiredItem2Label,
            event = 'lusty94_mushrooms:client:MakeOverDoseCure',
            arrow = true,
            icon = ItemImage('mushroomoverdosecure'),
            image = ItemImage('mushroomoverdosecure'),
        },
        {
            title = 'Main Menu',
            description = 'Return To The Main Menu',
            menu = 'MainMenuMushroom',
            arrow = false,
            icon = 'arrow-left',
        },     
    }
})


------------------< EVENTS >--------------
RegisterNetEvent('lusty94_mushrooms:client:openMainMenu', function() 
    lib.showContext('MainMenuMushroom')
end)

RegisterNetEvent('lusty94_mushrooms:client:openProcessingMenu', function() 
    lib.showContext('ProcessingMenuMushroom')
end)

RegisterNetEvent('lusty94_mushrooms:client:openCuringMenu', function() 
    lib.showContext('CuringMenuMushroom')
end)


