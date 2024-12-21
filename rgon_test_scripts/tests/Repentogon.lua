local test = REPENTOGON_TEST

local RepentogonTest = {}

function RepentogonTest:BeforeEach()
	return REPENTOGON
end

function RepentogonTest:AfterEach(repentogon)
	
end

----------

function RepentogonTest:TestMeetsVersion(repentogon)
	local version = "hello"
	repentogon:MeetsVersion(version)
end


return RepentogonTest
