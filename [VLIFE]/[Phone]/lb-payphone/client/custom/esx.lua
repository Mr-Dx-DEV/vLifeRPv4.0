if Config.Framework ~= "esx" then
    return
end

DebugPrint("Loading ESX")

local export, ESX = pcall(function()
    return exports.es_extended:getSharedObject()
end)

if not export then
    while not ESX do
        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)
        Wait(500)
    end
end

Loaded = true

DebugPrint("Loaded ESX")

function InputNumber()
    local p = promise:new()

    ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "input_number", {
        title = L("payphone"),
    }, function(data, menu)
        menu.close()
        p:resolve(data.value)
    end, function(data, menu)
        menu.close()
        p:resolve(false)
    end)

    return Citizen.Await(p)
end

function SelectCompany(companies)
    local elements = {
        {
            label = L("call_number"),
            name = "number"
        },
        {
            label = L("call_company", {
                company = companies[1]
            }),
            name = "company",
            value = 1,
            min = 1,
            max = #companies,
            type = "slider"
        },
    }

    local p = promise:new()

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_company", {
        title = L("payphone"),
        align = "top-right",
        elements = elements
    }, function(data, menu)
        menu.close()
        if data.current.name == "number" then
            return p:resolve({ false })
        elseif data.current.name == "company" then
            return p:resolve({ false, companies[data.current.value] })
        end
    end, function(data, menu)
        menu.close()
        p:resolve({ true })
    end, function(data, menu)
        if data.current.name == "company" then
            menu.update({ name = "company" }, {
                label = L("call_company", {
                    company = companies[data.current.value]
                })
            })
            menu.refresh()
        end
    end)

    return table.unpack(Citizen.Await(p))
end
