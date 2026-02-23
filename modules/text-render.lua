---Functions for text formatting,
---so it stays consistent
---
---Redo by using https://github.com/hoelzro/lua-term
---http://lua-users.org/wiki/AnsiTerminalColors

local ColorsList = require("modules.colors-list")

local TextRender = {}

---Clears the screen
function TextRender.ClearScreen()
    os.execute("clear")
end

---Prints `>`, waits for user to type something and then returns it
---@return string
function TextRender.WaitForInput()
    io.write(ColorsList.YELLOW.."\n> "..ColorsList.RESET); io.flush()
    return io.read()
end

---Prints a line of `=`
function TextRender.PrintDivisior()
    print(ColorsList.DIM..string.rep("=", 50)..ColorsList.RESET)
end

---Prints colored message
---@param str string
function TextRender.PrintInfoMessage(str)
    print(ColorsList.YELLOW.."\n"..str..ColorsList.RESET)
end

---Clears the screen and prints fancy formated strings
---@param ... string
function TextRender.PrintScreen(...)
    TextRender.ClearScreen()
    TextRender.PrintDivisior()
    print()

    local screen = table.pack(...)

    for i = 1, screen.n do
        print(screen[i])
    end

    print()
    TextRender.PrintDivisior()
end

---Invites user to input any key to continue
function TextRender.WaitToContinue()
    TextRender.PrintInfoMessage("Чтобы продолжить, нажмите любую клавишу")
    TextRender.WaitForInput()
end

---Handles choice from numbered variants
---@param optionsText string
---@param handleOptions table<integer, function>
---@param breakAfterHandling? boolean
function TextRender.MakeNumberedChoice(optionsText, handleOptions, breakAfterHandling)
    while true do
        TextRender.PrintScreen(optionsText)

        local choice = tonumber(TextRender.WaitForInput())
        local handler = handleOptions[choice]

        if handler then
            handler()
            if breakAfterHandling then break end
        else
            -- PrintInfoMessage("Неверный ввод")
            -- TODO: Find a wait module
        end
    end
end

return TextRender