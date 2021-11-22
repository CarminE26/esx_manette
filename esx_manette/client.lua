ESX = exports.es_extended:getSharedObject()

RegisterNetEvent('esx_manette:ammanetta')
AddEventHandler('esx_manette:ammanetta', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()

	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(300)
		end

		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
		SetPedCanPlayGestureAnims(playerPed, false)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(false)

	else

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
	end

end)

ESX.RegisterUsableItem('manette', function()
	local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
		
		if closestPlayer == -1 or closestPlayerDistance > 2.0 then
                  ESX.ShowNotification('Nessun giocatore trovato')
                else
                  ESX.ShowNotification(('Giocatore trovato'):format(GetPlayerName(closestPlayer), closestPlayerDistance))
                 end
	end
end)
    
