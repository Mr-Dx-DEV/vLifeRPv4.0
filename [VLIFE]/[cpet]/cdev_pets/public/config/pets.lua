---@alias PetLeashSettings { Bone: number, BoneName: string, BoneOffset: table }
---@alias PetFloatingUISetting { Bone: number, Offset: table; MenuOffset: table; BalloonOffset: table; StatsOffset: table }
---@alias CameraSettings { Bone: number, Offset: table, Rotation: table }
---@alias BallSettings { Enable: boolean, AttachBone: number, AttachBoneOffset: table }
---@alias PetDetails { Item: string, LeashSettings: PetLeashSettings, FloatingUISettings: PetFloatingUISetting, CameraCloseSettings: CameraSettings, BallSettings: BallSettings, Customization: any, Animations: any }
---@type table<string, PetDetails>
PetDetails = {
    ["cdev_dog_rott"] = {
        Item = "pet_chop",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_dobb"] = {
        Item = "pet_dobermann",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_golden"] = {
        Item = "pet_golden",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_husky"] = {
        Item = "pet_husky",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_frbull"] = {
        Item = "pet_frbul",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
        SkipVehicleScenarios = true,
    },
    ["cdev_dog_bully"] = {
        Item = "pet_bully",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_pitt"] = {
        Item = "pet_pitt",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_shep"] = {
        Item = "pet_shep",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_chow"] = {
        Item = "pet_chow",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_dal"] = {
        Item = "pet_dal",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_mal"] = {
        Item = "pet_mal",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_minipitt"] = {
        Item = "pet_minpit",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    -- cats 
    ["cdev_cat_turk"] = {
        Item = "pet_turk",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    },
    ["cdev_cat_amer"] = {
        Item = "pet_amer",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    }
}
