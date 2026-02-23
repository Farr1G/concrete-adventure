local TextRender = require("modules.text-render")
local TextPumping = require("modules.text-pumping")

-- local InventoryItem = require("modules.inventory-item")
local GameState = require("modules.game-state")
-- save system

local Game = {}

local function ask_player_for_name(gameState)
    local playerName = gameState.playerName

    repeat
        TextRender.clear_screen()
        TextRender.print_info_message("Введите имя")

        playerName = TextRender.wait_for_input()
    until playerName

    gameState.playerName = playerName
end

---@type table<integer, function>
local handleIntroLookAroundOptions = {}

handleIntroLookAroundOptions[1] = function ()
    TextRender.print_screen(TextPumping.get_text("game/intro/look-around/walls"))
    TextRender.wait_to_continue()
end

function Game.startNewGame()
    local newGameSate = GameState:new()

    ask_player_for_name(newGameSate)

    TextRender.print_screen(TextPumping.get_text("game/intro/exposition"))
    TextRender.wait_to_continue()

    TextRender.make_numbered_choise(
        TextPumping.get_text("game/intro/look-around/options"),
        handleIntroLookAroundOptions,
        true
    )

    TextRender.print_screen("Это последнее сообщение на данный момент. Сейчас тебя выкинет в главное меню.")
    TextRender.wait_to_continue()
end

return Game