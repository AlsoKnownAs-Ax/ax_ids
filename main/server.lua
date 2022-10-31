--/////////// vRP bind \\\\\\\\\\\--

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","ax_ids")

--===============================================--
local cache = {}

ax_ids = function(source)
    local choices = {}

    choices["Foloseste"] = {function(player,choice,mod)
        local user_id = vRP.getUserId({player})
        local faction = vRP.getUserFaction({user_id})
        local actualRank = vRP.getFactionRank({user_id})
        if user_id then
            if not cache[user_id] then
                local rows = exports.ghmattimysql:executeSync(AxConfig.name_query, {user_id = user_id})
                if rows then
                    cache[user_id] = {
                        firstname = rows[1].firstName,
                        secondname = rows[1].secondName
                    }
                end
            end

            vRPclient.getNearestPlayers(player,{AxConfig.show_radius},function(nplayers)
                for i,_ in pairs(nplayers) do
                    TriggerClientEvent('ax_ids:showBadge',i, {faction = faction, name = cache[user_id].firstname, secondname = cache[user_id].name, rank = actualRank, owner = player})
                end
                TriggerClientEvent('ax_ids:showBadge',player, {faction = faction, name = cache[user_id].firstname, secondname = cache[user_id].name, rank = actualRank, owner = player})
            end)
        end
    end}
    return choices
end

AddEventHandler("vRP:playerLeave",function(user_id,source)
    if cache[user_id] then
        cache[user_id] = nil
    end
end)

--// Items Def

for _,v in pairs(AxConfig.factions) do
    vRP.defInventoryItem({v.item_id,v.item_name,v.item_desc,ax_ids,v.item_weight})
end


