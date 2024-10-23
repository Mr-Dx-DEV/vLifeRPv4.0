---@enum ECategoryInventoryPets
ECategoryInventoryPets = {
    COLLAR = 0,
    FUR = 1,
    LEASH = 2,
    BOWL = 3,
    CLOTHES = 4,
    TOYS = 5,
    FOOD = 6,
    DRINKS = 7,
    TRAINING = 8,
}

---@type { [string]: InventoryItemSpec }
InventoryItemSpecs = {
    ["dummy"] = {
        label = "Dummy",
        category = ECategoryInventoryPets.TRAINING,
        stack = false,
        description = "Dummy item for testing.",
        canbeRemoved = true,
        usable = true,
        isK9 = true,
        onUse = {
            event = "cdev_pets:useDummy",
            data = { staminaDecrese = 5 },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["cone"] = {
        label = "Cones",
        category = ECategoryInventoryPets.TRAINING,
        stack = false,
        description = "Tunnel item for testing.",
        canbeRemoved = true,
        usable = true,
        
        isK9 = true,
        onUse = {
            event = "cdev_pets:useCones",
            data = { staminaDecrese = 5},
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["ramp"] = {
        label = "Ramp",
        category = ECategoryInventoryPets.TRAINING,
        stack = false,
        description = "Tunnel item for testing.",
        canbeRemoved = true,
        usable = true,
        isK9 = true,
        onUse = {
            event = "cdev_pets:useRampa",
            data = { staminaDecrese = 5 },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["hoop"] = {
        label = "Hoop",
        category = ECategoryInventoryPets.TRAINING,
        stack = true,
        description =
        "A great option for playing with pets, especially dogs. They are simple, straightforward, and effective toys that can be used for playing fetch or rolling around the house or yard.",
        canbeRemoved = true,
        usable = true,
        
        isK9 = true,
        onUse = {
            event = "cdev_pets:UseHoop",
            data = { staminaDecrese = 5 },
            net = false,
            close = true,
            preventRestoreState = true,
        }
    },
    ["baseball"] = {
        label = "Baseball",
        category = ECategoryInventoryPets.TOYS,
        stack = true,
        description =
        "A great option for playing with pets, especially dogs. They are simple, straightforward, and effective toys that can be used for playing fetch or rolling around the house or yard.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBall",
            data = {},
            net = false,
            close = true,
            preventRestoreState = true,
        }
    },
    ["cleanwater"] = {
        label = "Water Gallon",
        category = ECategoryInventoryPets.DRINKS,
        stack = true,
        description =
        "A great option for pets as it helps keep them hydrated and healthy. It is recommended to provide filtered water to pets to protect them from toxins that can be present in tap water.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 15,
        },
        onUse = {
            event = "cdev_pets:useWater",
            data = {},
            net = false,
            close = true,
            preventRestoreState = true,
        }
    },
    ["petfood1"] = {
        label = "Chicken Dog Food",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 7,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        }
    },
    ["petfood2"] = {
        label = "Porterhouse Dog Food",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 8,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        }
    },
    ["petfood3"] = {
        label = "Filetmignon Dog Food",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 10,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        }
    },
    ["petfood4"] = {
        label = "Paté Poultry Platter",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for cats, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 10,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        },
    },
    ["petfood5"] = {
        label = "Tasty Treasure Paté",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for cats, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 10,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        },
    },
    ["petfood6"] = {
        label = "Proactive Health",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for cats, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 10,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        },
    },
    ["pettreat1"] = {
        label = "Beef & Bacon Biscuits",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 5,
        },
        onUse = {
            event = "cdev_pets:useTreat",
            data = {},
            close = true,
        }
    },
    ["pettreat2"] = {
        label = "Yogurt Biscuits",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 7,
        },
        onUse = {
            event = "cdev_pets:useTreat",
            data = {},
            close = true,
        }
    },
    ["pettreat3"] = {
        label = "Peanut Butter Biscuits",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 7,
        },
        onUse = {
            event = "cdev_pets:useTreat",
            data = {},
            close = true,
        }
    },
    ["petmedlow"] = {
        label = "Pet Medkit (Low Effect)",
        stack = false,
        description =
        "The Pet Medkit (Low Effect) is a compact first aid kit for pets. It contains basic supplies to address minor injuries and ailments, providing immediate care and peace of mind for your furry friend.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 10,
        },
        onUse = {
            event = "cdev_pets:useMedication",
            data = {},
            close = true,
            preventRestoreState = true,
        }
    },
    ["petmedmed"] = {
        label = "Pet Medkit (Medium Effect)",
        stack = false,
        description =
        "The Pet Medkit (Medium Effect) is a comprehensive first aid kit for pets, providing intermediate medical support. With a wider range of supplies and treatments, it equips you to handle moderate injuries and health issues. Convenient and reliable, it's designed to ensure your pet's well-being in various emergencies.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 25,
        },
        onUse = {
            event = "cdev_pets:useMedication",
            data = {},
            close = true,
            preventRestoreState = true,
        }
    },
    ["petmedhigh"] = {
        label = "Pet Medkit (High Effect)",
        stack = false,
        description =
        "The Pet Medkit (High Effect) is an advanced and powerful first aid kit for pets. With a wide array of supplies and treatments, it provides strong medical support for addressing serious injuries and health conditions. Designed to handle high-impact emergencies, this medkit offers comprehensive care and ensures your pet's well-being in critical situations.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 50,
        },
        onUse = {
            event = "cdev_pets:useMedication",
            data = {},
            close = true,
            preventRestoreState = true,
        }
    },
    ["leashgreen"] = {
        label = "Green Leash",
        category = ECategoryInventoryPets.LEASH,
        stack = false,
        description = "Take your dog for a walk.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useLeash",
            data = {
                prop = "leashgreen",
                offset = vector3(0.18, -0.0, -0.02),
                rotation = vector3(300.0, 0.0, 0.0),
            },
            close = true,
            preventRestoreState = true,
        }
    },
    -- OUTFITS --
    ["purpleshoes"] = {
        label = "Purple Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fancy shoes for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["blackcollarstrass"] = {
        label = "Black Collar w Strass",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A very strong collar for your pet, black collar with gray strass",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 1,
                texture = 3,
            },
            close = true,
        }
    },
    ["goldcollar"] = {
        label = "Gold Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A very strong collar for your pet, there is gold strass",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 1,
                texture = 1
            },
            close = true,
        }
    },
    ["whitecollar"] = {
        label = "White Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A very strong collar for your pet completely white",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 1,
                texture = 2,
            },
            close = true,
        }
    },
    ["greencamohoodie"] = {
        label = "Green Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 2,
            },
            close = true,
        }
    },
    ["allblackcollar"] = {
        label = "All Black Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A very strong collar for your pet completely black",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["greendothoodie"] = {
        label = "Green Dot Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 2,
            },
            close = true,
        }
    },
    ["yellowbootslong"] = {
        label = "Yellow Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A good rain day shoes for your pet color yellow",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 0,
            },
            close = true,
        }
    },
    ["yellowhoodie"] = {
        label = "Yellow Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 5,
            },
            close = true,
        }
    },
    ["bluebootslong"] = {
        label = "Blue Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A good rain day shoes for your pet, color blue",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 1,
            },
            close = true,
        }
    },
    ["redbootslong"] = {
        label = "Red Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A good rain day shoes for your pet, color red",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 2,
            },
            close = true,
        }
    },
    ["lightyellowhoodie"] = {
        label = "Light Yellow Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 3,
            },
            close = true,
        }
    },
    ["whitehoodie"] = {
        label = "White Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 4,
            },
            close = true,
        }
    },
    ["snowbootspurple"] = {
        label = "Snow Boots Purple",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Good for cold feet in purple color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["snowbootsgray"] = {
        label = "Snow Boots Gray",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Good for cold feet in gray color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["pinkhoodie"] = {
        label = "Pink Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 1,
            },
            close = true,
        }
    },
    ["purplehoodie"] = {
        label = "Purple Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 0,
            },
            close = true,
        }
    },
    ["snowbootsblue"] = {
        label = "Snow Boots Blue",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Good for cold feet in light blue color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    ["lightpinkhoodie"] = {
        label = "Light Pink Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 7,
            },
            close = true,
        }
    },
    ["sneakersblue"] = {
        label = "Sneakers Blue",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Beautiful sneakers in blue color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 0,
            },
            close = true,
        }
    },
    ["whitebrownhoodie"] = {
        label = "White Brown Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 6
            },
            close = true,
        }
    },
    ["sneakerspurple"] = {
        label = "Sneakers Purple",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Beautiful sneakers in purple color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 1,
            },
            close = true,
        }
    },
    ["orangecamohoodie"] = {
        label = "Orange Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 5,
            },
            close = true,
        }
    },
    ["sneakersgreen"] = {
        label = "Sneakers Green",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Beautiful sneakers in green color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 2,
            },
            close = true,
        }
    },
    ["bluecamohoodie"] = {
        label = "Blue Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 4,
            },
            close = true,
        }
    },
    ["halowingsgoldwhite"] = {
        label = "Halo Wings Gold White",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute halo with wings over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 1,
                texture = 0,
            },
            close = true,
        }
    },
    ["pinkcamohoodie"] = {
        label = "Pink Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 3,
            },
            close = true,
        }
    },
    ["purplecamohoodie"] = {
        label = "Purple Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 1,
            },
            close = true,
        }
    },
    ["camohoodie"] = {
        label = "Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 0,
            },
            close = true,
        }
    },
    ["halowingsgold"] = {
        label = "Halo Wings Gold",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute halo with wings over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 1,
                texture = 1,
            },
            close = true,
        }
    },
    ["halowingssilverblack"] = {
        label = "Halo Wings Silver Black",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute halo with wings over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 1,
                texture = 2,
            },
            close = true,
        }
    },
    ["blacksailorcape"] = {
        label = "Black Sailor Cape",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cute sailor cape for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 2,
                texture = 4,
            },
            close = true,
        }
    },
    ["halowingsgoldpink"] = {
        label = "Halo Wings Gold Pink",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute halo with wings over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 1,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinksailorcape"] = {
        label = "Pink Sailor Cape",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cute sailor cape for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 2,
                texture = 3,
            },
            close = true,
        }
    },
    ["yellowflowers"] = {
        label = "Yellow Flowers",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Adorable yellow flowers for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["graysailorcape"] = {
        label = "Gray Sailor Cape",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cute sailor cape for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    ["camosailorcape"] = {
        label = "Camo Sailor Cape",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cute sailor cape for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["plaidsailorcape"] = {
        label = "Plaid Sailor Cape",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cute sailor cape for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    -- ["pinkheartsbow"] = {
    --     label = "Pink Hearts Bow",
    --     category = ECategoryInventoryPets.CLOTHES,
    --     
    --     stack = false,
    --     description = "Cute bow for your pet.",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 8,
    --             drawable = 3,
    --             texture = 0,
    --         },
    --         close = true,
    --     }
    -- },
    ["flowersdarkbow"] = {
        label = "Flowers Dark Bow",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cute bow for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 3,
                texture = 1,
            },
            close = true,
        }
    },
    ["bluelinesbow"] = {
        label = "Blue Lines Bow",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cute bow for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 3,
                texture = 2,
            },
            close = true,
        }
    },
    ["greenplaidbow"] = {
        label = "Green Plaid Bow",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cute bow for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 3,
                texture = 3,
            },
            close = true,
        }
    },
    ["policecap"] = {
        label = "Police Cap",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A Police Cap.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 4,
                texture = 1,
            },
            close = true,
        }
    },
    ["redsailorcap"] = {
        label = "Red Sailor Cap",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A Red Sailor Cap.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 4,
                texture = 0,
            },
            close = true,
        }
    },
    ["pinkbow"] = {
        label = "Pink Bow",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cute bow for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 3,
                texture = 0,
            },
            close = true,
        }
    },
    ["bluesailorcap"] = {
        label = "Blue Sailor Cap",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A Blue Sailor Cap.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 4,
                texture = 4,
            },
            close = true,
        }
    },
    ["medicalcap"] = {
        label = "Medical Cap",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A Medical Cap.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 4,
                texture = 3,
            },
            close = true,
        }
    },
    ["kapolicecap"] = {
        label = "KaPolice Cap",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Kanpolis Colice Cap.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 4,
                texture = 2,
            },
            close = true,
        }
    },
    ["whiteflowers"] = {
        label = "White Flowers",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Adorable white flowers for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    ["neon"] = {
        label = "Neon",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "Cute neon collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["gunner"] = {
        label = "Gunner",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A nice collar for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 4,
                texture = 0,
            },
            close = true,
        }
    },
    ["red"] = {
        label = "Red",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A nice collar for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 6,
                texture = 0,
            },
            close = true,
        }
    },
    ["suit"] = {
        label = "Suit",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 0,
            },
            close = true,
        }
    },
    ["pajama"] = {
        label = "Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 0,
            },
            close = true,
        }
    },
    ["camovest"] = {
        label = "Camo Vest",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 0,
            },
            close = true,
        }
    },
    ["camored"] = {
        label = "Camo Red Vest",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 1,
            },
            close = true,
        }
    },
    ["camoblack"] = {
        label = "Camo Black Vest",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 2,
            },
            close = true,
        }
    },
    ["camobluewhite"] = {
        label = "Camo Blue White Vest",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 3,
            },
            close = true,
        }
    },
    ["camoblueyellow"] = {
        label = "Camo Blue Yellow Vest",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 4,
            },
            close = true,
        }
    },
    ["camodarkblue"] = {
        label = "Camo Dark Blue Vest",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 5,
            },
            close = true,
        }
    },
    ["trouble"] = {
        label = "Trouble",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A trouble shirt for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 0,
            },
            close = true,
        }
    },
    ["whitecollarbandana"] = {
        label = "White Collar Bandana",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "Beautiful bandana collar with various patterns",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 7,
                texture = 0,
            },
            close = true,
        }
    },
    ["greencollarbandana"] = {
        label = "Green Collar Bandana",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "Beautiful bandana collar with various patterns",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 7,
                texture = 1,
            },
            close = true,
        }
    },
    ["redcollarbandana"] = {
        label = "Red Collar Bandana",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "Beautiful bandana collar with various patterns",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 7,
                texture = 2,
            },
            close = true,
        }
    },
    ["greycollarbandana"] = {
        label = "Grey Collar Bandana",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "Beautiful bandana collar with various patterns",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 7,
                texture = 3,
            },
            close = true,
        }
    },
    ["blackmask"] = {
        label = "Human Prop Mask Black",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Random human prop",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 1,
                texture = 0,
            },
            close = true,
        }
    },
    ["whitemask"] = {
        label = "Human Prop Mask White",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Random human prop",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 1,
                texture = 1,
            },
            close = true,
        }
    },
    ["securitypatch"] = {
        label = "Security Patch",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Security Patch",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["policepatch"] = {
        label = "Police Patch",
        category = ECategoryInventoryPets.CLOTHES,
        isPremiumPackage = false,
        stack = false,
        description = "Police Patch",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["rescuepatch"] = {
        label = "Rescue Patch",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Rescue Patch",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    ["sheriffpatch"] = {
        label = "Sheriff Patch",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Sheriff Patch",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 2,
                texture = 3,
            },
            close = true,
        }
    },
    -- ["servicepatch"] = {
    --     label = "Service Patch",
    --     category = ECategoryInventoryPets.CLOTHES,
    --     
    --     stack = false,
    --     description = "Service Patch",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 1,
    --             drawable = 2,
    --             texture = 4,
    --         },
    --         close = true,
    --     }
    -- },
    ["pinkyellowbootslong"] = {
        label = "Yellow/Pink Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A good rain day shoes for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinkbootslong"] = {
        label = "Pink Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A good rain day shoes for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 4,
            },
            close = true,
        }
    },
    ["yellowboots"] = {
        label = "Yellow Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A good rain day shoes for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 5,
            },
            close = true,
        }
    },
    ["blueboots"] = {
        label = "Blue Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A good rain day shoes for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 6,
            },
            close = true,
        }
    },
    ["greenboots"] = {
        label = "Green Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A good rain day shoes for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 7,
            },
            close = true,
        }
    },
    ["pinkwhitesnowboots"] = {
        label = "Pink white Snow Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cosy warm boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 3,
            },
            close = true,
        }
    },
    ["darkbluesnowboots"] = {
        label = "Dark Blue Snow Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cosy warm boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 4,
            },
            close = true,
        }
    },
    ["yellowsnowboots"] = {
        label = "Yellow Snow Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cosy warm boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 5,
            },
            close = true,
        }
    },
    ["pinksnowboots"] = {
        label = "Pink Snow Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cosy warm boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 6,
            },
            close = true,
        }
    },
    ["greywhitesnowboots"] = {
        label = "Grey White Snow Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cosy warm boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 7,
            },
            close = true,
        }
    },
    ["darkgreensnowboots"] = {
        label = "Dark Green Snow Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cosy warm boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 8,
            },
            close = true,
        }
    },
    ["redboots"] = {
        label = "Red Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fashionable cute boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 3,
            },
            close = true,
        }
    },
    ["beigeboots"] = {
        label = "Beige Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fashionable cute boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 4,
            },
            close = true,
        }
    },
    ["bluedarklightboots"] = {
        label = "Dark and Light Blue Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fashionable cute boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 5,
            },
            close = true,
        }
    },
    ["yelloworangeboots"] = {
        label = "Yellow Orange Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fashionable cute boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 6,
            },
            close = true,
        }
    },
    ["yellowbootsshort"] = {
        label = "Yellow Boots Short",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fashionable cute boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 7,
            },
            close = true,
        }
    },
    ["bluebandana"] = {
        label = "Blue bandana",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A fashionable bandana for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 5,
                texture = 0,
            },
            close = true,
        }
    },
    ["pinkbandana"] = {
        label = "Pink bandana",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A fashionable bandana for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 5,
                texture = 1,
            },
            close = true,
        }
    },
    ["redbandana"] = {
        label = "Red bandana",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A fashionable bandana for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 5,
                texture = 2,
            },
            close = true,
        }
    },
    ["orangebandana"] = {
        label = "Orange bandana",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A fashionable bandana for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 5,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinksunglasses"] = {
        label = "Pink Sunglasses",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fashionable sunglasses for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 1,
                texture = 0,
            },
            close = true,
        }
    },
    ["blacksunglasses"] = {
        label = "Black Sunglasses",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fashionable sunglasses for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 1,
                texture = 1,
            },
            close = true,
        }
    },
    ["redsunglasses"] = {
        label = "Red Sunglasses",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fashionable sunglasses for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 1,
                texture = 2,
            },
            close = true,
        }
    },
    ["whitesunglasses"] = {
        label = "White Sunglasses",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fashionable sunglasses for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 1,
                texture = 3,
            },
            close = true,
        }
    },
    ["blacksweater"] = {
        label = "Black Sweater",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cosy sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 9,
                texture = 0,
            },
            close = true,
        }
    },
    ["pinksweater"] = {
        label = "Pink Sweater",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cosy sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 9,
                texture = 1,
            },
            close = true,
        }
    },
    ["greensweater"] = {
        label = "Green Sweater",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cosy sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 9,
                texture = 2,
            },
            close = true,
        }
    },
    ["redsweater"] = {
        label = "Red Sweater",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Cosy sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 9,
                texture = 3,
            },
            close = true,
        }
    },
    ["prop1"] = {
        label = "Funny Prop 1",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A prop riding your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 10,
                texture = 0,
            },
            close = true,
        }
    },
    ["prop2"] = {
        label = "Funny Prop 2",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A prop riding your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 10,
                texture = 1,
            },
            close = true,
        }
    },
    ["prop3"] = {
        label = "Funny Prop 3",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A prop riding your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 10,
                texture = 2,
            },
            close = true,
        }
    },
    ["prop4"] = {
        label = "Funny Prop 4",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A prop riding your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 10,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinkflowers"] = {
        label = "Pink Flowers",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Flowers for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["pinkskirt"] = {
        label = "Pink Skirt",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A skirt for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 4,
                texture = 0,
            },
            close = true,
        }
    },
    -- ["redvest"] = {
    --     label = "Red Vest",
    --     category = ECategoryInventoryPets.CLOTHES,
    --     
    --     stack = false,
    --     description = "A vest for your pet",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 3,
    --             drawable = 7,
    --             texture = 1,
    --         },
    --         close = true,
    --     }
    -- },
    -- ["blackvest"] = {
    --     label = "Black Vest",
    --     category = ECategoryInventoryPets.CLOTHES,
    --     
    --     stack = false,
    --     description = "A vest for your pet",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 3,
    --             drawable = 7,
    --             texture = 2,
    --         },
    --         close = true,
    --     }
    -- },
    -- ["darkbluevest"] = {
    --     label = "Dark Blue Vest",
    --     category = ECategoryInventoryPets.CLOTHES,
    --     
    --     stack = false,
    --     description = "A vest for your pet",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 3,
    --             drawable = 7,
    --             texture = 3,
    --         },
    --         close = true,
    --     }
    -- },
    -- ["sheriffvest"] = {
    --     label = "Sheriff Vest",
    --     category = ECategoryInventoryPets.CLOTHES,
    --     
    --     stack = false,
    --     description = "A vest for your pet",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 3,
    --             drawable = 7,
    --             texture = 4,
    --         },
    --         close = true,
    --     }
    -- },
    -- ["servicevest"] = {
    --     label = "Service Vest",
    --     category = ECategoryInventoryPets.CLOTHES,
    --     
    --     stack = false,
    --     description = "A vest for your pet",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 3,
    --             drawable = 7,
    --             texture = 5,
    --         },
    --         close = true,
    --     }
    -- },
    -- BEDS
    ["bedbones"] = {
        label = "Bed Bones",
        stack = false,
        description = "A bed with bones",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedbones",
                petOffset = vector3(0.20, 0.05, 0.15),
                petHeadingOffset = 180.0,
            },
            close = true,
        }
    },
    ["bedmaster"] = {
        label = "Bed Master",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedmaster",
                petOffset = vector3(0.10, -0.15, -0.25),
                petHeadingOffset = 90.0,
            },
            close = true,
        }
    },
    ["bedwood"] = {
        label = "Wooden Bed",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedwood",
                petOffset = vector3(0.10, -0.15, -0.25),
                petHeadingOffset = 90.0,
            },
            close = true,
        }
    },
    ["bedcream"] = {
        label = "Bed Cream",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcream",
                petOffset = vector3(0.10, -0.25, -0.25),
                petHeadingOffset = 90.0,
            },
            close = true,
        }
    },
    ["bedgold"] = {
        label = "Bed Gold",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedgold",
                petOffset = vector3(0.10, -0.25, -0.25),
                petHeadingOffset = 90.0,
            },
            close = true,
        }
    },
    ["bedmodern"] = {
        label = "Bed Modern",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedmodern",
                petOffset = vector3(0.10, -0.25, -0.25),
                petHeadingOffset = 90.0,
            },
            close = true,
        }
    },
    ["bedold"] = {
        label = "Old Bed",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedold",
                petOffset = vector3(0.10, -0.15, -0.34),
                petHeadingOffset = 80.0,
            },
            close = true,
        }
    },
    ["bedplaid"] = {
        label = "Bed Plaid",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedplaid",
                petOffset = vector3(0.10 -0.15 -0.50),
                petHeadingOffset = 80.0,
            },
            close = true,
        }
    },
    ["bedbath"] = {
        label = "Bathing Tub Bed",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedbath",
                petOffset = vector3(-0.05, 0.10, 0.02),
                petHeadingOffset = 305.0,
            },
            close = true,
        }
    },
    ["bedsmall"] = {
        label = "Small Bed",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedsmall",
                petOffset = vector3(0.15, 0.20, 0.10),
                petHeadingOffset = 220.0,
            },
            close = true,
        }
    },
    ["bedflower"] = {
        label = "Flower Bed",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedflower",
                petOffset = vector3(0.05, -0.15, 0.30),
                petHeadingOffset = 140.0,
            },
            close = true,
        }
    },
    ["bedhouse"] = {
        label = "House Bed",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedhouse",
                petOffset = vector3(0.05, 0.15, 0.40),
                petHeadingOffset = 205.0,
            },
            close = true,
        }
    },
    ["bedhammock"] = {
        label = "Hammock Bed",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedhammock",
                petOffset = vector3(-0.05, 0.15, 0.40),
                petHeadingOffset = 260.0,
            },
            close = true,
        }
    },
    ["bedprincess"] = {
        label = "Princess Bed",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedprincess",
                petOffset = vector3(0.20, -0.03, 0.20),
                petHeadingOffset = 150.0,
            },
            close = true,
        }
    },
    ["bedpumpkin"] = {
        label = "Pumpkin Bed",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin",
                petOffset = vector3(0.15, -0.03, 0.03),
                petHeadingOffset = 150.0,
            },
            close = true,
        }
    },
    ["bedpumpkinhollow"] = {
        label = "Hollow Pumpkin Bed",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkinhollow",
                petOffset = vector3(0.15, -0.01, -0.15),
                petHeadingOffset = 150.0,
            },
            close = true,
        }
    },
    -- BOWLS --
    ["bluebowl"] = {
        label = "Blue Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "bluebowl",
            },
        },
    },
    ["brownbowl"] = {
        label = "Brown Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "brownbowl",
            },
        },
    },
    -- ["graybowl"] = {
    --     label = "Gray Bowl",
    --     category = ECategoryInventoryPets.BOWL,
    --     
    --     stack = false,
    --     description = "A nice bowl for your pet.",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:setBowl",
    --         data = {
    --             prop = "graybowl",
    --         },
    --     },
    -- },
    ["greenbowl"] = {
        label = "Green Bowl",
        category = ECategoryInventoryPets.BOWL,
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "greenbowl",
            },
        },
    },
    ["redbowl"] = {
        label = "Red Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "redbowl",
            },
        },
    },
    ["silverbowl"] = {
        label = "Silver Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "silverbowl",
            },
        },
    },

    ["beigestyleboots"] = {
        label = "Beige Boots ",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Stylish boots",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 4,
                texture = 0,
            },
            close = true,
        }
    },
    ["blackstyleboots"] = {
        label = "Black Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Stylish boots",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 4,
                texture = 1,
            },
            close = true,
        }
    },
    ["brownstyleboots"] = {
        label = "Brown Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Stylish boots",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 4,
                texture = 2,
            },
            close = true,
        }
    },
    -- ["bluependant"] = {
    --     label = "Blue Pendant",
    --     category = ECategoryInventoryPets.COLLAR,
    --     
    --     stack = false,
    --     description = "A beautiful pendant for your pet",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 8,
    --             drawable = 5,
    --             texture = 0,
    --         },
    --         close = true,
    --     }
    -- },
    -- ["redpendant"] = {
    --     label = "Red Pendant",
    --     category = ECategoryInventoryPets.COLLAR,
    --     
    --     stack = false,
    --     description = "A beautiful pendant for your pet",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 8,
    --             drawable = 5,
    --             texture = 1,
    --         },
    --         close = true,
    --     }
    -- },
    ["wgsailorhat"] = {
        label = "White and Gold Sailor Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Stylish hat",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 8,
                texture = 0,
            },
            close = true,
        }
    },
    ["piratehat"] = {
        label = "Pirate Hat Black",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Arrrrrr!",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 8,
                texture = 1,
            },
            close = true,
        }
    },
    ["wizhatwhite"] = {
        label = "Wizard Hat White",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Your dog can do magic with this hat",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 9,
                texture = 0,
            },
            close = true,
        }
    },
    ["wizhatpurple"] = {
        label = "Wizard Hat Purple",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Your dog can do magic with this hat",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 9,
                texture = 1,
            },
            close = true,
        }
    },
    ["beaniewhite"] = {
        label = "Beanie Hat White",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Stylish hats",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 0,
            },
            close = true,
        }
    },
    ["beanieyellow"] = {
        label = "Beanie Hat Yellow",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Stylish hats",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 1,
            },
            close = true,
        }
    },
    ["beanieblue"] = {
        label = "Beanie Hat Blue",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Stylish hats",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 2,
            },
            close = true,
        }
    },
    ["beaniepink"] = {
        label = "Beanie Hat Pink",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Stylish hats",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 3,
            },
            close = true,
        }
    },
    ["sharkdog"] = {
        label = "Funny Animal Prop",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Shark Dog",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 10,
                texture = 0,
            },
            close = true,
        }
    },
    ["whitecap"] = {
        label = "White Cap",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "White baseball cap",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 12,
                texture = 0,
            },
            close = true,
        }
    },
    ["whitepinkcap"] = {
        label = "White Pink Cap",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "White Pink baseball cap",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 12,
                texture = 1,
            },
            close = true,
        }
    },
    ["whiteyellowcap"] = {
        label = "White Yellow Cap",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "White Yellow baseball cap",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 12,
                texture = 2,
            },
            close = true,
        }
    },
    ["roundsunglasses"] = {
        label = "Round Sunglasses",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Sunglasses",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 6,
                texture = 0,
            },
            close = true,
        }
    },
    ["pumpkinhat"] = {
        label = "Pumpkin Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 6,
                texture = 0,
            },
            close = true,
        }
    },
    ["devilearsred"] = {
        label = "Devil Ears Red",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 0,
            },
            close = true,
        }
    },
    ["devilearsblack"] = {
        label = "Devil Ears Black",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 1,
            },
            close = true,
        }
    },
    ["devilearsgreen"] = {
        label = "Devil Ears Green",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 2,
            },
            close = true,
        }
    },
    ["devilearspink"] = {
        label = "Devil Ears Pink",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 3,
            },
            close = true,
        }
    },
    ["devilearsyellow"] = {
        label = "Devil Ears Yellow",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 4,
            },
            close = true,
        }
    },
    ["devilearsblue"] = {
        label = "Devil Ears Blue",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 5,
            },
            close = true,
        }
    },
    ["wingsred"] = {
        label = "Red Wings",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["wingsblack"] = {
        label = "Black Wings",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["wingsgreen"] = {
        label = "Green Wings",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    ["candyprop"] = {
        label = "Candy Prop",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 3,
                texture = 0,
            },
            close = true,
        }
    },
    ["pumpkinprop"] = {
        label = "Pumpkin Prop",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 3,
                texture = 1,
            },
            close = true,
        }
    },
    ["bigredwings"] = {
        label = "Big Red Wings",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 4,
                texture = 0,
            },
            close = true,
        }
    },
    ["redorangewings"] = {
        label = "Red/Orange Wings",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 5,
                texture = 0,
            },
            close = true,
        }
    },
    ["purplewings"] = {
        label = "Purple Wings",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 5,
                texture = 1,
            },
            close = true,
        }
    },
    ["pinkwings"] = {
        label = "Pink Wings",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 5,
                texture = 2,
            },
            close = true,
        }
    },
    ["bluewings"] = {
        label = "Blue Wings",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 5,
                texture = 3,
            },
            close = true,
        }
    },
    ["spiderprop1"] = {
        label = "Spider Prop 1",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 11,
                texture = 0,
            },
            close = true,
        }
    },
    ["spiderprop2"] = {
        label = "Spider Prop 2",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 12,
                texture = 0,
            },
            close = true,
        }
    },
    ["tealneon"] = {
        label = "Teal Neon",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "Cute neon collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["purpleneon"] = {
        label = "Purple Neon",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "Cute neon collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 3,
            },
            close = true,
        }
    },
    ["blueneon"] = {
        label = "Blue Neon",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "Cute neon collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    ["pinkneon"] = {
        label = "Pink Neon",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "Cute neon collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 4,
            },
            close = true,
        }
    },
    ["redneon"] = {
        label = "Red Neon",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "Cute neon collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 5,
            },
            close = true,
        }
    },

    -- ["pinkskirt"] = {
    --     label = "Pink Skirt",
    --     category = ECategoryInventoryPets.CLOTHES,
    --     
    --     stack = false,
    --     description = "A nice skirt for your pet.",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 3,
    --             drawable = 4,
    --             texture = 0,
    --         },
    --         close = true,
    --     }
    -- },
    ["greenskirt"] = {
        label = "Green Skirt",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice skirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 4,
                texture = 1,
            },
            close = true,
        }
    },
    ["redskirt"] = {
        label = "Red Skirt",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice skirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 4,
                texture = 2,
            },
            close = true,
        }
    },
    ["blueskirt"] = {
        label = "Blue Skirt",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice skirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 4,
                texture = 3,
            },
            close = true,
        }
    },
    ["rainbowskirt"] = {
        label = "Rainbow Skirt",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice skirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 4,
                texture = 4,
            },
            close = true,
        }
    },

    -- ["suit"] = {
    --     label = "Suit",
    --     category = ECategoryInventoryPets.CLOTHES,
    --     
    --     stack = false,
    --     description = "A nice suit for your pet.",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 3,
    --             drawable = 5,
    --             texture = 0,
    --         },
    --         close = true,
    --     }
    -- },
    ["pinksuit"] = {
        label = "Pink Suit",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 1,
            },
            close = true,
        }
    },
    ["greensuit"] = {
        label = "Green Suit",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 2,
            },
            close = true,
        }
    },
    ["bluesuit"] = {
        label = "Blue Suit",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 3,
            },
            close = true,
        }
    },
    ["whitesuit"] = {
        label = "White Suit",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 4,
            },
            close = true,
        }
    },
    ["tealsuit"] = {
        label = "Teal Suit",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 5,
            },
            close = true,
        }
    },

    -- ["pajama"] = {
    --     label = "Pajama",
    --     category = ECategoryInventoryPets.CLOTHES,
    --     
    --     stack = false,
    --     description = "A nice pajama for your pet.",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 3,
    --             drawable = 6,
    --             texture = 0,
    --         },
    --         close = true,
    --     }
    -- },
    ["pajama01"] = {
        label = "Pajama 01",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 1,
            },
            close = true,
        }
    },
    ["pajama02"] = {
        label = "Pajama 02",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 2,
            },
            close = true,
        }
    },
    ["pajama03"] = {
        label = "Pajama 03",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 3,
            },
            close = true,
        }
    },
    ["pajama04"] = {
        label = "Pajama 04",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 4,
            },
            close = true,
        }
    },
    ["pajama05"] = {
        label = "Pajama 05",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 5,
            },
            close = true,
        }
    },
    ["pajama06"] = {
        label = "Pajama 06",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 6,
            },
            close = true,
        }
    },
    ["pajama07"] = {
        label = "Pajama 07",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 7,
            },
            close = true,
        }
    },
    ["pajama08"] = {
        label = "Pajama 08",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A nice pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 8,
            },
            close = true,
        }
    },

    -- ["trouble"] = {
    --     label = "Trouble",
    --     category = ECategoryInventoryPets.CLOTHES,
    --     
    --     stack = false,
    --     description = "A trouble shirt for a trouble pet.",
    --     canbeRemoved = true,
        usable = true,
    --     onUse = {
    --         event = "cdev_pets:useClothing",
    --         data = {
    --             component = 3,
    --             drawable = 8,
    --             texture = 0,
    --         },
    --         close = true,
    --     }
    -- },
    ["troublered"] = {
        label = "Trouble Red",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A trouble shirt for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 1,
            },
            close = true,
        }
    },
    ["troublepurple"] = {
        label = "Trouble Purple",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A trouble shirt for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 2,
            },
            close = true,
        }
    },
    ["troublegreen"] = {
        label = "Trouble Green",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A trouble shirt for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 3,
            },
            close = true,
        }
    },
    ["troubleyellow"] = {
        label = "Trouble Yellow",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A trouble shirt for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 4,
            },
            close = true,
        }
    },
    ["troubleorange"] = {
        label = "Trouble Orange",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A trouble shirt for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 5,
            },
            close = true,
        }
    },
    ["troublepink"] = {
        label = "Trouble Pink",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A trouble shirt for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 6,
            },
            close = true,
        }
    },
    ["troubleblue"] = {
        label = "Trouble Blue",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A trouble shirt for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 7,
            },
            close = true,
        }
    },
    ["chestcollar"] = {
        label = "Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 0,
            },
            close = true,
        }
    },
    ["blackchestcollar"] = {
        label = "Black Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A black chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 1,
            },
            close = true,
        }
    },
    ["bluechestcollar"] = {
        label = "Blue Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A blue chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 2,
            },
            close = true,
        }
    },
    ["pinkchestcollar"] = {
        label = "Pink Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A pink chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 3,
            },
            close = true,
        }
    },
    ["lightbluechestcollar"] = {
        label = "Light Blue Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A light blue chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 4,
            },
            close = true,
        }
    },
    ["redchestcollar"] = {
        label = "Red Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A red chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 5,
            },
            close = true,
        }
    },
    ["greenchestcollar"] = {
        label = "Green Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A green chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 6,
            },
            close = true,
        }
    },
    ["purplechestcollar"] = {
        label = "Purple Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A purple chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 7,
            },
            close = true,
        }
    },
    ["lightpinkchestcollar"] = {
        label = "Light Pink Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A light pink chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 8,
            },
            close = true,
        }
    },
    ["chaincollarwhite"] = {
        label = "Chain Collar White",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A very strong collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 9,
                texture = 0,
            },
            close = true,
        }
    },
    ["chaincollarblack"] = {
        label = "Chain Collar Black",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A very strong collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 9,
                texture = 1,
            },
            close = true,
        }
    },
    ["chaincollargray"] = {
        label = "Chain Collar Gray",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A very strong collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 9,
                texture = 2,
            },
            close = true,
        }
    },
    ["chaincollargold"] = {
        label = "Chain Collar Gold",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A very strong collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 9,
                texture = 3,
            },
            close = true,
        }
    },
    ["metalcollarblack"] = {
        label = "Metal Collar Black",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A very strong collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 10,
                texture = 0,
            },
            close = true,
        }
    },
    ["metalcollargray"] = {
        label = "Metal Collar Gray",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A very strong collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 10,
                texture = 1,
            },
            close = true,
        }
    },
    ["metalcollarwhite"] = {
        label = "Metal Collar White",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A very strong collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 10,
                texture = 2,
            },
            close = true,
        }
    },
    ["silvermetalcollar"] = {
        label = "Silver Metal Collar",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A very strong collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 10,
                texture = 3,
            },
            close = true,
        }
    },
    ["blacktie"] = {
        label = "Black Tie",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A nice black tie for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 3,
                texture = 0,
            },
            close = true,
        }
    },
    ["greentie"] = {
        label = "Green Tie",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A nice green tie for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 3,
                texture = 1,
            },
            close = true,
        }
    },
    ["pinktie"] = {
        label = "Green Tie",
        category = ECategoryInventoryPets.COLLAR,
        
        stack = false,
        description = "A nice green tie for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 3,
                texture = 4,
            },
            close = true,
        }
    },
    ["brownboots"] = {
        label = "Brown Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fancy brown boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 0,
            },
            close = true,
        }
    },
    ["purpleboots"] = {
        label = "Purple Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fancy purple boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 1,
            },
            close = true,
        }
    },
    ["redbooots"] = {
        label = "Red Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fancy red boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 2,
            },
            close = true,
        }
    },
    ["blackboots"] = {
        label = "Black Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fancy black boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 3,
            },
            close = true,
        }
    },
    ["greenbooots"] = {
        label = "Green Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fancy green boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 4,
            },
            close = true,
        }
    },
    ["darkgreenboots"] = {
        label = "Dark Green Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fancy dark green boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 5,
            },
            close = true,
        }
    },
    ["beigebooots"] = {
        label = "Beige Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fancy beige boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 6,
            },
            close = true,
        }
    },
    ["darkergreenboots"] = {
        label = "Darker Green Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fancy Darker Green boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 7,
            },
            close = true,
        }
    },
    ["blackandwhiteboots"] = {
        label = "Black And White Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fancy Black And White boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 8,
            },
            close = true,
        }
    },
    ["purpleandwhiteboots"] = {
        label = "Purple And White Boots",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "Fancy Purple And White boots for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 9,
            },
            close = true,
        }
    },
    ["whitehat"] = {
        label = "White Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute white hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 0,
            },
            close = true,
        }
    },
    ["yellowhat"] = {
        label = "Yellow Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute yellow hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 1,
            },
            close = true,
        }
    },
    ["bluehat"] = {
        label = "Blue Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Blue hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 2,
            },
            close = true,
        }
    },
    ["pinkhat"] = {
        label = "Pink Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Pink hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 3,
            },
            close = true,
        }
    },
    ["fullwhitecap"] = {
        label = "Full White Cap",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute full white cap over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 12,
                texture = 0,
            },
            close = true,
        }
    },
    ["whiteandpinkcap"] = {
        label = "White And Pink Cap",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute white and pink cap over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 12,
                texture = 1,
            },
            close = true,
        }
    },
    ["blackandbrownhat"] = {
        label = "Black And Brown hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Black And Brown Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 13,
                texture = 0,
            },
            close = true,
        }
    },
    ["deerantlerbrown"] = {
        label = "Deer Antler Brown",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Deer Antler Brown over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 14,
                texture = 0,
            },
            close = true,
        }
    },
    ["deerantlerwhite"] = {
        label = "Deer Antler White",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Deer Antler White over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 14,
                texture = 1,
            },
            close = true,
        }
    },
    ["deerantlerred"] = {
        label = "Deer Antler Red",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Deer Antler Red over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 14,
                texture = 2,
            },
            close = true,
        }
    },
    ["deerantlerlightbrown"] = {
        label = "Deer Antler Light Brown",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Deer Antler Light Brown over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 14,
                texture = 3,
            },
            close = true,
        }
    },
    ["deerantlerblack"] = {
        label = "Deer Antler Black",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Deer Antler Black over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 14,
                texture = 4,
            },
            close = true,
        }
    },
    ["blackandgreenhearttiara"] = {
        label = "Black Heart Tiara",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Black Heart Tiara over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 15,
                texture = 0,
            },
            close = true,
        }
    },
    ["redhearttiara"] = {
        label = "Red Heart Tiara",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Red Heart Tiara over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 15,
                texture = 1,
            },
            close = true,
        }
    },
    ["bluehearttiara"] = {
        label = "Blue Heart Tiara",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Blue Heart Tiara over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 15,
                texture = 2,
            },
            close = true,
        }
    },
    ["purplehearttiara"] = {
        label = "Blue Heart Tiara",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Blue Heart Tiara over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 15,
                texture = 2,
            },
            close = true,
        }
    },
    ["greennoelhat"] = {
        label = "Green Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Green Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 0,
            },
            close = true,
        }
    },
    ["noelhat"] = {
        label = "Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 1,
            },
            close = true,
        }
    },
    ["yellownoelhat"] = {
        label = "Yellow Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Yellow Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 2,
            },
            close = true,
        }
    },
    ["orangenoelhat"] = {
        label = "Orange Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Orange Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinknoelhat"] = {
        label = "Pink Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Pink Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 4,
            },
            close = true,
        }
    },
    ["bluenoelhat"] = {
        label = "Blue Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Blue Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 5,
            },
            close = true,
        }
    },
    ["hotdog"] = {
        label = "Hot Dog",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Hot Dog Clothes",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 13,
                texture = 0,
            },
            close = true,
        }
    },
    ["mechanicuniform"] = {
        label = "Mechanic Uniform",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Mechanic Uniform",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 14,
                texture = 0,
            },
            close = true,
        }
    },
    ["beigescarf"] = {
        label = "Beige Flower Scarf",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Beige Flower Scarf",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 15,
                texture = 0,
            },
            close = true,
        }
    },
    ["grayscarf"] = {
        label = "Gray Flower Scarf",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Gray Flower Scarf",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 15,
                texture = 1,
            },
            close = true,
        }
    },
    ["bluescarf"] = {
        label = "Blue Flower Scarf",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Blue Flower Scarf",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 15,
                texture = 2,
            },
            close = true,
        }
    },
    ["lightpinkscarf"] = {
        label = "Light Pink Flower Scarf",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Light Pink Flower Scarf",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 15,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinkscarf"] = {
        label = "Pink Flower Scarf",
        category = ECategoryInventoryPets.CLOTHES,
        
        stack = false,
        description = "A cute Pink Flower Scarf",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 15,
                texture = 4,
            },
            close = true,
        }
    },
    ["bedbath2"] = {
        label = "Bed Bath 2",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedbath2",
                petOffset = vector3(-0.05, -0.10, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedbath3"] = {
        label = "Bed Bath 3",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedbath3",
                petOffset = vector3(-0.05, -0.10, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedflower2"] = {
        label = "Bed Flower 2",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedflower2",
                petOffset = vector3(-0.06, -0.15, 0.30),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedflower3"] = {
        label = "Bed Flower 3",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedflower3",
                petOffset = vector3(-0.06, -0.15, 0.30),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedhouse2"] = {
        label = "Bed House 2",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedhouse2",
                petOffset = vector3(0.15, -0.05, 0.40),
                petHeadingOffset = 150.0,
            },
            close = true,
        }
    },
    ["bedhouse3"] = {
        label = "Bed House 3",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedhouse3",
                petOffset = vector3(0.15, -0.05, 0.40),
                petHeadingOffset = 150.0,
            },
            close = true,
        }
    },
    ["bedprincess2"] = {
        label = "Bed Princess 2",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedprincess2",
                petOffset = vector3(-0.03, -0.15, 0.10),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedprincess3"] = {
        label = "Bed Princess 3",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedprincess3",
                petOffset = vector3(-0.03, -0.15, 0.10),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedprincess4"] = {
        label = "Bed Princess 4",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedprincess4",
                petOffset = vector3(-0.03, -0.15, 0.10),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkin2"] = {
        label = "Bed Pumpkin 2",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin2",
                petOffset = vector3(-0.02, -0.20, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkin3"] = {
        label = "Bed Pumpkin 3",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin3",
                petOffset = vector3(-0.02, -0.20, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkin4"] = {
        label = "Bed Pumpkin 4",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin4",
                petOffset = vector3(-0.02, -0.20, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkin5"] = {
        label = "Bed Pumpkin 5",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin5",
                petOffset = vector3(-0.02, -0.20, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkin6"] = {
        label = "Bed Pumpkin 6",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin6",
                petOffset = vector3(-0.02, -0.20, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkinhollow2"] = {
        label = "Bed Hollow 2",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkinhollow2",
                petOffset = vector3(-0.02, -0.15, -0.15),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkinhollow3"] = {
        label = "Bed Hollow 3",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkinhollow3",
                petOffset = vector3(-0.02, -0.15, -0.15),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkinhollow4"] = {
        label = "Bed Hollow 4",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkinhollow4",
                petOffset = vector3(-0.02, -0.15, -0.15),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedsmall2"] = {
        label = "Bed Small 2",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedsmall2",
                petOffset = vector3(-0.05, -0.20, 0.10),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedsmall3"] = {
        label = "Bed Small 3",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedsmall3",
                petOffset = vector3(-0.05, -0.20, 0.10),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedcomf"] = {
        label = "Bed Comf",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf2"] = {
        label = "Bed Comf 2",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf2",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf3"] = {
        label = "Bed Comf 3",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf3",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf4"] = {
        label = "Bed Comf 4",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf4",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf5"] = {
        label = "Bed Comf 5",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf5",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf6"] = {
        label = "Bed Comf 6",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf6",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf7"] = {
        label = "Bed Comf 7",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf7",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf8"] = {
        label = "Bed Comf 8",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf8",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf9"] = {
        label = "Bed Comf 9",
        
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf9",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedbasketa"] = {
        label = "Medium Brown Basket Bed",
        stack = false,
        limited = { "pet_amer", "pet_turk" },
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed1_a",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 320.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedbasketb"] = {
        label = "Brown Basket Bed",
        stack = false,
        
        limited = { "pet_amer", "pet_turk" },
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed1_b",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 320.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedbasketc"] = {
        label = "Light Brown Basket Bed",
        stack = false,
        
        limited = { "pet_amer", "pet_turk" },
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed1_c",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 320.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedbasketd"] = {
        label = "White Basket Bed",
        stack = false,
        
        limited = { "pet_amer", "pet_turk" },
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed1_d",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 320.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedsubmarinea"] = {
        label = "Brown Submarine Bed",
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed2_a",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 300.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedsubmarineb"] = {
        label = "Green Submarine Bed",
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed2_b",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 300.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedsubmarinec"] = {
        label = "Yellow Submarine Bed",
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed2_c",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 300.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree1_a"] = {
        label = "Tree House Bed A",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree1_a",
                petOffset = vector3(0.35, 0.10, 1.02),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree1_b"] = {
        label = "Tree House Bed B",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree1_b",
                petOffset = vector3(0.35, 0.10, 1.02),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree1_c"] = {
        label = "Tree House Bed C",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree1_c",
                petOffset = vector3(0.35, 0.10, 1.02),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree1_d"] = {
        label = "Tree House Bed D",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree1_d",
                petOffset = vector3(0.35, 0.10, 1.02),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree2_a"] = {
        label = "Master Tree House Bed A",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree2_a",
                petOffset = vector3(0.40, 0.30, 0.70),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree2_b"] = {
        label = "Master Tree House Bed B",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree2_b",
                petOffset = vector3(0.40, 0.30, 0.70),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_plataform1"] = {
        label = "Plataform",
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseShowcaseProp",
            data = {
                prop = "cdev_pets_plataform1",
                offset = vector3(0.0, 0.0, 0.5),
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_sandbox1_a"] = {
        label = "Brown Sandbox",
        stack = false,
        canbeRemoved = true,
        usable = true,
        description = "",
        
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseShowcaseProp",
            data = {
                prop = "cdev_pets_sandbox1_d",
                offset = vector3(0.0, 0.0, 0.10),
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_sandbox1_b"] = {
        label = "Medium Brown Sandbox",
        stack = false,
        canbeRemoved = true,
        usable = true,
        description = "",
        
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseShowcaseProp",
            data = {
                prop = "cdev_pets_sandbox1_b",
                offset = vector3(0.0, 0.0, 0.10),
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_sandbox1_c"] = {
        label = "Light Brown Sandbox",
        stack = false,
        canbeRemoved = true,
        usable = true,
        description = "",
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseShowcaseProp",
            data = {
                prop = "cdev_pets_sandbox1_c",
                offset = vector3(0.0, 0.0, 0.10),
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_sandbox1_d"] = {
        label = "Brown Sandbox",
        stack = false,
        canbeRemoved = true,
        usable = true,
        description = "",
        
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseShowcaseProp",
            data = {
                prop = "cdev_pets_sandbox1_d",
                offset = vector3(0.0, 0.0, 0.10),
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_bowl1_a"] = {
        label = "Blue round Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_a",
            },
        },
    },
    ["cdev_pets_bowl1_b"] = {
        label = "Black round Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_b",
            },
        },
    },

    ["cdev_pets_bowl1_c"] = {
        label = "Light Green round Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_c",
            },
        },
    },

    ["cdev_pets_bowl1_d"] = {
        label = "White/Blue round Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_d",
            },
        },
    },

    ["cdev_pets_bowl1_e"] = {
        label = "Brown/White round Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_e",
            },
        },
    },

    ["cdev_pets_bowl1_f"] = {
        label = "Light Pink round Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_f",
            },
        },
    },


    ["cdev_pets_bowl2_a"] = {
        label = "White Wood Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_a",
            },
        },
    },

    ["cdev_pets_bowl2_b"] = {
        label = "Blue Wood Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_b",
            },
        },
    },

    ["cdev_pets_bowl2_c"] = {
        label = "Red Wood Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_c",
            },
        },
    },

    ["cdev_pets_bowl2_d"] = {
        label = "White/White Wood Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_d",
            },
        },
    },

    ["cdev_pets_bowl2_e"] = {
        label = "Green2 Wood Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_e",
            },
        },
    },

    ["cdev_pets_bowl2_f"] = {
        label = "Beige Wood Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_f",
            },
        },
    },

    ["cdev_pets_bowl3_a"] = {
        label = "Cat White Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_a",
            },
        },
    },

    ["cdev_pets_bowl3_b"] = {
        label = "Cat Green Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_b",
            },
        },
    },

    ["cdev_pets_bowl3_c"] = {
        label = "Cat Silver Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_c",
            },
        },
    },

    ["cdev_pets_bowl3_d"] = {
        label = "Cat Pink Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_d",
            },
        },
    },

    ["cdev_pets_bowl3_e"] = {
        label = "Cat Red Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_e",
            },
        },
    },

    ["cdev_pets_bowl3_f"] = {
        label = "Cat Black Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_f",
            },
        },
    },

    ["cdev_pets_bowl3_g"] = {
        label = "Cat Blue Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_g",
            },
        },
    },

    ["cdev_pets_bowl3_h"] = {
        label = "Cat Yellow Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_h",
            },
        },
    },

    ["cdev_pets_bowl3_i"] = {
        label = "Cat Brown Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_i",
            },
        },
    },

    ["cdev_pets_bowl3_j"] = {
        label = "Cat Light Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_j",
            },
        },
    },

    ["cdev_pets_bowl4_a"] = {
        label = "Cat Wood Brown Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_a",
            },
        },
    },

    ["cdev_pets_bowl4_b"] = {
        label = "Cat Wood Red Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_b",
            },
        },
    },

    ["cdev_pets_bowl4_c"] = {
        label = "Cat Wood Blue Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_c",
            },
        },
    },

    ["cdev_pets_bowl4_d"] = {
        label = "Cat Wood White Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_d",
            },
        },
    },

    ["cdev_pets_bowl4_e"] = {
        label = "Cat Wood Green Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_e",
            },
        },
    },

    ["cdev_pets_bowl4_f"] = {
        label = "Cat Wood Baby Bowl",
        category = ECategoryInventoryPets.BOWL,
        
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_f",
            },
        },
    },

    ["cdev_pets_ball1_a"] = {
        label = "Black Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_a",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_b"] = {
        label = "White Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_b",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_c"] = {
        label = "Green Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_c",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_d"] = {
        label = "Blue Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_d",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_e"] = {
        label = "Yellow Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_e",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_f"] = {
        label = "Red Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_f",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_g"] = {
        label = "Purple Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_g",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_h"] = {
        label = "Pink Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_h",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_i"] = {
        label = "Light Blue Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_i",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_j"] = {
        label = "Brown Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_j",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbaga"] = {
        label = "Blue Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_a",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    
    ["catbagb"] = {
        label = "Pink Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_b",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagc"] = {
        label = "Brown Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_c",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagd"] = {
        label = "Red Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_d",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbage"] = {
        label = "Light Purple Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_e",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagf"] = {
        label = "White Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_f",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagg"] = {
        label = "Purple Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_g",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagh"] = {
        label = "Green Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_h",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagi"] = {
        label = "Red Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_i",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbaga"] = {
        label = "Blue Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = {"pet_chop", "pet_dobermann", "pet_golden", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_a",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagb"] = {
        label = "Pink Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        
        limited = {"pet_chop", "pet_dobermann", "pet_golden", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_b",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagc"] = {
        label = "Yellow Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        
        limited = {"pet_chop", "pet_dobermann", "pet_golden", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_c",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagd"] = {
        label = "Red Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        
        limited = {"pet_chop", "pet_dobermann", "pet_golden", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_d",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbage"] = {
        label = "Purple Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        
        limited = {"pet_chop", "pet_dobermann", "pet_golden", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_e",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagf"] = {
        label = "White Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        
        limited = {"pet_chop", "pet_dobermann", "pet_golden", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_f",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagg"] = {
        label = "Purple Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        
        limited = {"pet_chop", "pet_dobermann", "pet_golden", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_g",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagh"] = {
        label = "Green Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        
        limited = {"pet_chop", "pet_dobermann", "pet_golden", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_h",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
        ["bigdogbagi"] = {
        label = "Red Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        
        limited = {"pet_chop", "pet_dobermann", "pet_golden", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_i",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbaga"] = {
        label = "Blue Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_frbul", "pet_minpit" },
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_a",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagb"] = {
        label = "Pink Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        
        limited = { "pet_frbul", "pet_minpit" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_b",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagc"] = {
        label = "Yellow Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        
        limited = { "pet_frbul", "pet_minpit" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_c",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagd"] = {
        label = "Red Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        
        limited = { "pet_frbul", "pet_minpit" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_d",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbage"] = {
        label = "Purple Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        
        limited = { "pet_frbul", "pet_minpit" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_e",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagf"] = {
        label = "White Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        
        limited = { "pet_frbul", "pet_minpit" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_f",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagg"] = {
        label = "Purple Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        
        limited = { "pet_frbul", "pet_minpit" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_g",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagh"] = {
        label = "Green Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        
        limited = { "pet_frbul", "pet_minpit" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_h",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagi"] = {
        label = "Hot Red Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        limited = { "pet_frbul", "pet_minpit" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_i",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["scratch1a"] = {
        label = "Yellow Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_a",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch1b"] = {
        label = "Light Green Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_b",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch1c"] = {
        label = "White Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_c",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch1d"] = {
        label = "Vanilla Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_d",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch1e"] = {
        label = "Black Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_e",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch1f"] = {
        label = "Green Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_f",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch2a"] = {
        label = "Yellow Chicken Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch2_a",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 180.0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch2b"] = {
        label = "Candy Cane Chicken Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch2_b",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 180.0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch2c"] = {
        label = "Yellow Chicken Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch2_c",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 180.0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch2d"] = {
        label = "Green Chicken Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch2_d",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 180.0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
}
