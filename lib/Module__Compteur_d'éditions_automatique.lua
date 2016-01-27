--
-- WP-Editcount-Module
--
-- Wikipedia FR Lua module that handles the current edit count of users
-- Copyright (C) 2016 - GFLv2 or CC-BY-SA 3.0 or GFDL
-- <https://fr.wikipedia.org/w/index.php?title=Module:Compteur_d%27%C3%A9ditions_automatique&action=history>
--
local p = {}

function p.getEditCount(frame)
    -- Load and store the bot-updated data
    local data = mw.loadData( 'Module:Compteur d\'éditions automatique/data' )
    -- Get the calling page root title
    local rtitle = mw.title.getCurrentTitle().rootText
    -- Get the 1st level arguments
    local args = frame:getParent().args
    -- If there is a value for the given user (args elseif via title), return it
    if data[args[1]] ~= nil then
        -- If the user want the raw data
        if args['raw'] ~= nil then
            return data[args[1]]
        end
        -- Otherwise format the number according to his settings
    	return frame:preprocess("{{formatnum:" .. data[args[1]] .. "}}")
    elseif data[rtitle] ~= nil then
        if args['raw'] == nil then
            return frame:preprocess("{{formatnum:" .. data[rtitle] .. "}}")
        end
        return data[rtitle]
    end
    -- Elsewise just display a "?" until the bot get through it
    return "?"
end

return p
