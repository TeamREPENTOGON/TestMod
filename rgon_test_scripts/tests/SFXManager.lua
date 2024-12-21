local test = REPENTOGON_TEST

local SFXManagerTest = {}

function SFXManagerTest:BeforeEach()
	return SFXManager()
end

function SFXManagerTest:AfterEach(sfxmanager)
	
end

----------

function SFXManagerTest:TestAdjustPitch(sfxmanager)
	local id = 1
	local pitch = 1
	sfxmanager:AdjustPitch(id, pitch)
end

function SFXManagerTest:TestAdjustVolume(sfxmanager)
	local id = 1
	local volume = 1
	sfxmanager:AdjustVolume(id, volume)
end

function SFXManagerTest:TestGetAmbientSoundVolume(sfxmanager)
	local id = 1
	sfxmanager:GetAmbientSoundVolume(id)
end

function SFXManagerTest:TestIsPlaying(sfxmanager)
	local id = 1
	sfxmanager:IsPlaying(id)
end

function SFXManagerTest:TestPlay(sfxmanager)
	local id = 1
	local volume = 1
	local framedelay = 1
	local loop = true
	local pitch = 1
	local pan = 1
	sfxmanager:Play(id, volume, framedelay, loop, pitch, pan)
end

function SFXManagerTest:TestPreload(sfxmanager)
	local id = 1
	sfxmanager:Preload(id)
end

function SFXManagerTest:TestSetAmbientSound(sfxmanager)
	local id = 1
	local volume = 1
	local pitch = 1
	sfxmanager:SetAmbientSound(id, volume, pitch)
end

function SFXManagerTest:TestStop(sfxmanager)
	local id = 1
	sfxmanager:Stop(id)
end

function SFXManagerTest:TestStopLoopingSounds(sfxmanager)
	sfxmanager:StopLoopingSounds()
end


return SFXManagerTest
