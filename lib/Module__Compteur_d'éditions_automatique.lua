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
