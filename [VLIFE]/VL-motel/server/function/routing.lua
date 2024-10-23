local Instances = {}


function AddRoomInstance(motelName, roomName)
    Instances[roomName] = {
        motel = motelName,
        bucket = GenerateRandomInt(5),
        players = {}
    }
end

function AddPlayerToRoom(roomName, playerSource)
    local room = Instances[roomName]
    if not room then return end
    room.players[playerSource] = true
    SetPlayerRoutingBucket(playerSource, room.bucket)
end

function RemovePlayerFromRoom(roomName, playerSource)
    local room = Instances[roomName]
    if not room then return end
    room.players[playerSource] = false
    SetPlayerRoutingBucket(playerSource, 0)
end

function GetPlayersInRoom(roomName)
    local room = Instances[roomName]
    if not room then return end
    local players = {}
    for playerSource in pairs(room.players) do
        table.insert(players, playerSource)
    end
    return players
end
