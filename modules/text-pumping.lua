---Pumps text from files in the `texts` folder

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

---Returns contents of .txt file named `fileName` placed in `texts` folder
---@param fileName string
---@return string
function TextPumping.get_text(fileName)
    local file = assert(io.open(pathPrefix..fileName..pathPostfix, "r"))

    local text = file:read("a")
    file:close()

    return text
end

return TextPumping