
local AX_Font
local sgn_font
local loaded = false
local Color = vector4(255, 255, 255, 255)

CreateThread = Citizen.CreateThread
Wait = Citizen.Wait

CreateThread(function()
    -- Font
	RegisterFontFile('sgn')
    sgn_font = RegisterFontId('Adinda Melia')
    -- Font
	RegisterFontFile('wmk')
	AX_Font = RegisterFontId('Freedom Font')

	for i,_ in pairs(AxConfig.factions) do
        local used_string = tostring(i.."_badge")
        local file_loc = tostring("assets/"..i.."_badge.png")
        local texture_name = tostring(i.."_badge")

		txd = CreateRuntimeTxd(used_string)
		CreateRuntimeTextureFromImage(txd, texture_name, file_loc)
	end
    loaded = true
	print("ax_ids : Loaded Successfully")
end)



RegisterNetEvent('ax_ids:showBadge')
AddEventHandler('ax_ids:showBadge',function(data)
Debugprint("Joined the event")
while not loaded do Wait(150) end
    local waitEnded = false
    if type(data) == 'table' then
        Debugprint("Data type == table")
        if is_faction_in_config(data.faction) then
            Debugprint("is in whitelist faction")
            if data.name:len() > 0 and data.secondname:len() > 0 then
                Debugprint("name > 0")
                if data.owner then
                    Wait(200)
                    ShowBadge(data.faction,data.owner)
                    local HS = GetHeadshot(GetPlayerPed(GetPlayerFromServerId(data.owner)))
                    Debugprint("HS ready")
                 --============================= Config Storage ==============================--
                    local pos = AxConfig.factions[data.faction].badge_position
                    local badge_width = AxConfig.factions[data.faction].badge_width
                    local badge_height = AxConfig.factions[data.faction].badge_height
                    local _photo = AxConfig.factions[data.faction].player_photo
                    if _photo then
                        photo_width = AxConfig.factions[data.faction].photo_width
                        photo_height = AxConfig.factions[data.faction].photo_height
                        player_photo_pos = AxConfig.factions[data.faction].player_photo_pos
                    end
                    local _name = AxConfig.factions[data.faction].player_name
                    if _name then
                        player_name_pos = AxConfig.factions[data.faction].name_pos
                        scale = AxConfig.factions[data.faction].name_scale
                        r,g,b,a =  table.unpack(AxConfig.factions[data.faction].name_color)
                    end
                    local _signature = AxConfig.factions[data.faction].signature
                    if _signature then
                        signature_pos = AxConfig.factions[data.faction].signature_pos
                        signature_scale = AxConfig.factions[data.faction].signature_scale
                        _r,_g,_b,_a = table.unpack(AxConfig.factions[data.faction].signature_color)
                    end
                 --============================= Config Storage ==============================--
                    CreateThread(function()
                        while not waitEnded do
                            Wait(1)
                            DrawSprite(data.faction.."_badge", data.faction.."_badge", pos, badge_width, badge_height, 0.0, Color)
                            if _photo then
                                DrawSprite(HS, HS, pos+player_photo_pos, photo_width, photo_height, 0.0, Color)
                            end
                            if _name then
                                drawTxt(data.name.." "..data.secondname, AX_Font, pos+player_name_pos, scale, 0, math.ceil(r), math.ceil(g), math.ceil(b), math.ceil(a))
                            end
                            if _signature then
                                drawTxt(data.rank, sgn_font, pos+signature_pos, signature_scale, 0, math.ceil(_r), math.ceil(_g), math.ceil(_b), math.ceil(_a))
                            end
                        end
                    end)
                    Debugprint("Drawed")
                    Wait(3000)
                    DeleteEntity(ax_IdProp)
                    Wait(500)
                    ClearPedTasks(PlayerPedId())
                    
                    Wait(AxConfig.showtime)
                    UnregisterPedheadshot(pedHeadshot)
                    waitEnded = true
                end
            else
                Debugprint("ax_ids: You have triggered a Badge Event without any owner")
                -- This print should be impossible because you are triggering the event trough the item function
            end
        else
            Debugprint("ax_ids: You have triggered a Badge Event for a not whitelisted faction (solve: put the faction in the config file)")
        end
    else
        Debugprint("ax_ids: The Badge Event parameters type is not a table")
    end
end)