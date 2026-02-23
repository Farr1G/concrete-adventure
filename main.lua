---Main game module
---Launches game menu and (in the future) will handle game logic

-- load modules
local ColorsList = require("modules.colors-list")
local TextRender = require("modules.text-render")
local TextPumping = require("modules.text-pumping")

local Game = require("modules.game")

-- MAIN MENU

---@type table<integer, function>
local handleMainMenuOptions = {}

-- REDO in corutines
handleMainMenuOptions[1] = function ()
    Game.StartNewGame()
end

handleMainMenuOptions[3] = function ()
    TextRender.PrintScreen(TextPumping.GetText("main-menu/settings"))

    TextRender.PrintInfoMessage("Чтобы вернуться назад, нажмите любую клавишу")
    TextRender.WaitForInput()
end

handleMainMenuOptions[4] = function ()
    TextRender.PrintScreen(TextPumping.GetText("main-menu/info"))

    TextRender.PrintInfoMessage("Чтобы вернуться назад, нажмите любую клавишу")
    TextRender.WaitForInput()
end

handleMainMenuOptions[5] = function ()
    TextRender.ClearScreen()
    os.exit()
end


TextRender.MakeNumberedChoice(
    TextPumping.GetText("main-menu/options"),
    handleMainMenuOptions
)