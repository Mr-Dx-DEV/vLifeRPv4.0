local isTabletVisible = false
local animDict = 'amb@code_human_in_bus_passenger_idles@female@tablet@base'
local animName = 'base'
local tabletModel = `prop_cs_tablet`
local boneID = 60309
local attachOffset = vector3(0.03, 0.002, -0.0)
local attachRotation = vector3(10.0, 160.0, 0.0)

local function requestAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(150)
    end
end

local function requestModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(150)
    end
end

local function createAndAttachTablet(playerPed)
    local tabletObject = CreateObject(tabletModel, 0.0, 0.0, 0.0, true, true, false)
    local boneIndex = GetPedBoneIndex(playerPed, boneID)

    SetCurrentPedWeapon(playerPed, `weapon_unarmed`, true)
    AttachEntityToEntity(tabletObject, playerPed, boneIndex, attachOffset.x, attachOffset.y, attachOffset.z,
        attachRotation.x, attachRotation.y, attachRotation.z, true, false, false, false, 2, true)
    return tabletObject
end

local function isAnimPlaying(playerPed)
    return IsEntityPlayingAnim(playerPed, animDict, animName, 3)
end

local function playAnim(playerPed)
    TaskPlayAnim(playerPed, animDict, animName, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
end

local function removeTablet(tabletObject, playerPed)
    ClearPedSecondaryTask(playerPed)
    Citizen.Wait(450)
    DetachEntity(tabletObject, true, false)
    DeleteEntity(tabletObject)
end

function ToggleTablet(toggle)
    if toggle == isTabletVisible then return end
    isTabletVisible = toggle

    if isTabletVisible then
        Citizen.CreateThread(function()
            requestAnimDict(animDict)
            requestModel(tabletModel)

            local playerPed = PlayerPedId()
            local tabletObject = createAndAttachTablet(playerPed)
            SetModelAsNoLongerNeeded(tabletModel)

            while isTabletVisible do
                Citizen.Wait(100)
                playerPed = PlayerPedId() -- Update the player ped in case it changes.

                if not isAnimPlaying(playerPed) then
                    playAnim(playerPed)
                end
            end

            removeTablet(tabletObject, playerPed)
        end)
    end
end
