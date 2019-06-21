Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		--Uncomment the "weapon_pistol" parts for per gun and copy paste the elseif statments to add gun specific values
		--WEAPON EXCEPTIONS FOR RECOIL
		local hasvehicleweapon, vehicleweapon = GetCurrentPedVehicleWeapon(GetPlayerPed(-1))
		if GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -1609580060 then --unarmed slot
		elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -728555052 then --melee slots
		elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == 1548507267 then --Throwables slots
		elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -37788308 then --Fire Ext slot
		elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == 1595662460 then --Jerry Can slot
		elseif hasvehicleweapon == 1 then
		elseif GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_minigun") then
		elseif GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_rayminigun") then
		elseif IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then

			--if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_pistol") then
			--RecoilFirstPersonMultiplier(FirstPersonMultiplier,FirstPersonAimingMultiplier)
			RecoilFirstPersonMultiplier(2.0,1.0)
			--RecoilThirdPersonMultiplier(ThirdPersonMultiplier,ThirdPersonAimingMultiplier)
			RecoilThirdPersonMultiplier(3.0,2.0)
			--elseif GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_appistol") then
			--RecoilFirstPersonMultiplier(3.0,2.0)
			--RecoilThirdPersonMultiplier(2.0,1.0)
			--end
		elseif IsPedShooting(PlayerPedId()) then -- When in car

			--if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_pistol") then
			RecoilThirdPersonInCarMultiplier(5.0)
			--elseif GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_appistol") then
			--RecoilThirdPersonInCarMultiplier(5.0)
			--end

			-- First Person When in car
		elseif IsPedShooting(PlayerPedId()) and GetVehiclePedIsIn(PlayerPedId(),false) and GetFollowPedCamViewMode() == 4 then 
			
			--if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_pistol") then
			RecoilFirstPersonInCarMultiplier(15.0)
			--elseif GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_appistol") then
			--RecoilFirstPersonInCarMultiplier(15.0)
			--end
		end
	end
end)

function RecoilFirstPersonMultiplier(FirstPersonMultiplier,FirstPersonAimingMultiplier)
	if GetFollowPedCamViewMode() == 4 then -- First Person
		local getwidthrecoil = GetGameplayCamRelativeHeading()
		local widthrecoil = math.random() + math.random() - math.random() - math.random()
		SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * FirstPersonMultiplier)
		
		local getheightrecoil = GetGameplayCamRelativePitch()
		local heightrecoil = math.random() + math.random()
		SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * FirstPersonMultiplier, 1.0)
		if IsControlPressed(0, 25) then --RMB aim
			local getwidthrecoil = GetGameplayCamRelativeHeading()
			local widthrecoil = math.random() + math.random() - math.random() - math.random()
			SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * FirstPersonAimingMultiplier)
			
			local getheightrecoil = GetGameplayCamRelativePitch()
			local heightrecoil = math.random() + math.random() + math.random() + math.random() + math.random()
			SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * FirstPersonAimingMultiplier, 1.0)
			Citizen.Wait(0)
		end
	end
end

function RecoilThirdPersonMultiplier(ThirdPersonMultiplier,ThirdPersonAimingMultiplier)
	if GetFollowPedCamViewMode() ~= 4 then -- Not First Person
		local getwidthrecoil = GetGameplayCamRelativeHeading()
		local widthrecoil = math.random() + math.random() - math.random() - math.random()
		SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonMultiplier)
		
		local getheightrecoil = GetGameplayCamRelativePitch()
		local heightrecoil = math.random() + math.random()
		SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonMultiplier, 1.0)
		if IsControlPressed(0, 25) then --RMB aim
			local getwidthrecoil = GetGameplayCamRelativeHeading()
			local widthrecoil = math.random() + math.random() - math.random() - math.random()
			SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonAimingMultiplier)
			
			local getheightrecoil = GetGameplayCamRelativePitch()
			local heightrecoil = math.random() + math.random()
			SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonAimingMultiplier, 1.0)
			Citizen.Wait(0)
		end
	end
end

function RecoilThirdPersonInCarMultiplier(ThirdPersonInCarMultiplier)
	local getwidthrecoil = GetGameplayCamRelativeHeading()
	local widthrecoil = math.random() + math.random() - math.random() - math.random()
	SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonInCarMultiplier)
				
	local getheightrecoil = GetGameplayCamRelativePitch()
	local heightrecoil = math.random() + math.random()
	SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonInCarMultiplier, 1.0)
end

