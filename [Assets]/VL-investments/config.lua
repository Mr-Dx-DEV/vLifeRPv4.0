Config = {}

-- $$$$$$\   $$$$$$\  $$\   $$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\ $$$$$$$\   $$$$$$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\ 
--$$  __$$\ $$  __$$\ $$$\  $$ |$$  _____|\_$$  _|$$  __$$\ $$ |  $$ |$$  __$$\ $$  __$$\\__$$  __|\_$$  _|$$  __$$\ $$$\  $$ |
--$$ /  \__|$$ /  $$ |$$$$\ $$ |$$ |        $$ |  $$ /  \__|$$ |  $$ |$$ |  $$ |$$ /  $$ |  $$ |     $$ |  $$ /  $$ |$$$$\ $$ |
--$$ |      $$ |  $$ |$$ $$\$$ |$$$$$\      $$ |  $$ |$$$$\ $$ |  $$ |$$$$$$$  |$$$$$$$$ |  $$ |     $$ |  $$ |  $$ |$$ $$\$$ |
--$$ |      $$ |  $$ |$$ \$$$$ |$$  __|     $$ |  $$ |\_$$ |$$ |  $$ |$$  __$$< $$  __$$ |  $$ |     $$ |  $$ |  $$ |$$ \$$$$ |
--$$ |  $$\ $$ |  $$ |$$ |\$$$ |$$ |        $$ |  $$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |  $$ |     $$ |  $$ |  $$ |$$ |\$$$ |
--\$$$$$$  | $$$$$$  |$$ | \$$ |$$ |      $$$$$$\ \$$$$$$  |\$$$$$$  |$$ |  $$ |$$ |  $$ |  $$ |   $$$$$$\  $$$$$$  |$$ | \$$ |
 --\______/  \______/ \__|  \__|\__|      \______| \______/  \______/ \__|  \__|\__|  \__|  \__|   \______| \______/ \__|  \__|

--Use "esx" or "qb"
Config.Framework = "qb"
--If you are using one of the most recent versions of ESX, set the script name. Default = "es_extended"
Config.ESXExport = ""
--Default ESX: "esx:getSharedObject" | Default QB: "qb-core"
Config.Core = "qb-core"
-- Money delivered after 6 hours
Config.sixhours = 500000 
-- Money delivered after 5 hours
Config.fivehours = 300000 
-- Money delivered after 4 hours
Config.fourhours = 200000 
-- Money delivered after 3 hours
Config.threehours = 100000 
-- Money delivered after 2 hours
Config.twohours = 50000 
-- Money delivered after 1 hours
Config.onehour = 25000
-- Type of currency used 
Config.currency = "$" 
-- Command to open investments menu
Config.investmentsCommand = "invest" 
-- 1 for 1 hour, 2 for 2 hours, 3 for 3 hours,... Max. 6. For testing you can use 7, it is for 20 seconds
Config.defaultTime = 2 
-- url of the discord webhook where the logs will be received
Config.webhook = "https://discord.com/api/webhooks/1275199145904443548/Q098TCCfCHFBxysy4bRTJnr6xt8SdloUXQ0_oCHfhi6jqnq9-KXrZdlSutNsA0PdbOAo" 
