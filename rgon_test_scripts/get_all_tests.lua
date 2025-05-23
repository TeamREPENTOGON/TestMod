local root = REPENTOGON_TEST.TestsRoot

return {
	InMenu = {
		BestiaryMenu = include(root.."BestiaryMenu"),
		ChallengeMenu = include(root.."ChallengeMenu"),
		CharacterMenu = include(root.."CharacterMenu"),
		CollectionMenu = include(root.."CollectionMenu"),
		ControllerSelectMenu = include(root.."ControllerSelectMenu"),
		CustomChallengeMenu = include(root.."CustomChallengeMenu"),
		CutscenesMenu = include(root.."CutscenesMenu"),
		DailyChallengeMenu = include(root.."DailyChallengeMenu"),
		KeyConfigMenu = include(root.."KeyConfigMenu"),
		MainMenu = include(root.."MainMenu"),
		MenuManager = include(root.."MenuManager"),
		ModsMenu = include(root.."ModsMenu"),
		OptionsMenu = include(root.."OptionsMenu"),
		SaveMenu = include(root.."SaveMenu"),
		SpecialSeedsMenu = include(root.."SpecialSeedsMenu"),
		StatsMenu = include(root.."StatsMenu"),
		TitleMenu = include(root.."TitleMenu"),
	},
	InGame = {
		BitSet128 = include(root.."BitSet128"),
		Color = include(root.."Color"),
		CustomCache = include(root.."CustomCache"),
		Entity = include(root.."Entity"),
		EntityBomb = include(root.."EntityBomb"),
		EntityEffect = include(root.."EntityEffect"),
		EntityFamiliar = include(root.."EntityFamiliar"),
		EntityKnife = include(root.."EntityKnife"),
		EntityLaser = include(root.."EntityLaser"),
		EntityNPC = include(root.."EntityNPC"),
		EntityPickup = include(root.."EntityPickup"),
		EntityPlayer = include(root.."EntityPlayer"),
		EntityProjectile = include(root.."EntityProjectile"),
		EntityPtr = include(root.."EntityPtr"),
		EntityRef = include(root.."EntityRef"),
		EntityTear = include(root.."EntityTear"),
		EntityGridCollision = include(root.."EntityGridCollision"),
		Font = include(root.."Font"),
		--FontRenderSettings = include(root.."FontRenderSettings"),  -- API functions made for this in rep+ are wonked
		Game = include(root.."Game"),
		GridEntity = include(root.."GridEntity"),
		GridEntityDoor = include(root.."GridEntityDoor"),
		GridEntityPit = include(root.."GridEntityPit"),
		GridEntityPoop = include(root.."GridEntityPoop"),
		GridEntityPressurePlate = include(root.."GridEntityPressurePlate"),
		GridEntityRock = include(root.."GridEntityRock"),
		GridEntitySpikes = include(root.."GridEntitySpikes"),
		GridEntityTNT = include(root.."GridEntityTNT"),
		HUD = include(root.."HUD"),
		HUDMessage = include(root.."HUDMessage"),
		Input = include(root.."Input"),
		Isaac = include(root.."Isaac"),
		ItemConfig = include(root.."ItemConfig"),
		ItemConfigCard = include(root.."ItemConfigCard"),
		ItemConfigCostume = include(root.."ItemConfigCostume"),
		ItemConfigItem = include(root.."ItemConfigItem"),
		ItemConfigPillEffect = include(root.."ItemConfigPillEffect"),
		ItemPool = include(root.."ItemPool"),
		KColor = include(root.."KColor"),
		Level = include(root.."Level"),
		MusicManager = include(root.."MusicManager"),
		PathFinder = include(root.."PathFinder"),
		PathFinder_Familiar = include(root.."PathFinder_Familiar"),
		PlayerTypesActiveItemDesc = include(root.."PlayerTypesActiveItemDesc"),
		PlayerTypesPosVel = include(root.."PlayerTypesPosVel"),
		ProjectileParams = include(root.."ProjectileParams"),
		QueueItemData = include(root.."QueueItemData"),
		RNG = include(root.."RNG"),
		Room = include(root.."Room"),
		RoomConfigEntry = include(root.."RoomConfigEntry"),
		RoomConfigRoom = include(root.."RoomConfigRoom"),
		RoomConfigSpawn = include(root.."RoomConfigSpawn"),
		RoomDescriptor = include(root.."RoomDescriptor"),
		Seeds = include(root.."Seeds"),
		SFXManager = include(root.."SFXManager"),
		Sprite = include(root.."Sprite"),
		TearParams = include(root.."TearParams"),
		TemporaryEffect = include(root.."TemporaryEffect"),
		TemporaryEffects = include(root.."TemporaryEffects"),
		Vector = include(root.."Vector"),
		Ambush = include(root.."Ambush"),
		AnimationData = include(root.."AnimationData"),
		AnimationFrame = include(root.."AnimationFrame"),
		AnimationLayer = include(root.."AnimationLayer"),
		Backdrop = include(root.."Backdrop"),
		BossPool = include(root.."BossPool"),
		BossPoolManager = include(root.."BossPoolManager"),
		Camera = include(root.."Camera"),
		Capsule = include(root.."Capsule"),
		ChallengeParam = include(root.."ChallengeParam"),
		ColorModifier = include(root.."ColorModifier"),
		ColorParams = include(root.."ColorParams"),
		Console = include(root.."Console"),
		CostumeSpriteDesc = include(root.."CostumeSpriteDesc"),
		DailyChallenge = include(root.."DailyChallenge"),
		DebugRenderer = include(root.."DebugRenderer"),
		EntityConfig = include(root.."EntityConfig"),
		EntityConfigBaby = include(root.."EntityConfigBaby"),
		EntityConfigEntity = include(root.."EntityConfigEntity"),
		EntityConfigPlayer = include(root.."EntityConfigPlayer"),
		EntityDelirium = include(root.."EntityDelirium"),
		EntitySlot = include(root.."EntitySlot"),
		EvaluateStats = include(root.."EvaluateStats"),
		FXParams = include(root.."FXParams"),
		GenericPrompt = include(root.."GenericPrompt"),
		History = include(root.."History"),
		HistoryItem = include(root.."HistoryItem"),
		ItemOverlay = include(root.."ItemOverlay"),
		LayerState = include(root.."LayerState"),
		LootList = include(root.."LootList"),
		LootListEntry = include(root.."LootListEntry"),
		LRoomAreaDesc = include(root.."LRoomAreaDesc"),
		LRoomTileDesc = include(root.."LRoomTileDesc"),
		Minimap = include(root.."Minimap"),
		MultiShotParams = include(root.."MultiShotParams"),
		NightmareScene = include(root.."NightmareScene"),
		NullFrame = include(root.."NullFrame"),
		PersistentGameData = include(root.."PersistentGameData"),
		PlayerHUD = include(root.."PlayerHUD"),
		PlayerHUDHeart = include(root.."PlayerHUDHeart"),
		PlayerManager = include(root.."PlayerManager"),
		PocketItem = include(root.."PocketItem"),
		ProceduralEffect = include(root.."ProceduralEffect"),
		ProceduralItem = include(root.."ProceduralItem"),
		ProceduralItemManager = include(root.."ProceduralItemManager"),
		RailManager = include(root.."RailManager"),
		Repentogon = include(root.."Repentogon"),
		RoomConfig = include(root.."RoomConfig"),
		RoomConfigHolder = include(root.."RoomConfigHolder"),
		RoomConfigStage = include(root.."RoomConfigStage"),
		RoomTransition = include(root.."RoomTransition"),
		ScoreSheet = include(root.."ScoreSheet"),
		StageTransition = include(root.."StageTransition"),
		Weapon = include(root.."Weapon"),
		WeightedOutcomePicker = include(root.."WeightedOutcomePicker"),
		XMLData = include(root.."XMLData"),
		PauseMenu = include(root.."PauseMenu"),
		Beam = include(root.."Beam"),
		BlendMode = include(root.."BlendMode"),
		Point = include(root.."Point"),
		XmlFeatures = include(root.."XmlFeatures"),
	}
}