function RecoilFirstPersonInCarMultiplier(FirstPersonInCarMultiplier)
	local getwidthrecoil = GetGameplayCamRelativeHeading()
	local widthrecoil = math.random() + math.random() - math.random() - math.random()
	SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * FirstPersonInCarMultiplier)
	--Doesnt work hence side ways recoil increased
	--[[local getheightrecoil = GetGameplayCamRelativePitch()
	local heightrecoil = math.random() + math.random()
	SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * FirstPersonInCarMultiplier, 1.0)--]]
end

function StopWeaponSwitching()
	--Uncomment "IsControlPressed" part and delete these lines
	--if you want to switch weapon without manually pressing the SAFE ui button
	BlockWeaponWheelThisFrame()
	HideHudComponentThisFrame(19) -- Weapon Wheel
	HideHudComponentThisFrame(20) -- Weapon Wheel Stats
	DisableControlAction(0, 37, true) -- Disables tab

	--[[if IsControlPressed(0,37) then --if tab button pressed
		SendNUIMessage({switchtosafe = true})
		Citizen.Wait(2100)
	end--]]

	--Prevents the ped switching to the wrong UI when getting into a car because the weapon with change
	if IsPedGettingIntoAVehicle(GetPlayerPed(-1)) then
		SendNUIMessage({switchtosafe = true})
		Citizen.Wait(2100)
	end
	--Prevents the ped switching to the wrong UI when going into water because the weapon with change
	if IsPedSwimming(GetPlayerPed(-1)) then
		SendNUIMessage({switchtosafe = true})
		Citizen.Wait(2100)
	end

	if IsControlPressed(0, 24) or IsDisabledControlPressed(0, 24) then --RMB aim
		DisableControlAction(0, 22, true) -- Disables spacebar
	end

	if IsControlPressed(0, 25) or IsDisabledControlPressed(0, 25) then --LMB aim
		DisableControlAction(0, 22, true) -- Disables spacebar
	end

	if IsPlayerFreeAiming(PlayerId()) then
		DisableControlAction(0, 22, true) -- Disables spacebar
	end
end

safetyon = not safetyon
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if safetyon then
			--WEAPON EXCEPTIONS FOR DISPLAYING BURST AND AUTO BUTTONS
			SendNUIMessage({ShowSemiUI = false,ShowAutoUI = false})
			local hasvehicleweapon, vehicleweapon = GetCurrentPedVehicleWeapon(GetPlayerPed(-1))
			if GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -1609580060 then --UNARMED slot
			elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -728555052 then --melee slot
			elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == 1548507267 then --Throwables slot
			elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -37788308 then --Fire Ext slot
			elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == 1595662460 then --Jerry Can slot
			elseif hasvehicleweapon == 1 then
			else
				if GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == 416676503 then --Pistols slot
					if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_appistol") then
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = true})
					else
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = false})
					end
				elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == 690389602 then --Taser slot
					SendNUIMessage({ShowSemiUI = true,ShowAutoUI = false})
				elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -1212426201 then --Sniper slot
					if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_marksmanrifle") then
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = true})
					elseif GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_marksmanrifle_mk2") then
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = true})
					else
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = false})
					end
				elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == 860033945 then --Shotgun slot
					if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_assaultshotgun") then
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = true})
					elseif GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_heavyshotgun") then
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = true})
					elseif GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_autoshotgun") then
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = true})
					else
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = false})
					end
				elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -1569042529 then --RPG slot
					if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_minigun") then
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = true})
					elseif GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_rayminigun") then
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = true})
					else
						SendNUIMessage({ShowSemiUI = true,ShowAutoUI = false})
					end
				else
					SendNUIMessage({ShowSemiUI = true,ShowAutoUI = true})
				end
				DisablePlayerFiring(PlayerId(), true)
			end
		else
			StopWeaponSwitching()
		end
		if singleshot then
			StopWeaponSwitching()
			if IsControlJustPressed(0, 24) then
				Citizen.Wait(0)
				while IsControlPressed(0, 24) or IsDisabledControlPressed(0, 24) do
					DisablePlayerFiring(PlayerId(), true)
					Citizen.Wait(0)
				end
			end
		end
		if burstshot then
			StopWeaponSwitching()
			if IsControlJustPressed(0, 24) then
				Citizen.Wait(350)
				while IsControlPressed(0, 24) or IsDisabledControlPressed(0, 24) do
					DisablePlayerFiring(PlayerId(), true)
					Citizen.Wait(0)
				end
			end
		end
		if IsControlPressed(0, 19) then --Left Alt 
			--if IsControlJustPressed(0, 11) then --PAGE DOWN
				--WEAPON EXCEPTIONS FOR SELECTING A BUTTON WITH NUI
				local hasvehicleweapon, vehicleweapon = GetCurrentPedVehicleWeapon(GetPlayerPed(-1))
				if GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -1609580060 then --UNARMED slot
				elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -728555052 then --melee slot
				elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == 1548507267 then --Throwables slot
				elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -37788308 then --Fire Ext slot
				elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == 1595662460 then --Jerry Can slot
				elseif hasvehicleweapon == 1 then
				else
					SetNuiFocus(true,true)
				end
			--end
		end
	end
