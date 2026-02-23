---Functions for text formatting,
---so it stays consistent
---
---Redo by using https://github.com/hoelzro/lua-term
---http://lua-users.org/wiki/AnsiTerminalColors

local ColorsList = require("modules.colors-list")

local TextRender = {}

---Clears the screen
function TextRender.clear_screen()
    os.execute("clear")
end

---Prints `>`, waits for user to type something and then returns it
---@return string
function TextRender.wait_for_input()
    io.write(ColorsList.YELLOW.."\n> "..ColorsList.RESET); io.flush()
    return io.read()
end

---Prints a line of `=`
function TextRender.print_divisor()
    print(ColorsList.DIM..string.rep("=", 50)..ColorsList.RESET)
end

---Prints colored message
---@param str string
function TextRender.print_info_message(str)
    print(ColorsList.YELLOW.."\n"..str..ColorsList.RESET)
end

---Clears the screen and prints fancy formated strings
---@param ... string
function TextRender.print_screen(...)
    TextRender.clear_screen()
    TextRender.print_divisor()
    print()

    local screen = table.pack(...)

    for i = 1, screen.n do
        print(screen[i])
    end

    print()
    TextRender.print_divisor()
end

---Invites user to input any key to continue
function TextRender.wait_to_continue()
    TextRender.print_info_message("Чтобы продолжить, нажмите любую клавишу")
    TextRender.wait_for_input()
end

return TextRender