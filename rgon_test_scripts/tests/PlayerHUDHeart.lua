local test = REPENTOGON_TEST

local PlayerHUDHeartTest = {}

function PlayerHUDHeartTest:BeforeEach()
	return Game():GetHUD():GetPlayerHUD(0):GetHearts()[1]
end

function PlayerHUDHeartTest:AfterEach(playerhudheart)
	
end

----------

function PlayerHUDHeartTest:TestGetFlashType(playerhudheart)
	playerhudheart:GetFlashType()
end

function PlayerHUDHeartTest:TestGetHeartAnim(playerhudheart)
	playerhudheart:GetHeartAnim()
end

function PlayerHUDHeartTest:TestGetHeartOverlayAnim(playerhudheart)
	playerhudheart:GetHeartOverlayAnim()
end

function PlayerHUDHeartTest:TestIsEternalHeartOverlayVisible(playerhudheart)
	playerhudheart:IsEternalHeartOverlayVisible()
end

function PlayerHUDHeartTest:TestIsFadingHeart(playerhudheart)
	playerhudheart:IsFadingHeart()
end

function PlayerHUDHeartTest:TestIsGoldenHeartOverlayVisible(playerhudheart)
	playerhudheart:IsGoldenHeartOverlayVisible()
end

function PlayerHUDHeartTest:TestIsVisible(playerhudheart)
	playerhudheart:IsVisible()
end


return PlayerHUDHeartTest
