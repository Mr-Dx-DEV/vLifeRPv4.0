PlayerShop = {
    Roles = {
        BOSS = 100,
        MANAGER = 50,
        VETERINARY = 25,
        CLERK = 0,
    }
}

PublicSharedPetsConfig = {
    -- If true, certain pet items will be limited to players who have active VIP status
    -- in your server, for setting up VIP integration check the documentation for cdev_lib
    UseVIPSystem = true,

    -- If true, there will be a button for opening the pet shop in your Pet Bag
    -- If false, you must integrate the pet shop by yourself, check docs for cdev_pets
    WantPetShopButton = false,

    -- When true, if the pet is loyal enough it will attack players you aim at, if you decide to keep this disabled use the export to trigger attacks from your own script ":Attack(ped)"
    WantAttackWhenAiming = true,

    -- Works the same as WantAttackWhenAiming, but if you disable WantAttackWhenAiming you can still enable this to allow K9s to attack when aiming
    WantAttackWhenAimingIfK9 = true,

    -- if true, pets can only attack players
    -- if false, pets can attack any entity 
    EnablePetToOnlyAttackPlayers = true,

    -- If true, will enable the new attack update with the police being the only that can use this feature and train the dog
    -- If false, will reverse to old one
    -- If This is true need EnablePetToOnlyAttackPlayers to be true
    EnableAttackUpdate = true,

    -- Configuration for opening a pet shop via Ped.
    PedShop = {

        -- If true, it will create a pet shop to use as a pet shop.
        WantPedShop = true,

        -- Coords to define where the ped will spawn
        PedCoords = vector4(78.661, -228.305, 53.673, 93.981),

        -- Parameter to define the ped model.
        PedModel = "s_m_m_doctor_01",

    },

    PlayerShop = {
        -- If true, it will use the drawtext system to show the pet shop
        UseDrawtextForPetShopEntities = false,
        UseDrawtextForManagment = false,
        UseDrawTextForStoreStores = false,
        DrawtextDistance = 1.5,

        UseBankInsteadOfCash = false,

            -- ⌨️ Default controls for the shop creator menu (see https://docs.fivem.net/docs/game-references/controls)
        CreatorControls = {
            CONFIRM_ANY_ACTION = 38, -- E
            CANCEL_ANY_ACTION = 200, -- ESC
            GENERAL_SAVE = 201,      -- Enter
            GENERAL_TOGGLE = 289,     -- TAB
            GENERAL_ALTERNATE = 19,  -- L. ALT
            INCREASE = 15,           -- Scroll UP
            DECREASE = 14,           -- Scroll DOWN
        },

        VetControls = {
            CANCEL_ANY_ACTION = 200, -- ESC
            HEAL = 201, -- Enter
        },
        
        -- ⌨️ Default controls for drawtext shops if using any (see https://docs.fivem.net/docs/game-references/controls)
        DrawtextShopControls = {
            BROWSE_STOCK = 38, -- E
            MANAGEMENT = 38,   -- E
            PETSHOP = 38,     -- E
        },

        Job = {
            RoleRequirements = {
                OpenManagementMenu = PlayerShop.Roles.CLERK,
                ManageStock = PlayerShop.Roles.CLERK,
                ManageEmployees = PlayerShop.Roles.MANAGER,
                ManageSettings = PlayerShop.Roles.MANAGER,
                ManageVault = PlayerShop.Roles.MANAGER,
                PlaceDogs = PlayerShop.Roles.MANAGER,
                TreatDogs = PlayerShop.Roles.VETERINARY,
            },
        },
    },

    -- Range the Keybinds/Commands will work
    Range = 5.0,

    Keybinds = {
        Enabled = false,

        -- Quick action for following/staying
        QuickAction_Follow = "G",

        -- Quick action for opening the menu
        QuickAction_Menu = "E",

        -- Quick action for cuddling
        QuickAction_Cuddle = "F",

        -- Quick action for standing up (leaving bed)
        QuickAction_Stand = "G",

        -- Cancel action
        CancelAction = "X",

        -- Keybind for opening your Pet Bag
        PetsBag = "F2",
    },

    Commands = {
        Enabled = true,

        -- Command for following/staying
        petfollow = "petfollow",

        -- Command for opening the menu
        openpetmenu = "petopenmenu",

        -- Command for cuddling
        petcuddle = "petcuddle",

        -- Command for cancelling action
        petcancel = "petcancel",

        -- Command for opening pet Bag
        petbag = "petbag",

        -- Command for standing up (leaving bed)
        petstand = "petstand"
    },

    -- Interaction for getting pet into vehicle (if false you should trigger events from your own script, events in docs)
    PetVehicleInteractionTarget = true,

    BagIcon = "https://i.ibb.co/JzwLFNL/Ex4-ETAA-d.png",

    Permissions = {
        -- Permission for adding inventory items for a pet
        PermPetInventoryAddItem = PERMISSION_HIGH,
        PermPetGivePet = PERMISSION_HIGH,
        PermPetDelPet = PERMISSION_HIGH,
        PermCreatePetShop = PERMISSION_HIGH,
        PermAddEmployees = PERMISSION_HIGH,
    },

    Inventory = {
        -- Max slots for pet inventory by default
        Slots = 40,
        -- Max slots for pet inventory for VIP players (if VIP enabled)
        VIPSlots = 120,
    },

    -- Settings related to pet tracker on map
    Tracker = {
        Enabled = true,
        Sprite = 621,
        Color = 5,
        Scale = 1.0,
        UpdateRateMS = 2 * 1000,
    },

    -- Settings related to pet shop
    Shop = {
        Icon = "https://i.ibb.co/JzwLFNL/Ex4-ETAA-d.png",
        PetCategories = {
            "pet_category_pets",
        },
        ApparelCategories = {
            "apparel_category_collar",
            "apparel_category_clothes",
            "apparel_category_shoes",
            "apparel_category_head",
            "apparel_category_patch",
            "apparel_category_glasses",
            "apparel_category_mask",
            --"apparel_category_fur",
        },
        AccessoriesCategories = {
            "accessory_category_leash",
            "accessory_category_bowl",
            "accessory_category_bed",
            "accessory_category_toys",
            "accesorry_category_training"
        },
        CareCategories = {
            "care_category_food",
            "care_category_liquids",
            "care_category_health",
        },
    },

    -- Mood UI settings
    Mood = {
        -- How far away will pet mood be displayed
        ShowRange = 20,
    },

    -- AI Related settings
    AI = {
        -- How frequently will AI tasks be processed on the server in seconds
        -- Changing this may have severe effects, not recommended
        TickFrequency = 60,
    },

    -- Pet stat related configuration
    -- Stats range from 0-100, values are changed per tick (check TickFrequency)
    Stats = {
        -- Appetite lost per tick
        AppetiteDecreasePerTick = 1,
        -- Appetite lost while following per tick
        AppetiteDecreaseFollowingPerTick = 3,
        -- Appetite change stat notification frequency
        AppetiteChangeNotify = 10,
        -- Damage dealt per tick while starving
        StarvationDamagePerTick = 15,
        -- Appetite lost when fetching a toy
        AppetiteDecreaseFromFetch = 1,
        -- Appetitle lost when healed
        ApettiteDecreaseWhenHealed = 3,
        -- Appetite lost when attacking
        AppetiteDecreaseWhenAttacking = 5,

        -- Hydration lost per tick
        HydrationDecreasePerTick = 1,
        -- Hydration lost while following per tick
        HydrationDecreaseFollowingPerTick = 3,
        -- Hydration change stat notification frequency
        HydrationChangeNotify = 10,
        -- Damage dealt per tick while dehydrated
        DehydrationDamagePerTick = 15,
        -- Hydration lost when fetching a toy
        HydrationDecreaseFromFetch = 3,
        -- Hydration lost when healed
        HydrationDecreaseWhenHealed = 3,
        -- Hydration lost when attacking
        HydrationDecreaseWhenAttacking = 5,

        -- Stamina lost while following per tick
        StaminaDecreaseFollowingPerTick = 4,
        -- Stamina lost when fetching a toy
        StaminaDecreaseFromFetch = 4,
        -- Stamina gained when sleeping per tick
        StaminaIncreaseWhileSleepingPerTick = 2,
        -- Stamina change stat notification frequency when sleeping
        StaminaChangeWhileSleepingNotify = 1,
        -- Stamina lost when attacking
        StaminaDecreaseWhenAttacking = 5,

        -- Happiness gained from cuddling (limited to cuddle frequency setting)
        HappinessBoostFromCuddle = 5,
        -- Happiness gained from following (limited to follow frequency setting)
        HappinessBoostFromFollow = 5,
        -- How often in seconds will cuddling increase happiness
        HappinessCuddleFrequency = 60 * 5,
        -- How often in seconds will following increase happiness
        HappinessFollowFrequency = 60 * 2.5,
        -- Pet will get angry when happiness is under this amount
        HappinessAngryThreshold = 30,
        -- Happiness lost when attacked by owner
        HappinessDecreaseWhenAttackedByOwner = 20,
        -- Happiness gained when fetching a toy
        HappinessBoostFromFetch = 5,

        -- Loyalty will increase when happiness above
        LoyaltyIncreaseWhenHappinessAbove = 80,
        -- Loyalty gained per tick when pet is above happiness threshold
        LoyaltyIncreasePerTickWhenHappy = 1,
        -- Loyalty lost per tick when starving
        LoyaltyDecreasePerTickWhenStarving = 1,
        -- Loyalty lost when attacked by owner
        LoyaltyDecreaseWhenAttackedByOwner = 5,
        -- Loyalty gained when revived by owner
        LoyaltyIncreaseWhenRevivedByOwner = 5,
        -- Loyalty gained when healed by owner
        LoyaltyIncreasedWhenHealedByOwner = 1,
        -- Loyalty gained when attacking
        LoyaltyIncreaseWhenAttacking = 1,
        -- Loyalty needed to perform certain actions like attacking
        LoyaltyLoyalThreshold = 80,

        -- How far away will pet stat changes be displayed
        NotifyShowRange = 20,
    },

    K9 = {
        -- Whether or not K9s can sniff for illegal items
        Skills = {
            sniff = {
                -- Level the k9 starts at
                DefaultLevel = 20,
                -- Minimum level the k9 can be at 
                -- if 0 then it will be impossible to sniff
                MinimiumLevel = 1,
                -- How much the sniff level increases per successful sniff
                LevelIncrease = 5,
                -- How much of the skill it will take out 
                TakeOut = 5,
            },
            attack = {
                -- Level the k9 starts at
                DefaultLevel = 20,
                -- Minimum level the k9 can be at
                -- if 0 then it will be impossible to attack
                MinimiumLevel = 1,
                -- How much the attack level increases per successful attack
                LevelIncrease = 5,
                -- How much time the player will be down
                takedownTime = 10000, 
                -- How much of the skill it will take out 
                TakeOut = 5,
            }, 
            agility = {
                -- Level the k9 starts at
                DefaultLevel = 20,
                -- Minimum level the k9 can be at
                -- if 0 then it will be impossible to agility
                MinimiumLevel = 1,
                -- How much the attack level increases per successful attack
                LevelIncrease = 5,
                -- How much of the skill it will take out 
                TakeOut = 5,
            },
            resistance = {
                -- Level the k9 starts at
                DefaultLevel = 20,
                -- Minimum level the k9 can be at
                -- if 0 then it will be impossible to resistance
                MinimiumLevel = 1,
                -- How much the attack level increases per successful attack
                LevelIncrease = 5,
                -- How much of the skill it will take out 
                TakeOut = 5,
            },

            -- How often in seconds will the skill tick
            TakeOutSkillTickFrequency = 720, -- in seconds
        },

        -- Whether or not K9s can sniff for illegal items
        SearchEnabled = true,
        -- Item ids that can be sniffed by K9s
        DrugItems = {
            "phone",
        },
        MoneyItems = {
            "water_bottle",
        },
        WeaponItems = {
            "sandwich",
        },
    },

    -- For development and support feedback only, do not use.
    Debug = false,
}
