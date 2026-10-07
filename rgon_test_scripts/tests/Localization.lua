local test = REPENTOGON_TEST

local LocalizationTests = {}


function LocalizationTests:TestGetByName()
	test.AssertTrue(Isaac.GetCardIdByName("#REPENTOGON_TEST_STRING") > 0)
	test.AssertTrue(Isaac.GetChallengeIdByName("#REPENTOGON_TEST_STRING") > 0)
	test.AssertTrue(Isaac.GetCurseIdByName("#REPENTOGON_TEST_STRING") > 0)
	test.AssertTrue(Isaac.GetEntityTypeByName("#REPENTOGON_TEST_STRING") > 0)
	test.AssertTrue(Isaac.GetEntityVariantByName("#REPENTOGON_TEST_STRING") > 0)
	test.AssertTrue(Isaac.GetEntitySubTypeByName("#REPENTOGON_TEST_STRING") > 0)
	test.AssertTrue(Isaac.GetItemIdByName("#REPENTOGON_TEST_STRING") > 0)
	test.AssertTrue(Isaac.GetPillEffectByName("#REPENTOGON_TEST_STRING") > 0)
	test.AssertTrue(Isaac.GetPlayerTypeByName("#REPENTOGON_TEST_STRING") > 0)
	test.AssertTrue(Isaac.GetTrinketIdByName("#REPENTOGON_TEST_STRING") > 0)
end


return LocalizationTests