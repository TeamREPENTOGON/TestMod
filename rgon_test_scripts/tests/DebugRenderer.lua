local test = REPENTOGON_TEST

local DebugRendererTest = {}

function DebugRendererTest:BeforeEach()
	
end

function DebugRendererTest:AfterEach()
	
end

----------

function DebugRendererTest:TestGet()
	local index = 1
	local unknown = true
	DebugRenderer.Get(index, unknown)
end


return DebugRendererTest
