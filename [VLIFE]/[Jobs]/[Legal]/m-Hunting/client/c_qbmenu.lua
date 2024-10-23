local QBCore = exports[Config.CoreName]:GetCoreObject()

RegisterNetEvent('m-Hunting:client:AbrirMenuGeral')
AddEventHandler('m-Hunting:client:AbrirMenuGeral', function()
  exports["qb-menu"]:openMenu({
        { header = "[⚔️] Hunter",  isMenuHeader = true},
        { header = "[🔪] I need a knife!",            txt = "", params = {  isServer = true, event = "m-Hunting:server:Receberknifelevel1"  }},
        { header = "[💸] Open Shop",                   txt = "", params = {  event = "m-Hunting:client:AbrirLojaHunting" }},
        { header = "[✅] I want upgrade my knife!",   txt = "", params = {  event = "m-Hunting:client:AbrirUpgrades"  }},
        { header = "[💵] Sell Items",                 txt = "", params = {  event = "m-Hunting:client:VenderItens" }},
        { header = "[❌] Close",                      txt = "", params = {  event = "qb-menu:closeMenu" }},
    })
end)

RegisterNetEvent('m-Hunting:client:AbrirUpgrades')
AddEventHandler('m-Hunting:client:AbrirUpgrades', function()
  exports["qb-menu"]:openMenu({
        { header = "Upgrades", isMenuHeader = true},
        { header = "[✅] Upgrade Knife Nível 2",txt = "You need: <br>"..Config.AmountItemUpNvl2.."x "..QBCore.Shared.Items[Config.ItemUpNvl2].label,  params = { isServer = true, event = "m-Hunting:server:UpgradeKnifeNivel2" }},
        { header = "[✅] Upgrade Knife Nível 3",txt = "You need: <br>"..Config.AmountItemUpNvl3.."x "..QBCore.Shared.Items[Config.ItemUpNvl3].label,  params = { isServer = true, event = "m-Hunting:server:UpgradeKnifeNivel3" }},
        { header = "[✅] Upgrade Knife Nível 4",txt = "You need: <br>"..Config.AmountItemUpNvl4.."x "..QBCore.Shared.Items[Config.ItemUpNvl4].label,  params = { isServer = true, event = "m-Hunting:server:UpgradeKnifeNivel4" }},
        { header = "[✅] Upgrade Knife Nível 5",txt = "You need: <br>"..Config.AmountItemUpNvl5.."x "..QBCore.Shared.Items[Config.ItemUpNvl5].label,  params = { isServer = true, event = "m-Hunting:server:UpgradeKnifeNivel5" }},
    })
end)

--============================================================== VENDAS
RegisterNetEvent('m-Hunting:client:VenderItens')
AddEventHandler('m-Hunting:client:VenderItens', function()
  exports["qb-menu"]:openMenu({
        { header = "[💵] Selling Items", isMenuHeader = true},
        { header = "<img src=nui://"..Config.InvLink..QBCore.Shared.Items["badmeat"].image.." width=35px style='margin-right: 10px'> Sell Meat",  txt = "", params = { event = "m-Hunting:client:VenderCarne" }},
        { header = "<img src=nui://"..Config.InvLink..QBCore.Shared.Items["badleather"].image.." width=35px style='margin-right: 10px'> Sell Leather", txt = "", params = { event = "m-Hunting:client:VenderCouro" }},
        { header = "<img src=nui://"..Config.InvLink..QBCore.Shared.Items["badhorns"].image.." width=35px style='margin-right: 10px'> Sell Horns",   txt = "", params = { event = "m-Hunting:client:VenderChifres" }},
    })
end)

RegisterNetEvent('m-Hunting:client:VenderCarne')
AddEventHandler('m-Hunting:client:VenderCarne', function()
  exports["qb-menu"]:openMenu({
        { header = "[💵] Selling Items", isMenuHeader = true},
        { header = "Sell Low Quality Meat",    txt = "Price: $"..Config.SellingItems.BeefBad, params = { isServer = true,event = "m-Hunting:server:VenderCarne", args = 1 }},
        { header = "Sell Medium Quality Meat", txt = "Price: $"..Config.SellingItems.BeefMed, params = { isServer = true,event = "m-Hunting:server:VenderCarne", args = 2 }},
        { header = "Sell High Quality Meat",   txt = "Price: $"..Config.SellingItems.BeefMax, params = { isServer = true,event = "m-Hunting:server:VenderCarne", args = 3 }},
    })
end)

RegisterNetEvent('m-Hunting:client:VenderCouro')
AddEventHandler('m-Hunting:client:VenderCouro', function()
  exports["qb-menu"]:openMenu({
        {header = "[💵] Selling Items", isMenuHeader = true},
        {header = "Sell Low Quality Leather",     txt = "Price: $"..Config.SellingItems.LeatherBad, params = {isServer = true,event = "m-Hunting:server:VenderCouro",args = 1 }},
        {header = "Sell Medium Quality Leather",  txt = "Price: $"..Config.SellingItems.LeatherMed, params = {isServer = true,event = "m-Hunting:server:VenderCouro",args = 2 }},
        {header = "Sell High Quality Leather",    txt = "Price: $"..Config.SellingItems.LeatherMax, params = {isServer = true,event = "m-Hunting:server:VenderCouro",args = 3 }},
    })
end)

RegisterNetEvent('m-Hunting:client:VenderChifres')
AddEventHandler('m-Hunting:client:VenderChifres', function()
  exports["qb-menu"]:openMenu({
        {header = "[💵] Selling Items", isMenuHeader = true},
        {header = "Sell Low Quality Horns",     txt = "Price: $"..Config.SellingItems.HornsBad, params = {isServer = true,event = "m-Hunting:server:VenderChifres",args = 1 }},
        {header = "Sell Medium Quality Horns",  txt = "Price: $"..Config.SellingItems.HornsMed, params = {isServer = true,event = "m-Hunting:server:VenderChifres",args = 2 }},
        {header = "Sell High Quality Horns",    txt = "Price: $"..Config.SellingItems.HornsMax, params = {isServer = true,event = "m-Hunting:server:VenderChifres",args = 3 }},
    })
end)