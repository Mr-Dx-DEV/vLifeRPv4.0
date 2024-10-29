currentBlipState = false


RegisterNetEvent("snipe-gangsystem:client:openLaptop", function()
    SendNUIMessage({
        action = "opentablet",
        isGang = IsAuthorizedGang(PlayerGang.name),
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback("closetablet", function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback("getGangData", function(_, cb)
    local p = promise.new()
    QBCore.Functions.TriggerCallback("snipe-gangsystem:server:getGangData", function(data)
        p:resolve(data)
    end, PlayerGang.name)

    local result = Citizen.Await(p)
    local data = {}
    data.noOfFlags = result.noOfFlags
    data.gangName = PlayerGang.name
    data.logoUrl = Config.GangFlags[PlayerGang.name].url
    data.onlineMembers = result.onlineMembers
    data.blipState = currentBlipState

    cb(data)
end)

local function SetBlipState(state)
    currentBlipState = state
    if state then
        for k, v in pairs(FlagTable) do 
            v.blip = AddBlipForRadius(v.coords.x , v.coords.y , v.coords.z, 80.0)
            SetBlipColour(v.blip, Config.GangFlags[v.gang].blipColor)
            SetBlipAlpha(v.blip, 128)
        end
    else
        for k, v in pairs(FlagTable) do 
            RemoveBlip(v.blip)
            v.blip = nil
        end
    end
end

RegisterNUICallback("blipstate", function(data, cb)
    SetBlipState(data)
    cb('ok')
end)

RegisterNUICallback("getFundsData", function(data, cb)
    local p = promise.new()
    QBCore.Functions.TriggerCallback("snipe-gangsystem:server:getFundsData", function(data)
        p:resolve(data)
    end, PlayerGang.name)

    local result = Citizen.Await(p)
    local returnData = {}
    returnData.totalGangFunds = result.funds
    returnData.isOwner = PlayerGang.isboss
    cb(returnData)
end)

RegisterNUICallback("depositFunds", function(data, cb)
    local p = promise.new()
    QBCore.Functions.TriggerCallback("snipe-gangsystem:server:depositToGangFunds", function(result)
        p:resolve(result)
    end, data)

    local cannotDeposit = Citizen.Await(p)
    cb(cannotDeposit) -- callback true if not possible to deposit
end)

RegisterNUICallback("withdrawFunds", function(data, cb)
    local p = promise.new()
    QBCore.Functions.TriggerCallback("snipe-gangsystem:server:withdrawFromGangFunds", function(result)
        p:resolve(result)
    end, data)

    local cannotWitdraw = Citizen.Await(p)
    cb(cannotWitdraw) -- callback true if not possible to deposit
end)


RegisterNUICallback("getManagementData", function(data, cb)
    local p = promise.new()
    QBCore.Functions.TriggerCallback("snipe-gangsystem:server:getManagementData", function(result)
        p:resolve(result)
    end, PlayerGang.name)

    local result = Citizen.Await(p)
    cb(result)
end)

RegisterNUICallback("addMember", function(data, cb)
    local p = promise.new()
    QBCore.Functions.TriggerCallback("snipe-gangsystem:server:addMember", function(result)
        p:resolve(result)
    end, data)
    local result = Citizen.Await(p)
    cb(result) -- error if send error message else send empty string => ''
    
end)

RegisterNUICallback("fireMember", function(data, cb)
    local p = promise.new()
    QBCore.Functions.TriggerCallback("snipe-gangsystem:server:fireMember", function(result)
        p:resolve(result)
    end, data)
    local result = Citizen.Await(p)
    cb(false) -- error if true
    
end)

RegisterNUICallback("changeRole", function(data, cb)
    local p = promise.new()
    QBCore.Functions.TriggerCallback("snipe-gangsystem:server:changeRole", function(result)
        p:resolve(result)
    end, data)
    local result = Citizen.Await(p)
    cb(false)
end)