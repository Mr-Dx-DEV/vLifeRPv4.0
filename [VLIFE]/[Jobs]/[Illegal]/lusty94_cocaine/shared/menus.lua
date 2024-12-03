-- this menu is only displayed if Config.DrugSettings.Effects.OverDose is set to false
lib.registerContext({
  id = 'MainMenuCocaineNoCure',
  title = 'Cocaine & Crack Processing',
  options = {
    {
      title = 'Process Cocaine & Crack',
      event = 'lusty94_cocaine:client:openProcessingMenu',
      arrow = true,
    },
    {
      title = 'Bag Cocaine & Crack',
      event = 'lusty94_cocaine:client:openBaggingMenu',
      arrow = true,
    },    
  }
})


--main menu
lib.registerContext({
    id = 'MainMenuCocaine',
    title = 'Cocaine & Crack Processing',
    options = {
      {
        title = 'Process Cocaine & Crack',
        event = 'lusty94_cocaine:client:openProcessingMenu',
        arrow = true,
      },
      {
        title = 'Bag Cocaine & Crack',
        event = 'lusty94_cocaine:client:openBaggingMenu',
        arrow = true,
      },     
      {
        title = 'Create Overdose Cure',
        event = 'lusty94_cocaine:client:openCuringMenu',
        arrow = true,
      },     
    }
})




--processing menu
lib.registerContext({
    id = 'ProcessingMenuCocaine',
    title = 'Process Cocaine And Crack',
    options = {
      {
        title = 'Process ' ..Config.Processing.Cocaine.ProcessedItemLabel,
        description = 'Required Items: \n' ..Config.Processing.Cocaine.RequiredItemAmount..' x '.. Config.Processing.Cocaine.RequiredItemLabel .. '\n' .. Config.Processing.Cocaine.RequiredItem2Amount .. ' x '.. Config.Processing.Cocaine.RequiredItem2Label .. '\n' .. Config.Processing.Cocaine.RequiredItem3Amount .. ' x ' .. Config.Processing.Cocaine.RequiredItem3Label .. '\n' .. Config.Processing.Cocaine.RequiredItem4Amount .. ' x ' .. Config.Processing.Cocaine.RequiredItem4Label,
        event = 'lusty94_cocaine:client:ProcessPureCocaine',
        arrow = true,
        icon = ItemImage(Config.Processing.Cocaine.ProcessedItemName),
        image = ItemImage(Config.Processing.Cocaine.ProcessedItemName),
      },
      {
        title = 'Process ' ..Config.Processing.Crack.ProcessedItemLabel,
        description = 'Required Items: \n' ..Config.Processing.Crack.RequiredItemAmount..' x '.. Config.Processing.Crack.RequiredItemLabel .. '\n' .. Config.Processing.Crack.RequiredItem2Amount .. ' x '.. Config.Processing.Crack.RequiredItem2Label .. '\n' .. Config.Processing.Crack.RequiredItem3Amount .. ' x ' .. Config.Processing.Crack.RequiredItem3Label,
        event = 'lusty94_cocaine:client:ProcessPureCrack',
        arrow = true,
        icon = ItemImage(Config.Processing.Crack.ProcessedItemName),
        image = ItemImage(Config.Processing.Crack.ProcessedItemName),
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        menu = 'MainMenuCocaine',
        arrow = true,
      },     
    }
})



--bagging menu
lib.registerContext({
    id = 'BaggingMenuCocaine',
    title = 'Bag Cocaine & Crack',
    options = {
      {
        title = 'Bag '..Config.Processing.Bagging.Cocaine.RequiredItemAmount..' x '.. Config.Processing.Bagging.Cocaine.RequiredItemLabel ..' Into '..Config.Processing.Bagging.Cocaine.BaggedItemAmount ..' x '.. Config.Processing.Bagging.Cocaine.BaggedItemLabel,
        description = 'Required Items: \n'.. Config.Processing.Bagging.Cocaine.RequiredItem2Label .. '\n' .. Config.Processing.Bagging.Cocaine.RequiredItemAmount ..' x '.. Config.Processing.Bagging.Cocaine.RequiredItemLabel ..'\n' ..  Config.Processing.Bagging.Cocaine.RequiredItem3Amount .. ' x ' .. Config.Processing.Bagging.Cocaine.RequiredItem3Label,
        event = 'lusty94_cocaine:client:ProcessCokeBaggy',
        arrow = true,
        icon = ItemImage(Config.Processing.Bagging.Cocaine.BaggedItemName),
        image = ItemImage(Config.Processing.Bagging.Cocaine.BaggedItemName),
      },
      {
        title = 'Bag '..Config.Processing.Bagging.Crack.RequiredItemAmount..' x '.. Config.Processing.Bagging.Crack.RequiredItemLabel ..' Into '..Config.Processing.Bagging.Crack.BaggedItemAmount ..' x '.. Config.Processing.Bagging.Crack.BaggedItemLabel,
        description = 'Required Items: \n'.. Config.Processing.Bagging.Crack.RequiredItem2Label .. '\n' .. Config.Processing.Bagging.Crack.RequiredItemAmount ..' x '.. Config.Processing.Bagging.Crack.RequiredItemLabel ..'\n' ..  Config.Processing.Bagging.Crack.RequiredItem3Amount .. ' x ' .. Config.Processing.Bagging.Crack.RequiredItem3Label,
        event = 'lusty94_cocaine:client:ProcessCrackBaggy',
        arrow = true,
        icon = ItemImage(Config.Processing.Bagging.Crack.BaggedItemName),
        image = ItemImage(Config.Processing.Bagging.Crack.BaggedItemName),
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        menu = 'MainMenuCocaine',
        arrow = true,
      },      
    }
})



--process overdose cure if enabled
lib.registerContext({
    id = 'CuringMenuCocaine',
    title = 'Create Overdose Cure',
    options = {
      {
        title = 'Process An ' .. Config.Processing.Curing.ProcessedItemLabel,
        description = 'Required Items: \n' .. Config.Processing.Curing.RequiredItem2Amount .. ' x ' .. Config.Processing.Curing.RequiredItem2Label .. '\n' .. Config.Processing.Curing.RequiredItemAmount .. ' x ' .. Config.Processing.Curing.RequiredItemLabel .. '\n' .. Config.Processing.Curing.RequiredItem3Amount .. ' x ' .. Config.Processing.Curing.RequiredItem3Label ,
        event = 'lusty94_cocaine:client:CreateOverDoseCure',
        arrow = true,
        icon = ItemImage(Config.Processing.Curing.ProcessedItemName),
        image = ItemImage(Config.Processing.Curing.ProcessedItemName),
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        menu = 'MainMenuCocaine',
        arrow = true,
      },      
    }
})




---------------< EVENTS >------------------------
RegisterNetEvent('lusty94_cocaine:client:openMainMenu', function()
  if Config.DrugSettings.Effects.OverDose then
      lib.showContext('MainMenuCocaine')
  else
    lib.showContext('MainMenuCocaineNoCure')
  end
end)

RegisterNetEvent('lusty94_cocaine:client:openProcessingMenu', function() 
    lib.showContext('ProcessingMenuCocaine')
end)

RegisterNetEvent('lusty94_cocaine:client:openBaggingMenu', function() 
    lib.showContext('BaggingMenuCocaine')
end)

RegisterNetEvent('lusty94_cocaine:client:openCuringMenu', function() 
    lib.showContext('CuringMenuCocaine')
end)