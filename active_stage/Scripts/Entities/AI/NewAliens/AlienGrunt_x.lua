AlienGrunt_x =
{
	ActionController = "Animations/Mannequin/ADB/alienGruntControllerDefs.xml",
	AnimDatabase3P = "Animations/Mannequin/ADB/alienGrunt.adb",
	SoundDatabase = "Animations/Mannequin/ADB/alienGruntSounds.adb",
	UseMannequinAGState = true,
	UseLegacyCoverLocator = false,

	Properties =
	{
		soclasses_SmartObjectClass = "Grunt, Actor",
		aibehavior_behaviour = "",
		aicharacter_character = "",
		esBehaviorSelectionTree = "AlienGrunt",

		DisintegrateOnDeath =
		{
			bEnabled = 0,
			DisintegrateTime = 2.0,
			esDisintegrateParticleEffect = "Crysis2_alien_effects.grunt.disintegrate",
		},

		bStartInAssaultMode = 0,
		bSniper = 0,
		bCanPairWithDrone = true,

		fileModel = "objects/characters/alien/grunt/grunt.cdf",
		equip_EquipmentPack = "Slug_Grunt",

		fileHitDeathReactionsParamsDataFile = "Libs/HitDeathReactionsData/HitDeathReactions_AlienGrunt.xml",
		useSpecialMovementTransitions = 1,

		Damage =
		{
			heatAbsobsion = 0.5,		-- how much real damage is absorbed when actor is hit by mike particles. 0 takes all damage, 1 takes no damage at all.
			heatDissipation = 100,		-- how much heat damage points are dissipated per second
			minHeatDamage = 200,		-- the minumum heat damage needed to burst an enemy
		},

		Perception =
		{
			cloakMaxDistCrouchedAndMoving = 0.0,
			cloakMaxDistCrouchedAndStill = 0.0,
			cloakMaxDistMoving = 0.0,
			cloakMaxDistStill = 0.0,
		},

		PlayerInteractions =
		{
			bStealthKill = 1,
			bCanBeGrabbed = 1,
			esGrabType = "Grunt"
		},

		CharacterSounds =
		{
			footstepEffect = "footstep_grunt",			-- Footstep mfx library to use
			remoteFootstepEffect = "footstep_grunt",	-- Footstep mfx library to use for remote players
			bFootstepGearEffect = 0,					-- This plays a sound from materialfx
			foleyEffect = "foley_grunt",				-- Foley signal effect name
		},

		BehaviorTweaks =
		{
			-- How long to delay between each situation analyzation (this will help
			-- in having the grunts move to the most recent guard position).
			fMastermindGuardingRethinkMinInterval = 3,
			fMastermindGuardingRethinkMaxInterval = 5,
		},
	},

	gameParams =
	{
		stance =
		{
			{
				stanceId = STANCE_STAND,
				normalSpeed = 1.0,
				maxSpeed = 50.0,
				heightCollider = 1.3,
				heightPivot = 0.0,
				size = {x=0.5,y=0.5,z=0.2},
				modelOffset = {x=0,y=-0.0,z=0},
				viewOffset = {x=0,y=0.10,z=1.95},
				weaponOffset = {x=0.35,y=0.0,z=1.55},
				leanLeftViewOffset = {x=-0.5,y=0.10,z=1.525},
				leanRightViewOffset = {x=0.5,y=0.10,z=1.525},
				leanLeftWeaponOffset = {x=-0.45,y=0.0,z=1.30},
				leanRightWeaponOffset = {x=0.65,y=0.0,z=1.30},
				name = "stand",
				useCapsule = 1,
			},
			{
				stanceId = STANCE_ALERTED,
				normalSpeed = 1.0,
				maxSpeed = 50.0,
				heightCollider = 1.3,
				heightPivot = 0.0,
				size = {x=0.5,y=0.5,z=0.2},
				modelOffset = {x=0,y=-0.0,z=0},
				viewOffset = {x=0,y=0.10,z=1.95},
				weaponOffset = {x=0.35,y=0.0,z=1.55},
				leanLeftViewOffset = {x=-0.5,y=0.10,z=1.525},
				leanRightViewOffset = {x=0.5,y=0.10,z=1.525},
				leanLeftWeaponOffset = {x=-0.45,y=0.0,z=1.30},
				leanRightWeaponOffset = {x=0.65,y=0.0,z=1.30},
				name = "alerted",
				useCapsule = 1,
			},
			{
				stanceId = STANCE_CROUCH,
				normalSpeed = 0.5,
				maxSpeed = 50.0,
				heightCollider = 0.8,
				heightPivot = 0.0,
				size = {x=0.5,y=0.5,z=0.1},
				modelOffset = {x=0.0,y=0.0,z=0},
				viewOffset = {x=0,y=0.0,z=1.2},
				weaponOffset = {x=0.35,y=0.0,z=0.85},
				leanLeftViewOffset = {x=-0.55,y=0.0,z=0.95},
				leanRightViewOffset = {x=0.55,y=0.0,z=0.95},
				leanLeftWeaponOffset = {x=-0.5,y=0.0,z=0.65},
				leanRightWeaponOffset = {x=0.5,y=0.0,z=0.65},
				name = "crouch",
				useCapsule = 1,
			},
			{
				stanceId = STANCE_LOW_COVER,
				normalSpeed = 0.5,
				maxSpeed = 50.0,
				heightCollider = 0.8,
				heightPivot = 0.0,
				size = {x=0.5,y=0.5,z=0.1},
				modelOffset = {x=0.0,y=0.0,z=0},
				viewOffset = {x=0,y=0.0,z=1.2},
				weaponOffset = {x=0.35,y=0.0,z=0.85},

				leanLeftViewOffset = {x=-0.95,y=0.0,z=1.3},
				leanRightViewOffset = {x=0.9,y=0.0,z=1.3},
				leanLeftWeaponOffset = {x=-0.95,y=0.0,z=0.85},
				leanRightWeaponOffset = {x=1.2,y=0.0,z=0.95},

				whileLeanedLeftViewOffset = {x=-0.15,y=0.9,z=1.5},
				whileLeanedRightViewOffset = {x=0.2,y=0.8,z=1.5},
				whileLeanedLeftWeaponOffset = {x=-0.2,y=0.8,z=1.0},
				whileLeanedRightWeaponOffset = {x=0.2,y=0.6,z=1.0},

				peekOverViewOffset = {x=0.1,y=0.0,z=1.8},
				peekOverWeaponOffset = {x=0.4,y=0.0,z=1.5},
				name = "coverLow",
				useCapsule = 1,
			},
			{
				stanceId = STANCE_HIGH_COVER,
				normalSpeed = 1.0,
				maxSpeed = 50.0,
				heightCollider = 1.3,
				heightPivot = 0.0,
				size = {x=0.5,y=0.5,z=0.2},
				modelOffset = {x=0,y=-0.0,z=0},
				viewOffset = {x=0.45,y=0.10,z=1.90},
				weaponOffset = {x=0.35,y=0.0,z=1.7},

				leanLeftViewOffset = {x=-0.85,y=0.10,z=1.8},
				leanRightViewOffset = {x=0.8,y=0.10,z=1.85},
				leanLeftWeaponOffset = {x=-0.55,y=0.0,z=1.35},
				leanRightWeaponOffset = {x=1.0,y=0.0,z=1.3},

				whileLeanedLeftViewOffset = {x=0.0,y=0.5,z=1.8},
				whileLeanedRightViewOffset = {x=0.1,y=0.5,z=1.9},
				whileLeanedLeftWeaponOffset = {x=0.25,y=0.4,z=1.4},
				whileLeanedRightWeaponOffset = {x=0.2,y=0.25,z=1.35},

				peekOverViewOffset = {x=0.1,y=0.0,z=2.25},
				peekOverWeaponOffset = {x=0.3,y=0.0,z=2.35},
				name = "coverHigh",
				useCapsule = 1,
			},
			{
				stanceId = STANCE_SWIM,
				normalSpeed = 1.0, -- this is not even used?
				maxSpeed = 50.0, -- this is ignored, overridden by pl_swim* cvars.
				heightCollider = 0.9,
				heightPivot = 0.5,
				size = {x=0.5,y=0.5,z=0.1},
				modelOffset = {x=0,y=0,z=0.0},
				viewOffset = {x=0,y=0.1,z=0.5},
				weaponOffset = {x=0.2,y=0.0,z=0.3},
				name = "swim",
				useCapsule = 1,
			},
			--AI states
			{
				stanceId = STANCE_RELAXED,
				normalSpeed = 1.0,
				maxSpeed = 50.0,
				heightCollider = 1.3,
				heightPivot = 0.0,
				size = {x=0.5,y=0.5,z=0.2},
				modelOffset = {x=0,y=0.0,z=0},
				viewOffset = {x=0,y=0.10,z=1.625},
				weaponOffset = {x=0.2,y=0.0,z=1.3},
				name = "relaxed",
				useCapsule = 1,
			},
		},

		boneIDs =
		{
			BONE_SPINE = "Spine01",
			BONE_SPINE2 = "Spine02",
			BONE_SPINE3 = "Spine03",
			BONE_HEAD = "Head",
			BONE_WEAPON = "weapon_bone",
			BONE_FOOT_R = "R Foot",
			BONE_FOOT_L = "L Foot",
		},

		characterDBAs =
		{
			"AlienGrunt",
		},

		autoAimTargetParams =
		{
			primaryTargetBone = BONE_SPINE3,
			physicsTargetBone = BONE_SPINE3,
			secondaryTargetBone = BONE_HEAD,
			fallbackOffset = 1.2,
			innerRadius = 0.4,
			outerRadius = 0.5,
			snapRadius = 2.0,
			snapRadiusTagged = 4.0,
		},

		meeleHitRagdollImpulseScale = 5.0, --Scales melee impulse force (when being hit)

		proceduralLeaningFactor = 1.0,

		cornerSmoother = 2,

		lookFOV = 160,
		aimFOV = 140, -- extreme aiming allowed
		aimIKFadeDuration = 0.5, -- time to reach aim pose

		turnThresholdAngle = 30, -- Angle in degrees that the character has to deviate from the entity before the turn timer (turnThresholdTime) runs
		turnThresholdTime = 1, -- Duration (in seconds) the current angle deviation needs to be above turnThresholdAngle before the character turns
		minimumAngleForTurnWithoutDelay = 45,

		maxDeltaAngleRateNormal = 360, -- Maximum turnspeed (degrees/second)
	},

	BehaviorProperties =
	{
		fOptimalCombatRange = 25.0,
		fStartScannerSearchDistance = 20.0,
		fCautiousSearchApproachDistance = 30.0,
		fCondidentApproachCloseRange = 20,
		fConfidentApproachPressureThreshold = 0.2,

		fDefaultCloseCombatRange = 3.0,
	},

	CoordinationsProperties =
	{
		--Assault
		baseOfFireRange = 20,
	},

	SearchModule =
	{
		sightRange = 15.0,
	},

	SoftPing =
	{
		radius = 10,
		timeInterval = 10,
	},

	MastermindBuffing =
	{
		-- Deprecated
		berserkBuffWeaponName = "FY71alienMastermindBuffed",          -- When receiving the berserk buff, we will switch to this weapon.

		berserkBuffDamageReductionFactor = 0.7,
	},

	AIMovementAbility =
	{
		pathType = "AIPATH_GRUNT",
		pathRadius = 0.65,
		passRadius = 0.65,

		distanceToCover = 0.855, -- needs to be at least 20cm more than max(passRadius, pathRadius)
		inCoverRadius = 0.075,
		effectiveCoverHeight = 0.55,

		maxAccel = 1.5,
		maxDecel = 70.0, -- grunt decelerates extremely fast

		avoidanceAbilities = AVOIDANCE_ALL,
		pushableObstacleWeakAvoidance = true,
		pushableObstacleAvoidanceRadius = 0.35,

		AIMovementSpeeds =
		{
		  --            { default, min, max }
			Relaxed =
			{
				Slow =      { 2.5,     2.0, 2.5 },
				Walk =      { 2.5,     2.0, 2.5 },
				Run =       { 6.6,     6.0, 6.6 },
				Sprint =    { 7.5,     6.0, 7.5 },
			},
			Combat =
			{
				Slow =      { 2.5,     2.0, 2.5 },
				Walk =      { 2.5,     2.0, 2.5 },
				Run =       { 6.6,     6.0, 6.6 }, -- Min should ideally be: Max - (<Idle2Move duration> * maxAccel)
				Sprint =    { 7.5,     6.0, 7.5 },
			},
			Alerted =
			{
				Slow =      { 2.5,     2.0, 2.5 },
				Walk =      { 2.5,     2.0, 2.5 },
				Run =       { 6.6,     6.0, 6.6 },
				Sprint =    { 7.5,     6.0, 7.5 },
			},
			LowCover =
			{
				Slow =      { 2.62,    2.62, 2.62 },
				Walk =      { 2.62,    2.62, 2.62 },
				Run =       { 3.00,    3.00, 3.00 },
				Sprint =    { 3.00,    3.00, 3.00 },
			},
			HighCover =
			{
				Slow =      { 2.62,    2.62, 2.62 },
				Walk =      { 2.62,    2.62, 2.62 },
				Run =       { 3.00,    3.00, 3.00 },
				Sprint =    { 3.00,    3.00, 3.00 },
			},
		},
	},

	melee =
	{
		damage = 800,
		damageOffset = {x=0,y=2,z=0};
		damageRadius = 2.5,
		damageRadiusShort = 1.5,
		hitRange = 2.5,
		knockdownChance = 0.0,
		impulse = 600,
		angleThreshold = 180,
	},

	aiSequenceUser = true,

	Effects =
	{
		MastermindBuffEffectAttachment = "buff_effect",

		MastermindBuffReceive = "mastermind_proto.buff.cloud",
		MastermindBuffActive = "mastermind_proto.buff.cloud",
	},

	Server =
	{
		OnHit = function(self, hit)
			hit.damage = hit.damage * self.AI.MastermindBuff.damageReductionFactor
			return AIBase.Server.OnHit(self, hit)
		end,
	},

	-- Flow output event: The Mastermind started buffing this grunt.
	Event_MastermindBuffStarted = function(sender)
		BroadcastEvent(self, "MastermindBuffStarted")
	end,

	-- Flow output event: The Mastermind stopped buffing this grunt.
	Event_MastermindBuffStopped = function(sender)
		BroadcastEvent(self, "MastermindBuffStopped")
	end,

	EnableSearchModule = function( entity )
		local groupId = AI.GetGroupOf(entity.id)
		local targetPos = g_Vectors.temp_v1
		if (AI.GetAttentionTargetPosition(entity.id, targetPos)) then
			local targetEntityId = NULL_ENTITY
			local targetEntity = AI.GetAttentionTargetEntity(entity.id);
			if (targetEntity) then
				targetEntityId = targetEntity.id
			end
			GameAI.StartSearchModuleFor(groupId, targetPos, targetEntityId, 45.0)
			GameAI.RegisterWithModule("SearchModule", entity.id)
			entity:Log("Started search module for my group.")
		else
			GameAI.StartSearchModuleFor(groupId, entity:GetPos(), nil, 45.0)
			GameAI.RegisterWithModule("SearchModule", entity.id)
			entity:Error("Started search module for my group, but there's no attention target")
		end
	end,

	DisableSearchModule = function( entity )
		GameAI.UnregisterWithModule("SearchModule", entity.id)
	end,

	SetNextSearchSpotToRefPoint = function( entity )
		local position = GameAI.GetNextSearchSpot(entity.id, 0.6, 0.3, 0.1)
		if (position) then
			AI.SetRefPointPosition(entity.id, position);
		else
			AI.Signal(SIGNALFILTER_SENDER, 1, "NoSearchSpotsAvailable", entity.id)
		end
	end,

	OnBeingHitByStickyExplosiveArrow = function( entity )
		entity.lastImmediateThreatPos = entity:GetWorldPos()
	end,

	OnGrenadeDanger = function(entity, sender, data)
		entity.lastImmediateThreatPos = data.point

		if ( AI.Hostile(entity.id, data.id) ) then
			AI.Signal(SIGNALFILTER_SENDER, 1, "OnGrenadeDangerFromHostile", entity.id)
		end
	end,


	OnExposedToExplosion = function(entity, sender, data)
		entity.lastImmediateThreatPos = data.point
	end,


	OnScorcherExplosionDanger = function(entity, sender, data)
		entity.lastImmediateThreatPos = data.point
	end,


	OnScorchDanger = function(entity, sender, data)
		entity.lastImmediateThreatPos = data.point
	end,

	ClearCombatMoveAssignmentIfCloseToTheDestination = function( entity )
		if (DistanceSqVectors(entity:GetWorldPos(), entity.AI.combatMove.position) < 25) then
			entity:ClearAssignment()
		end
	end,

	CallClosestDrone = function( entity )
		local closestDrone = nil
		local distanceToClosestDroneSq = nil
		local count = AI.GetGroupCount(entity.id)
		for i=1,count do
			local groupMember = AI.GetGroupMember(entity.id, i)
			if (groupMember ~= nil and
				groupMember ~= entity and
				groupMember:IsActive() and
				not groupMember:IsDead() and
				groupMember.drone ~= nil and groupMember.drone == true
				) then
				if (closestDrone == nil) then
					closestDrone = groupMember
					distanceToClosestDroneSq = DistanceSqVectors(entity:GetWorldPos(), groupMember:GetWorldPos())
				else
					local distanceToGroupMemberSq = DistanceSqVectors(entity:GetWorldPos(), groupMember:GetWorldPos())
					if (distanceToGroupMemberSq < distanceToClosestDroneSq) then
						closestDrone = groupMember
						distanceToBestMateSq = distanceToGroupMemberSq
					end
				end
			end
		end

		if (closestDrone ~= nil) then
			local blackboard = entity:GetGroupBlackboard();
			blackboard.droneCaller = entity
			entity.calledDrone = closestDrone
			AI.Signal(SIGNALFILTER_SENDER, 1, "OnDroneCall", closestDrone.id)
			return true
		end

		return false
	end,

	StopDroneCall = function( entity )
		if ( entity.calledDrone ~= nil ) then
			AI.Signal( SIGNALFILTER_SENDER, 1, "OnStopDroneCall", entity.calledDrone.id )
			entity.calledDrone = nil
		end
	end,

	IsThereAGroupMateWithinTargetsRange = function( entity, range )
		local targetPosition = g_Vectors.temp_v1
		if ( not AI.GetAttentionTargetPosition( entity.id, targetPosition ) ) then
			return false
		end
		local rangeSq = range * range
		local groupCount = AI.GetGroupCount( entity.id )
		for i=1,groupCount do
			local groupMember = AI.GetGroupMember( entity.id, i )
			if (groupMember ~= nil and
				groupMember ~= entity and
				groupMember:IsActive() and
				not groupMember:IsDead() and
				DistanceSqVectors(targetPosition, groupMember:GetWorldPos()) < rangeSq
				) then
				return true
			end
		end

		return false
	end,

	OnCustomKill = function( entity, hit )
		GameAudio.StopEntitySignal(entity.SoundSignals.Idle, entity.id);

		if (entity.pairedWithDrone ~= nil) then
			AI.Signal(SIGNALFILTER_SENDER, 1, "OnPairedMateKilled", entity.pairedWithDrone.id)
		end

		local killerId = hit.shooterId
		local killer = System.GetEntity(killerId)
		local threatPosition = nil
		if (killer ~= nil) then
			threatPosition = killer:GetWorldPos()
		else
			threatPosition = entity:GetWorldPos()
		end

		AI.CreateStimulusEventInRange(
			killerId,
			'MateKilled',
			{
				threat = AITHREAT_THREATENING,
				type = EST_Sound,
				pos = threatPosition,
				radius = 75
			}
		)

		local shouldDisintegrate = (
			entity.Properties.DisintegrateOnDeath.bEnabled and entity.Properties.DisintegrateOnDeath.bEnabled ~= 0 and
			not g_gameRules:IsStealthHealthHit( hit.type ) and
			not g_gameRules.game:IsHitTypeIdMelee(hit.typeId) and
			hit.type ~= "electricity" and
			hit.type ~= "stickyArrow" and
			hit.type ~= "kvolt" and
			hit.type ~= "mike_burn" and
			hit.type ~= "explosion" and
			hit.type ~= "frag" and
			hit.type ~= "fire" and
			hit.type ~= "collision" and
			hit.type ~= "silentMelee" and
			hit.headShotType ~= eHeadShotType_Head and
			hit.headShotType ~= eHeadShotType_Helmet
			)

		if ( shouldDisintegrate ) then
			AI.PlayCommunication( entity.id, "DisintegrateWarning", "PersonalNoSilence", 0.5 )
			entity.disintegrateTimer = Script.SetTimer( entity.Properties.DisintegrateOnDeath.DisintegrateTime * 1000, function() entity:Disintegrate(); end )
		end
	end,

	Disintegrate = function( entity )
		AI.PlayCommunication(entity.id, "Disintegrating", "PersonalNoSilence", 0.1)
		entity:Hide(1)

		local damage = 0 -- Explosion is purely 'cosmetic' and we don't want Grunts to do damage onto each other.
		local position = entity:GetWorldPos()

		if (position == nil) then
			return
		end

		position.z = position.z + 0.2
		local direction = g_Vectors.v001
		local radius = 3
		local pressure = 100
		local particleFX = entity.Properties.DisintegrateOnDeath.esDisintegrateParticleEffect
		local minRadius = 0
		local minPhysRadius = 0
		local maxPhysRadius = 5
		local expType = g_gameRules.game:GetHitTypeId("explosion")

		g_gameRules:CreateExplosion(entity.id, entity.id, damage, position, direction, radius, nil, pressure, 0, particleFX,
			nil, minRadius, minPhysRadius, maxPhysRadius, expType)
	end,

	OccupyAdvantagePoint = function( entity )
		entity:ReleaseAdvantagePoint()

		local advantagePointPosition = AI.GetRefPointPosition( entity.id )
		if ( not advantagePointPosition ) then
			return
		end

		entity.occupiedAdvantagePointPosition = advantagePointPosition
		GameAI.OccupyAdvantagePoint( entity.id, advantagePointPosition )
	end,

	ReleaseAdvantagePoint = function( entity )
		if ( not entity.occupiedAdvantagePointPosition ) then
			return
		end

		GameAI.ReleaseAdvantagePointFor( entity.id, entity.occupiedAdvantagePointPosition )
		entity.occupiedAdvantagePointPosition = nil
	end,

	ShouldIgnoreHit = function(entity, hit)
		if ( AI.Hostile( entity.id, hit.shooterId ) ) then
			return false
		end

		return ( hit.type == "mike_burn" or hit.type == "gruntGrenade" )
	end,

	OnTargetedByTurret = function( entity, hit, data )
		entity.turretPosition = data.point
	end,

	OnEnemyDamage = function(entity, sender, data)
		local enemyId = data.id
		local enemy = System.GetEntity(enemyId)
		if (enemy ~= nil) then
			AI.CreateStimulusEventInRange(
				enemyId,
				'EnemyDamage',
				{
					threat = AITHREAT_THREATENING,
					type = EST_Sound,
					pos = enemy:GetWorldPos(),
					radius = 75
				}
			)
		end

		AI.Signal(SIGNALFILTER_GROUPONLY_EXCEPT, 1, "OnEnemyDamagedGroupMate", entity.id)
	end,

}


