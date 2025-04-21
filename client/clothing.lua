local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local currentOutfit = {}

-- Initialize player data
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

-- Command to open clothing menu
RegisterCommand('clothing', function()
    local menu = {
        {
            header = "👕 Clothing Menu",
            isMenuHeader = true
        },
        {
            header = "👔 Outfits",
            txt = "Manage your saved outfits",
            params = {
                event = "ox_inventory:clothing:outfits"
            }
        },
        {
            header = "👕 Tops",
            txt = "Change your top",
            params = {
                event = "ox_inventory:clothing:tops"
            }
        },
        {
            header = "👖 Pants",
            txt = "Change your pants",
            params = {
                event = "ox_inventory:clothing:pants"
            }
        },
        {
            header = "👟 Shoes",
            txt = "Change your shoes",
            params = {
                event = "ox_inventory:clothing:shoes"
            }
        },
        {
            header = "🦺 Kevlar",
            txt = "Change your kevlar",
            params = {
                event = "ox_inventory:clothing:kevlar"
            }
        },
        {
            header = "👂 Ears",
            txt = "Change ear accessories",
            params = {
                event = "ox_inventory:clothing:ears"
            }
        },
        {
            header = "💍 Accessories",
            txt = "Change accessories",
            params = {
                event = "ox_inventory:clothing:accessories"
            }
        },
        {
            header = "💇 Hair",
            txt = "Manage your hair",
            params = {
                event = "ox_inventory:clothing:hair"
            }
        }
    }
    exports['qb-menu']:openMenu(menu)
end)

-- Event handlers for clothing changes
RegisterNetEvent('ox_inventory:clothing:tops', function()
    local tops = exports['illenium-appearance']:GetTops()
    local menu = {
        {
            header = "👕 Tops",
            isMenuHeader = true
        }
    }
    
    for _, top in pairs(tops) do
        menu[#menu + 1] = {
            header = top.label,
            txt = "ID: " .. top.id,
            params = {
                event = "ox_inventory:clothing:applyTop",
                args = {
                    id = top.id,
                    color = top.color
                }
            }
        }
    end
    
    exports['qb-menu']:openMenu(menu)
end)

-- Accessories menu
RegisterNetEvent('ox_inventory:clothing:accessories', function()
    local menu = {
        {
            header = "💍 Accessories",
            isMenuHeader = true
        },
        {
            header = "👒 Hat",
            txt = "Change your hat",
            params = {
                event = "ox_inventory:clothing:hat"
            }
        },
        {
            header = "🕶️ Glasses",
            txt = "Change your glasses",
            params = {
                event = "ox_inventory:clothing:glasses"
            }
        },
        {
            header = "🎭 Mask",
            txt = "Change your mask",
            params = {
                event = "ox_inventory:clothing:mask"
            }
        },
        {
            header = "🎒 Bag",
            txt = "Change your bag",
            params = {
                event = "ox_inventory:clothing:bag"
            }
        },
        {
            header = "⌚ Watch",
            txt = "Change your watch",
            params = {
                event = "ox_inventory:clothing:watch"
            }
        },
        {
            header = "💫 Decals",
            txt = "Change your decals",
            params = {
                event = "ox_inventory:clothing:decals"
            }
        }
    }
    exports['qb-menu']:openMenu(menu)
end)

-- Hair menu
RegisterNetEvent('ox_inventory:clothing:hair', function()
    local menu = {
        {
            header = "💇 Hair",
            isMenuHeader = true
        },
        {
            header = "✂️ Manage Hair",
            txt = "Change your hair style",
            params = {
                event = "ox_inventory:clothing:manageHair"
            }
        },
        {
            header = "🔄 Switch Hair",
            txt = "Switch between saved hairstyles",
            params = {
                event = "ox_inventory:clothing:switchHair"
            }
        }
    }
    exports['qb-menu']:openMenu(menu)
end)

-- Apply clothing changes
RegisterNetEvent('ox_inventory:clothing:applyTop', function(data)
    local ped = PlayerPedId()
    exports['illenium-appearance']:SetPedTop(ped, data.id, data.color)
    TriggerServerEvent('ox_inventory:clothing:saveOutfit', 'top', data)
end)

RegisterNetEvent('ox_inventory:clothing:applyPants', function(data)
    local ped = PlayerPedId()
    exports['illenium-appearance']:SetPedPants(ped, data.id, data.color)
    TriggerServerEvent('ox_inventory:clothing:saveOutfit', 'pants', data)
end)

RegisterNetEvent('ox_inventory:clothing:applyShoes', function(data)
    local ped = PlayerPedId()
    exports['illenium-appearance']:SetPedShoes(ped, data.id, data.color)
    TriggerServerEvent('ox_inventory:clothing:saveOutfit', 'shoes', data)
end)

-- Remove all clothes
RegisterNetEvent('ox_inventory:clothing:removeAll', function()
    local ped = PlayerPedId()
    exports['illenium-appearance']:ResetPedComponents(ped)
    TriggerServerEvent('ox_inventory:clothing:saveOutfit', 'reset', {})
end)

-- Save current outfit
RegisterNetEvent('ox_inventory:clothing:saveOutfit', function()
    local ped = PlayerPedId()
    local outfit = {
        top = exports['illenium-appearance']:GetPedTop(ped),
        pants = exports['illenium-appearance']:GetPedPants(ped),
        shoes = exports['illenium-appearance']:GetPedShoes(ped),
        accessories = exports['illenium-appearance']:GetPedAccessories(ped),
        hair = exports['illenium-appearance']:GetPedHair(ped)
    }
    
    TriggerServerEvent('ox_inventory:clothing:saveOutfit', outfit)
end)

-- Load saved outfit
RegisterNetEvent('ox_inventory:clothing:loadOutfit', function(outfit)
    local ped = PlayerPedId()
    if outfit.top then
        exports['illenium-appearance']:SetPedTop(ped, outfit.top.id, outfit.top.color)
    end
    if outfit.pants then
        exports['illenium-appearance']:SetPedPants(ped, outfit.pants.id, outfit.pants.color)
    end
    if outfit.shoes then
        exports['illenium-appearance']:SetPedShoes(ped, outfit.shoes.id, outfit.shoes.color)
    end
    if outfit.accessories then
        for _, accessory in pairs(outfit.accessories) do
            exports['illenium-appearance']:SetPedAccessory(ped, accessory.type, accessory.id, accessory.color)
        end
    end
    if outfit.hair then
        exports['illenium-appearance']:SetPedHair(ped, outfit.hair.id, outfit.hair.color)
    end
end) 