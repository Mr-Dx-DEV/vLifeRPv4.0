return {
    homepage = {
        dispatchlimit = 10,
        maxSearchResults = 20
    },

    announcements = {
        minContentLength = 30
    },

    bodyRegions = {
        { name = 'Head', x1 = 119, y1 = 5, x2 = 119 + 93, y2 = 5 + 93 },
        { name = 'Left Arm', x1 = 223, y1 = 117, x2 = 223 + 42, y2 = 117 + 128 },
        { name = 'Left Forearm', x1 = 230, y1 = 248, x2 = 230 + 93, y2 = 248 + 159 },
        { name = 'Right Arm', x1 = 54, y1 = 116, x2 = 54 + 52, y2 = 116 + 130 },
        { name = 'Right Forearm', x1 = 0, y1 = 248, x2 = 0 + 96, y2 = 248 + 155 },
        { name = 'Left Foot', x1 = 164, y1 = 635, x2 = 164 + 47, y2 = 635 + 55 },
        { name = 'Right Foot', x1 = 111, y1 = 635, x2 = 111 + 44, y2 = 635 + 58 },
        { name = 'Right Calf', x1 = 95, y1 = 491, x2 = 95 + 61, y2 = 491 + 140 },
        { name = 'Left Calf', x1 = 164, y1 = 494, x2 = 164 + 57, y2 = 494 + 135 },
        { name = 'Left Thigh', x1 = 156, y1 = 318, x2 = 156 + 64, y2 = 318 + 176 },
        { name = 'Right Thigh', x1 = 96, y1 = 316, x2 = 96 + 56, y2 = 316 + 172 },
        { name = 'Chest', x1 = 101, y1 = 109, x2 = 101 + 113, y2 = 109 + 204 },
    },

    playerPositionRefreshRate = 1000, -- time in milliseconds which indicates how often the player's position on the map should be updated

    patrols = {
        statusTypes = {"Patrol", "Break", "Own Intervention", "Responding", "Other", "Transporting a patient"},
        patrolTypes = {
            { value = "heli", label = "Helicopter" },
            { value = "car", label = "Car" },
            { value = "walk", label = "Walk" },
            { value = "boat", label = "Boat" },
            { value = "bike", label = "Bike" },
            { value = "motorbike", label = "Motorbike" },
        },
        statusColorMap = {
            ['Patrol'] = "blue",
            ['Break'] = "orange",
            ['Own Intervention'] = "purple",
            ['Responding'] = "green",
            ['Other'] = "gray",
            ['Transporting a patient'] = "cyan"
        }
    },
    dispatch = {
        distanceCalculate = {
            unit = "miles",
            useRoadDistance = true
        },
        weaponColors = {
            ['handgun'] = "blue",
            ['smg'] = "red",
            ['rifle'] = "gray",
            ['sniper_rifle'] = "orange",
            ['shotgun'] = "purple",
            ['heavy'] = "black",
            ['thrown'] = "green"
        },
        timeLabels = {
            seconds = {
                { min = 0, max = 1, label = "a second" },
                { min = 2, max = 59, label = "x seconds" }
            },
            minutes = {
                { min = 1, max = 1, label = "a minute" },
                { min = 2, max = 59, label = "x minutes" }
            },
            hours = {
                { min = 1, max = 1, label = "an hour" },
                { min = 2, max = 23, label = "x hours" }
            },
            days = {
                { min = 1, max = 1, label = "a day" },
                { min = 2, max = 6, label = "x days" }
            },
            weeks = {
                { min = 1, max = 1, label = "a week" },
                { min = 2, max = 4, label = "x weeks" }
            },
            months = {
                { min = 1, max = 1, label = "a month" },
                { min = 2, max = 11, label = "x months" }
            },
            years = {
                { min = 1, max = 1, label = "a year" },
                { min = 2, max = 100, label = "x years" }
            }
        }
    }
}