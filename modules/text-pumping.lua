---Pumps text from files in the `texts` folder

local ColorsList = require("modules.colors-list")

local TextPumping = {}

---Returns the `text-pumping.lua` file's path
---@return string
local function get_current_directory()
    local info = debug.getinfo(1, "S")
    local source = info.source

    -- removing `@` from path if needed
    if source:sub(1, 1) == '@' then
        source = source:sub(2)
    end

    return source:match("(.*/)") or ""
end

local pathPrefix = get_current_directory().."../texts/"
local pathPostfix = ".txt"

---Parses text by substituting ColorList tags with their values
---@param text string
---@return string
local function parse_text(text)
    local parsedText = text

    for tag, value in pairs(ColorsList) do
        parsedText = string.gsub(parsedText, "ColorsList."..tag, value)
    end

    return parsedText
end

---Returns contents of .txt file named `fileName` placed in `texts` folder
---@param fileName string
---@return string
function TextPumping.get_text(fileName)
    local file = assert(io.open(pathPrefix..fileName..pathPostfix, "r"))

    local text = file:read("a")
    file:close()

    return parse_text(text)
end

return TextPumping