function hackingMinigame()
    local result = true
    if GetResourceState('bl_ui') == "started" then
        result = exports.bl_ui:PrintLock(3, {
            grid = 4,
            duration = 20000,
            target = 4
        })
    end
    return result
end