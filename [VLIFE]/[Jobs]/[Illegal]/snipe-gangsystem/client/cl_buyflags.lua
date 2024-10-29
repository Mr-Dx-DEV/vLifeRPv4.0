-- Trigger this event wherever you want, to open the menu to buy flags/removal

RegisterNetEvent("snipe-gangsystem:client:openBuyFlagMenu", function()
    local OpenMenu = {
        {
            header = "Spray Store",
            isMenuHeader = true
        }, {
            header = "Buy Flag",
            txt = "",
            params = {
                isServer = true,
                event = "snipe-gangsystem:server:buyFlags",
            }
        }, {
            header = "Buy Removal ($1000000)",
            params = {
                isServer = true,
                event = "snipe-gangsystem:server:buyRemoval",
            }
        }, 
    }
    exports['qb-menu']:openMenu(OpenMenu)
end)
local spawnedEntity = nil

local function SpawnPed()
    RequestModel(Config.BuyFlagModel)
    while not HasModelLoaded(Config.BuyFlagModel) do
        Wait(0)
    end
    local entity = CreatePed(0, GetHashKey(Config.BuyFlagModel), Config.BuyFlagLocation.x, Config.BuyFlagLocation.y, Config.BuyFlagLocation.z - 1.0, Config.BuyFlagLocation.w,  false, false)
    FreezeEntityPosition(entity, true)
    SetEntityInvincible(entity, true)
    SetBlockingOfNonTemporaryEvents(entity, true)
    exports['qb-target']:AddTargetEntity(entity, { 
    options = { 
    { 
        type = "client", 
        event = "snipe-gangsystem:client:openBuyFlagMenu",
        icon = 'fas fa-circle',
        label = 'Flag Store', 
        canInteract = function(entity)
            if IsAuthorizedGang(PlayerGang.name) then
                return true
            end
        end,
        }
    },
        distance = 2.5, 
    })
    return entity
end

if Config.SpawnPedToBuyFlag then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local pos = GetEntityCoords(PlayerPedId())
            if #(pos - vector3(Config.BuyFlagLocation.x, Config.BuyFlagLocation.y, Config.BuyFlagLocation.z)) < 50.0 then
                if spawnedEntity == nil or not DoesEntityExist(spawnedEntity) then
                    spawnedEntity = SpawnPed()
                end
            else
                if spawnedEntity ~= nil and DoesEntityExist(spawnedEntity) then
                    DeleteEntity(spawnedEntity)
                end
            end
        end
    end)
end
