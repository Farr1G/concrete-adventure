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

local function print_info_message(str)
    print(COLORS.YELLOW.."\n"..str..COLORS.RESET)
end

local function print_screen(...)
    clear_screen()
    print_divisor()
    print()

    local screen = table.pack(...)
    screen.n = nil

    for _, str in pairs(screen) do
        print(str)
    end

    print()
    print_divisor()
end

-- MAIN MENU

local handleMainMenuOptions = {}

handleMainMenuOptions[3] = function ()
    print_screen(
        "Настройки",
        "Ещё не добавлено"
    )

    print_info_message("Чтобы вернуться назад, нажмите любую клавишу")
    wait_for_input()
end

handleMainMenuOptions[4] = function ()
    print_screen(
        "Бетонное приключение",
        "— это короткое текстовое приключение-квест про попытку пройти через подземную станцию метрополитена, имеющую крайне высокие потолки, сделанную в основном из бетона, в несколько бруталистском стиле."
    )

    print_info_message("Чтобы вернуться назад, нажмите любую клавишу")
    wait_for_input()
end

handleMainMenuOptions[5] = function ()
    clear_screen()
    os.exit()
end

local function print_main_menu_options()
    print_screen(
        "Бетонное приключение "..COLORS.YELLOW.."[В разработке]"..COLORS.RESET,
        "Сделано Платоном Акуловым",

        "\n1. Новая игра",
        "2. Загрузить сохранение",
        "3. Настройки",
        "4. Об игре",
        "5. Выйти"
    )
end

local function PrintMainMenu()
    while true do
        print_main_menu_options()

        local choice = tonumber(wait_for_input())
        local handler = handleMainMenuOptions[choice]

        if handler then
            handler()
        else
            -- print_info_message("Неверный ввод")
            -- TODO: Find a wait module
        end
    end
end

PrintMainMenu()