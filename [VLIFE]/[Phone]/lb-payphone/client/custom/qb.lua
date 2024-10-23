if Config.Framework ~= "qb" then
    return
end

DebugPrint("Loading QB")

local QB = exports["qb-core"]:GetCoreObject()

while not LocalPlayer.state.isLoggedIn do
    Wait(500)
end

Loaded = true

DebugPrint("Loaded QB")

function InputNumber()
    local dialog = exports["qb-input"]:ShowInput({
        header = L("payphone"),
        submitText = L("call"),
        inputs = {
            {
                text = L("number_placeholder"),
                name = "phoneNumber",
                type = "number",
                isRequired = true,
            },
        }
    })

    if dialog then
        return dialog.phoneNumber
    end

    return false
end

function SelectCompany(companies)
    local action

    exports["qb-menu"]:openMenu({
        {
            header = L("payphone"),
            isMenuHeader = true
        },
        {
            header = L("call_number"),
            params = {
                event = function()
                    action = "number"
                end,
                isAction = true
            }
        },
        {
            header = L("company"),
            params = {
                event = function()
                    action = "company"
                end,
                isAction = true
            }
        },
        {
            header = L("cancel"),
            params = {
                event = function()
                    exports["qb-menu"]:closeMenu()
                end,
                isAction = true
            }
        }
    })

    while not IsNuiFocused() do
        Wait(0)
    end

    while IsNuiFocused() do
        Wait(0)
    end

    exports["qb-menu"]:closeMenu()

    if not action then
        return true
    end

    if action == "number" then
        return false
    end

    local options = {}

    for i = 1, #companies do
        options[#options+1] = {
            text = companies[i],
            value = companies[i]
        }
    end

    local dialog = exports["qb-input"]:ShowInput({
        header = L("payphone"),
        submitText = L("call"),
        inputs = {
            {
                text = L("company"),
                name = "company",
                type = "select",
                isRequired = true,
                options = options
            }
        }
    })

    if dialog then
        return false, dialog.company
    end

    return true
end
