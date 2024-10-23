Config = {
    Debug = true,
    CommandName = "carmenu",
    Keybind = {
        enabled = true,
        key = "F11" -- The Key to opening the menu if enabled.
    },
    Translation = {
        ["tip_focus_mode"] = "Tip: Right click to enter focus mode.",
        ["tab_windows"] = "Windows",
        ["tab_seats"] = "Seats",
        ["tab_miscellaneous"] = "Miscellaneous",
        ["tab_doors"] = "Doors",
    }
}

Functions = {
    HasKeys = function()
        return true
    end
}
