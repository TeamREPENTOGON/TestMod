local test = REPENTOGON_TEST

local BitSet128Test = {}

function BitSet128Test:BeforeEach()
	return BitSet128()
end

function BitSet128Test:AfterEach(bitset128)
	
end

----------

function BitSet128Test:TestGet(bitset128)
	local bitposition = 1
	bitset128:Get(bitposition)
end

function BitSet128Test:TestSet(bitset128)
	local bitposition = 1
	local state = true
	bitset128:Set(bitposition, state)
end

function BitSet128Test:TestVarh(bitset128)
	local originalVal = bitset128.h
	for _, val in pairs(test.TestInts) do
		bitset128.h = val
		test.AssertEquals(bitset128.h, val)
	end
	bitset128.h = originalVal
end

function BitSet128Test:TestVarl(bitset128)
	local originalVal = bitset128.l
	for _, val in pairs(test.TestInts) do
		bitset128.l = val
		test.AssertEquals(bitset128.l, val)
	end
	bitset128.l = originalVal
end


return BitSet128Test
