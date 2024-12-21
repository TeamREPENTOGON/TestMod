local test = REPENTOGON_TEST

local MusicManagerTest = {}

function MusicManagerTest:BeforeEach()
	return MusicManager()
end

function MusicManagerTest:AfterEach(musicmanager)
	
end

----------

function MusicManagerTest:TestCrossfade(musicmanager)
	local musicid = 1
	local faderate = 1
	musicmanager:Crossfade(musicid, faderate)
end

function MusicManagerTest:TestDisable(musicmanager)
	musicmanager:Disable()
end

function MusicManagerTest:TestDisableLayer(musicmanager)
	local layerid = 1
	musicmanager:DisableLayer(layerid)
end

function MusicManagerTest:TestEnable(musicmanager)
	musicmanager:Enable()
end

function MusicManagerTest:TestEnableLayer(musicmanager)
	local layerid = 1
	local instant = true
	musicmanager:EnableLayer(layerid, instant)
end

function MusicManagerTest:TestFadein(musicmanager)
	local musicid = 1
	local volume = 1
	local _volume = 1
	musicmanager:Fadein(musicid, volume, _volume)
end

function MusicManagerTest:TestFadeout(musicmanager)
	local faderate = 1
	musicmanager:Fadeout(faderate)
end

function MusicManagerTest:TestGetCurrentMusicID(musicmanager)
	musicmanager:GetCurrentMusicID()
end

function MusicManagerTest:TestGetQueuedMusicID(musicmanager)
	musicmanager:GetQueuedMusicID()
end

function MusicManagerTest:TestIsEnabled(musicmanager)
	musicmanager:IsEnabled()
end

function MusicManagerTest:TestIsLayerEnabled(musicmanager)
	local layerid = 1
	musicmanager:IsLayerEnabled(layerid)
end

function MusicManagerTest:TestPause(musicmanager)
	musicmanager:Pause()
end

function MusicManagerTest:TestPitchSlide(musicmanager)
	local targetpitch = 1
	musicmanager:PitchSlide(targetpitch)
end

function MusicManagerTest:TestPlay(musicmanager)
	local musicid = 1
	local volume = 1
	musicmanager:Play(musicid, volume)
end

function MusicManagerTest:TestQueue(musicmanager)
	local id = 1
	musicmanager:Queue(id)
end

function MusicManagerTest:TestResetPitch(musicmanager)
	musicmanager:ResetPitch()
end

function MusicManagerTest:TestResume(musicmanager)
	musicmanager:Resume()
end

function MusicManagerTest:TestUpdateVolume(musicmanager)
	musicmanager:UpdateVolume()
end

function MusicManagerTest:TestVolumeSlide(musicmanager)
	local targetvolume = 1
	local faderate = 1
	musicmanager:VolumeSlide(targetvolume, faderate)
end

function MusicManagerTest:TestPlayJingle(musicmanager)
	local musicid = 1
	musicmanager:PlayJingle(musicid)
end

function MusicManagerTest:TestSetCurrentPitch(musicmanager)
	local originalVal = musicmanager:GetCurrentPitch()
	for _, val in pairs(test.TestFloats) do
		musicmanager:SetCurrentPitch(val)
		test.AssertEquals(musicmanager:GetCurrentPitch(), val)
	end
	musicmanager:SetCurrentPitch(originalVal)
end

function MusicManagerTest:TestStopJingle(musicmanager)
	musicmanager:StopJingle()
end


return MusicManagerTest
