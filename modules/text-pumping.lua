---Pumps text from files in the `texts` folder

local TextPumping = {}

local pathPrefix = "../texts/"
local pathPostfix = ".txt"

---Returns contents of .txt file named `fileName` placed in `texts` folder
---@param fileName string
---@return string
function TextPumping.get_text(fileName)
    local file = assert(io.open(pathPrefix..fileName..pathPostfix, "r"))

    io.input(file)
    local text = io.read("a")
    io.close(file)
    return text
end

return TextPumping