AlienGrunt_x.Postures =
{
	{
		name = "LowCoverPeek",
		templateOnly = true,

		type = POSTURE_PEEK,
		stance = STANCE_LOW_COVER,
		priority = 9.0,

		{
			name = "LowCoverPeekLeft",
			lean = -1.0,
			peekOver = -0.15,
			agInput = "coverLftPeek",
			priority = -0.25,
		},

		{
			name = "LowCoverPeekRight",
			lean = 1.0,
			peekOver = -0.15,
			agInput = "coverRgtPeek",
			priority = -0.25,
		},

		{
			name = "LowCoverPeekCenter",
			peekOver = 1.0,
			lean = -0.125,
			agInput = "coverMidPeek",
			priority = -0.5,
		},
	},

	{
		name = "HighCoverPeek",
		templateOnly = true,

		type = POSTURE_PEEK,
		stance = STANCE_HIGH_COVER,
		priority = 9.0,

		{
			name = "HighCoverPeekLeft",
			lean = -0.9,
			peekOver = 1.0,
			agInput = "coverLftPeek",
			priority = -0.15,
		},

		{
			name = "HighCoverPeekRight",
			lean = 1.0,
			peekOver = 1.0,
			agInput = "coverRgtPeek",
			priority = -0.15,
		},
	},

	{
		name = "LowCoverAim",
		templateOnly = true,

		type = POSTURE_AIM,
		stance = STANCE_LOW_COVER,
		priority = 9.0,

		{
			name = "LowCoverAimLeft",
			lean = -0.7,
			priority = -0.25,
			agInput = "coverLftShoot",
		},

		{
			name = "LowCoverAimRight",
			lean = 0.7,
			priority = -0.25,
			agInput = "coverRgtShoot",
		},

		{
			name = "LowCoverAimCenter",
			peekOver = 1,
			priority = -0.5,
			agInput = "coverMidShoot",
		},
	},

	{
		name = "HighCoverAim",
		templateOnly = true,

		type = POSTURE_AIM,
		stance = STANCE_HIGH_COVER,
		priority = 0.0,

		{
			name = "HighCoverAimLeft",
			lean = -1.0,
			priority = 8.5,
			agInput = "coverLftShoot",
		},

		{
			name = "HighCoverAimRight",
			lean = 1.0,
			priority = 8.5,
			agInput = "coverRgtShoot",
		},
	},

	{
		name = "StandAim",
		type = POSTURE_AIM,
		stance = STANCE_STAND,
		priority = 8.0,
	},
};

