-- load modules

-- variables

local COLORS = {
    RED = "\27[31m",
    GREEN = "\27[32m",
    YELLOW = "\27[33m",
    BLUE = "\27[34m",
    GREY = "\27[30m",
    
    RESET = "\27[0m",
}

local function clear_screen()
    os.execute("clear")
end

local function wait_for_input(isNumber)
    io.write(COLORS.YELLOW.."\n> "..COLORS.RESET); io.flush()
    return io.read(isNumber and "n")
end

-- TODO: Add logic
local function PrintMenu()
    clear_screen()
    print(COLORS.GREY..string.rep("=", 50)..COLORS.RESET)

    print("Бетонное приключение "..COLORS.RED.."[В разработке]"..COLORS.RESET)
    print("Сделано Платоном Акуловым")

    print("\n1. Новая игра")
    print("2. Загрузить сохранение")
    print("3. Настройки")
    print("4. Об игре")

    print(COLORS.GREY..string.rep("=", 50)..COLORS.RESET)
end

local chosenOption = ""
while true do
    PrintMenu()
    chosenOption = wait_for_input("n")

    -- Just a test
    if chosenOption == 1 then
        print("Loading...")
        break
    end
end