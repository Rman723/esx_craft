# esx_craft

#ADDING NEW ITESM#
If you are adding a new craftable but not new item do this:
Go to main.lua then under "local wafflronfig" you will see all the current craftables follow that exact format *EX:{item="ITEM NAME", cost="WHAT YOU WANT TO CRAFT WITH"}*. Once you have done that go to server.lua and under "RegisterServerEvent('craft')" add:
*elseif data == '*NEW ITEM*' then
		if *ITEM NEEDED* >= *NUM NEEDED* and *ITEM NEEDED* >= *NUM NEEDED* then 
			TriggerClientEvent('startcraft', source, data)
		else 
			TriggerClientEvent('cantcraft', source)	
		end*
Then under *RegisterServerEvent('craftcraft',data)* add:
*elseif data == '*NEW ITEM*' then 
xPlayer.removeInventoryItem('*ITEM NEEDED*', *NUM NEEDED*)--Do this for every item needed to croft
xPlayer.addInventoryItem('*Craftable', *Num you want to give*)*

If you cant do these steps and you are a server owner I recommend you throw away your server :)

#ADDING NEW ITEMS TO CRAFT WITH#
Go to server.lua and it is tells you how to do it.
