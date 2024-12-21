local test = REPENTOGON_TEST

local TemporaryEffectsTest = {}

function TemporaryEffectsTest:BeforeEach()
	return Isaac.GetPlayer():GetEffects()
end

function TemporaryEffectsTest:AfterEach(temporaryeffects)
	
end

----------

function TemporaryEffectsTest:TestAddCollectibleEffect(temporaryeffects)
	local collectibletype = 1
	local addcostume = true
	local count = 1
	temporaryeffects:AddCollectibleEffect(collectibletype, addcostume, count)
end

function TemporaryEffectsTest:TestAddNullEffect(temporaryeffects)
	local nullid = 1
	local addcostume = true
	local count = 1
	temporaryeffects:AddNullEffect(nullid, addcostume, count)
end

function TemporaryEffectsTest:TestAddTrinketEffect(temporaryeffects)
	local trinkettype = 1
	local addcostume = true
	local count = 1
	temporaryeffects:AddTrinketEffect(trinkettype, addcostume, count)
end

function TemporaryEffectsTest:TestClearEffects(temporaryeffects)
	temporaryeffects:ClearEffects()
end

function TemporaryEffectsTest:TestGetCollectibleEffect(temporaryeffects)
	local collectibletype = 1
	temporaryeffects:GetCollectibleEffect(collectibletype)
end

function TemporaryEffectsTest:TestGetCollectibleEffectNum(temporaryeffects)
	local collectibletype = 1
	temporaryeffects:GetCollectibleEffectNum(collectibletype)
end

function TemporaryEffectsTest:TestGetEffectsList(temporaryeffects)
	temporaryeffects:GetEffectsList()
end

function TemporaryEffectsTest:TestGetNullEffect(temporaryeffects)
	local nullid = 1
	temporaryeffects:GetNullEffect(nullid)
end

function TemporaryEffectsTest:TestGetNullEffectNum(temporaryeffects)
	local nullid = 1
	temporaryeffects:GetNullEffectNum(nullid)
end

function TemporaryEffectsTest:TestGetTrinketEffect(temporaryeffects)
	local trinkettype = 1
	temporaryeffects:GetTrinketEffect(trinkettype)
end

function TemporaryEffectsTest:TestGetTrinketEffectNum(temporaryeffects)
	local trinkettype = 1
	temporaryeffects:GetTrinketEffectNum(trinkettype)
end

function TemporaryEffectsTest:TestHasCollectibleEffect(temporaryeffects)
	local collectibletype = 1
	temporaryeffects:HasCollectibleEffect(collectibletype)
end

function TemporaryEffectsTest:TestHasNullEffect(temporaryeffects)
	local nullid = 1
	temporaryeffects:HasNullEffect(nullid)
end

function TemporaryEffectsTest:TestHasTrinketEffect(temporaryeffects)
	local trinkettype = 1
	temporaryeffects:HasTrinketEffect(trinkettype)
end

function TemporaryEffectsTest:TestRemoveCollectibleEffect(temporaryeffects)
	local collectibletype = 1
	local count = 1
	temporaryeffects:RemoveCollectibleEffect(collectibletype, count)
end

function TemporaryEffectsTest:TestRemoveNullEffect(temporaryeffects)
	local nullid = 1
	local count = 1
	temporaryeffects:RemoveNullEffect(nullid, count)
end

function TemporaryEffectsTest:TestRemoveTrinketEffect(temporaryeffects)
	local trinkettype = 1
	local count = 1
	temporaryeffects:RemoveTrinketEffect(trinkettype, count)
end


return TemporaryEffectsTest
