ESX = exports.es_extended:getSharedObject()

RegisterNetEvent('esx_manette:ammanetta')
AddEventHandler('esx_manette:ammanetta', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_manette:ammanetta', target)
end)