end)

RegisterNUICallback('close', function()

	SendNUIMessage({
		ShowSemiUI = false,
		WeaponCanBeSemi = true
	})

	SendNUIMessage({	
		ShowSemiUI = false,
		open = false
	})

	SetNuiFocus(false)	
end)
RegisterNUICallback('SAFE', function()
	TriggerServerEvent('weaponrecoil:SAFE')
end)

RegisterNUICallback('SEMI', function()
	TriggerServerEvent('weaponrecoil:SEMI')
end)

RegisterNUICallback('BURST', function()
	TriggerServerEvent('weaponrecoil:BURST')
end)

RegisterNUICallback('AUTO', function()
	TriggerServerEvent('weaponrecoil:AUTO')
end)

RegisterNetEvent('weaponrecoil:SAFE')
AddEventHandler('weaponrecoil:SAFE', function()
	if not safetyon then
	safetyon = not safetyon
	end
	if singleshot then
	singleshot = not singleshot
	end
	if burstshot then
	burstshot = not burstshot
	end
	safetyontext = not safetyontext
	Citizen.Wait(2000)
	safetyontext = not safetyontext
end)

RegisterNetEvent('weaponrecoil:SEMI')
AddEventHandler('weaponrecoil:SEMI', function()
	if safetyon then
	safetyon = not safetyon
	end
	if not singleshot then
	singleshot = not singleshot
	end
	if burstshot then
	burstshot = not burstshot
	end
	singleshottext = not singleshottext
	Citizen.Wait(2000)
	singleshottext = not singleshottext
end)

RegisterNetEvent('weaponrecoil:BURST')
AddEventHandler('weaponrecoil:BURST', function()
	if safetyon then
	safetyon = not safetyon
	end
	if singleshot then
	singleshot = not singleshot
	end
	if not burstshot then
	burstshot = not burstshot
	end
	burstshottext = not burstshottext
	Citizen.Wait(2000)
	burstshottext = not burstshottext
end)

RegisterNetEvent('weaponrecoil:AUTO')
AddEventHandler('weaponrecoil:AUTO', function()
	if safetyon then
	safetyon = not safetyon
	end
	if singleshot then
	singleshot = not singleshot
	end
	if burstshot then
	burstshot = not burstshot
	end
	autoshottext = not autoshottext
	Citizen.Wait(2000)
	autoshottext = not autoshottext
end)

Citizen.CreateThread(function()
	--[[RegisterCommand('weapondebug', function() 
    weapondebug = not weapondebug
    end, false)--]]
	while true do
		Citizen.Wait(0)
		local scaling = 0.6
       	local pos = GetEntityCoords(GetPlayerPed(-1))
       	if weapondebug then
       		if IsPedInAnyVehicle(GetPlayerPed(-1),false) then
				local hasvehicleweapon, vehicleweapon = GetCurrentPedVehicleWeapon(GetPlayerPed(-1))
				DrawWeaponText3Ds(pos["x"],pos["y"],pos["z"], "~b~Vehicle Selected:~r~" .. vehicleweapon .. "~b~Vehicle Has Weapon:~r~" .. tostring(hasvehicleweapon),scaling)
       		else
       			local group = GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) --weapon wheel slot
        		DrawWeaponText3Ds(pos["x"],pos["y"],pos["z"], "~b~Selected:~r~" .. GetSelectedPedWeapon(GetPlayerPed(-1)) .. " ~b~Slot:~r~" .. group,scaling)
        	end
		end
       	if singleshottext then
           	    DrawWeaponText3Ds(pos["x"],pos["y"],pos["z"], "FLICKS SWITCH TO SEMI AUTO" ,scaling)
       	end
       	if burstshottext then
           	    DrawWeaponText3Ds(pos["x"],pos["y"],pos["z"], "FLICKS SWITCH TO BURST FIRE" ,scaling)
       	end
       	if autoshottext then
           	    DrawWeaponText3Ds(pos["x"],pos["y"],pos["z"], "FLICKS SWITCH TO FULLY AUTO" ,scaling)
       	end
       	if safetyontext then
           	    DrawWeaponText3Ds(pos["x"],pos["y"],pos["z"], "FLICKS SAFETY SWITCH ON" ,scaling)
       	end
	end
