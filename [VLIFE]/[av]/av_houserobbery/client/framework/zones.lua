local points = {}
local text = false
local closeAnother = false

function CreateZones(zones,shell,isExit,debug)
    if not zones then return end
    if not DoesEntityExist(shell) then return end
    local shell_coords = GetEntityCoords(shell)
    for k, v in pairs(zones) do
        if not v['robbed'] then
            local name = v['label']
            local type = nil
            if isExit then
                name = Lang['exit']
                type = "exit"
            end
            local x = shell_coords.x + v['x']
            local y = shell_coords.y + v['y']
            local z = shell_coords.z + v['z'] - 2.0
            local heading = (GetEntityHeading(shell) + v['heading'])
            if Config.TargetSystem and not isExit then
                exports[Config.TargetSystem]:AddBoxZone(name, vector3(x, y, z), 0.55, 0.55, {
                    name = name,
                    heading = heading,
                    debugPoly = true,
                    minZ = z - 0.25,
                    maxZ = z + 0.5,
                }, {
                    options = {{
                        type = "client",
                        event = "av_houserobbery:interact",
                        icon = v['icon'],
                        label = name,
                        extraData = v,
                        interactionType = "zone"
                    }},
                    distance = 2.5
                })
            else
                points[#points+1] = lib.points.new({
                    coords = vector3(x,y,z),
                    distance = 1.5,
                    robbed = false,
                    extraData = {
                        label = name,
                        type = type,
                        identifier = v['identifier']
                    }
                })
            end
        end
    end
    if points and points[1] then
        for k, v in pairs(points) do
            function v:onEnter()
                if Config.Debug then
                    print("onEnter()", self.extraData.type)
                end
                if self.extraData.type == "exit" then
                    closeAnother = self.extraData.label
                    if not text then
                        text = true
                        lib.showTextUI('[E] - '..self.extraData.label)
                    end
                end
                if not houseAlarm then
                    closeAnother = self.extraData.label
                    if not text and not self.robbed then
                        if self.extraData.type == "exit" or not carryObject then
                            text = true
                            lib.showTextUI('[E] - '..self.extraData.label)
                        end
                    end
                end
            end
            function v:nearby()
                if closeAnother ~= self.extraData.label then return end
                if self.currentDistance < 5.0 and Config.Debug then
                    DrawMarker(2, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 200, 20, 20, 200, false, true, 2, false, nil, nil, false)
                end
                if self.currentDistance < 1.25 and self.extraData.type == "exit" then
                    if IsControlJustPressed(0,38) then
                        if Config.Debug then
                            print("E pressed but are we busy?", busy)
                        end
                        if not busy then
                            TriggerEvent('av_houserobbery:interact',{extraData = v['extraData'], interactionType = "zone"})
                            v:remove()
                            if text then
                                lib.hideTextUI()
                                text = false
                            end
                        end
                    end
                else
                    if not houseAlarm then
                        if self.currentDistance < 1.25 and not carryObject then
                            if IsControlJustPressed(0,38) and not self.robbed and not busy then
                                TriggerEvent('av_houserobbery:interact',{extraData = v['extraData'], interactionType = "zone"})
                                v:remove()
                                if text then
                                    lib.hideTextUI()
                                    text = false
                                end
                            end
                        end
                    end
                end
            end
            function v:onExit()
                closeAnother = nil
                if text then
                    lib.hideTextUI()
                    text = false
                end
            end
        end
    end
end

function DeleteZones(zones)
    lib.hideTextUI()
    if points and points[1] then
        for k, v in pairs(points) do
            v:remove()
            points[k] = nil
        end
        points = {}
    end
    if not zones then return end
    if Config.TargetSystem then
        for k, v in pairs(zones) do
            exports[Config.TargetSystem]:RemoveZone(v['label'])
        end
    end
end

function ZonesFunction(data)
    if not data then print("[ERROR] Empty zone (?)") return end
    if Config.Debug then
        if data and data['type'] then
            print("ZonesFunction(), type: "..data['type'])
        end
    end
    if data['type'] == "exit" then
        busy = true
        if Config.Debug then
            print("is Exit!")
        end
        ExitHouse()
        busy = false
        if Config.Debug then
            print("Outside (?)")
        end
        return
    end
    if carryObject then return end
    if houseAlarm then return end
    local minigame = SearchAnimation()
    if minigame then
        TriggerServerEvent('av_houserobbery:searchZone',currentIdentifier,data['identifier'])
    end
end

function SearchAnimation()
    busy = true
    local result = false
    local ped = PlayerPedId()
    lib.requestAnimDict('mini@repair')
    FreezeEntityPosition(ped,true)
    TaskPlayAnim(ped, "mini@repair", 'fixing_a_player', 2.0, 2.0, -1, 16, 0, true, true, true)
    Wait(math.random(1000,3000))
    exports['ps-ui']:Circle(function(outcome)
        result = outcome
    end, 3, 20)
    ClearPedTasks(ped)						
    FreezeEntityPosition(ped,false)
    busy = false
    return result
end