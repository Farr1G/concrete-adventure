---Main game module
---Launches game menu and (in the future) will handle game logic

-- load modules
local ColorsList = require("modules.colors-list")
local TextRender = require("modules.text-render")

-- MAIN MENU

---@type table<integer, function>
local handleMainMenuOptions = {}

handleMainMenuOptions[3] = function ()
    TextRender.print_screen(
        "Настройки",
        "Ещё не добавлено"
    )

    TextRender.print_info_message("Чтобы вернуться назад, нажмите любую клавишу")
    TextRender.wait_for_input()
end

handleMainMenuOptions[4] = function ()
    TextRender.print_screen(
        "Бетонное приключение",
        "— это короткое текстовое приключение-квест про попытку пройти через подземную станцию метрополитена, имеющую крайне высокие потолки, сделанную в основном из бетона, в несколько бруталистском стиле."
    )

    TextRender.print_info_message("Чтобы вернуться назад, нажмите любую клавишу")
    TextRender.wait_for_input()
end

handleMainMenuOptions[5] = function ()
    TextRender.clear_screen()
    os.exit()
end

---Prints main menu options to inform user
local function print_main_menu_options()
    TextRender.print_screen(
        "Бетонное приключение "..ColorsList.YELLOW.."[В разработке]"..ColorsList.RESET,
        "Сделано Платоном Акуловым",

        "\n1. Новая игра",
        "2. Загрузить сохранение",
        "3. Настройки",
        "4. Об игре",
        "5. Выйти"
    )
end

---Prints main menu options and handles user input
local function PrintMainMenu()
    while true do
        print_main_menu_options()

        local choice = tonumber(TextRender.wait_for_input())
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