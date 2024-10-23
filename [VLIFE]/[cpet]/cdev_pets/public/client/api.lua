---@type CLIBClient
clib = exports.cdev_lib:Get()
loc = clib.localizer.get


PetClientAPI = {}

PetClientAPI.OpenShop = function(shop)
    OpenShop(shop)
end

PetClientAPI.GetBalanceForShop = function()
    return clib.api.Character.GetCash()
end

if PublicSharedPetsConfig.PedShop.WantPedShop then
    local pedCoords = PublicSharedPetsConfig.PedShop.PedCoords
    local pedModel = PublicSharedPetsConfig.PedShop.PedModel

    clib.wrappers.LoadModel(pedModel)

    local ped = CreatePed(4, pedModel, pedCoords.x, pedCoords.y, pedCoords.z, pedCoords.w, false, true)

    clib.wrappers.UnloadModel(pedModel)

    local blip = AddBlipForCoord(pedCoords.x, pedCoords.y, pedCoords.z)
    SetBlipSprite(blip, 442)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Pet Shop")
    EndTextCommandSetBlipName(blip)

    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedRagdollOnCollision(ped, false)

    clib.api.ThirdEye.AddEntityInteraction({
        entity = ped,
        event = 'cdev_pets:loadShop',
        faIcon = 'fa-solid fa-dog',
        label = "Open Pet Shop",
    })

end