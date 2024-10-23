if Config.Framework ~= "custom" then
    return
end

while not NetworkIsSessionStarted() do
    Wait(500)
end

Loaded = true