function AlienGrunt_x:CacheResources()
	-- Particles
	BasicActor.CacheResources(self);
	self:PreLoadParticleEffect(self.Properties.DisintegrateOnDeath.esDisintegrateParticleEffect);
	self:PreLoadParticleEffect(self.Effects.MastermindBuffReceive)
	self:PreLoadParticleEffect(self.Effects.MastermindBuffActive)
end

-----------------------------------------------------------------------------------------------------
function AlienGrunt_x:OnResetCustom()

	AlienBase.OnResetCustom(self);

	AI.SetPostures(self.id, self.Postures);

	--self:SelectPrimaryWeapon();

	self:DrawSlot(1, 0);

	self:ResetTargetLostTimer();
	self:ResetSoundIds();
	self:SetupRanges()

	-- self:EnableBlindFire(false);

	self.lastPlasmaGrenadeQueryTime = nil

	self.idleStanceHasBeenSet = nil

	self.pairedWithDrone = nil

	self.AI.MastermindBuff =
	{
		damageReductionFactor = 1.0,      -- Damage reduction will be granted at the moment the Buff is actually applied.
	}

	self.lastExplosiveThreatPos = {x=0, y=0, z=0}
	self.lastImmediateThreatPos = {x=0, y=0, z=0}

	self:SafeKillTimer(self.disintegrateTimer)
