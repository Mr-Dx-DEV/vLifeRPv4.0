Config = {}

GameTypes = {
    CircleProgress = "CircleProgress",
    Progress = "Progress",
    KeyCircle = "KeyCircle",
    KeySpam = "KeySpam",
    NumberSlide = "NumberSlide",
    RapidLines = "RapidLines",
    CircleShake = "CircleShake",
}

Config.KeepGameInput = {
    [GameTypes.CircleProgress] = false,
    [GameTypes.Progress] = false,
    [GameTypes.KeySpam] = false,
    [GameTypes.NumberSlide] = false,
    [GameTypes.RapidLines] = false,
}

Config.DisplayCursor = {
    [GameTypes.CircleShake] = true,
}