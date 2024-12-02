local points = {}
local interactives = {}
local closeAnother = false

function SpawnObjects(list,entry,debug,firstSpawn)
    if not list then return end
    local temp_objects = {}
    for k, v in pairs(list) do
        local networked = false
        local interactive = false
        local generate = false
        if not v['type'] then
            generate = true
        end
        if v['type'] == "alarm" then
            generate = true
            interactive = true
        else
            generate = firstSpawn
            if firstSpawn then
                networked = true
                interactive = true
            end
        end
        local model = GetHashKey(v['prop'])
        if generate then
            if IsModelInCdimage(model) then
                local x = entry.x + v['x']
                local y = entry.y + v['y']
                local z = entry.z + v['z']
                lib.requestModel(model, 10000)
                local temp_object = CreateObject(model, x, y, z, networked, networked, false)
                while not DoesEntityExist(temp_object) do
                    Wait(50)
                end
                local heading = (GetEntityHeading(currentShell) + v['heading'])
                FreezeEntityPosition(temp_object,true)
                SetEntityHeading(temp_object, heading)
                v['object'] = temp_object
                if interactive then
                    points[#points+1] = lib.points.new({
                        coords = vector3(x,y,z),
                        distance = 1.5,
                        robbed = v['robbed'],
                        extraData = v
                    })
                end
                temp_objects[#temp_objects+1] = temp_object
            else
                print("[ERROR] Object:",v['prop'], "doesn't exist")
            end
        end
        Wait(150)
    end
    if points and points[1] then
        for k, v in pairs(points) do
            function v:onEnter()
                closeAnother = self.extraData.label
                if self.extraData.type == "alarm" then
                    if houseAlarm then
                        if not text and not debug then
                            text = true
                            lib.showTextUI('[E] - '..self.extraData.label)
                        end
                    end
                else
                    if not houseAlarm then
                        if not text and not debug then
                            text = true
                            lib.showTextUI('[E] - '..self.extraData.label)
                        end
                    end
                end
            end
            function v:nearby()
                if closeAnother ~= self.extraData.label then return end
                if self.currentDistance < 5.0 and debug then
                    DrawMarker(2, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 200, 20, 20, 200, false, true, 2, false, nil, nil, false)
                end
--                print('busy?',busy, 'robbed?',self.robbed, 'carryObject',carryObject)
                if self.currentDistance < 2.0 and not self.robbed and not carryObject then
                    if IsControlJustPressed(0,38) and not busy and not self.robbed then
                        TriggerEvent('av_houserobbery:interact',{extraData = v['extraData'], interactionType = "object"})
                        if not self.extraData.type and not houseAlarm then
                            v:remove()
                        end
                        if self.extraData.type and (self.extraData.type ~= "alarm" and self.extraData.type ~= "safe") then
                            v:remove()
                        end
                        if text then
                            lib.hideTextUI()
                            text = false
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
    return temp_objects
end

function WipeInteractives()
    for k, v in pairs(interactives) do
        exports[Config.TargetSystem]:RemoveTargetEntity(v['entity'], v['label'])
    end
end