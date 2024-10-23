-- Webhook for instapic posts, recommended to be a public channel

INSTAPIC_WEBHOOK = "https://discordapp.com/api/webhooks/1196116836916408400/imjZ2wElWx0NYRflwVgSPTOJkwQZIj8YYjDOlbDHPi3N9fmWJ4M71Y7pHcirJejkVwAp"
-- Webhook for birdy posts, recommended to be a public channel
BIRDY_WEBHOOK = "https://discordapp.com/api/webhooks/1274387954214895637/A9_8O92HSM2yuTrZ2D37YbAxjkufFXACZb9EV-M1zc54GdJP5hNj9ksu4z02X0FUje55"

-- Discord webhook for server logs
LOGS = {
    Calls = "https://discordapp.com/api/webhooks/1293480607950835733/bqpWD-Cxg_5KHOuwaS34DnOuSjzOMvAkGAjFZ77lYlS7lK5b2Ilr0ILsYYSpCe6csFGf", -- set to false to disable
    Messages = "https://discordapp.com/api/webhooks/1293480607950835733/bqpWD-Cxg_5KHOuwaS34DnOuSjzOMvAkGAjFZ77lYlS7lK5b2Ilr0ILsYYSpCe6csFGf",
    InstaPic = "https://discordapp.com/api/webhooks/1293480607950835733/bqpWD-Cxg_5KHOuwaS34DnOuSjzOMvAkGAjFZ77lYlS7lK5b2Ilr0ILsYYSpCe6csFGf",
    Birdy = "https://discordapp.com/api/webhooks/1293480607950835733/bqpWD-Cxg_5KHOuwaS34DnOuSjzOMvAkGAjFZ77lYlS7lK5b2Ilr0ILsYYSpCe6csFGf",
    YellowPages = "https://discordapp.com/api/webhooks/1274388518180753501/4aZSeikczYLSiO6j3trSsgemYPI6g1OqMKRoC3fh3rcL5eeDwx2Q_4jp5W8q93uXKyQU",
    Marketplace = "https://discordapp.com/api/webhooks/1293480607950835733/bqpWD-Cxg_5KHOuwaS34DnOuSjzOMvAkGAjFZ77lYlS7lK5b2Ilr0ILsYYSpCe6csFGf",
    Mail = "https://discordapp.com/api/webhooks/1293480607950835733/bqpWD-Cxg_5KHOuwaS34DnOuSjzOMvAkGAjFZ77lYlS7lK5b2Ilr0ILsYYSpCe6csFGf",
    Wallet = "https://discordapp.com/api/webhooks/1293480607950835733/bqpWD-Cxg_5KHOuwaS34DnOuSjzOMvAkGAjFZ77lYlS7lK5b2Ilr0ILsYYSpCe6csFGf",
    DarkChat = "https://discordapp.com/api/webhooks/1275202511174897674/7ldY2Y8KxtiDybUj79CO4NrCtwTrRnafI-pbKnxFTamUBTZjqc5NsSWJhjqyZorPXpKU",
    Services = "https://discordapp.com/api/webhooks/1293480607950835733/bqpWD-Cxg_5KHOuwaS34DnOuSjzOMvAkGAjFZ77lYlS7lK5b2Ilr0ILsYYSpCe6csFGf",
    Crypto = "https://discordapp.com/api/webhooks/1293480607950835733/bqpWD-Cxg_5KHOuwaS34DnOuSjzOMvAkGAjFZ77lYlS7lK5b2Ilr0ILsYYSpCe6csFGf",
    Trendy = "https://discordapp.com/api/webhooks/1293480607950835733/bqpWD-Cxg_5KHOuwaS34DnOuSjzOMvAkGAjFZ77lYlS7lK5b2Ilr0ILsYYSpCe6csFGf",
    Uploads = "https://discordapp.com/api/webhooks/1293480607950835733/bqpWD-Cxg_5KHOuwaS34DnOuSjzOMvAkGAjFZ77lYlS7lK5b2Ilr0ILsYYSpCe6csFGf" -- all camera uploads will go here

}

-- Set your API keys for uploading media here.
-- Please note that the API key needs to match the correct upload method defined in Config.UploadMethod.
-- The default upload method is Fivemanage
-- We STRONGLY discourage using Discord as an upload method, as uploaded files may become inaccessible after a while.
-- You can get your API keys from https://fivemanage.com/
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
API_KEYS = {
    Video = "FXj7LTG0zbyvZBDOuZ84Tz4ufIMchB4b",
    Image = "FXj7LTG0zbyvZBDOuZ84Tz4ufIMchB4b",
    Audio = "FXj7LTG0zbyvZBDOuZ84Tz4ufIMchB4b",
}
