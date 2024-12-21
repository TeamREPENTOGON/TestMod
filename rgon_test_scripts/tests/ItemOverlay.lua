local test = REPENTOGON_TEST

local ItemOverlayTest = {}

function ItemOverlayTest:BeforeEach()
	
end

function ItemOverlayTest:AfterEach()
	
end

----------

function ItemOverlayTest:TestGetDelay()
	ItemOverlay.GetDelay()
end

function ItemOverlayTest:TestGetMegaMushPlayerSprite()
	ItemOverlay.GetMegaMushPlayerSprite()
end

function ItemOverlayTest:TestGetOverlayID()
	ItemOverlay.GetOverlayID()
end

function ItemOverlayTest:TestGetPlayer()
	ItemOverlay.GetPlayer()
end

function ItemOverlayTest:TestGetSprite()
	ItemOverlay.GetSprite()
end

function ItemOverlayTest:TestShow()
	local giantbookid = 1
	local delay = 1
	local entityplayer = Isaac.GetPlayer()
	ItemOverlay.Show(giantbookid, delay, entityplayer)
end


return ItemOverlayTest
