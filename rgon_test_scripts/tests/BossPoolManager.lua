local test = REPENTOGON_TEST

local BossPoolManagerTest = {}

function BossPoolManagerTest:BeforeEach()
	
end

function BossPoolManagerTest:AfterEach()
	
end

----------

function BossPoolManagerTest:TestGetPool()
	local stbtype = 1
	BossPoolManager.GetPool(stbtype)
end

function BossPoolManagerTest:TestGetRemovedBosses()
	BossPoolManager.GetRemovedBosses()
end

function BossPoolManagerTest:TestGetRemovedSpecialBosses()
	BossPoolManager.GetRemovedSpecialBosses()
end


return BossPoolManagerTest
