local test = REPENTOGON_TEST

local GenericPromptTest = {}

function GenericPromptTest:BeforeEach()
	return GenericPrompt()
end

function GenericPromptTest:AfterEach(genericprompt)
	
end

----------

function GenericPromptTest:TestGetCurrentSelection(genericprompt)
	genericprompt:GetCurrentSelection()
end

function GenericPromptTest:TestGetSprite(genericprompt)
	genericprompt:GetSprite()
end

function GenericPromptTest:TestGetSubmittedSelection(genericprompt)
	genericprompt:GetSubmittedSelection()
end

function GenericPromptTest:TestInitialize(genericprompt)
	local smallprompt = true
	genericprompt:Initialize(smallprompt)
end

function GenericPromptTest:TestIsActive(genericprompt)
	genericprompt:IsActive()
end

function GenericPromptTest:TestRender(genericprompt)
	genericprompt:Render()
end

function GenericPromptTest:TestSetImageToVictoryRun(genericprompt)
	genericprompt:SetImageToVictoryRun()
end

function GenericPromptTest:TestSetText(genericprompt)
	local text1 = "hello"
	local text2 = "hello"
	local text3 = "hello"
	local text4 = "hello"
	local text5 = "hello"
	genericprompt:SetText(text1, text2, text3, text4, text5)
end

function GenericPromptTest:TestShow(genericprompt)
	genericprompt:Show()
end

function GenericPromptTest:TestUpdate(genericprompt)
	local processinput = true
	genericprompt:Update(processinput)
end


return GenericPromptTest
