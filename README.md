Video Preview: https://www.youtube.com/watch?v=Y3AJ61aSfZM&ab_channel=AlsoKnownAsAx


> How to add new badges:

> Add the factions in AxConfig.factions and copy the variables the add your image as in the example

--> factionName_badge.png

After that just configure your config.lua and you are good to go


> Add / take ID card functions

```


local legitimatii = {
	["Politie"] = "police-id-card",
	["Smurd"] = "smurd-id-card",
	["Diicot"] = "diicot-id-card"
}

local function ch_giveidcard(source,choice)
	local user_id = vRP.getUserId(source)
	local faction = vRP.getUserFaction(user_id)
	vRP.prompt(source, "ID (CNP):", "", function(source, _CNP)
		local id = parseInt(_CNP)
		local _tsrc = vRP.getUserSource(id)
		if id and _tsrc then
			vRP.giveInventoryItem(id,legitimatii[faction],1,false)
			vRPclient.notify(source,{"Ai oferit legitimatia jucatorului "..GetPlayerName(_tsrc)})
			vRPclient.notify(_tsrc,{"Jucatorul "..GetPlayerName(source).. "ti-a oferit legitimatia."})
		else
			vRPclient.notify(source,{"Acest ID nu a fost gasit"})
		end
	end)
end

local function ch_takeidcard(source,choice)
	local user_id = vRP.getUserId(source)
	local faction = vRP.getUserFaction(user_id)
	vRP.prompt(source, "ID (CNP):", "", function(source, _CNP)
		local id = parseInt(_CNP)
		local _tsrc = vRP.getUserSource(id)
		if id and _tsrc then
			vRP.tryGetInventoryItem(user_id,legitimatii[faction],1,false)
			vRPclient.notify(source,{"Ai confiscat legitimatia jucatorului "..GetPlayerName(_tsrc)})
			vRPclient.notify(_tsrc,{"Jucatorul "..GetPlayerName(source).. "ti-a confiscat legitimatia."})
		else
			vRPclient.notify(source,{"Acest ID nu a fost gasit"})
		end
	end)
end

```

>> !! Do not forget to add them in the desired menu


