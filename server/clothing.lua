local QBCore = exports['qb-core']:GetCoreObject()

-- Save player outfit
RegisterNetEvent('ox_inventory:clothing:saveOutfit', function(outfit)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local citizenid = Player.PlayerData.citizenid
    local outfitData = json.encode(outfit)

    MySQL.Async.execute('INSERT INTO player_outfits (citizenid, outfit) VALUES (@citizenid, @outfit) ON DUPLICATE KEY UPDATE outfit = @outfit', {
        ['@citizenid'] = citizenid,
        ['@outfit'] = outfitData
    })
end)

-- Load player outfit
RegisterNetEvent('ox_inventory:clothing:loadOutfit', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local citizenid = Player.PlayerData.citizenid

    MySQL.Async.fetchAll('SELECT outfit FROM player_outfits WHERE citizenid = @citizenid', {
        ['@citizenid'] = citizenid
    }, function(result)
        if result[1] then
            local outfit = json.decode(result[1].outfit)
            TriggerClientEvent('ox_inventory:clothing:loadOutfit', src, outfit)
        end
    end)
end)

-- Add clothing items to ox_inventory
local clothingItems = {
    ['era_top'] = {
        name = 'era_top',
        label = 'Top',
        weight = 0,
        type = 'item',
        image = 'era_top.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A clothing item'
    },
    ['era_pants'] = {
        name = 'era_pants',
        label = 'Pants',
        weight = 0,
        type = 'item',
        image = 'era_pants.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A clothing item'
    },
    ['era_shoes'] = {
        name = 'era_shoes',
        label = 'Shoes',
        weight = 0,
        type = 'item',
        image = 'era_shoes.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A clothing item'
    },
    ['era_kevlar'] = {
        name = 'era_kevlar',
        label = 'Kevlar',
        weight = 0,
        type = 'item',
        image = 'era_kevlar.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A protective vest'
    },
    ['era_hat'] = {
        name = 'era_hat',
        label = 'Hat',
        weight = 0,
        type = 'item',
        image = 'era_hat.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A hat'
    },
    ['era_glasses'] = {
        name = 'era_glasses',
        label = 'Glasses',
        weight = 0,
        type = 'item',
        image = 'era_glasses.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A pair of glasses'
    },
    ['era_mask'] = {
        name = 'era_mask',
        label = 'Mask',
        weight = 0,
        type = 'item',
        image = 'era_mask.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A mask'
    },
    ['era_bag'] = {
        name = 'era_bag',
        label = 'Bag',
        weight = 0,
        type = 'item',
        image = 'era_bag.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A bag'
    },
    ['era_watch'] = {
        name = 'era_watch',
        label = 'Watch',
        weight = 0,
        type = 'item',
        image = 'era_watch.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A watch'
    },
    ['era_ears'] = {
        name = 'era_ears',
        label = 'Ear Accessories',
        weight = 0,
        type = 'item',
        image = 'era_ears.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Ear accessories'
    },
    ['era_decals'] = {
        name = 'era_decals',
        label = 'Decals',
        weight = 0,
        type = 'item',
        image = 'era_decals.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Clothing decals'
    },
    ['era_outfit'] = {
        name = 'era_outfit',
        label = 'Outfit',
        weight = 0,
        type = 'item',
        image = 'era_outfit.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A complete outfit'
    }
}

-- Register items with ox_inventory
for k, v in pairs(clothingItems) do
    exports.ox_inventory:RegisterItem(k, v)
end

-- Create SQL table for outfits
MySQL.ready(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS player_outfits (
            citizenid VARCHAR(50) PRIMARY KEY,
            outfit LONGTEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ]], {})
end) 