end

function AlienGrunt_x:SetupRanges()
	GameAI.RegisterWithModule("RangeModule", self.id)

	GameAI.AddRange(self.id, 3, "OnTargetEnteredMeleeRange", "")
	GameAI.AddRange(self.id, 5, "", "OnTargetLeftMeleeRange")

	-- deprecated:
	GameAI.AddRange(self.id, 3, "OnInsideMeleeRange", "OnOutsideMeleeRange")
	self.spectacularKillRangeID = GameAI.AddRange(self.id, 15, "OnEnteredSpectacularKillRange", "OnLeftSpectacularKillRange")
end

function AlienGrunt_x:ResetSoundIds()

	self.SoundSignals = {
		Idle = GameAudio.GetSignal("Grunt_Idle"),
	}

end

function AlienGrunt_x:DoPainSounds(dead, hitType, isSilenced)
	--If stealthkill, let animevents handle it
	if( g_gameRules:IsStealthHealthHit(hitType) ) then
		return
	end

	if (dead) then
		if (self.doHeadShotReadability) then
			AI.PlayCommunication(self.id, "DeadByHeadshot", "Injury", 0.5);
			self.doHeadShotReadability = false;
		elseif (hitType == "meleeLeft" or hitType == "meleeRight") then
			local isAlerted = AI.GetAlertness(self.id) > 0;
			if ( isAlerted == false ) then
				AI.PlayCommunication(self.id, "DeadByHeadshot", "Injury", 0.5);
			else
				AI.PlayCommunication(self.id, "DeadByMelee", "Injury", 0.5);
			end
		elseif (hitType == "silentMelee") then
			AI.PlayCommunication(self.id, "DeadByHeadshot", "Injury", 0.5);
		else
			if (isSilenced == true) then
				AI.PlayCommunication(self.id, "DeadByHeadshot", "Injury", 0.5);
			else
				AI.PlayCommunication(self.id, "Dead", "Injury", 0.5);
			end
		end
	else
		if(hitType == "mike_burn") then
			AI.PlayCommunication(self.id, "HitByMikeBurn", "InjuryPain", 0.5);
		elseif (hitType == "silentMelee") then
			return
		else
			AI.PlayCommunication(self.id, "Hit", "InjuryPain", 0.5);
		end
	end

