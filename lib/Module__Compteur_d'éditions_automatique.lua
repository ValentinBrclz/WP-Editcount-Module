--
-- WP-Editcount-Module
--
-- Wikipedia FR Lua module that handles the current edit count of users
-- Copyright (C) 2016 - GFLv2 or CC-BY-SA 3.0 or GFDL
-- <https://fr.wikipedia.org/w/index.php?title=Module:Compteur_d%27%C3%A9ditions_automatique&action=history>
--
local p = {}

-- Get data in fromatnum format
local function getFormattedData(frame, format, data)
    -- If the user want the raw data
    if format ~= nil then
        return data
    end
    -- Otherwise format the number according to his settings
    return frame:preprocess("{{formatnum:" .. data .. "}}")
end

function p.getEditCount(frame)
    -- Load and store the bot-updated data
    local data = mw.loadData( 'Module:Compteur d\'éditions automatique/data' )
    -- Get the calling page root title
    local rtitle = mw.title.getCurrentTitle().rootText
    -- Get the 1st level arguments
    local args = frame:getParent().args
    -- If there is a value for the given user (args elseif via title), return it
    if data[args[1]] ~= nil then
        return getFormattedData(frame, args['raw'], data[args[1]])
    elseif data[rtitle] ~= nil then
        return getFormattedData(frame, args['raw'], data[rtitle])
    end
    -- Elsewise just display a "?" until the bot get through it
    return "?"
end

return p
