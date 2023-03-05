GetHeadshot = function(ped)
    local texture
    local timeout = 10
    local headshot = RegisterPedheadshot(ped)

    while (timeout > 0) and (not IsPedheadshotReady(headshot) or not IsPedheadshotValid(headshot)) do
        timeout = timeout - 1
		Wait(200) 
	end
    texture = GetPedheadshotTxdString(headshot)
    UnregisterPedheadshot(headshot)
    return texture
end


Debugprint = function(string)
    if AxConfig.Debug then
        print(string)
    end
end

is_faction_in_config = function(faction)
    for k,_ in pairs(AxConfig.factions) do
        if k == faction then return k end
    end
    return false
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Wait( 0 )
    end
end

playingAnim = false

ShowBadge = function(faction,player)
    -- [[ Badge Animation ]]
	if PlayerPedId() == GetPlayerPed(GetPlayerFromServerId(player)) then --[[ Not triggering the function for non Badge Owners ]]
    	CreateThread(function()
           if not playingAnim then --[[ Anti Spam so it doesn`t get bugged randomly ]]
                playingAnim = true
                local prop_model = AxConfig.factions[faction].prop_name
                RequestModel(prop_model)
                while not HasModelLoaded(prop_model) do
                    Wait(1)
                end
                local ped_owner = GetPlayerFromServerId(player)
                local ped = GetPlayerPed(ped_owner)
                local coords = GetEntityCoords(ped)
                local badgeProp = CreateObject(GetHashKey(prop_model), coords.x, coords.y, coords.z + 0.2, true, true, true)
                local boneIndex = GetPedBoneIndex(ped, AxConfig.factions[faction].bone_index)

                local a,b,c,d,e,f = table.unpack(AxConfig.factions[faction].PropPlacement)
                
                AttachEntityToEntity(badgeProp, ped, boneIndex, a, b, c, d, e, f, true, true, false, true, 1, true)
                if IsPedArmed(ped, 7) then
                    SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
                end
                loadAnimDict('paper_1_rcm_alt1-9')
                TaskPlayAnim(ped, 'paper_1_rcm_alt1-9', 'player_one_dual-9', 8.0, -8, 10.0, 49, 0, 0, 0, 0)
                Wait(3500)
                ClearPedSecondaryTask(ped)
                DeleteObject(badgeProp)
                playingAnim = false
                Debugprint("PlayingAnim == false , object Deleted")
            end
			Wait(650)
    	end)
	end
end


function drawTxt(text, font, thePos, scale, center, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(center)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(thePos)
end
