local test = REPENTOGON_TEST

local PlayerTypesActiveItemDescTest = {}

function PlayerTypesActiveItemDescTest:BeforeEach()
	return Isaac.GetPlayer():GetActiveItemDesc()
end

function PlayerTypesActiveItemDescTest:AfterEach(playertypesactiveitemdesc)
	
end

----------

function PlayerTypesActiveItemDescTest:TestVarBatteryCharge(playertypesactiveitemdesc)
	local originalVal = playertypesactiveitemdesc.BatteryCharge
	for _, val in pairs(test.TestInts) do
		playertypesactiveitemdesc.BatteryCharge = val
		test.AssertEquals(playertypesactiveitemdesc.BatteryCharge, val)
	end
	playertypesactiveitemdesc.BatteryCharge = originalVal
end

function PlayerTypesActiveItemDescTest:TestVarCharge(playertypesactiveitemdesc)
	local originalVal = playertypesactiveitemdesc.Charge
	for _, val in pairs(test.TestInts) do
		playertypesactiveitemdesc.Charge = val
		test.AssertEquals(playertypesactiveitemdesc.Charge, val)
	end
	playertypesactiveitemdesc.Charge = originalVal
end

function PlayerTypesActiveItemDescTest:TestVarItem(playertypesactiveitemdesc)
	local originalVal = playertypesactiveitemdesc.Item
	for _, val in pairs(test.TestInts) do
		playertypesactiveitemdesc.Item = val
		test.AssertEquals(playertypesactiveitemdesc.Item, val)
	end
	playertypesactiveitemdesc.Item = originalVal
end

function PlayerTypesActiveItemDescTest:TestVarPartialCharge(playertypesactiveitemdesc)
	local originalVal = playertypesactiveitemdesc.PartialCharge
	for _, val in pairs(test.TestFloats) do
		playertypesactiveitemdesc.PartialCharge = val
		test.AssertEquals(playertypesactiveitemdesc.PartialCharge, val)
	end
	playertypesactiveitemdesc.PartialCharge = originalVal
end

function PlayerTypesActiveItemDescTest:TestVarSubCharge(playertypesactiveitemdesc)
	local originalVal = playertypesactiveitemdesc.SubCharge
	for _, val in pairs(test.TestInts) do
		playertypesactiveitemdesc.SubCharge = val
		test.AssertEquals(playertypesactiveitemdesc.SubCharge, val)
	end
	playertypesactiveitemdesc.SubCharge = originalVal
end

function PlayerTypesActiveItemDescTest:TestVarTimedRechargeCooldown(playertypesactiveitemdesc)
	local originalVal = playertypesactiveitemdesc.TimedRechargeCooldown
	for _, val in pairs(test.TestInts) do
		playertypesactiveitemdesc.TimedRechargeCooldown = val
		test.AssertEquals(playertypesactiveitemdesc.TimedRechargeCooldown, val)
	end
	playertypesactiveitemdesc.TimedRechargeCooldown = originalVal
end

function PlayerTypesActiveItemDescTest:TestVarVarData(playertypesactiveitemdesc)
	local originalVal = playertypesactiveitemdesc.VarData
	for _, val in pairs(test.TestInts) do
		playertypesactiveitemdesc.VarData = val
		test.AssertEquals(playertypesactiveitemdesc.VarData, val)
	end
	playertypesactiveitemdesc.VarData = originalVal
end


return PlayerTypesActiveItemDescTest
