Config = {}

------------------------------------------- MEGA PHONE -----------------------------------

Config.MicrophoneZones = {
    [1] = {
        name = "check", 
        coords = vector3(-329.25076293945, -1975.0554199219, 23.026344299316),
        length = 3.4,
        width = 3.6,
        spawnProp = false, -- if set to true, it will let you spawn the prop at location
        data = {
            debugPoly = false,
            heading = 180,
            minZ = 22.02,
            maxZ = 24.42,
            data = {
                range = 100.0 -- range for the voice
            }
        }
    },
    [2] = {
        name = "doj_court", 
        coords = vector3(-574.3, -208.82, 38.23),
        length = 15.2,
        width = 12,
        spawnProp = false, -- if set to true, it will let you spawn the prop at location
        data = {
            debugPoly = Config.Showzone,
            heading = 30,
            minZ = 37.03,
            maxZ = 41.03,
            data = {
                range = 25.0 -- range for the voice
            }
        }
    },
    [3] = {
        name = "press_pd", 
        coords = vector3(430.54, -995.07, 30.69),
        length = 2,
        width = 2,
        spawnProp = false, -- if set to true, it will let you spawn the prop at location
        data = {
            debugPoly = Config.Showzone,
            heading = 0,
            minZ = 28.29,
            maxZ = 32.29,
            data = {
                range = 25.0 -- range for the voice
            }
        }
    },
    [4] = {
        name = "meeting_pd", 
        coords = vector3(440.58, -985.88, 34.97),
        length = 2,
        width = 2,
        spawnProp = false, -- if set to true, it will let you spawn the prop at location
        data = {
            debugPoly = Config.Showzone,
            heading = 0,
            minZ = 32.17,
            maxZ = 36.17,
            data = {
                range = 25.0 -- range for the voice
            }
        }
    },
}