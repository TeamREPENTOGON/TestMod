local test = REPENTOGON_TEST

local ConsoleTest = {}

function ConsoleTest:BeforeEach()
	
end

function ConsoleTest:AfterEach()
	
end

----------

function ConsoleTest:TestGetCommandHistory()
	Console.GetCommandHistory()
end

function ConsoleTest:TestGetHistory()
	Console.GetHistory()
end

function ConsoleTest:TestPopHistory()
	Console.PopHistory(0)
end

function ConsoleTest:TestPrintError()
	local err = "This is a test!"
	Console.PrintError(err)
end

function ConsoleTest:TestPrintWarning()
	local warning = "This is a test!\n"
	Console.PrintWarning(warning)
end

function ConsoleTest:TestRegisterCommand()
	local name = "hello"
	local desc = "hello"
	local helptext = "hello"
	local showonmenu = true
	local autocompletetype = 1
	Console.RegisterCommand(name, desc, helptext, showonmenu, autocompletetype)
end

function ConsoleTest:TestRegisterMacro()
	local name = "hello"
	local commands = {"hello"}
	Console.RegisterMacro(name, commands)
end


return ConsoleTest
