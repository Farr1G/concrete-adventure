-- load modules

-- variables

-- Redo by using https://github.com/hoelzro/lua-term
-- http://lua-users.org/wiki/AnsiTerminalColors
local COLORS = {
    RED = "\27[31m",
    GREEN = "\27[32m",
    YELLOW = "\27[33m",
    BLUE = "\27[34m",

    DIM = "\27[2m",
    
    RESET = "\27[0m",
}

local function clear_screen()
    os.execute("clear")
end

local function wait_for_input()
    io.write(COLORS.YELLOW.."\n> "..COLORS.RESET); io.flush()
    return io.read()
end

local function print_divisor()
    print(COLORS.DIM..string.rep("=", 50)..COLORS.RESET)
end

-- TODO: Add logic
local function PrintMenu()
    clear_screen()
    print_divisor()
    print("")

    print("Бетонное приключение "..COLORS.YELLOW.."[В разработке]"..COLORS.RESET)
    print("Сделано Платоном Акуловым")

    print("\n1. Новая игра")
    print("2. Загрузить сохранение")
    print("3. Настройки")
    print("4. Об игре")
    print("5. Выйти")

    print("")
    print_divisor()
end

local chosenOption = 0
while true do
    PrintMenu()
    chosenOption = tonumber(wait_for_input())

    -- Just a test
    if chosenOption == 1 then
        print("Loading...")
        break
    end
end