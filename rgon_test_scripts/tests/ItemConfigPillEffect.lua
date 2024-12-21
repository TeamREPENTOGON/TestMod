local test = REPENTOGON_TEST

local ItemConfigPillEffectTest = {}

function ItemConfigPillEffectTest:BeforeEach()
	return Isaac.GetItemConfig():GetPillEffect(PillEffect.PILLEFFECT_BAD_GAS)
end

function ItemConfigPillEffectTest:AfterEach(itemconfigpilleffect)
	
end

----------

function ItemConfigPillEffectTest:TestIsAvailable(itemconfigpilleffect)
	itemconfigpilleffect:IsAvailable()
end

function ItemConfigPillEffectTest:TestVarAchievementID(itemconfigpilleffect)
	local originalVal = itemconfigpilleffect.AchievementID
	for _, val in pairs(test.TestInts) do
		itemconfigpilleffect.AchievementID = val
		test.AssertEquals(itemconfigpilleffect.AchievementID, val)
	end
	itemconfigpilleffect.AchievementID = originalVal
end

function ItemConfigPillEffectTest:TestVarAnnouncerDelay(itemconfigpilleffect)
	local originalVal = itemconfigpilleffect.AnnouncerDelay
	for _, val in pairs(test.TestInts) do
		itemconfigpilleffect.AnnouncerDelay = val
		test.AssertEquals(itemconfigpilleffect.AnnouncerDelay, val)
	end
	itemconfigpilleffect.AnnouncerDelay = originalVal
end

function ItemConfigPillEffectTest:TestVarAnnouncerVoice(itemconfigpilleffect)
	local originalVal = itemconfigpilleffect.AnnouncerVoice
	for _, val in pairs(test.TestInts) do
		itemconfigpilleffect.AnnouncerVoice = val
		test.AssertEquals(itemconfigpilleffect.AnnouncerVoice, val)
	end
	itemconfigpilleffect.AnnouncerVoice = originalVal
end

function ItemConfigPillEffectTest:TestVarAnnouncerVoiceSuper(itemconfigpilleffect)
	local originalVal = itemconfigpilleffect.AnnouncerVoiceSuper
	for _, val in pairs(test.TestInts) do
		itemconfigpilleffect.AnnouncerVoiceSuper = val
		test.AssertEquals(itemconfigpilleffect.AnnouncerVoiceSuper, val)
	end
	itemconfigpilleffect.AnnouncerVoiceSuper = originalVal
end

-- These are basically const right now, but idk if they should be?
function ItemConfigPillEffectTest:TestVarEffectClass(itemconfigpilleffect)
	local originalVal = itemconfigpilleffect.EffectClass
	--[[for _, val in pairs(test.TestInts) do
		itemconfigpilleffect.EffectClass = val
		test.AssertEquals(itemconfigpilleffect.EffectClass, val)
	end
	itemconfigpilleffect.EffectClass = originalVal]]
end
function ItemConfigPillEffectTest:TestVarEffectSubClass(itemconfigpilleffect)
	local originalVal = itemconfigpilleffect.EffectSubClass
	--[[for _, val in pairs(test.TestInts) do
		itemconfigpilleffect.EffectSubClass = val
		test.AssertEquals(itemconfigpilleffect.EffectSubClass, val)
	end
	itemconfigpilleffect.EffectSubClass = originalVal]]
end

function ItemConfigPillEffectTest:TestVarGreedModeAllowed(itemconfigpilleffect)
	local originalVal = itemconfigpilleffect.GreedModeAllowed
	itemconfigpilleffect.GreedModeAllowed = true
	itemconfigpilleffect.GreedModeAllowed = originalVal
end

function ItemConfigPillEffectTest:TestVarID(itemconfigpilleffect)
	local originalVal = itemconfigpilleffect.ID
	for _, val in pairs(test.TestInts) do
		itemconfigpilleffect.ID = val
		test.AssertEquals(itemconfigpilleffect.ID, val)
	end
	itemconfigpilleffect.ID = originalVal
end

function ItemConfigPillEffectTest:TestVarMimicCharge(itemconfigpilleffect)
	local originalVal = itemconfigpilleffect.MimicCharge
	for _, val in pairs(test.TestInts) do
		itemconfigpilleffect.MimicCharge = val
		test.AssertEquals(itemconfigpilleffect.MimicCharge, val)
	end
	itemconfigpilleffect.MimicCharge = originalVal
end

function ItemConfigPillEffectTest:TestVarName(itemconfigpilleffect)
	local originalVal = itemconfigpilleffect.Name
	for _, val in pairs(test.TestStrings) do
		itemconfigpilleffect.Name = val
		test.AssertEquals(itemconfigpilleffect.Name, val)
	end
	itemconfigpilleffect.Name = originalVal
end


return ItemConfigPillEffectTest
