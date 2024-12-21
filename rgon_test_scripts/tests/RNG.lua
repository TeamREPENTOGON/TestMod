local test = REPENTOGON_TEST

local RNGTest = {}

function RNGTest:BeforeEach()
	return RNG()
end

function RNGTest:AfterEach(rng)
	
end

----------

function RNGTest:TestGetSeed(rng)
	rng:GetSeed()
end

function RNGTest:TestNext(rng)
	rng:Next()
end

function RNGTest:TestRandomFloat(rng)
	rng:RandomFloat()
end

function RNGTest:TestRandomInt(rng)
	local min = 1
	local max = 1
	rng:RandomInt(min, max)
end

function RNGTest:TestSetSeed(rng)
	local seed = 1
	local shiftidx = 1
	rng:SetSeed(seed, shiftidx)
end

function RNGTest:TestGetShiftIdx(rng)
	rng:GetShiftIdx()
end

function RNGTest:TestPhantomFloat(rng)
	rng:PhantomFloat()
end

function RNGTest:TestPhantomInt(rng)
	local max = 1
	rng:PhantomInt(max)
end

function RNGTest:TestPhantomNext(rng)
	rng:PhantomNext()
end

function RNGTest:TestPhantomPrevious(rng)
	rng:PhantomPrevious()
end

function RNGTest:TestPhantomVector(rng)
	rng:PhantomVector()
end

function RNGTest:TestPrevious(rng)
	rng:Previous()
end

function RNGTest:TestRandomVector(rng)
	rng:RandomVector()
end


return RNGTest
