-- local InventoryItem = require("modules.inventory-item")

---@class GameState
---@field stage string
---@field playerName string
---@field inventory InventoryItem[]
---@field irreversibleActions string[]

---@class GameStateProperties
---@field stage? string
---@field playerName? string
---@field inventory? InventoryItem[]
---@field irreversibleActions? string[]

local GameState = {}

---Creates new GameState for later editing, saving and loading
---@param properties? GameStateProperties
---@return GameState
function GameState:new(properties)
    properties = properties or {}

    local instance = {
        stage = properties.stage or "intro",
        playerName = properties.playerName or "",
        inventory = properties.inventory or {},
        irreversibleActions = properties.irreversibleActions or {}
    }

    setmetatable(instance, self)

    return instance
end

---Changes properties of GameState
---@param properties GameStateProperties
function GameState:change_properties(properties)
    for property, value in pairs(properties) do
        self[property] = value
    end
end

return GameState