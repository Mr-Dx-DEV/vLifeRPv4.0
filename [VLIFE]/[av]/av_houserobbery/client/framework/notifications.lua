-- Replace the event with your own notifications system if you don't want the one from ox_lib
RegisterNetEvent('av_houserobbery:notification', function(type,msg)
    lib.notify({
        title = 'House',
        description = msg,
        type = type
    })
end)