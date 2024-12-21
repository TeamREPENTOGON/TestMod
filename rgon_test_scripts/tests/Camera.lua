local test = REPENTOGON_TEST

local CameraTest = {}

function CameraTest:BeforeEach()
	return Game():GetRoom():GetCamera()
end

function CameraTest:AfterEach(camera)
	
end

----------

function CameraTest:TestIsPosVisible(camera)
	local pos = Vector(1,1)
	camera:IsPosVisible(pos)
end

function CameraTest:TestSetFocusPosition(camera)
	local pos = Vector(1,1)
	camera:SetFocusPosition(pos)
end

function CameraTest:TestSnapToPosition(camera)
	local pos = Vector(1,1)
	camera:SnapToPosition(pos)
end

function CameraTest:TestUpdate(camera)
	local flag = true
	camera:Update(flag)
end


return CameraTest
