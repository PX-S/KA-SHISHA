ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("chema_shisha:pay")
AddEventHandler("chema_shisha:pay", function(entity)
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeMoney(20)
end)

RegisterServerEvent("eff_smokes")
AddEventHandler("eff_smokes", function(entity)
	TriggerClientEvent("c_eff_smokes", -1, entity)
end)

ESX.RegisterUsableItem('shisha', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('shisha', 1)
	xPlayer.showNotification('~g~The shisha was set up.')
	TriggerClientEvent("chema_shisha:spawn", -1, entity)
end)

RegisterCommand("deleteshisha", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("chema_shisha:delete", -1, entity)
	xPlayer.addInventoryItem("shisha", 1)
end)
RegisterCommand("shisha", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
	
	TriggerClientEvent("chema_shisha:spawn", -1, entity, xPlayer)
end)

local CurrentVersion = '1.0'

PerformHttpRequest('https://raw.githubusercontent.com/ChemaSanchez/chema_shisha/main/Version.txt', function(Error, NewestVersion, Header)
    PerformHttpRequest('https://raw.githubusercontent.com/ChemaSanchez/chema_shisha/main/Version.txt', function(Error, Changes, Header)
        print('^0')
        print('^6[chema_shisha]^0 Checking for updates...')
        print('^0')
        print('^6[chema_shisha]^0 Version: ^5' .. CurrentVersion .. '^0')
        print('^0')
        if CurrentVersion ~= NewestVersion then
            print('^6[chema_shisha]^0 Your script is ^8outdated^0!')
            print('^0')
            print('^6[chema_shisha] ^3New Version ^5' .. NewestVersion .. ':^0')
            print('^3')
            print('^0')
            print('^6[chema_shisha]^0 You ^8you dont have^0 la ultima version of ^5chema_shisha^0. Actualizalo: https://github.com/ChemaSanchez/chema_shisha/releases/tag/'.. NewestVersion)
        else
            print('^6[chema_shisha]^0 This ^2up-to-date^0')
        end
        print('^0')
    end)
end)