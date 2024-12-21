local test = REPENTOGON_TEST

local DebugTest = {}

function DebugTest:BeforeEach()
	
end

function DebugTest:AfterEach()
	
end

----------

function DebugTest:TestForceUnload()
	local modulename = "hello"
	Debug.ForceUnload(modulename)
end

function DebugTest:TestGetSignature()
	local address = 1
	Debug.GetSignature(address)
end

function DebugTest:TestListLoadedFiles()
	Debug.ListLoadedFiles()
end


return DebugTest