end)

function DrawWeaponText3Ds(x,y,z, text, scale)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    SetTextScale(scale, scale)
    SetTextFont(10)
    SetTextProportional(1)
    SetTextColour(255, 255, 0, 215)
    SetTextOutline()    
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentSubstringPlayerName(text)
    DrawText(_x,_y)
    local factor = (string.len(text))
    DrawRect(_x,_y+0.02, factor/84, scale/12, 41, 11, 41, 100)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if not IsAimCamActive() or not IsFirstPersonAimCamActive() then --Hides crosshair
            HideHudComponentThisFrame(14)
        end
        local ammoweaponhash = GetSelectedPedWeapon(GetPlayerPed(-1)) --stops ammo running out to stop weapon switching with exceptions
        local ammocount = GetAmmoInPedWeapon(GetPlayerPed(-1),ammoweaponhash)
        if GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == 1548507267 then --Throwables slot
		elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == -37788308 then --Fire Ext slot
		elseif GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1))) == 1595662460 then --Jerry Can slot
        elseif ammocount == 1 then
        	DisablePlayerFiring(PlayerId(), true)
        end
	end
end)

--[[list of all weapons
'weapon_bat', 					
'weapon_battleaxe', 			
'weapon_bottle', 				
'weapon_crowbar', 				
'weapon_dagger', 				
'weapon_flashlight', 			
'weapon_golfclub', 			
'weapon_hammer', 				
'weapon_hatchet', 				
'weapon_knife', 				
'weapon_knuckle', 				
'weapon_machete', 				
'weapon_nightstick', 			
'weapon_poolcue', 				
'weapon_wrench', 				
'weapon_switchblade', 			
'weapon_stone_hatchet',		
'weapon_appistol', 			
'weapon_combatpistol', 		
'weapon_doubleaction', 		
'weapon_flaregun', 			
'weapon_heavypistol', 			
'weapon_marksmanpistol', 		
'weapon_pistol', 				
'weapon_pistol50', 			
'weapon_pistol_mk2', 			
'weapon_revolver', 			
'weapon_revolver_mk2', 		
'weapon_snspistol', 			
'weapon_snspistol_mk2',		
'weapon_stungun', 				
'weapon_vintagepistol', 		
'weapon_raypistol', 			
'weapon_assaultsmg', 			
'weapon_combatmg', 			
'weapon_combatmg_mk2', 		
'weapon_combatpdw', 			
'weapon_gusenberg', 			
'weapon_machinepistol', 		
'weapon_mg', 					
'weapon_microsmg', 			
'weapon_minismg', 				
'weapon_smg', 					
'weapon_smg_mk2', 				
'weapon_raycarbine', 		
'weapon_advancedrifle', 		
'weapon_assaultrifle', 		
'weapon_assaultrifle_mk2', 	
'weapon_bullpuprifle', 		
'weapon_bullpuprifle_mk2', 	
'weapon_carbinerifle', 		
'weapon_carbinerifle_mk2', 	
'weapon_compactrifle', 		
'weapon_specialcarbine', 		
'weapon_specialcarbine_mk2', 
'weapon_heavysniper', 			
'weapon_heavysniper_mk2', 		
'weapon_marksmanrifle', 		
'weapon_marksmanrifle_mk2', 
'weapon_musket', 				
'weapon_sniperrifle', 			
'weapon_assaultshotgun', 		
'weapon_autoshotgun', 			
'weapon_bullpupshotgun', 		
'weapon_dbshotgun', 			
'weapon_heavyshotgun', 		
'weapon_pumpshotgun', 			
'weapon_pumpshotgun_mk2', 		
'weapon_sawnoffshotgun', 		
'weapon_compactlauncher', 		
'weapon_firework', 			
'weapon_grenadelauncher', 		
'weapon_hominglauncher', 		
'weapon_minigun', 				
'weapon_railgun', 				
'weapon_rpg', 					
'weapon_rayminigun', 			
'weapon_ball', 				
'weapon_bzgas', 				
'weapon_fireextinguisher', 	
'weapon_flare', 				
'weapon_grenade', 				
'weapon_molotov', 				
'weapon_petrolcan', 			
'weapon_pipebomb', 			
'weapon_proxmine', 			
'weapon_smokegrenade', 		
'weapon_snowball', 			
'weapon_stickybomb', --]]		