PetResourceAPI = {}

PetResourceAPI.Shop = {
    ---@param source number
    ---@param item PetShopItem
    ---@param quantity number
    CanPurchaseItem = function(source, item, quantity)
        local hasMoney = clib.api.Character.GetCharacterCashFromSource(source) >= item.price * quantity

        if not hasMoney then
            return false, loc("not_enough_money")
        end

        return true
    end,
    ---@param source number
    ---@param item PetShopItem
    ---@param quantity number
    ChargeItem = function(source, item, quantity)
        clib.api.Character.RemoveCharacterCashFromSource(source, item.price * quantity)
    end,
}

PetResourceAPI.GetPetOwnerIdFromSource = function(source)
    return clib.api.Character.GetCharacterIdentifierFromSource(source)
end

PetResourceAPI.GetCharacterNameFromIdentifier = function (citizenid)
    return clib.api.Character.GetCharacterNameFromIdentifier(citizenid)
end


PetResourceAPI.IsPlayerAllowedToBuyK9 = function(source)
    local jobName, grade = clib.api.Character.GetCharacterJobFromSource(source)

    if jobName ~= "police" then
        return false
    end

    return true
end

PetResourceAPI.HasMoney = function(source, amount)
    return clib.api.Character.GetCharacterCashFromSource(source) >= amount
end

PetResourceAPI.Charge = function(source, amount)
    clib.api.Character.RemoveCharacterCashFromSource(source, amount)
end

PetResourceAPI.CheckHasMoneyToDepositToVault = function(source, amount)
    if PublicSharedPetsConfig.UseBankInsteadOfCash then
        return clib.api.Character.GetCharacterBankFromSource(source) >= amount
    else
        return clib.api.Character.GetCharacterCashFromSource(source) >= amount
    end
end

PetResourceAPI.ChargePlayerForDepositToVault = function(source, amount)
    if PublicSharedPetsConfig.UseBankInsteadOfCash then
        clib.api.Character.RemoveCharacterBankFromSource(source, amount)
    else
        clib.api.Character.RemoveCharacterCashFromSource(source, amount)
    end
end

PetResourceAPI.GiveMoneyToPlayerFromVault = function(source, amount)
    if PublicSharedPetsConfig.UseBankInsteadOfCash then
        clib.api.Character.AddCharacterBankForSource(source, amount)
    else
        clib.api.Character.AddCharacterCashForSource(source, amount)
    end
end


