# ------------------------CREDITS------------------------ #
# --------        Script made by Deltarix        -------- #
# --   Copyright 2021 Deltarix. All rights reserved    -- #
# ------------------------------------------------------- #

Requirements:
- qbcore
- oxmysql
- qb-vehicleshop (for the database setup)
- qb-garage (for the database setup)
- qb-houses (for database setup)

Installation:
- Insert drx.sql into your database.
- Open the first.sql and change information as needed in the first.sql file, and insert it.
- Drag drx_mdw into your resource folder and start it in your server configuration file.

Extra:
- If you want to import qbcore through the fxmanifest then disable "Export" in the configuration file and follow the steps below.

- If you want to use a menu or something else to open the MDW, then use the following events
> Server: TriggerClientEvent('drx_mdw:openMDW', source)
> Client: TriggerServerEvent('drx_mdw:deltarix#3150')

<!-- Open the fxmanifest.lua -->
<!-- Add '@qb-core/import.lua', before 'Config.lua' under shared_scripts  -->

Notifications:
- Title is the title shown on the notification, can be used as the type of robbery (etc Robbery, Heist, Incoming call or whatever)
- Text being details about the event, user could fetch the street the person is at and show that with some text
- Icon displayed (Has to be a html element etc *<span class="material-icons">local_police</span>*) (A good notification source: https://fonts.google.com/icons?selected=Material+Icons)
- Duation = the display time of the notification
> Server: TriggerServerEvent('drx_mdw:sendNotify', title, text, icon, duration)

Create calls:
- type (Filler text - Could be, robbery, user call, vehicle stolen)
- details (Filler text)
- icon (Icon (<span class="material-icons">person</span>)) https://fonts.google.com/icons?selected=Material+Icons
- duration (Duration the notification is shown in miliseconds)
> TriggerServerEvent('drx_mdw:sendNotify', type, details, icon, duration)


Create calls example:
RegisterCommand('drx112', function(source, args)
    local coords = GetEntityCoords(PlayerPedId(-1))
    local location = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords[1], coords[2], coords[3]))
    local type = 'User Call'
    local caller = 'Unknown'
    local details = ''
    for i=1, #args, 1 do
        if i > 0 then details = details .. ' '
            details = details .. args[i]
        end
    end
    TriggerServerEvent('drx_mdw:createDispatchCall', type, caller, details, location, coords)
    TriggerServerEvent('drx_mdw:sendNotify', type, details, '<span class="material-icons">person</span>', 5000)
end)

# Permanent Discord Invite: https://discord.gg/njBM5fVWcf (For support, and to be notified about updates)
# Youtube Channel: https://www.youtube.com/c/Deltarix

# CREDITS: Deltarix & Bubble