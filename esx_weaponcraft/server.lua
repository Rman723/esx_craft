ESX = nil
--[[
Put new materials here
	like this
"local *material* = nil"
]]
local aluminium = nil--
local plastic = nil--
local lockpick = nil
local clothe = nil--
local bottle = nil--
local spring = nil--
local lf = nil--

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('itemcheck')
AddEventHandler('itemcheck', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	--[[ Then do this:
	local xItem *next num* = xPlayer.getInventoryItem('*new material name*')
	THEN
	*material* = (xItem *next num*.count)
	]]
	local xItem = xPlayer.getInventoryItem('aluminium')
	local xItem2 = xPlayer.getInventoryItem('plastic')
	local xItem3 = xPlayer.getInventoryItem('lockpick')
	local xItem4 = xPlayer.getInventoryItem('clothe')
	local xItem5 = xPlayer.getInventoryItem('bottle')
	local xItem6 = xPlayer.getInventoryItem('spring')
	local xItem7 = xPlayer.getInventoryItem('lf')
	aluminium = (xItem.count)--
	plastic = (xItem2.count)--
	lockpick = (xItem3.count)
	clothe = (xItem4.count)--
	bottle = (xItem5.count)--
	spring = (xItem6.count)--
	lf = (xItem7.count)--
end)

RegisterServerEvent('craft')
AddEventHandler('craft', function(data)
	local xPlayer = ESX.GetPlayerFromId(source)
	if data == 'Switchblade' then 
		if aluminium >= 2 and spring >= 1 then 
			TriggerClientEvent('startcraft', source, data)
		else 
			TriggerClientEvent('cantcraft', source)	
		end
	elseif data == 'molotov' then
		if bottle >= 1 and lf >= 1 and clothe >= 1 then 
			TriggerClientEvent('startcraft', source, data)
		else 
			TriggerClientEvent('cantcraft', source)	
		end
	elseif data == 'lockpick' then
		if plastic >= 3 and aluminium >= 2 then 
			TriggerClientEvent('startcraft', source, data)
		else 
			TriggerClientEvent('cantcraft', source)	
		end
	end
end)

RegisterServerEvent('craftcraft',data)
AddEventHandler('craftcraft', function(data)
	local xPlayer = ESX.GetPlayerFromId(source)
	if data == 'Switchblade' then 
		xPlayer.removeInventoryItem('aluminium', 2)
		xPlayer.removeInventoryItem('spring', 1)
		xPlayer.addWeapon('WEAPON_SWITCHBLADE', 1)
	elseif data == 'molotov' then 
		xPlayer.removeInventoryItem('bottle', 1)
		xPlayer.removeInventoryItem('lf', 1)
		xPlayer.removeInventoryItem('clothe', 1)
		xPlayer.addWeapon('WEAPON_molotov', 1)
	elseif data == 'lockpick' then 
		xPlayer.removeInventoryItem('plastic', 3)
		xPlayer.removeInventoryItem('aluminium', 2)
		xPlayer.addInventoryItem('lockpick', 1)
	end
end)


--xPlayer.removeInventoryItem(xItem.name, amount)
--xPlayer.showNotification('you\'ve sold ~b~'..amount..'x~s~ ~y~'..xItem.name..'~s~ for ~g~$'..price..'~s~', amount, xItem.label, ESX.Math.GroupDigits(price))