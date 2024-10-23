local chars = {}
for i = 48, 57 do
    table.insert(chars, string.char(i)) -- 0-9
end
for i = 65, 90 do
    table.insert(chars, string.char(i)) -- A-Z
end
for i = 97, 122 do
    table.insert(chars, string.char(i)) -- a-z
end

function GenerateSerialKey()
    return ("%s%s"):format(GenerateRandomInt(5), GenerateRandomString(6))
end

function GenerateRandomString(length)
    local result = ""
    for i = 1, length do
        local randomIndex = math.random(1, #chars)
        result = result .. chars[randomIndex]
    end
    return result
end

function GenerateRandomInt(length)
    local min = 10 ^ (length - 1)
    local max = (10 ^ length) - 1
    return math.random(min, max)
end

function InitDB()
    print("CREATING TABLE")
    MySQL.query.await([[CREATE TABLE `motel` (
        `motel` varchar(50) DEFAULT NULL,
        `room` varchar(50) NOT NULL,
        `owner` varchar(50) NOT NULL,
        `expire` datetime DEFAULT NULL,
        `serialkey` varchar(50) DEFAULT NULL,
        `autopay` TINYINT(0) DEFAULT NULL,
        KEY `motel` (`motel`),
        KEY `owner` (`owner`),
        KEY `serialkey` (`serialkey`)
    )]])
    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `motel_owner` (
            `motel` varchar(50) NOT NULL,
            `balance` int(11) DEFAULT 0,
            `total` int(11) DEFAULT 0,
            UNIQUE KEY `motel` (`motel`)
        )]])
    print("SUCCESSFULLY CREATED DATABASE TABLE")
end

function SendPhoneMail(source, sender, subject, message)
    TriggerClientEvent("lazy-motel:client:sendNewMail", source, sender, subject, message)
end
