local display = false

wafflronfig = {
	items = {
	  {item="Switchblade", cost="2 Aluminium, 1 Spring"},
	  {item="molotov", cost="1 Cloth, 1 Bottle, 1 Lighter Fluid"},
	  {item="lockpick", cost="3 Plastic, 1 Aluminium"}
	}
  }


--Use this if you want them to use a command
--[[]]RegisterCommand("on", function()
    Citizen.CreateThread(function()
      TriggerEvent('nui:on', true)
    end)
end)

RegisterCommand("off", function()
  Citizen.CreateThread(function()
      TriggerEvent("nui:off", true)
  end)
end)
--]]

--[[ ////////////////////////////////////////// ]]


RegisterNUICallback("exit", function(data)
  TriggerEvent("nui:off", true)
  SetNuiFocus(false, false)
end)

RegisterNUICallback("craft", function(data)
  local data = data.data
  TriggerServerEvent('craft',data)
end)

RegisterNetEvent('nui:on')
AddEventHandler('nui:on', function()
  SetNuiFocus(true, true)
  SendNUIMessage({
    type = "ui",
    display = true
  })
end)

RegisterNetEvent('nui:off')
AddEventHandler('nui:off', function()
  SendNUIMessage({
    type = "ui",
    display = false
  })
end)

RegisterNetEvent('yea')
AddEventHandler('yea', function()
  for k,v in pairs(wafflronfig.items) do
    SendNUIMessage({
      type = "ic2",
      ca = k,
      ba = v
    })
  end
end)

RegisterNetEvent('startcraft')
AddEventHandler('startcraft', function(data)
  exports['mythic_progbar']:Progress({
    name = "sb",
    duration = 10000,
    label = "Crafting "..data,
    useWhileDead = false,
    canCancel = false,
    controlDisables = {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    },
  }, function(status)
		if not status then
			TriggerServerEvent('craftcraft',data)
		end
	end)
end)

RegisterNetEvent('cantcraft')
AddEventHandler('cantcraft', function(data)
  exports['mythic_notify']:SendAlert('error', "You are missing an item!")
end)

local craftspot = vector3(-174.85748291016,219.1686706543,90.021583557129)
Citizen.CreateThread(function()
  while true do
      local ped = GetPlayerPed(-1)
      local playerCoords = GetEntityCoords(PlayerPedId())
      local dist =  #(vector3(craftspot['x'],craftspot['y'],craftspot['z']) - playerCoords)
      if dist <= 7 then
        DrawText3Ds(craftspot['x'],craftspot['y'],craftspot['z'],'Press ~r~[E]~s~ To Open Craft Menu')
        if IsControlJustPressed(2, 86) then
          TriggerEvent('nui:on', true)
          TriggerEvent('yea')
          TriggerServerEvent('itemcheck')
        end
      end
  Citizen.Wait(0)
    end
end)



---Something
DrawText3Ds = function(x,y,z, text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
local factor = #text / 370
local px,py,pz=table.unpack(GetGameplayCamCoords())

SetTextScale(0.35, 0.35)
SetTextFont(4)
SetTextProportional(1)
SetTextColour(255, 255, 255, 215)
SetTextEntry("STRING")
SetTextCentre(1)
AddTextComponentString(text)
DrawText(_x,_y)
DrawRect(_x,_y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 120)
end
