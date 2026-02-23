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
    Game.startNewGame()
end

handleMainMenuOptions[3] = function ()
    TextRender.print_screen(TextPumping.get_text("main-menu/settings"))

    TextRender.print_info_message("Чтобы вернуться назад, нажмите любую клавишу")
    TextRender.wait_for_input()
end

handleMainMenuOptions[4] = function ()
    TextRender.print_screen(TextPumping.get_text("main-menu/info"))

    TextRender.print_info_message("Чтобы вернуться назад, нажмите любую клавишу")
    TextRender.wait_for_input()
end

handleMainMenuOptions[5] = function ()
    TextRender.clear_screen()
    os.exit()
end


TextRender.make_numbered_choise(
    TextPumping.get_text("main-menu/options"),
    handleMainMenuOptions
)