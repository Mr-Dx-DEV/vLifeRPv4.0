local text = false
local door = lib.points.new({
    coords = Config.StartingDoor,
    distance = 2,
})

function door:onEnter()
    lib.showTextUI('[E] - Knock door')
end

function door:onExit()
    lib.hideTextUI()
end

function door:nearby()
    if self.currentDistance < 1.5 and IsControlJustReleased(0, 38) then
        TriggerEvent('av_houserobbery:knock')
    end
end

local housesPoints = {}

function refreshHouses()
    for k, v in pairs(housesPoints) do
        v:remove()
    end
    for k, v in pairs(houses) do
        housesPoints[#housesPoints+1] = lib.points.new({
            coords = vector3(v['coords']['x'], v['coords']['y'], v['coords']['z']),
            distance = 2,
            open = v['open'],
            identifier = v['identifier']
        })
    end
    if housesPoints and housesPoints[1] then
        for k, v in pairs(housesPoints) do
            function v:onEnter()
                if not text then
                    text = true
                    local label = Lang['use_lockpick']
                    if self.open then
                        label = Lang['door_open']
                    end
                    lib.showTextUI(label)
                end
            end
            function v:nearby()
                if self.currentDistance < 2.0 then
                    if IsControlJustPressed(0,38) and not busy then
                        if not self.open then
                            TriggerEvent('av_houserobbery:interact',{extraData = v['identifier'], interactionType = "lockpick"})
                        else
                            TriggerEvent('av_houserobbery:interact',{extraData = v['identifier'], interactionType = "enter"})
                        end
                        if text then
                            lib.hideTextUI()
                            text = false
                        end
                    end
                end
            end
            function v:onExit()
                if text then
                    lib.hideTextUI()
                    text = false
                end
            end
        end
    end
end