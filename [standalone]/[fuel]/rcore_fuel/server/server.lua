function UpdateConfigForClient(source, identifier)
    if LoadedAllShopData then
        local updatedDataForClient = {}
        for k, v in pairs(Config.ShopList) do
            updatedDataForClient[k] = {
                for_sale = v.for_sale,
                price = v.price,
                open = v.open,
                owner_identifier = v.owner_identifier,
                gasPrices = v.gasPrices,
                capacity = v.capacity,
                fuel_only_employee = v.fuel_only_employee,
                companyMoney = v.companyMoney,
                isMissionRunning = v.isMissionRunning,
            }
        end

        if identifier then
            if updatedDataForClient[identifier] then
                updatedDataForClient = {
                    [identifier] = updatedDataForClient[identifier],
                }
            end
        end

        TriggerClientEvent("rcore_fuel:updateConfig", source, updatedDataForClient)
    end
end

RegisterNetEvent("rcore_fuel:requestConfigChanges", function()
    local source = source
    UpdateConfigForClient(source)
end)

RegisterNetEvent("rcore_fuel:requestPlayerIdentifier", function()
    local source = source
    local player = SharedObject.GetPlayerFromId(source)
    if player then
        TriggerClientEvent("rcore_fuel:requestPlayerIdentifier", source, player.identifier)
    end
end)

RegisterCommand("refillallstations", function(source)
    if source == 0 then
        print("Starting refilling all stations fuel")

        for k, v in pairs(Config.ShopList) do
            local modal = GetCompanyModal(k)
            if not modal.IsBuyingCompanyEnabled() then
                for fuelType, maxCapacity in pairs(v.maxCapacity) do
                    modal.SetCurrentFuelCapacity(fuelType, maxCapacity)
                end
                modal.Save()
                print("Filled station:", k, " to the max")
            end
        end

        print("Done with refilling!")
        UpdateConfigForClient(-1)
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)

RegisterCommand("setfuelstationprice", function(source, args)
    if source == 0 then
        if args[1] ~= nil and args[2] ~= nil then
            local modal = GetCompanyModal(args[1])
            if modal.DoesExists() then
                local newPrice = tonumber(args[2])
                if newPrice then
                    modal.SetCompanyPrice(newPrice)
                    modal.Save()
                    UpdateConfigForClient(-1, args[1])
                    print("New price has been set!")
                else
                    print("Error! The price is not number!")
                end
            else
                print("This company:", args[1], "doesnt exists!")
            end
        else
            print("Use command: setfuelstationprice [Company name] [Price]")
            print("Example: setfuelstationprice fuel_pump24 620420")
        end
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)

RegisterCommand("setallfuelstationprice", function(source, args)
    if source == 0 then
        if args[1] ~= nil then
            for k, v in pairs(Config.ShopList) do
                local modal = GetCompanyModal(k)
                if modal.DoesExists() then
                    local newPrice = tonumber(args[1])
                    if newPrice then
                        modal.SetCompanyPrice(newPrice)
                        modal.Save()
                        print("New price has been set!")
                    else
                        print("Error! The price is not number!")
                    end
                end
            end
            UpdateConfigForClient(-1)
        else
            print("Use command: setallfuelstationprice [Price]")
            print("Example: setallfuelstationprice 620420")
        end
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)

RegisterCommand("refillstation", function(source, args)
    if source == 0 then
        if args[1] ~= nil then
            local rcore_fuel = exports["rcore_fuel"]
            local modal = rcore_fuel:GetCompanyModal(args[1])
            if modal.DoesExists() then
                for _, fuelType in pairs(modal.GetAllFuelTypes()) do
                    modal.SetCurrentFuelCapacity(fuelType, modal.GetMaximumFuelCapacity(fuelType))
                end

                modal.Save()
                modal.RefreshData()
                print("Company stock has been refilled")
            else
                print("This company:", args[1], "doesnt exists!")
            end
        else
            print("Use command: refillstation [Company name]")
            print("Example: refillstation fuel_pump24")
        end
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)