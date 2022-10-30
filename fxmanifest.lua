fx_version 'adamant'

game {'gta5'}

author "--Ax-#0018"

description 'Legitimations system for legal factions'

client_scripts {
    "lib/Proxy.lua",
    "lib/Tunnel.lua",
    "config.lua",
    "main/utils.lua",
    "main/client.lua"
}

server_scripts {
    "@vrp/lib/utils.lua",
    "config.lua",
    "main/server.lua"
}

files {
    "assets/*png",
    "stream/*.gfx",
}

data_file "DLC_ITYP_REQUEST" "badge1.ytyp"

data_file "DLC_ITYP_REQUEST" "copbadge.ytyp"