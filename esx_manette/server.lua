ESX = exports.es_extended:getSharedObject()

RegisterNetEvent('esx_manette:ammanetta')
AddEventHandler('esx_manette:ammanetta', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_manette:ammanetta', target)
end)


ESX.RegisterUsableItem('manette', function()
    local target, , closestPlayer, distance = ESX.Game.GetClosestPlayer()
    playerheading = GetEntityHeading(PlayerPedId())
    playerlocation = GetEntityForwardVector(PlayerPedId())
    playerCoords = GetEntityCoords(PlayerPedId())
    Citizen.Wait(250)
    loadanimdict('mp_arresting')
    TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 15.0, -8,-1, 2, 0, 0, 0, 0)
    Citizen.Wait(2000)
    ClearPedTasks(PlayerPedId())
    local target_id = GetPlayerServerId(target)
    if distance <= 2.0 then
        TriggerEvent('esx_manette:ammanetta', GetPlayerServerId(closestPlayer))
    end
end)
