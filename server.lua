RegisterServerEvent('weaponrecoil:SAFE')
AddEventHandler('weaponrecoil:SAFE', function()
	TriggerClientEvent('weaponrecoil:SAFE', source)
end)

RegisterServerEvent('weaponrecoil:SEMI')
AddEventHandler('weaponrecoil:SEMI', function()
	TriggerClientEvent('weaponrecoil:SEMI', source)
end)

RegisterServerEvent('weaponrecoil:BURST')
AddEventHandler('weaponrecoil:BURST', function()
	TriggerClientEvent('weaponrecoil:BURST', source)
end)

RegisterServerEvent('weaponrecoil:AUTO')
AddEventHandler('weaponrecoil:AUTO', function()
	TriggerClientEvent('weaponrecoil:AUTO', source)
end)