-- 📦 Database queries
PetResourceAPI.Queries = {

    CreatePetsTable = function()
        clib.db.Insert([[
            CREATE TABLE IF NOT EXISTS `cdev_pets` (
                `id` bigint(20) NOT NULL AUTO_INCREMENT,
                `key` varchar(50) NOT NULL,
                `owner` varchar(255) NOT NULL,
                `name` text NOT NULL,
                `stamina` int(11) NOT NULL DEFAULT 100,
                `loyalty` int(11) NOT NULL DEFAULT 100,
                `happiness` int(11) NOT NULL DEFAULT 100,
                `hunger` int(11) NOT NULL DEFAULT 100,
                `health` int(11) NOT NULL DEFAULT 100,
                `thirst` int(11) NOT NULL DEFAULT 100,
                `sniff` int(11) NOT NULL DEFAULT 0,
                `resistance` int(11) NOT NULL DEFAULT 0,
                `agility` int(11) NOT NULL DEFAULT 0,
                `attack` int(11) NOT NULL DEFAULT 0,
                `customization` longtext DEFAULT '{}',
                `props` longtext DEFAULT '{}',
                `escaped` tinyint(4) DEFAULT 0,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
        ]])
    end,
    CreatePetInventoryTable = function()
        clib.db.Insert([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_inventory` (
              `id` bigint(20) NOT NULL AUTO_INCREMENT,
              `inventory` bigint(20) NOT NULL,
              `item` varchar(100) NOT NULL,
              `slot` int(11) NOT NULL,
              `quantity` int(11) NOT NULL,
              `metadata` longtext DEFAULT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
        ]])
    end,
    ---@param petId number
    ---@return InventoryItemRow[]
    FetchInventoryItems = function(petId)
        return clib.db.Query("SELECT * FROM cdev_pets_inventory WHERE inventory = ?", { petId })
    end,
    ---@param item InventoryItemRow
    UpdateInventoryItem = function(item)
        clib.db.Insert([[
            UPDATE cdev_pets_inventory SET
                inventory = ?,
                item = ?,
                slot = ?,
                quantity = ?,
                metadata = ?
            WHERE
                id = ?
        ]], {
            item.inventory,
            item.item,
            item.slot,
            item.quantity,
            item.metadata,
            item.id,
        })
    end,
    ---@param item InventoryItemRow
    DeleteInventoryItem = function(item)
        clib.db.Insert("DELETE FROM cdev_pets_inventory WHERE id = ?", {
            item.id,
        })
    end,
    ---@param item InventoryItemRow
    ---@return number
    InsertInventoryItem = function(item)
        return clib.db.Insert(
        "INSERT INTO cdev_pets_inventory(inventory, item, slot, quantity, metadata) values(?, ?, ?, ?, ?)", {
            item.inventory,
            item.item,
            item.slot,
            item.quantity,
            item.metadata
        })
    end,
    ---@return PetDBRow[]
    FetchPet = function(petId)
        return clib.db.Query("SELECT * FROM cdev_pets WHERE id = ?", { petId })
    end,
    ---@param petId number
    ---@param name PetStat
    ---@param value number
    UpdateStat = function(petId, name, value)
        clib.db.Update("UPDATE cdev_pets SET " .. name .. " = ? WHERE id = ?", { value, petId })
    end,

    ---@param petId number
    DeletPet = function(petId)
        clib.db.Insert("DELETE FROM cdev_pets WHERE id = ?", {
            petId
        })
    end,
    ---@param ownerId string
    ---@param name string
    ---@param key string
    InsertPet = function(ownerId, name, key, customization, skills)
        return clib.db.Insert("INSERT INTO cdev_pets(owner, `key`, `name`, customization, sniff, resistance, agility, attack) VALUES(?, ?, ?, ?, ?, ?, ?, ?)",
            { ownerId, key, name, json.encode(customization), skills.sniff, skills.resistance, skills.agility, skills.attack })
    end,
    ---@param ownerId string
    ---@return PetBagEntry[]
    FetchBag = function(ownerId)
        return clib.db.Query("SELECT id, name, stamina, `escaped` FROM cdev_pets WHERE owner = ?", { ownerId })
    end,
    ---@param petId number
    UpdateCustomization = function(petId, customization)
        clib.db.Update("UPDATE cdev_pets SET customization = ? WHERE id = ?", { json.encode(customization), petId })
    end,
    ---@param petId number
    UpdateProps = function(petId, props)
        clib.db.Update("UPDATE cdev_pets SET props = ? WHERE id = ?", { json.encode(props), petId })
    end,
    ---@param petId number
    ---@param escaped boolean
    SetEscaped = function(petId, escaped)
        clib.db.Update("UPDATE cdev_pets SET `escaped` = ? WHERE id = ?", { escaped and 1 or 0, petId })
    end,
    -- PetShop
    CreatePetShopsTable = function()
        clib.db.Insert([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_petshops` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `name` varchar(255) NOT NULL DEFAULT '',
              `blip` int(11) NOT NULL DEFAULT 0,
              `blipSize` float DEFAULT NULL,
              `blipColor` int(11) NOT NULL DEFAULT 0,
              `blipLocation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
              `petsellersLocation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
              `sellersLocation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
              `management` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
              `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
              `logo` varchar(255) NOT NULL DEFAULT '',
              `vault` int(11) NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
        ]])
    end,
    CreatePetShopStockTable = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_stock` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `shop_id` int(11) NOT NULL,
              `item_id` varchar(255) NOT NULL,
              `amount` int(11) NOT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
        ]])
    end,
    CreatePetShopEmployees = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_employees` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `shop_id` int(11) NOT NULL,
              `identifier` varchar(255) NOT NULL,
              `role` int(11) NOT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
        ]])
    end,
    CreatePetShopSellPrices = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_sell_prices` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `shop_id` int(11) NOT NULL,
              `item_id` varchar(255) NOT NULL,
              `price` int(11) NOT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
        ]])
    end,
    CreatePetShopSales = function ()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_sales` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `shop_id` int(11) NOT NULL,
              `identifier` varchar(255) NOT NULL,
              `price` int(11) NOT NULL,
              `items` longtext DEFAULT '{}',
              `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
        ]])
    end,
    InsertShop = function(name, logo, blip, blipSize, blipColor, blipLocation, petsellersLocation, sellersLocation, management, settings, vaultMoney)
        clib.db.Insert([[
            INSERT INTO cdev_pets_petshops(id, name, logo, blip, blipSize, blipColor, blipLocation, petsellersLocation, sellersLocation, management, settings, vault)
            VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ]], {
            name,
            logo,
            blip,
            blipSize,
            blipColor,
            blipLocation,
            petsellersLocation,
            sellersLocation,
            management,
            settings,
            vaultMoney,
        })
    end,
    UpdateShop = function(name, logo, blip, blipSize, blipColor, blipLocation, petsellersLocation, sellersLocation, management, settings, vaultMoney, id)
        clib.db.Update([[
            UPDATE cdev_pets_petshops
            SET name = ?, logo = ?, blip = ?, blipSize = ?, blipColor = ?, blipLocation = ?, petsellersLocation = ?, sellersLocation = ?, management = ?, vault = ?, settings = ?
            WHERE id = ?
            ]], {
            name,
            logo,
            blip,
            blipSize,
            blipColor,
            blipLocation,
            petsellersLocation,
            sellersLocation,
            management,
            settings,
            vaultMoney,
            id
        })
    end,
    DeleteShop = function(id)
        clib.db.Update("DELETE FROM cdev_pets_petshops WHERE id = ?", { id })
        clib.db.Update("DELETE FROM cdev_pets_petshops_stock WHERE shop_id = ?", { id })
        clib.db.Update("DELETE FROM cdev_pets_petshops_employees WHERE shop_id = ?", { id })
        clib.db.Update("DELETE FROM cdev_pets_petshops_sell_prices WHERE shop_id = ?", { id })
        clib.db.Update("DELETE FROM cdev_pets_petshops_sales WHERE shop_id = ?", { id })
    end,
    UpdatepetsellersLocation = function (petsellersLocation, id)
        clib.db.Update([[
            UPDATE cdev_pets_petshops
            SET petsellersLocation = ?
            WHERE id = ?
        ]], {
            petsellersLocation,
            id
        })
    end,
    UpdateSellersLocation = function (sellersLocation, id)
        clib.db.Update([[
            UPDATE cdev_pets_petshops
            SET sellersLocation = ?
            WHERE id = ?
        ]], {
            sellersLocation,
            id
        })
    end,
    fetchSellersLocation = function (id)
        return clib.db.Query("SELECT sellersLocation FROM cdev_pets_petshops WHERE id = ?", { id })
    end,
    fetchPetSellersLocation = function (id)
        return clib.db.Query("SELECT petsellersLocation FROM cdev_pets_petshops WHERE id = ?", { id })
    end,
    FetchEmployeeMapFromShop = function(shop_id)
        local employees = clib.db.Query("SELECT * FROM cdev_pets_petshops_employees WHERE shop_id = ?", { shop_id })
        for _, employee in pairs(employees) do
            employee.name = PetResourceAPI.GetCharacterNameFromIdentifier(employee.identifier)
        end
        return employees
    end,
    FetchStockFromShop = function(shop_id)
        local stock = clib.db.Query("SELECT * FROM cdev_pets_petshops_stock WHERE shop_id = ?", { shop_id })
        local sellprices = clib.db.Query("SELECT * FROM cdev_pets_petshops_sell_prices WHERE shop_id = ?", { shop_id })

        for _, item in pairs(stock) do
            for _, price in pairs(sellprices) do
                if item.item_id == price.item_id then
                    item.price = price.price
                    break
                end
            end
        end

        return stock
    end,
    FetchSellPricesFromShop = function(shop_id)
        return clib.db.Query("SELECT * FROM cdev_pets_petshops_sell_prices WHERE shop_id = ?", { shop_id })
    end,
    FetchPetShops = function()
        return clib.db.Query("SELECT * FROM cdev_pets_petshops")
    end,
    UpdatePetShopEmployee = function(employeeRole, employeeIdentifier, shopId)
        clib.db.Update([[UPDATE cdev_pets_petshops_employees SET role = ? WHERE identifier = ? AND shop_id = ?]],
            { employeeRole, employeeIdentifier, shopId })
    end,
    InsertPetShopSale = function(shopId, identifier, price, items)
        clib.db.Insert([[INSERT INTO cdev_pets_petshops_sales(id, shop_id, identifier, price, items, date) VALUES(NULL, ?, ?, ?, ?, NULL)]],
            { shopId, identifier, price, items })
    end,
    FetchPetShopSales = function(shopId)
        local sales = clib.db.Query("SELECT * FROM cdev_pets_petshops_sales WHERE shop_id = ?", { shopId })
        for _, sale in pairs(sales) do
            sale.name = PetResourceAPI.GetCharacterNameFromIdentifier(sale.identifier)
            sale.items = json.decode(sale.items)
        end
        
        return sales
    end,
    InsertPetShopEmployee = function(employeeIdentifier, employeeRole, shopId)
        clib.db.Update([[
            INSERT INTO cdev_pets_petshops_employees(id, identifier, role, shop_id)
            VALUES(NULL, ?, ?, ?)]],
            { employeeIdentifier, employeeRole, shopId })
    end,
    DeletePetShopEmployee = function(employeeIdentifier, shopId)
        clib.db.Update([[
            DELETE FROM cdev_pets_petshops_employees
            WHERE identifier = ? AND shop_id = ?
        ]], {
            employeeIdentifier,
            shopId,
        }
        )
    end,
    UpdatePetShopStockEntry = function(amount, itemId, shopId)
        clib.db.Update([[
            UPDATE cdev_pets_petshops_stock
            SET amount = ?
            WHERE item_id = ? AND shop_id = ?
        ]], {
            amount,
            itemId,
            shopId,
        })
    end,
    UpdateShopVault = function(vault, shopId)
        clib.db.Update([[
            UPDATE cdev_pets_petshops
            SET vault = ?
            WHERE id = ?
        ]], {
            vault,
            shopId
        })
    end,
    InsertPetShopStockEntry = function(shopId, itemId, amount)
        clib.db.Insert([[
            INSERT INTO cdev_pets_petshops_stock(id, shop_id, item_id, amount)
            VALUES(NULL, ?, ?, ?)
        ]], {
            shopId,
            itemId,
            amount,
        })
    end,
    InsertPetShopShopPrice = function (shopId, itemId, price)
        clib.db.Insert([[
            INSERT INTO cdev_pets_petshops_sell_prices(id, shop_id, item_id, price)
            VALUES(NULL, ?, ?, ?)
        ]], {
            shopId,
            itemId,
            price,
        })
    end,
    UpdatePetShopShopPrice = function (shopId, itemId, price)
        clib.db.Update([[
            UPDATE cdev_pets_petshops_sell_prices
            SET price = ?
            WHERE item_id = ? AND shop_id = ?
        ]], {
            price,
            itemId,
            shopId,
        })
    end,
    DeletePetShopStockEntry = function(itemId, shopId)
        clib.db.Update([[
            DELETE FROM cdev_pets_petshops_stock
            WHERE item_id = ? AND shop_id = ?
        ]], {
            itemId,
            shopId,
        })
    end,
}
