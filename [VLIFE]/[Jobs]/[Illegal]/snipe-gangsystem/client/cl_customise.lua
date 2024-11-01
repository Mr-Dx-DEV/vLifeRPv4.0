
function ShowNotification(msg, type)
    if Config.Notify['QBCore'] then
        QBCore.Functions.Notify(msg, type)
    elseif Config.Notify['okokNotify'] then
        exports['okokNotify']:Alert(Config.OkOkNotifyTitle, msg, 5000, type)
    elseif Config.Notify['pNotify'] then
        exports.pNotify:SendNotification({text = msg, type = type, layout = Config.pNotifyLayout, timeout = 5000})
    end
end

function IsAuthorizedGang(gang)
    for k, v in pairs(Config.GangFlags) do
        if k == gang then
            return true
        end
    end
    return false
end

CreateThread(function()
    for k, v in pairs(Config.GangFlags) do
        for a, b in pairs(v.ped) do
            RequestModel(GetHashKey(b))
            exports[Config.Target]:AddTargetModel(GetHashKey(b), {
                options = {
                    {
                        label = 'Sell Drugs',
                        icon = 'fa-solid fa-dollar-sign',
                        event = "snipe-gangsystem:client:sellDrugs",
                        gangName = k,
                        canInteract = function(entity)
                            if currentGang ~= nil and PlayerGang.name == currentGang and not IsEntityDead(entity) and IsAuthorizedGang(PlayerGang.name) then
                                return true
                            end
                        end, 
                    },
                    {
                        label = 'Rob Gang Member',
                        icon = 'fa-solid fa-dollar-sign',
                        event = "snipe-gangsystem:client:robMember",
                        gangName = k,
                        canInteract = function(entity)
                            if currentGang ~= nil and PlayerGang.name ~= currentGang and not IsEntityDead(entity) and IsAuthorizedGang(PlayerGang.name) then
                                return true
                            end
                        end, 
                    }
                },
                distance = 2.0
            })
        end
    end
end)

RegisterNetEvent("snipe-gangsystem:client:notifyGang", function(coords)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "Local",
        subject = "Local being robbed",
        message = "Someone is trying to rob your locals, the location has been marked on your GPS.",
    })
    local LocalRobberyBlip = AddBlipForCoord(coords)
    SetBlipSprite(LocalRobberyBlip, 189)
    SetBlipScale(LocalRobberyBlip, 0.5)
    SetBlipColour(LocalRobberyBlip, 38)
    SetBlipRoute(LocalRobberyBlip, true)
    SetBlipRouteColour(LocalRobberyBlip, 38)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Robbing Locals")
    EndTextCommandSetBlipName(LocalRobberyBlip)
    Wait(1 * 60 * 1000) -- blip will be removed after 1 minute 
    RemoveBlip(LocalRobberyBlip)
end)

RegisterNetEvent("snipe-gangsystem:client:notifyGangDestroy", function(coords)
    TriggerEvent('qs-smartphone:client:notify', {
        title = 'Flag Rob!!',
        text = 'There is a FLAG Attact Going on!',
        icon = './img/apps/whatsapp.png',
        timeout = 5000
    })
    local LocalRobberyBlip = AddBlipForCoord(coords)
    SetBlipSprite(LocalRobberyBlip, 38)
    SetBlipScale(LocalRobberyBlip, 0.5)
    SetBlipColour(LocalRobberyBlip, 38)
    SetBlipRoute(LocalRobberyBlip, true)
    SetBlipRouteColour(LocalRobberyBlip, 38)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Destroying Flag")
    EndTextCommandSetBlipName(LocalRobberyBlip)
    Wait(1 * 60 * 1000) -- blip will be removed after 1 minute 
    RemoveBlip(LocalRobberyBlip)
end)

-- Add your own custom dispatch information here.
RegisterNetEvent("snipe-gangsystem:client:notifyCops", function()
    print("notifying cops drug sale at: ".. GetEntityCoords(PlayerPedId()))

    --[[
        exports['ps-dispatch']:DrugSale()
    ]]--

    --[[
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police'}, 
            coords = data.coords,
            title = '10-15 - Drug Sale',
            message = 'A '..data.sex..' is selling drugs at '..data.street, 
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = '911 - Drug Sale',
                time = (5*60*1000),
                sound = 1,
            }
        })
    ]]--
end)


-- command to toggle the blips (only for gang members the blips will be visible) (UNUSED IN NEW UPDATE, USE LAPTOP NOW)

-- RegisterCommand("toggleblip", function()
--     for k, v in pairs(FlagTable) do 
--         if v.blip then
--             RemoveBlip(v.blip)
--             v.blip = nil
--         else
--             if IsAuthorizedGang(PlayerGang.name) then -- remove this line 
--                 v.blip = AddBlipForRadius(v.coords.x , v.coords.y , v.coords.z, 80.0)
--                 SetBlipColour(v.blip, Config.GangFlags[v.gang].blipColor)
--                 SetBlipAlpha(v.blip, 128)
--             end -- remove this line
--         end
--     end
-- end)

local animals = {
    [111281960] = true, -- a_c_pigeon
    [402729631] = true, -- a_c_crow
    [1462895032] = true, -- a_c_cat_01
    [-1788665315] = true, -- a_c_rottweiler
    [`a_c_boar`] = true,
    [`a_c_cat_01`] = true,
    [`a_c_cormorant`] = true,
    [`a_c_pigeon`] = true,
    [`a_c_seagull`] = true,
    [`a_c_chickenhawk`] = true,
    [`a_c_chop`] = true,
    [`a_c_cow`] = true,
    [`a_c_coyote`] = true,
    [`a_c_deer`] = true,
    [`a_c_husky`] = true,
    [`a_c_mtlion`] = true,
    [`a_c_pig`] = true,
    [`a_c_pigeon`] = true,
    [`a_c_poodle`] = true,
    [`a_c_pug`] = true,
    [`a_c_rabbit_01`] = true,
    [`a_c_rat`] = true,
    [`a_c_retriever`] = true,
    [`a_c_shepherd`] = true,
    [`a_c_westy`] = true
}

-- the logic that spawns the gang peds in territory (do not edit if you dont know what you are doing)
AddEventHandler('populationPedCreating', function(x, y, z, model, setters)
    local pos = GetEntityCoords(PlayerPedId())
    if not animals[model] then
        if currentGang ~= nil and (#(pos - vector3(x,y,z)) < 100.0) and ((math.abs(pos.z - z)) < 2.0) then
            local found, handle = GetClosestPed(x, y, z, 5.0, -1 , 1, 1, 1)
            if found then
                if not IsPedAPlayer(handle) then
                    setters.setModel(Config.GangFlags[currentGang].ped[math.random(1, #(Config.GangFlags[currentGang].ped))]) -- you can use a hash as well
                end
            end
        end    
    end
end)


-- Command to open the laptop
-- Event to open the laptop is "snipe-gangsystem:client:openLaptop"
if Config.UseCommandToOpenLaptop then
    RegisterCommand("ganglaptop", function()
        SendNUIMessage({
            action = "opentablet",
            isGang = IsAuthorizedGang(PlayerGang.name),
        })
        SetNuiFocus(true, true)
    end)
end