end

function AlienGrunt_x:IsUsable(user)
	if(self:IsDead()) then
		return 0;
	else
		return 1;
	end
end

-- function AlienGrunt_x:EnableBlindFire(enable)
	-- if (enable) then
		-- --self:Log("im blind, im gonna fire blindly!")
		-- AI.SetPosturePriority(self.id, "BlindLowCoverAim", 10.0);
		-- AI.SetPosturePriority(self.id, "BlindHighCoverAim", 10.0);
	-- else
		-- --self:Log("i can see, no moar blind firez!")
		-- AI.SetPosturePriority(self.id, "BlindLowCoverAim", 0.0);
		-- AI.SetPosturePriority(self.id, "BlindHighCoverAim", 0.0);
	-- end
-- end

function AlienGrunt_x:GetOptimalCombatRange()
	return self.BehaviorProperties.fOptimalCombatRange;
end

function AlienGrunt_x:GetBaseOfFireRange()
	return self.BehaviorProperties.Coordinations.baseOfFireRange;
end

function AlienGrunt_x:GetBloodFlowBone()
	return "Spine02";
end

function AlienGrunt_x:DoSoftPing()
	AI.Animation(self.id, AIANIM_SIGNAL, "softping")
	Script.SetTimer(1300, function() GameAI.CreateSoftPingInterference(self.id) end)
