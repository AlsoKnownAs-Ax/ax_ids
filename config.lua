AxConfig = {}

AxConfig.showtime = 2500 -- Show time of the id card in seconds

AxConfig.show_radius = 10 -- Radius to show the ID card 

AxConfig.Debug = false -- Debug

AxConfig.name_query = "SELECT firstName,secondName FROM vrp_users WHERE id = @user_id" --// Query Settings

AxConfig.factions = { 
    ["Politie"] = {
       --// If you don`t know what you are doing , don`t touch this //
        PropPlacement = { 0.0600, 0.0210, -0.0400, -90.00, -180.00, 78.999 },
        bone_index = 28422, 
        prop_name = "prop_fib_badge" ,
        item_name = "Police Legitimation",
        item_desc = "Police ID Card",
        item_id = "police-id-card",
        --======================== -> Badge Settings <- ===================================--
        item_weight = 0.5,
        badge_position = vector2(0.75, 0.55), --// Badge position on the screen (x,y)
        badge_width = 0.28,
        badge_height = 0.49,
        --==================== -> Player Photo Settings <- ================================--
        player_photo = true,
        player_photo_pos = vector2(0.0687, -0.138),
        photo_width = 0.049,
        photo_height = 0.077,
        --==================== -> Player Name Settings <- =================================--
        player_name = false,
        name_pos = vector2(0.010, -0.096),
        name_scale = 0.3,
        name_color = vector4(65, 105, 225, 255),
        --==================== -> Player Signature Settings <- ============================--
        signature = true,
        signature_pos = vector2(-0.105, 0.145),
        signature_scale = 0.51,
        signature_color = vector4(25, 25, 112, 255) 
    },
    ["Smurd"] = {
        --// If you don`t know what you are doing , don`t touch this //
        PropPlacement = { 0.1000, 0.0200, -0.0300, -90.00, -180.00, 78.999 },
        bone_index =  28422, 
        prop_name = "p_ld_id_card_002" ,
        item_name = "Smurd Legitimation",
        item_desc = "Smurd ID Card",
        item_id = "smurd-id-card",
        --==========================================================--
        item_weight = 0.5,
        badge_position = vector2(0.75, 0.55), --// Badge position on the screen (x,y)
        badge_width = 0.28,
        badge_height = 0.30,
        --==================== -> Player Photo Settings <- ================================--
        player_photo = true,
        player_photo_pos = vector2(0.0759, 0.035),
        photo_width = 0.098,
        photo_height = 0.181,
        --==================== -> Player Name Settings <- =================================--
        player_name = false,
        name_pos = vector2(-0.040, -0.117),
        name_scale = 0.3,
        name_color = vector4(201, 185, 6, 255),
        --==================== -> Player Signature Settings <- ============================--
        signature = true,
        signature_pos = vector2(-0.095, -0.015),
        signature_scale = 0.45,
        signature_color = vector4(201, 6, 35, 255) 
    }, 
   ["Diicot"] = {
        --// If you don`t know what you are doing , don`t touch this //
        PropPlacement = { 0.0800, -0.0120, -0.0600, -90.00, 180.00, 69.99 },
        bone_index =  28422, 
        prop_name = "prop_cop_badge" ,
        item_name = "Diicot Legitimation",
        item_desc = "Diicot ID Card",
        item_id = "diicot-id-card",
        --======================== -> Badge Settings <- ===================================--
        item_weight = 0.5,
        badge_position = vector2(0.85, 0.65), --// Badge position on the screen (x,y)
        badge_width = 0.28,
        badge_height = 0.49,
        --==================== -> Player Photo Settings <- ================================--
        player_photo = false,
        player_photo_pos = vector2(0.0687, -0.138),
        photo_width = 0.049,
        photo_height = 0.077,
        --==================== -> Player Name Settings <- =================================--
        player_name = false,
        name_pos = vector2(-0.032, 0.067),
        name_scale = 0.25,
        name_color = vector4(171, 167, 167, 255),
        --==================== -> Player Signature Settings <- ============================--
        signature = false,
        signature_pos = vector2(-0.045, 0.105),
        signature_scale = 0.45,
        signature_color = vector4(232, 230, 230, 255) 
    },
}
