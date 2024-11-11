local function cdIntegration(data)
    local data = {
        code = data.title,
        default_priority = 'medium',
        coords = data.coords,
        job = data.job_table,
        text = data.message,
        type = 'alerts',
        blip_time = data.blip.time or nil,
        blip = {
            sprite = data.blip.sprite or 1,
            colour = data.blip.colour,
            scale = data.blip.scale or 0.7,
            text = data.blip.text or 'Alert',
            flashes = data.blip.flashes or false,
            radius = data.blip.radius or 0,
        }
    }
    TriggerEvent('rcore_dispatch:server:sendAlert', data)
end

RegisterNetEvent('cd_dispatch:AddNotification', cdIntegration)

local function qsIntegration(data)
    local data = {
        code = data.callCode.code,
        default_priority = 'medium',
        coords = data.callLocation,
        job = data.job,
        text = data.message,
        type = 'alerts',
        image = data.image or nil,
        blip_time = data.blip.time or nil,
        blip = {
            sprite = data.blip.sprite or 1,
            colour = data.blip.colour,
            scale = data.blip.scale or 0.7,
            text = data.blip.text or 'Alert',
            flashes = data.blip.flashes or false,
            radius = data.blip.radius or 0,
        }
    }
    TriggerEvent('rcore_dispatch:server:sendAlert', data)
end

RegisterNetEvent('qs-dispatch:server:CreateDispatchCall', qsIntegration)

local function psIntegration(data)
    local priority = 'medium'
    if data.priority == 1 then
        priority = 'high'
    end
    if not data.code then
        data.code = '10-13'
    end
    if not data.dispatchCode then
        data.dispatchCode = 'Alert'
    end
    if not data.street then
        data.street = 'Unknown'
    end
    local car = ''
    if data.vehicle then
        car = ' - ' .. data.vehicle .. ' - ' .. data.plate .. ' - ' .. data.color
    end
    local bl = nil
    if data.alert then
        bl = {
            sprite = data.alert.sprite or 1,
            colour = data.alert.color,
            scale = data.alert.scale or 0.7,
            text = data.dispatchCode or 'Alert',
            flashes = data.alert.flash or false,
            radius = data.alert.radius or 0,
        }
    end
    local data = {
        code = data.code .. ' - ' .. data.dispatchCode,
        default_priority = priority,
        coords = data.coords,
        job = data.jobs,
        text = data.message .. ' - ' .. data.street .. car,
        type = 'alerts',
        image = data.image or nil,
        blip_time = data.alertTime or nil,
        blip = bl
    }
    TriggerEvent('rcore_dispatch:server:sendAlert', data)
end

RegisterNetEvent('ps-dispatch:server:notify', psIntegration)
