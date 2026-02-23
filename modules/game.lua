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

function Game.startNewGame()
    local newGameSate = GameState:new()

    ask_player_for_name(newGameSate)

    TextRender.make_numbered_choise(
        TextPumping.get_text("game-intro"),
        handleIntroLookAroundOptions,
        true
    )

    -- TextRender.wait_to_continue()
end

return Game