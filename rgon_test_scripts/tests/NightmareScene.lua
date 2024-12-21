local test = REPENTOGON_TEST

local NightmareSceneTest = {}

function NightmareSceneTest:BeforeEach()
	
end

function NightmareSceneTest:AfterEach()
	
end

----------

function NightmareSceneTest:TestGetBackgroundSprite()
	NightmareScene.GetBackgroundSprite()
end

function NightmareSceneTest:TestGetBubbleSprite()
	NightmareScene.GetBubbleSprite()
end

function NightmareSceneTest:TestGetPlayerExtraPortraitSprite()
	NightmareScene.GetPlayerExtraPortraitSprite()
end

function NightmareSceneTest:TestGetProgressBarMap()
	NightmareScene.GetProgressBarMap()
end

function NightmareSceneTest:TestGetProgressBarSprite()
	NightmareScene.GetProgressBarSprite()
end

function NightmareSceneTest:TestIsDogmaNightmare()
	NightmareScene.IsDogmaNightmare()
end


return NightmareSceneTest
