local test = REPENTOGON_TEST

local InputTest = {}

function InputTest:BeforeEach()
	
end

function InputTest:AfterEach()
	
end

----------

function InputTest:TestGetActionValue()
	local action = 1
	local controllerid = 1
	Input.GetActionValue(action, controllerid)
end

function InputTest:TestGetButtonValue()
	local button = 1
	local controllerid = 1
	Input.GetButtonValue(button, controllerid)
end

function InputTest:TestGetMousePosition()
	local gamecoords = true
	Input.GetMousePosition(gamecoords)
end

function InputTest:TestIsActionPressed()
	local action = 1
	local controllerid = 1
	Input.IsActionPressed(action, controllerid)
end

function InputTest:TestIsActionTriggered()
	local action = 1
	local controllerid = 1
	Input.IsActionTriggered(action, controllerid)
end

function InputTest:TestIsButtonPressed()
	local button = 1
	local controllerid = 1
	Input.IsButtonPressed(button, controllerid)
end

function InputTest:TestIsButtonTriggered()
	local button = 1
	local controllerid = 1
	Input.IsButtonTriggered(button, controllerid)
end

function InputTest:TestIsMouseBtnPressed()
	local button = 1
	Input.IsMouseBtnPressed(button)
end

function InputTest:TestGetDeviceNameByIdx()
	local controlleridx = 1
	Input.GetDeviceNameByIdx(controlleridx)
end

function InputTest:TestGetMouseWheel()
	Input.GetMouseWheel()
end


return InputTest
