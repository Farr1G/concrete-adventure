---List of formatting styles for command line messages

-- Redo by using https://github.com/hoelzro/lua-term
--
-- http://lua-users.org/wiki/AnsiTerminalColors
local ColorsList = {
    RED = "\27[31m",
    GREEN = "\27[32m",
    YELLOW = "\27[33m",
    BLUE = "\27[34m",

    DIM = "\27[2m",
    
    RESET = "\27[0m",
}

return ColorsList