--/////////// vRP bind \\\\\\\\\\\--

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","ax_ids")

--===============================================--

ax_ids = function(source)
    local choices = {}

    choices["Foloseste"] = {function(player,choice,mod)
        local user_id = vRP.getUserId({player})
        local faction = vRP.getUserFaction({user_id})
        local actualRank = vRP.getFactionRank({user_id})
        if user_id then
            vRP.getUserIdentity({user_id, function(identity)
                vRPclient.getNearestPlayers(player,{AxConfig.show_radius},function(nplayers)
                    for i,v in pairs(nplayers) do
                        TriggerClientEvent('ax_ids:showBadge',i, {faction = faction, name = identity.firstname, secondname = identity.name, rank = actualRank, owner = player})
                    end
                    TriggerClientEvent('ax_ids:showBadge',player, {faction = faction, name = identity.firstname, secondname = identity.name, rank = actualRank, owner = player})
                end)
            end})
        end
    end}
    return choices
end


for _,v in pairs(AxConfig.factions) do
    vRP.defInventoryItem({v.item_id,v.item_name,v.item_desc,ax_ids,v.item_weight})
end


