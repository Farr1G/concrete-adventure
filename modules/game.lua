local TextRender = require("modules.text-render")
local TextPumping = require("modules.text-pumping")

-- local InventoryItem = require("modules.inventory-item")
local GameState = require("modules.game-state")
-- save system

local Game = {}

local function ask_player_for_name(gameState)
    local playerName = gameState.playerName

    repeat
        TextRender.ClearScreen()
        TextRender.PrintInfoMessage("Введите имя")

        playerName = TextRender.WaitForInput()
    until playerName

    gameState.playerName = playerName
end

---@type table<integer, function>
local handleIntroLookAroundOptions = {}

handleIntroLookAroundOptions[1] = function ()
    TextRender.PrintScreen(TextPumping.GetText("game/intro/look-around/walls"))
    TextRender.WaitToContinue()
end

handleIntroLookAroundOptions[2] = function ()
    TextRender.PrintScreen(TextPumping.GetText("game/intro/look-around/ceiling"))
    TextRender.WaitToContinue()
end

handleIntroLookAroundOptions[3] = function ()
    TextRender.PrintScreen(TextPumping.GetText("game/intro/look-around/phone"))
    TextRender.WaitToContinue()
end

handleIntroLookAroundOptions[4] = function ()
    TextRender.PrintScreen(TextPumping.GetText("game/intro/look-around/bottom"))
    TextRender.WaitToContinue()
end

---@type table<integer, function>
local handleIntroCafeOptions = {}

handleIntroCafeOptions[1] = function ()
    
end

handleIntroCafeOptions[2] = function ()
    
end

function Game.StartNewGame()
    local newGameSate = GameState:New()

    ask_player_for_name(newGameSate)

    TextRender.PrintScreen(TextPumping.GetText("game/intro/exposition"))
    TextRender.WaitToContinue()

    TextRender.MakeNumberedChoice(
        TextPumping.GetText("game/intro/look-around/options"),
        handleIntroLookAroundOptions,
        true
    )

    TextRender.PrintScreen(TextPumping.GetText("game/intro/arrived-to-bottom"))
    TextRender.WaitToContinue()

    TextRender.MakeNumberedChoice(
        TextPumping.GetText("game/intro/cafe/options"),
        handleIntroCafeOptions,
        true
    )

    TextRender.PrintScreen("Это последнее сообщение на данный момент. Сейчас тебя выкинет в главное меню.")
    TextRender.WaitToContinue()
end

return Game