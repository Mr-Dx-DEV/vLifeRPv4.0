local tabletEntity = nil -- DO NOT CHANGE
local tabletModel = "pp_ems_tablet"
local tabletDict = "amb@world_human_seat_wall_tablet@female@base"
local tabletAnim = "base"
local imagePromise = nil
local items = nil

return {
    locale = 'en', -- EN | PL
    keybind = true,

    startTabletAnimation = function()
        lib.requestAnimDict(tabletDict)
        if tabletEntity then
            stopTabletAnimation()
        end
        lib.requestModel(tabletModel)
        tabletEntity = CreateObject(GetHashKey(tabletModel), 1.0, 1.0, 1.0, 1, 1, 0)
        AttachEntityToEntity(tabletEntity, cache.ped, GetPedBoneIndex(cache.ped, 57005), 0.12, 0.10, -0.13, 25.0, 170.0, 160.0, true, true, false, true, 1, true)
        TaskPlayAnim(cache.ped, tabletDict, tabletAnim, 8.0, -8.0, -1, 50, 0, false, false, false)
        SetModelAsNoLongerNeeded(tabletModel)
    end,

    stopTabletAnimation = function()
        if tabletEntity then
            StopAnimTask(cache.ped, tabletDict, tabletAnim ,8.0, -8.0, -1, 50, 0, false, false, false)
            DeleteEntity(tabletEntity)
            tabletEntity = nil
        end
    end,

}