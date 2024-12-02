function Weather(state)
    if state then
        -- Freeze time
        TriggerEvent('av_weather:freeze', true, 23, 00, "CLEAR", false)
    else
        -- Unfreeze time
        TriggerEvent('av_weather:freeze', false)
    end
end