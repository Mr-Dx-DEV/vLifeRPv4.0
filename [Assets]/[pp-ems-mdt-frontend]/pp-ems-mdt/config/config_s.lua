local Framework = nil

if GetResourceState('es_extended') ~= 'missing' then
    Framework = 'ESX'
    ESX = exports.es_extended:getSharedObject()
elseif GetResourceState('qbx_core') ~= 'missing' then
    Framework = 'QBOX'
elseif GetResourceState('qb-core') ~= 'missing' then
    Framework = 'QBCore'
    QBCore = exports['qb-core']:GetCoreObject()
elseif GetResourceState('your_custom_framework') ~= 'missing' then -- fill it when you are using other framework
    Framework = 'your_custom_framework'
end

return {
    debug = true,
    locales = 'en', -- EN | PL

    imageUpload = {
        type = 'fivemanage', -- fivemanage | fmsdk | discord | custom
        token = '', -- fivemanage token | discord webhook
        custom = function(source)
            return nil --return url
        end
    },

    jobsWithAccess = {
        'ambulance'
    },

    homePage = {
        getDoctorData = function(player)
            local radiochannel, image, badge = nil, nil, nil
            if Framework == 'ESX' then
                radiochannel = Player(player.source).state.radioChannel
                image = player.getMeta('ems_mdt_image')
                badge = player.getMeta('badge') or 0
            elseif Framework == 'QBCore' or Framework == 'QBOX' then
                radiochannel = Player(player.PlayerData.source).state.radioChannel
                image = player.PlayerData.metadata.ems_mdt_image
                badge = player.PlayerData.metadata.callsign or 0
            end

            return {
                radio = radiochannel,
                img = image,
                badge = badge
            }
        end,
        getPhoto = function(identifier)
            local image = nil
            if Framework == 'ESX' then
                local player = ESX.GetPlayerFromIdentifier(identifier)

                if player then
                    image = player.getMeta('ems_mdt_image')
                else
                    local response = MySQL.query.await("SELECT JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.ems_mdt_image')) AS ems_mdt_image, FROM `users` WHERE `identifier` = ?", {
                        identifier
                    })
                    if response and response[1] then
                        image = response[1].ems_mdt_image
                    end
                end
            elseif Framework == 'QBOX' then
                local player = exports.qbx_core:GetPlayerByCitizenId(identifier) or exports.qbx_core:GetOfflinePlayer(identifier)
                image = player?.PlayerData.metadata.ems_mdt_image
            elseif Framework == 'QBCore' then
                local player = QBCore.Functions.GetPlayerByCitizenId(identifier) or QBCore.Functions.GetOfflinePlayerByCitizenId(identifier)
                image = player?.PlayerData.metadata.ems_mdt_image
            end

            return image
        end
    },

    citizen = {
        updatePhoto = function(identifier, url)
            if Framework == 'ESX' then
                local player = ESX.GetPlayerFromIdentifier(identifier)
                if player then
                    player.setMeta('ems_mdt_image', url)
                else
                    MySQL.update.await("UPDATE `users` SET `metadata` = JSON_SET(`metadata`, '$.ems_mdt_image', ?) WHERE `identifier` = ?", {
                        url,
                        identifier
                    })
                end
            elseif Framework == 'QBOX' then
                local player = exports.qbx_core:GetPlayerByCitizenId(identifier) or exports.qbx_core:GetOfflinePlayer(identifier)
                if not player then return false end

                player.Functions.SetMetaData('ems_mdt_image', url)
            elseif Framework == 'QBCore' then
                local player = QBCore.Functions.GetPlayerByCitizenId(identifier) or QBCore.Functions.GetOfflinePlayerByCitizenId(identifier)
                if not player then return false end
    
                player.Functions.SetMetaData('ems_mdt_image', url)
            end
            return true
        end,
        getCitizenDetails = function(identifier)
            local response = {}

            if Framework == 'ESX' then
                local data = {}
                local player = ESX.GetPlayerFromIdentifier(identifier)

                if player then
                    data.firstname = player.get('firstName')
                    data.lastname = player.get('lastName')
                    data.birthdate = player.get('dob')
                    data.nationality = player.get('nationality')
                    data.ems_mdt_image = player.getMeta('ems_mdt_image')
                    data.badge = player.getMeta('badge')
                else
                    local response = MySQL.query.await("SELECT `firstname`, `lastName`, `dateofbirth` AS `dob`, `nationality`, JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.ems_mdt_image')) AS ems_mdt_image, JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.badge')) AS badge FROM `users` WHERE `identifier` = ?", {
                        identifier
                    })
                    if response and response[1] then
                        data.firstname = response[1].firstname
                        data.lastname = response[1].lastName
                        data.birthdate = response[1].dob
                        data.nationality = response[1].nationality
                        data.ems_mdt_image = response[1].ems_mdt_image
                        data.badge = response[1].badge
                    end
                end

                response = {
                    name = data.firstname .. ' ' .. data.lastname,
                    dob = data.birthdate,
                    img = data.ems_mdt_image,
                    ssn = identifier,
                    nationality = data.nationality,
                    badge = data.badge
                }
            elseif Framework == 'QBOX' then
                local player = exports.qbx_core:GetPlayerByCitizenId(identifier) or exports.qbx_core:GetOfflinePlayer(identifier)
                if not player or not player.PlayerData then return {} end
                local data = player.PlayerData
                local licenses = {}

                for name, value in pairs(data.metadata.licences) do
                    table.insert(licenses, {
                        label = name,
                        owns = value
                    })
                end

                response = {
                    name = data.charinfo.firstname .. ' ' .. data.charinfo.lastname,
                    dob = data.charinfo.birthdate,
                    img = data.metadata.ems_mdt_image,
                    ssn = identifier,
                    nationality = data.charinfo.nationality,
                    licenses = licenses
                }
            elseif Framework == 'QBCore' then
                local player = QBCore.Functions.GetPlayerByCitizenId(identifier) or QBCore.Functions.GetOfflinePlayerByCitizenId(identifier)
                if not player or not player.PlayerData then return {} end
                local data = player.PlayerData
                local licenses = {}
    
                for name, value in pairs(data.metadata.licences) do
                    table.insert(licenses, {
                        label = name,
                        owns = value
                    })
                end
    
                response = {
                    name = data.charinfo.firstname .. ' ' .. data.charinfo.lastname,
                    dob = data.charinfo.birthdate,
                    img = data.metadata.ems_mdt_image,
                    ssn = identifier,
                    nationality = data.charinfo.nationality,
                    licenses = licenses
                }
            end


            return response
        end
    },

    case = {
        giveInvoice = function(identifier, fine, data)
            -- fill with your own ticket system
        end,
        injuries = {
            {
                name = 'First-degree burn', -- Oparzenie 1. stopnia
                price = 1000
            },
            {
                name = 'Second-degree burn', -- Oparzenie 2. stopnia
                price = 1500
            },
            {
                name = 'Third-degree burn', -- Oparzenie 3. stopnia
                price = 2500
            },
            {
                name = 'Open fracture', -- Złamanie otwarte
                price = 2000
            },
            {
                name = 'Closed fracture', -- Złamanie zamknięte
                price = 1500
            },
            {
                name = 'Concussion', -- Wstrząs mózgu
                price = 1200,
                onlyForRegion = 'Head'
            },
            {
                name = 'Hematoma', -- Krwiak
                price = 800
            },
            {
                name = 'Dislocation', -- Zwichnięcie
                price = 1100
            },
            {
                name = 'Sprain', -- Skręcenie
                price = 900
            },
            {
                name = 'Minor laceration', -- Małe rozcięcie
                price = 700
            },
            {
                name = 'Deep laceration', -- Głębokie rozcięcie
                price = 1600
            },
            {
                name = 'Whiplash injury', -- Uraz kręgosłupa szyjnego
                price = 1300,
                onlyForRegion = 'Head'
            },
            {
                name = 'Puncture wound', -- Rana kłuta
                price = 1700
            },
            {
                name = 'Gunshot wound', -- Rana postrzałowa
                price = 3000
            },
        }
    },

    patrols = {
        inviteExpiration = 60000, -- 1 minute
    },

    dispatch = {
        getGender = function(frPlayer)
            local gender = nil
            if Framework == 'ESX' then
                gender = frPlayer.get('sex') == 'm' and "Male" or "Female"
            elseif Framework == 'QBOX' then
                gender = frPlayer.PlayerData.charinfo.gender and "Male" or "Female"
            end
            return gender
        end,
    },

    permissions = {
        [1] = { -- [grade] = { permissions }
            announcements = {
                'view',
            },
            patrols = {
                'view',
            },
            citizens = {
                'view'
            },
            citizen = {
                'view',
            },
            cases = {
                'view',
            },
            case = {
                'view',
            },
            notes = {
                'view',
            },
            note = {
                'view',
            },
            settings = {
                'view'
            }
        },
        [2] = {
            homepage = {
                'chat',
                'search'
            },
            announcements = {
                'create',
            },
            announcement = {
                'edit',
                'remove'
            },
            patrols = {
                'create'
            },
            citizen = {
                'photo',
                'viewcases',
                'viewnotes',
                'viewvehicles'
            },
            cases = {
                'listview',
                'create'
            },
            case = {
                'edit'
            },
            notes = {
                'listview',
                'create'
            },
            note = {
                'edit',
                'remove'
            }
        }
    },

    queries = (Framework == 'QBOX' or Framework == 'QBCore') and {
        ['searchCitizens'] = [[
            SELECT
                COUNT(*) as count
            FROM
                players
            WHERE
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')) LIKE @search
                OR JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname')) LIKE @search
        ]],
        ['getCitizens'] = [[
            SELECT
                citizenid AS identifier,
                citizenid AS ssn,
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')) AS firstname,
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname')) AS lastname,
                JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.ems_mdt_image')) AS image
            FROM
                players
            WHERE
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')) LIKE @search
                OR JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname')) LIKE @search
            LIMIT @limit OFFSET @offset
        ]],
        ['getAuthor'] = [[
            SELECT
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')) AS firstname,
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname')) AS lastname
            FROM
                players
            WHERE
                citizenid = ?
        ]],
        ['getCitizensByIdentifiers'] = [[
            SELECT
                citizenid AS identifier,
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')) AS firstname,
                JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname')) AS lastname
            FROM
                players
            WHERE
                citizenid IN (?)
        ]],
        search = {
            ['citizens'] = [[
                SELECT
                    citizenid AS identifier,
                    JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')) AS firstname,
                    JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname')) AS lastname
                FROM
                    players
                WHERE
                    JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')) LIKE @query
                    OR JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname')) LIKE @query
                LIMIT 20]],
            ['doctors'] = [[
                SELECT
                    p.citizenid AS identifier,
                    JSON_UNQUOTE(JSON_EXTRACT(p.charinfo, '$.firstname')) AS firstname,
                    JSON_UNQUOTE(JSON_EXTRACT(p.charinfo, '$.lastname')) AS lastname
                FROM
                    players p
                WHERE
                    JSON_UNQUOTE(JSON_EXTRACT(p.job, '$.name')) IN (@jobs)
                    AND (
                        JSON_UNQUOTE(JSON_EXTRACT(p.charinfo, '$.firstname')) LIKE @query
                        OR JSON_UNQUOTE(JSON_EXTRACT(p.charinfo, '$.lastname')) LIKE @query
                    )
                LIMIT 20;
            ]],
        }
    } or {
        ['searchCitizens'] = [[
            SELECT
                COUNT(*) as count
            FROM
                users
            WHERE
                firstname LIKE @search
                OR lastname LIKE @search
        ]],
        ['getCitizens'] = [[
            SELECT
                identifier AS identifier,
                identifier AS ssn,
                firstname,
                lastname,
                JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.ems_mdt_image')) AS image
            FROM
                users
            WHERE
                firstname LIKE @search
                OR lastname LIKE @search
            LIMIT @limit OFFSET @offset
        ]],
        ['getAuthor'] = [[
            SELECT
                firstname,
                lastname
            FROM
                users
            WHERE
                identifier = ?
        ]],
        ['getCitizensByIdentifiers'] = [[
            SELECT
                identifier AS identifier,
                firstname,
                lastname
            FROM
                users
            WHERE
                identifier IN (?)
        ]],
        search = {
            ['citizens'] = [[
                SELECT
                    identifier AS identifier,
                    firstname,
                    lastname
                FROM
                    users
                WHERE
                    firstname LIKE @query
                    OR lastname LIKE @query
                LIMIT 20
            ]],
            ['doctors'] = [[
                SELECT `identifier`, `lastname`, `firstname`
                FROM `users`
                WHERE `job` IN (@jobs)
                AND (firstname LIKE @query OR lastname LIKE @query)
                LIMIT 20;
            ]],
        }
    }
}