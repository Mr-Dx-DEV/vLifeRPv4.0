loaf_lib = exports.loaf_lib:GetLib()

function DebugPrint(...)
    if not Config.Debug then
        return
    end

    local data = {...}
    local str = ""

    for i = 1, #data do
        if type(data[i]) == "table" then
            str = str .. json.encode(data[i])
        elseif type(data[i]) ~= "string" then
            str = str .. tostring(data[i])
        else
            str = str .. data[i]
        end

        if i ~= #data then
            str = str .. " "
        end
    end

    print("^6[LB Payphone] ^3[Debug]^7: " .. str, "^7")
end

function L(path, args)
    assert(type(path) == "string", "path must be a string")

    local translation = Locales[path] or path

    if args then
        for k, v in pairs(args) do
            local safe_v = tostring(v):gsub("%%", "%%%%")  -- Escape % characters
            translation = translation:gsub("{" .. k .. "}", safe_v)
        end
    end

    return translation
end

if Config.Framework == "auto" then
    DebugPrint("Framework set to auto, detecting...")

    if GetResourceState("es_extended") ~= "missing" then
        Config.Framework = "esx"
    elseif GetResourceState("qb-core") ~= "missing" then
        Config.Framework = "qb"
    else
        Config.Framework = "custom"
    end

    DebugPrint("Detected framework: " .. Config.Framework)
end