end

function AlienGrunt_x:CanFirePlasmaGrenade()
	if(self.lastPlasmaGrenadeQueryTime and _time - self.lastPlasmaGrenadeQueryTime < 5) then
		return false
	end

	local blackboard = self:GetGroupBlackboard()
	if (blackboard.plasmaGrenadeInUse or (blackboard.lastPlasmaGrenadeFireTime and (_time - blackboard.lastPlasmaGrenadeFireTime < 10))) then
		return false
	end

	local targetDistance = AI.GetAttentionTargetDistance(self.id)
	if (targetDistance == nil or targetDistance < 10.0) then
		return false
	end

	local targetPosition = g_Vectors.temp_v1
	if (AI.GetAttentionTargetPosition(self.id, targetPosition)) then
		return (not AI.CheckForFriendlyAgentsAroundPoint(self.id, targetPosition, 10.0))
	else
		self:OnError("CanFirePlasmaGrenade - Failed to retrive the attention target's position")
	end

	return false
end

function AlienGrunt_x:FirePlasmaGrenade()
	local blackboard = self:GetGroupBlackboard()
	blackboard.plasmaGrenadeInUse = true
	AI.SetBehaviorVariable(self.id, "PlasmaGrenade", true)
end

function AlienGrunt_x.AnimationEvent(entity, event, value)
	if (event == "StealthMeleeDeath") then
		AI.PlayCommunication(entity.id, "comm_death_melee_stealth", "Injury", 0.5);
	elseif (BasicAI.AnimationEvent) then
		BasicAI.AnimationEvent(entity, event, value)
	end
