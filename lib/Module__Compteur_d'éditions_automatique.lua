--
-- WP-Editcount-Module
--
-- Wikipedia FR Lua module that handles the current edit count of users
-- Copyright (C) 2016
-- <https://fr.wikipedia.org/w/index.php?title=Module:Compteur_d%27%C3%A9ditions_automatique&action=history>
--
local p = {}

function p.getEditCount(frame)
    -- Load and store the bot-updated data
    local data = mw.loadData( 'Module:Compteur d\'éditions automatique/data' )
    -- Get the 2nd level arguments
    args = frame:getParent().args
    -- If there is a value for the given user, return it
    if data[args[1]] ~= nil then
        return data[args[1]]
    end
    -- Elsewise just display a "?" until the bot get throught it
    return "?"
end

return p

