-- load modules
-- …

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

local function print_info_message(message)
    print(COLORS.YELLOW.."\n"..message..COLORS.RESET)
end

-- MAIN MENU

local handleMainMenuOptions = {}

local function PrintMainMenuOptions()
    clear_screen()
    print_divisor()
    print()

    print("Бетонное приключение "..COLORS.YELLOW.."[В разработке]"..COLORS.RESET)
    print("Сделано Платоном Акуловым")

    print("\n1. Новая игра")
    print("2. Загрузить сохранение")
    print("3. Настройки")
    print("4. Об игре")
    print("5. Выйти")

    print()
    print_divisor()
end

local function PrintMainMenu()
    local chosenOption = 0
    
    while true do
        PrintMainMenuOptions()
        chosenOption = tonumber(wait_for_input())

        if handleMainMenuOptions[chosenOption] ~= nil then
            break
        end
    end

    handleMainMenuOptions[chosenOption]()
end

handleMainMenuOptions[4] = function ()
    clear_screen()
    print_divisor()
    print()

    print("Бетонное приключение")
    print([=[— это короткое текстовое приключение-квест про попытку пройти через подземную станцию метрополитена, имеющую крайне высокие потолки, сделанную в основном из бетона, в несколько бруталистском стиле.]=])

    print()
    print_divisor()

    print_info_message("Чтобы вернуться назад, нажмите любую клавишу")
    wait_for_input()

    PrintMainMenu()
end

handleMainMenuOptions[5] = function ()
    clear_screen()
    os.execute("exit")
end

PrintMainMenu()