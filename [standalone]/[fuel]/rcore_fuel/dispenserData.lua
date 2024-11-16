local allowedModels = {}

CreateThread(function()
    for k, v in pairs(Config.SupportedGasPumpModel) do
        allowedModels[v.modelHash] = true
    end
end)

function IsModelAllowedDispenser(model)
    return Config.SupportedGasPumpModel[model] ~= nil
end

function GetAllWorkingDispenserModels()
    return allowedModels
end

function GetDispenserGunModel(model)
    return Config.SupportedGasPumpModel[model].nozzleHand
end

function CreateFuelRopeForPump(obj, side)
    local model = GetEntityModel(obj)
    if not obj or not side or not model then
        return
    end

    local dData = Config.SupportedGasPumpModel[model].dispenserGunObjectsPosition[side]
    if not dData then
        return
    end

    local offsetRope = dData.offsetRope
    local ropePos = GetOffsetFromEntityInWorldCoords(obj, offsetRope)

    local ropeObject = CreateLocalObject(Config.SupportedGasPumpModel[model].nozzleWithTube, ropePos)

    SetEntityCollision(ropeObject, false, true)
    SetEntityHeading(ropeObject, GetEntityHeading(obj) - dData.heading)
    return ropeObject
end

function CreateFuelHolderForPump(obj, side)
    local model = GetEntityModel(obj)
    if not obj or not side or not model then
        return
    end

    local dData = Config.SupportedGasPumpModel[model].dispenserGunObjectsPosition[side]
    if not dData then
        return
    end

    local offsetHolder = dData.offsetHolder
    local holderPos = GetOffsetFromEntityInWorldCoords(obj, offsetHolder)

    local holderObject = CreateLocalObject(Config.SupportedGasPumpModel[model].nozzleHolster, holderPos)

    SetEntityCollision(holderObject, false, true)
    SetEntityHeading(holderObject, GetEntityHeading(obj) - dData.heading)

    return holderObject
end

function GetOffsetCoordsForRopeFuelDispenser(obj)
    local pedPos = GetEntityCoords(PlayerPedId())
    local modelHash = GetEntityModel(obj)

    local offsetOne, offsetTwo = Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[1], Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[2]

    local distance1 = #(GetOffsetFromEntityInWorldCoords(obj, offsetOne) - pedPos)
    local distance2 = #(GetOffsetFromEntityInWorldCoords(obj, offsetTwo) - pedPos)

    if distance1 <= distance2 then
        return Config.SupportedGasPumpModel[modelHash].ropeOffsetPosition[1]
    elseif distance2 < distance1 then
        return Config.SupportedGasPumpModel[modelHash].ropeOffsetPosition[2]
    end
end

function GetWalkOffsetForPump(obj, side)
    local pedPos = GetEntityCoords(PlayerPedId())
    local modelHash = GetEntityModel(obj)

    local offsetOne, offsetTwo = Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[1], Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[2]

    local distance1 = #(GetOffsetFromEntityInWorldCoords(obj, offsetOne) - pedPos)
    local distance2 = #(GetOffsetFromEntityInWorldCoords(obj, offsetTwo) - pedPos)

    if not offsetOne then
        distance1 = 999999
    end
    if not offsetTwo then
        distance2 = 999999
    end

    if side then
        return GetOffsetFromEntityInWorldCoords(obj, Config.SupportedGasPumpModel[modelHash].playerWalkingOffsetPosition[side]), side
    end

    if distance1 <= distance2 then
        return GetOffsetFromEntityInWorldCoords(obj, Config.SupportedGasPumpModel[modelHash].playerWalkingOffsetPosition[1]), 1
    elseif distance2 < distance1 then
        return GetOffsetFromEntityInWorldCoords(obj, Config.SupportedGasPumpModel[modelHash].playerWalkingOffsetPosition[2]), 2
    end
end

function GetHeadingOffetForPump(obj, side)
    local pedPos = GetEntityCoords(PlayerPedId())
    local modelHash = GetEntityModel(obj)

    local offsetOne, offsetTwo = Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[1], Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[2]

    local distance1 = #(GetOffsetFromEntityInWorldCoords(obj, offsetOne) - pedPos)
    local distance2 = #(GetOffsetFromEntityInWorldCoords(obj, offsetTwo) - pedPos)

    if not offsetOne then
        distance1 = 999999
    end
    if not offsetTwo then
        distance2 = 999999
    end

    if side then
        return Config.SupportedGasPumpModel[modelHash].playerHeadingTowardGasPump[side]
    end

    if distance1 <= distance2 then
        return Config.SupportedGasPumpModel[modelHash].playerHeadingTowardGasPump[1]
    elseif distance2 < distance1 then
        return Config.SupportedGasPumpModel[modelHash].playerHeadingTowardGasPump[2]
    end
end