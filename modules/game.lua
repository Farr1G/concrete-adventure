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

---@type table<string, function>
local handleStages = {}

function Game.startNewGame()
    local newGameSate = GameState:new()

    ask_player_for_name(newGameSate)

    print(newGameSate.playerName)
    TextRender.wait_for_input()
end

return Game