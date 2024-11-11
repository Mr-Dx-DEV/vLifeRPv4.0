Register = {}
Register.Enable = true

Register.Validation = {
    ["firstName"] = {
        minLength = 2,
        maxLength = 15,
        letters = true,
        numbers = false,
        specialCharacters = false,
    },
    ["lastName"] = {
        minLength = 2,
        maxLength = 15,
        letters = true,
        numbers = false,
        specialCharacters = false,
    },
    ["dateOfBirth"] = {
        minAge = 12,
        maxAge = 80,
    },
    ["height"] = {
        minValue = 100,
        maxValue = 220,
    },
}

Register.Countries = {
	"Bangladesh",
	"India",
	"Pakistan",
	"United Kingdom",
	"United States",
	
}