local test = REPENTOGON_TEST

local CostumeSpriteDescTest = {}

function CostumeSpriteDescTest:BeforeEach()
	if not Isaac.GetPlayer():GetCostumeSpriteDescs()[1] then
		Isaac.GetPlayer():AddCollectible(1)
	end
	return Isaac.GetPlayer():GetCostumeSpriteDescs()[1]
end

function CostumeSpriteDescTest:AfterEach(costumespritedesc)
	
end

----------

function CostumeSpriteDescTest:TestCanOverwriteColor(costumespritedesc)
	costumespritedesc:CanOverwriteColor()
end

function CostumeSpriteDescTest:TestGetBodyColor(costumespritedesc)
	costumespritedesc:GetBodyColor()
end

function CostumeSpriteDescTest:TestGetHeadColor(costumespritedesc)
	costumespritedesc:GetHeadColor()
end

function CostumeSpriteDescTest:TestGetItemConfig(costumespritedesc)
	costumespritedesc:GetItemConfig()
end

function CostumeSpriteDescTest:TestGetPlayerType(costumespritedesc)
	costumespritedesc:GetPlayerType()
end

function CostumeSpriteDescTest:TestGetPriority(costumespritedesc)
	costumespritedesc:GetPriority()
end

function CostumeSpriteDescTest:TestGetSprite(costumespritedesc)
	costumespritedesc:GetSprite()
end

function CostumeSpriteDescTest:TestHasOverlay(costumespritedesc)
	costumespritedesc:HasOverlay()
end

function CostumeSpriteDescTest:TestHasSkinAlt(costumespritedesc)
	costumespritedesc:HasSkinAlt()
end

function CostumeSpriteDescTest:TestIsFlying(costumespritedesc)
	costumespritedesc:IsFlying()
end

function CostumeSpriteDescTest:TestIsItemAnimPlaying(costumespritedesc)
	costumespritedesc:IsItemAnimPlaying()
end

function CostumeSpriteDescTest:TestIsItemStateOnly(costumespritedesc)
	costumespritedesc:IsItemStateOnly()
end


return CostumeSpriteDescTest
