local MySQLFramework = {
    OX_MYSQL = 0,
    GHMATTI_MYSQL = 1,
    MYSQL_ASYNC = 2,
}

function IsResourceOnServer(resourceName)
    if GetResourceState(resourceName) == 'started' or GetResourceState(resourceName) == 'starting' then
        return true
    end
    return false
end

if SV_CONFIG == nil then
    SV_CONFIG = {}
end
SV_CONFIG.MysqlType = nil
if SV_CONFIG.MysqlType == nil then
    if IsResourceOnServer('oxmysql') then
        local OxMySQLVersion = GetResourceMetadata('oxmysql', 'version'):gsub('%D+', '')
        OxMySQLVersion = tonumber(OxMySQLVersion)

        if OxMySQLVersion <= 189 then
            -- is older than 2.0.0 version we're going to
            -- switch to old exports to make sure
            SV_CONFIG.MysqlType = MySQLFramework.OX_MYSQL
        else
            -- is newest we will trust the bridge for mysql-async will work on their part.
            SV_CONFIG.MysqlType = MySQLFramework.MYSQL_ASYNC
        end
    elseif IsResourceOnServer('mysql-async') then
        SV_CONFIG.MysqlType = MySQLFramework.MYSQL_ASYNC
    end

    if IsResourceOnServer('ghmattimysql') then
        SV_CONFIG.MysqlType = MySQLFramework.GHMATTI_MYSQL
    end
end

if SV_CONFIG.MysqlType == MySQLFramework.OX_MYSQL then
    local OxMySQLVersion = GetResourceMetadata('oxmysql', 'version'):gsub('%D+', '')
    OxMySQLVersion = tonumber(OxMySQLVersion)

    if OxMySQLVersion <= 189 then
        -- is older than 2.0.0 version we're going to
        -- switch to old exports to make sure
        SV_CONFIG.MysqlType = MySQLFramework.OX_MYSQL
    else
        -- is newest we will trust the bridge for mysql-async will work on their part.
        SV_CONFIG.MysqlType = MySQLFramework.MYSQL_ASYNC
    end
    MySQL = {}
    MySQL.Sync = {}
    MySQL.Async = {}

    function MySQL.Sync.fetchAll(query, table_, cb)
        return exports['oxmysql']:executeSync(query, table_, cb)
    end

    function MySQL.Async.fetchAll(query, table_, cb)
        return exports['oxmysql']:execute(query, table_, cb)
    end

    ---
    -- sync / async
    function MySQL.Sync.execute(query, table_, cb)
        return exports['oxmysql']:executeSync(query, table_, cb)
    end

    function MySQL.Async.execute(query, table_, cb)
        return exports['oxmysql']:execute(query, table_, cb)
    end

    -- sync / async
    function MySQL.Sync.insert(query, table_, cb)
        return exports['oxmysql']:insert(query, table_, cb)
    end

    function MySQL.Async.insert(query, table_, cb)
        return exports['oxmysql']:insert_async(query, table_, cb)
    end
end

if SV_CONFIG.MysqlType == MySQLFramework.GHMATTI_MYSQL then
    MySQL = {}
    MySQL.Sync = {}
    MySQL.Async = {}

    MySQL.Async.fetchAll = function(query, table_, cb)
        return exports['ghmattimysql']:execute(query, table_, cb)
    end

    MySQL.Sync.fetchAll = function(query, table_, cb)
        return exports['ghmattimysql']:executeSync(query, table_, cb)
    end

    MySQL.Async.execute = function(query, table_, cb)
        return exports['ghmattimysql']:execute(query, table_, cb)
    end

    MySQL.Sync.execute = function(query, table_, cb)
        return exports['ghmattimysql']:executeSync(query, table_, cb)
    end

    MySQL.Async.fetchScalar = function(query, table_, cb)
        return exports['ghmattimysql']:scalar(query, table_, cb)
    end

    MySQL.Sync.fetchScalar = function(query, table_, cb)
        return exports['ghmattimysql']:scalarSync(query, table_, cb)
    end
end
