TargetType = {
    NO_TARGET = 0,
    Q_TARGET = 1,
    BT_TARGET = 2,
    QB_TARGET = 3,
    OX_TARGET = 4
}

Inventory = {
    AUTOMATIC = 0,
    OX = 1,
    QS = 2,
    MF = 3,
    PS = 4,
    LJ = 5,
    CORE = 6,


    ESX = 100,
    QB = 101,
}

MeasurementUnits = {
    METRIC = 1,
    IMPERIAL = 2,
}

MeasurementTypes = {
    KILOMETERS = 1,
    LITERS = 2,
    METERS = 3,
}

InventoryResourceNames = {
    [Inventory.OX] = "ox_inventory",
    [Inventory.QS] = "qs-inventory",
    [Inventory.MF] = "mf-inventory",
    [Inventory.PS] = "ps-inventory",
    [Inventory.LJ] = "lj-inventory",
    [Inventory.CORE] = "core_inventory",
}

TargetTypeResourceName = {
    [TargetType.NO_TARGET] = "none",
    [TargetType.Q_TARGET] = "qtarget",
    [TargetType.BT_TARGET] = "bt-target",
    [TargetType.QB_TARGET] = "qb-target",
    [TargetType.OX_TARGET] = "ox_target"
}

Framework = {
    CUSTOM = 0,
    ESX = 1,
    QBCORE = 2,
}

AlignTypes = {
    LEFT = "L",
    RIGHT = "R",
    MIDDLE = "M",
}

DecorEnum = {
    FUEL = "_FUEL_LEVEL",
    WRONG_FUEL = "WRONG_FUEL",
    MILEAGE = "MILEAGE",
}

FuelType = {
    NATURAL = 1,
    DIESEL = 2,
    EV = 3,
    LPG = 4,
    CNG = 5,
    MILK = 6,
    AVIATION = 7,
}

VehicleTypes = {
    AMPHIBIOUS_QUAD_BIKE = 1,
    AMPHIBIOUS_CAR = 2,
    TRAIN = 3,
    QUAD_BIKE = 4,
    PLANE = 5,
    JETSKI = 6,
    HELI = 7,
    CAR = 8,
    BOAT = 9,
    BIKE = 10,
    BICYCLE = 11,
}

MaterialType = {
    NONE = 0,
    CLOTHES = 1,
    WOOD = 2,
    METAL = 3,
    HARD_SAND = 4,
    SOFT_SAND = 5,
    GRASS = 6,
    WET = 7,
    WATER = 8,
}

SoundEffect = {
    LIQUID_POURING_LOOP = "../sound/liquid_pouring_loop.mp3",
    SINGLE_POUR = "../sound/single_pour.mp3",
    FUEL_PUMP_SOUND_ELE_LOOP = "../sound/fuel_pump_sound_loop.mp3",
}

SkinChangerType = {
    AUTOMATIC = 0,
    SKIN_CHANGER = 1,
    CUI_CHARACTER = 2,
    QB_CLOTHING = 3,
    FIVEM_APPEARANCE = 4,
    ILLENIUM_APPEARANCE = 5,
    RCORE_CLOTHING = 6,
    NONE = 7,
}

skinchangerResource = {
    ["skinchanger"] = SkinChangerType.SKIN_CHANGER,
    ["cui_character"] = SkinChangerType.CUI_CHARACTER,
    ["qb-clothing"] = SkinChangerType.QB_CLOTHING,
    ["fivem-appearance"] = SkinChangerType.FIVEM_APPEARANCE,
    ["illenium-appearance"] = SkinChangerType.ILLENIUM_APPEARANCE,
}