end

function AlienGrunt_x.EnableAssaultMode(entity)
	entity.AI.assaultModeEnabled = true
	entity:ResetFiremode()
	AI.SetBehaviorVariable(entity.id, "AssaultMode", true)
	--AI.SetCollisionAvoidanceRadiusIncrement(entity.id, 1.0)
end

function AlienGrunt_x.ResetFiremode(entity)
	weapon = entity.inventory:GetCurrentItem();
	if(weapon~=nil and weapon.weapon~=nil and weapon.class==entity.primaryWeapon) then
		if (entity.AI.assaultModeEnabled) then
			weapon.weapon:SetCurrentFireMode("Flechete")
		else
			weapon.weapon:SetCurrentFireMode("Rapid")
		end
	end
end

function AlienGrunt_x.StartMeleeTimeout(entity)
	AI.SetBehaviorVariable(entity.id, "MeleeTimeout", true)
	entity.AI.meleeTimeoutTimer =  Script.SetTimerForFunction(3000, "AlienGrunt_x.MeleeTimeoutDone", entity)
end

function AlienGrunt_x.MeleeTimeoutDone(entity)
	AI.SetBehaviorVariable(entity.id, "MeleeTimeout", false)
	entity.AI.meleeTimeoutTimer = nil
end


function AlienGrunt_x:TargetIsWithinRange(minRange, maxRange)
	local dist = AI.GetAttentionTargetDistance(self.id) or 500
	if (minRange and maxRange and dist >= minRange and dist <= maxRange) then
		return true
	end
	return false
end

function AlienGrunt_x:GetTargetDistance()
	return AI.GetAttentionTargetDistance(self.id) or 500
end

AlienGrunt_x.FlowEvents =
{
	Inputs =
	{
	},
	Outputs =
	{
		MastermindBuffStarted       = "bool",   -- Mastermind_x.Event_MastermindBuffStarted
		MastermindBuffStopped       = "bool",   -- Mastermind_x.Event_MastermindBuffStopped
	}
}


