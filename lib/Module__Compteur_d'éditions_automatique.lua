--
-- WP-Editcount-Module
--
-- Wikipedia FR Lua module that handles the current edit count of users
-- Copyright (C) 2016
-- <https://fr.wikipedia.org/w/index.php?title=Module:Compteur_d%27%C3%A9ditions_automatique&action=history>
--
local p = {}

function p.getEditCount(frame)
	local data = mw.loadData( 'Module:Compteur d\'éditions automatique/data' )
	args = frame:getParent().args
	if data[args[1]] ~= nil then
		return data[args[1]]
	end
	return "?"
end

return p
