local test = REPENTOGON_TEST

local BossPoolTest = {}

function BossPoolTest:BeforeEach()
	return BossPoolManager.GetPool(1)
end

function BossPoolTest:AfterEach(bosspool)
	
end

----------

function BossPoolTest:TestGetDoubleTroubleRoomID(bosspool)
	bosspool:GetDoubleTroubleRoomID()
end

function BossPoolTest:TestGetEntries(bosspool)
	bosspool:GetEntries()
end

function BossPoolTest:TestGetName(bosspool)
	bosspool:GetName()
end

function BossPoolTest:TestGetRNG(bosspool)
	bosspool:GetRNG()
end

function BossPoolTest:TestGetWeight(bosspool)
	bosspool:GetWeight()
end


return BossPoolTest
