-- Animations Missing: Melee1, Melee2, HitLeft, HitRight

AlienPinger_x =
{
	traceMe = true,

	--AnimationGraph = "alienpinger.xml",
	--UpperBodyGraph = "",

	ActionController = "Animations/Mannequin/ADB/alienPingerSPControllerDefs.xml",
	AnimDatabase3P = "Animations/Mannequin/ADB/alienPingerSP.adb",
	UseMannequinAGState = true,

	Radar =
	{
		range = 40,         -- How far can the radar detect targets
		frequency = 3,      -- How frequently will the radar be checked (checks/sec)
		ignoreCloak = false, -- Radar respects player cloak
	},

	BigPingDetectRange = 100,
	BigPingDetectRangeWhenPlayerUnderwater = 25,
	BigPingEnergyDrainRange = 40,
	BigPingEnergyDrainRangePlayerUnderwater = 10,

	FocusPingDetectRange = 35,
	FocusPingEnergyDrainRange = 25,

	DeflectorHalfFieldOfView = 75,

	Plasma =
	{
		distBehindTarget = 1.0,
		spacing = 1.5,
		steps = 6, -- Total potential positions = steps * 2 + 1
	},

	Properties =
	{
		aibehavior_behaviour = "",
		aicharacter_character = "",
		esBehaviorSelectionTree = "AlienPinger",

		fileModel = "objects/characters/alien/pinger/pinger_v2.cdf",
		useSpecialMovementTransitions = 1,

		equip_EquipmentPack = "Alien_Pinger",
		fNearCombatRange = 20.0,

		Damage =
		{
			health = 500,
		},

		CharacterSounds =
		{
			footstepEffect = "footstep_pinger",				-- Footstep mfx library to use
			remoteFootstepEffect = "footstep_pinger",		-- Footstep mfx library to use for remote players
			bFootstepGearEffect = 0,					-- This plays a sound from materialfx
			foleyEffect = "foley_pinger",						-- Foley signal effect name
		},
	},

	physicsParams =
	{
		flags = 0,
		mass = 500,

		Living =
		{
			mass = 500,
			gravity = 9.8;
		},
	},

	gameParams =
	{
		stance =
		{
			{
				stanceId = STANCE_STAND,
				normalSpeed = 5,
				maxSpeed = 5,
				heightCollider = 5.0,
				heightPivot = 0,
				size = {x=2.2,y=2.2,z=0.0},
				viewOffset = {x=0,y=2.6,z=4.4},
				weaponOffset = {x=0,y=2.6,z=5.0},
				modelOffset = {x=0.0,y=0,z=0},
				name = "stand",
				useCapsule = 1,
			},
			{
				stanceId = STANCE_ALERTED,
				normalSpeed = 5,
				maxSpeed = 5,
				heightCollider = 4.0,
				heightPivot = 0,
				size = {x=2.2,y=2.2,z=0.0},
				viewOffset = {x=0,y=2.6,z=4.4},
				weaponOffset = {x=0,y=2.6,z=5.0},
				modelOffset = {x=0.0,y=0,z=0},
				name = "alerted",
				useCapsule = 1,
			},
			{
				stanceId = STANCE_RELAXED,
				normalSpeed = 5,
				maxSpeed = 5,
				heightCollider = 5.0,
				heightPivot = 0,
				size = {x=2.5,y=2.5,z=0.5},
				viewOffset = {x=0,y=3,z=4.4},
				weaponOffset = {x=0,y=3,z=5.0},
				modelOffset = {x=0.0,y=0,z=0},
				name = "relaxed",
				useCapsule = 1,
			},
			{
				stanceId = STANCE_NULL,	-- terminator
			},
		},

		lookFOV = 290, -- Total FOV for looking (degrees)
		aimFOV = 290,  -- Total FOV for aiming  (degrees)
		turnThresholdTime = 0.5, -- Duration (in seconds) the current angle deviation needs to be above turnThresholdAngle before the character turns
		turnThresholdAngle = 15, -- Angle in degrees that the character has to deviate from the entity before the turn timer (turnThresholdTime) runs
		minimumAngleForTurnWithoutDelay = 70,
		cornerSmoother = 2,

		allowLookAimStrafing = true,

		maxDeltaAngleRateNormal = 10, -- Maximum turnspeed (degrees/second)

		proceduralLeaningFactor = 0.0, -- Disable procedural leaning
		canUseComplexLookIK = true, -- HACK: By enabling the old lookik we effectively disable the head-only lookIK which doesn't look good on the pinger.

		aimIKFadeDuration = 1.0, -- Time to fully reach aim pose

		boneIDs =
		{
			BONE_SPINE = "Spine1",
			BONE_HEAD = "weapon_bone",
		},

		characterDBAs =
		{
			"AlienPinger",
		},

		autoAimTargetParams =
		{
			primaryTargetBone = BONE_SPINE,
			physicsTargetBone = BONE_SPINE,
			secondaryTargetBone = BONE_HEAD,
			fallbackOffset = 5.0,
			innerRadius = 1.5,
			outerRadius = 1.6,
			snapRadius = 3.0,
			snapRadiusTagged = 4.0,
		},
	},


	melee =
	{
		melee_animations =
		{
		},

		damage = 1000,			-- damage when doing melee from front
		damageSmall = 0,	-- damage when doing melee from back
		damageOffset = {x=0,y=1.5,z=0};		-- Local offset of the damage box
		damageRadius = 4.5,								-- size of the damage box.
		approachLookat = 0,
		alignTime = 0,
		damageTime = 0,
		range = 6,
	},

	-- the AI movement ability of the vehicle.
	AIMovementAbility =
	{
		pathType = "AIPATH_PINGER",
		pathRadius = 4.5,
		passRadius = 4.5,

		avoidanceAbilities = AVOIDANCE_NONE,
		pushableObstacleMassMin = 3000.0,
		pushableObstacleMassMax = 10000.0,

		collisionAvoidanceParticipation = false,

		maxAccel=7.0,
		maxDecel=7.0,

		-- These are actually aiparams (as they may be changed during game and need to get serialized),
		-- but defined here so that designers do not try to change them.
		lookIdleTurnSpeed = 35,
		lookCombatTurnSpeed = 35,
		aimTurnSpeed = 50, --120,
		fireTurnSpeed = 90, --120,

		AIMovementSpeeds =
		{
			-- { default, minimum, maximum }
			Relaxed =
			{
				Slow =		{ 3.9, 3.9, 3.9 },
				Walk =		{ 3.9, 3.9, 3.9 },
				Run =     { 3.9, 3.9, 3.9 },
				Sprint =	{ 3.9, 3.9, 3.9 },
			},
			Alerted =
			{
				Slow =		{ 3.9, 3.9, 3.9 },
				Walk =		{ 3.9, 3.9, 3.9 },
				Run =     { 3.9, 3.9, 3.9 },
				Sprint =	{ 3.9, 3.9, 3.9 },
			},
			Combat =
			{
				Slow =		{ 4.3, 4.3, 4.3 },
				Walk =    { 4.3, 4.3, 4.3 },
				Run =     { 4.3, 4.3, 4.3 },
				Sprint =	{ 4.3, 4.3, 4.3 },
			},

		},
	},

	ProceduralContextAim =
	{
		polarCoordinatesSmoothTimeSeconds = 0.05,
		polarCoordinatesMaxYawDegreesPerSecond = 120,
		polarCoordinatesMaxPitchDegreesPerSecond = 120,
	},

	MELEE_TIMER = 1114,

	Server = {},
	Client = {},

	FlowEvents =
	{
		Inputs =
		{
		},

		Outputs =
		{
			Pinged = "bool",
		},
	},

	Vulnerability =
	{
		ExplosionWeakSpotBone = "Motor Bone",
	},

	BodyDamageProfiles =
	{
		fileCachedBodyDamageParts = "libs/bodydamage/BodyParts_AlienPinger.xml",

		MouthOpen =
		{
			fileBodyDamage = "libs/bodydamage/BodyDamage_AlienPinger_MouthOpen.xml",
		},
	},
	
	MouthAttachments =
	{
		MouthGun = "mouthGun",
	},

	particleEffects =
	{
		deflectorPulse = "crysis2_weapon_alienpinger.deflector_pulse",
		deflectorRepulse = "crysis2_weapon_alienpinger.deflector_repulse",
		radarPing = "crysis2_weapon_alienpinger.radar_ping",
		weap_ping_a = "Crysis2_weapon_alienpinger.ping.ping_a",
		weap_ping_b = "Crysis2_weapon_alienpinger.ping.ping_b",
		weap_ping_c = "Crysis2_weapon_alienpinger.ping.ping_c"		
	},

	ResetBodyDamageProfiles = function(entity)
		local profile = entity.BodyDamageProfiles.MouthOpen
		profile.ProfileID =
			entity.actor:GetBodyDamageProfileID(
				profile.fileBodyDamage, entity.Properties.Damage.fileBodyDamageParts)
	end,

	OnRadarMiss = function(entity)
		Particle.SpawnEffect(entity.particleEffects.radarPing, entity:GetWorldPos(), g_Vectors.v001, 1.0)
		entity:PlaySoundEvent('sounds/a_pinger:pinger_voice:radar_pulse', g_Vectors.v000, g_Vectors.v010, SOUND_DEFAULT_3D, 0, SOUND_SEMANTIC_LIVING_ENTITY)
	end,

	OnRadarHit = function(entity, info)
		Particle.SpawnEffect(entity.particleEffects.radarPing, entity:GetWorldPos(), g_Vectors.v001, 1.0)
		entity:PlaySoundEvent("sounds/a_pinger:pinger_voice:detection_pulse", g_Vectors.v000, g_Vectors.v010, SOUND_DEFAULT_3D, 0, SOUND_SEMANTIC_LIVING_ENTITY)
	end,

	StorePlasmaTargetPosition = function(entity, position)
		entity.AI.plasmaTargetPosition = position
	end,

	OpenMouth = function(entity)
		AI.SetAnimationTag(entity.id, "MouthOpened")
		entity.actor:OverrideBodyDamageProfileID(entity.BodyDamageProfiles.MouthOpen.ProfileID)

		entity:HideAttachment(0, entity.MouthAttachments.MouthGun, false, false)
	end,

	CloseMouth = function(entity)
		AI.SetAnimationTag(entity.id, "MouthClosed")
		entity.actor:OverrideBodyDamageProfileID(INVALID_BODYDAMAGEPROFILEID)

		entity:HideAttachment(0, entity.MouthAttachments.MouthGun, true, true)
	end,

	IsWeakSpotHit = function(entity, hit)
		return entity.actor:CheckBodyDamagePartFlags(hit.partId, hit.materialId, eBodyDamage_PID_WeakSpot)
	end,
}

function AlienPinger_x:C3BalanceMod_IsCloakedPlayer(entity)
	if (entity and entity.actor and entity.actor.IsPlayer and entity.actor:IsPlayer()) then
		if (entity.actor.GetNanoSuitMode and entity.actor:GetNanoSuitMode() == 2) then
			return true
		end

		local targetCloaked = AI.GetParameter(entity.id, AIPARAM_CLOAKED)
		return targetCloaked == true or targetCloaked == 1
	end

	return false
end

function AlienPinger_x:OnResetCustom()

	AlienBase.OnResetCustom(self)
	
	self:SetupRanges()

	self:CreateAttachments();

	self:SelectPrimaryWeapon();

	self:KillTimer(self.MELEE_TIMER);

	self:ResetSoundIDs()

	self.suspectID = nil
	self.suspectPos = {x=0,y=0,z=0}
	self.deflectingList = {}
	self.lastSeekTime = _time or 0
	self.AI.lastLostSightOfTargetTime = 0
	self.annoyCounter = 0

	self:ResetBodyDamageProfiles()
end

function AlienPinger_x:CacheResources()
	BasicActor.CacheResources(self);
	self.particleEffects.deflectorPulse = self:PreLoadParticleEffect( self.particleEffects.deflectorPulse );
	self.particleEffects.deflectorRepulse = self:PreLoadParticleEffect( self.particleEffects.deflectorRepulse );
	self.particleEffects.radarPing   = self:PreLoadParticleEffect( self.particleEffects.radarPing );
	self.particleEffects.weap_ping_a = self:PreLoadParticleEffect( self.particleEffects.weap_ping_a )
	self.particleEffects.weap_ping_b = self:PreLoadParticleEffect( self.particleEffects.weap_ping_b )
	self.particleEffects.weap_ping_c = self:PreLoadParticleEffect( self.particleEffects.weap_ping_c )
	self:PreLoadParticleEffect( "Crysis2_weapon_alienpinger.sonic_weapon" )
	self:PreLoadParticleEffect( "Crysis2_weapon_alienpinger.mouth.open" ) -- Fix: Used in a Mannequin proc-clip, which doesn't support pre-caching yet.	
	Game.CacheBodyDamageProfile(self.BodyDamageProfiles.MouthOpen.fileBodyDamage, self.BodyDamageProfiles.fileCachedBodyDamageParts)
end

function AlienPinger_x:SetupRanges()
	GameAI.RegisterWithModule("RangeModule", self.id)
	self.meleeRangeID = GameAI.AddRange(self.id, self.melee.range, "OnMeleeRangeEnter", "OnMeleeRangeLeave")
end

function AlienPinger_x:ResetSoundIDs()
	self.soundSignals =
	{
		idle = GameAudio.GetSignal("Pinger_Idle"),
		death = GameAudio.GetSignal("Pinger_Death"),
	}
end

function AlienPinger_x:CreateAttachments()
	-- create attachment points
	self:DestroyAttachment(0, "right_item_attachment");
	self:DestroyAttachment(0, "left_item_attachment");
	self:DestroyAttachment(0, "damage_effect");
	self:CreateBoneAttachment(0, "right_item_attachment", "R Gun02");
	self:CreateBoneAttachment(0, "left_item_attachment", "L Gun02");
	self:CreateBoneAttachment(0, "Head", "damage_effect");
	self:CreateBoneAttachment(0, "weapon", "weapon_bone" );
end

function AlienPinger_x:TryMelee()
	if (self:CanMelee()) then
		AI.SetBehaviorVariable(self.id, "Melee", true)
	end
end

function AlienPinger_x:CanMelee()
	return (AI.GetTargetType(self.id) == AITARGET_ENEMY and
			not self:IsUsingPipe("PingerFocusPing") and
			not self:IsUsingPipe("PingerBigPing") and
			not self:IsUsingPipe("PingerMelee"))
end

function AlienPinger_x:MeleeDamage()
	local headDir = self.actor:GetHeadDir();
	local dirX = self:GetDirectionVector(0);
	local dirY = self:GetDirectionVector(1);
	local dirZ = self:GetDirectionVector(2);

	-- if the alien has local meleeDir, blend the head direction and the melee dir.
	local hitDir = g_Vectors.temp_v1;
	if( self.melee.meleeDir ) then
		FastSumVectors( hitDir, headDir, self.melee.meleeDir );
		NormalizeVector( hitDir );
	else
		CopyVector( hitDir, headDir );
	end

	local radius = 5.0;
	local	offset = self.melee.damageOffset;

	local pos=self:GetWorldPos(g_Vectors.temp_v3)
	pos.x = pos.x + dirX.x * offset.x + dirY.x * offset.y + dirZ.x * offset.z;
	pos.y = pos.y + dirX.y * offset.x + dirY.y * offset.y + dirZ.y * offset.z;
	pos.z = pos.z + dirX.z * offset.x + dirY.z * offset.y + dirZ.z * offset.z;

	local entities = System.GetPhysicalEntitiesInBox(pos, radius);

	g_gameRules:ClientViewShake(pos,nil,0,10,20,0.25,0.09);

	if (entities) then
		-- calculate damage for each entity
		for i,entity in ipairs(entities) do
			if (entity ~= self and (AI.GetReactionOf(self.id, entity.id) ~= Friendly)) then

				-- Hit!
				if (g_gameRules) then

					local normal=g_Vectors.temp_v2
					CopyVector(normal, hitDir);
					NegVector(normal);

					g_gameRules:CreateHit(entity.id, self.id, self.id, self.melee.damage, 0, nil, nil, "melee", pos, hitDir, normal)
					entity:AddImpulse(-1, entity:GetWorldPos(g_Vectors.temp_v1), hitDir, 500, 1);
				end
			end
		end
	end
end

function AlienPinger_x:GetHealthEffect()
	local percentage = 100 * self.actor:GetHealth() / self.actor:GetMaxHealth()

	if (percentage > 67) then
		return self.particleEffects.weap_ping_a
	elseif (percentage > 33) then
		return self.particleEffects.weap_ping_b
	else -- percentage < 33
		return self.particleEffects.weap_ping_c
	end
end

function AlienPinger_x:DetectTargetInArea()

	-- # Detects through obstacles
	-- # Just checks for player at the moment

	local player = System.GetEntity(g_localActorId)
	if (player == nil) then
		self:OnError("DetectTargetInArea: Couldn't find the player")
		return
	end

	if (self:C3BalanceMod_IsCloakedPlayer(player)) then
		self.enemyDetectedByPing = nil
		return
	end

	local target = player
	local targetPos = g_Vectors.temp_v1
	local pingerPos = g_Vectors.temp_v2
	target:GetWorldPos(targetPos)
	self:GetWorldPos(pingerPos)

	local playerIsSwimingUnderwater = GameAI.IsSwimmingUnderwater(player.id)

	local bigPingDetectRange
	if (playerIsSwimingUnderwater) then
		bigPingDetectRange = self.BigPingDetectRangeWhenPlayerUnderwater
	else
		bigPingDetectRange = self.BigPingDetectRange
	end

	local targetDist = DistanceVectors(pingerPos, targetPos)

	if (targetDist < bigPingDetectRange) then
		self:Log("DetectTargetInArea: Detected suspect target %s in area", EntityName(target))
		self.enemyDetectedByPing = true
		self:SetSuspect(g_localActorId, targetPos)

		local stimulusData = {}
		stimulusData.pos = targetPos
		stimulusData.type = EST_Sound
		stimulusData.threat = AITHREAT_AGGRESSIVE
		AI.CreateStimulusEvent(self.id, target.id, "EchoFromThreatOnRadar", stimulusData)

		local energyDrainRange
		if (playerIsSwimingUnderwater) then
			energyDrainRange = self.BigPingEnergyDrainRangePlayerUnderwater
		else
			energyDrainRange = self.BigPingEnergyDrainRange
		end
		if (targetDist < energyDrainRange) then
			self:HitTargetWithPing(target, "player_big_ping")
		end
	else
		self.enemyDetectedByPing = nil
		self:Log("DetectTargetInArea: Potential target %s was too far away", EntityName(target))
	end
end

function AlienPinger_x:GenerateBigPing()
	self:Trace("GenerateBigPing");
	local explo_pos = self:GetWorldPos();
	explo_pos.z = explo_pos.z + 1.0;

	local damage = 1000;
	local direction = { x=0, y=0, z=1 };
	local radius = 12;
	local minRadius = 2;
	local minPhysRadius = 4
	local maxPhysRadius = 5
	local pressure = 800
	local effect = self:GetHealthEffect() -- a/b/c depending on health
	local sound = "sounds/a_pinger:pinger_voice:big_pulse";
	local expType = g_gameRules.game:GetHitTypeId("pingerPing");

	g_gameRules:CreateExplosion(self.id,self.id,damage,explo_pos,dir,radius,nil,pressure,0,effect,1.5, minRadius, minPhysRadius, maxPhysRadius, expType);
	self:PlaySoundEvent(sound, g_Vectors.v000, g_Vectors.v010, SOUND_DEFAULT_3D, 0, SOUND_SEMANTIC_LIVING_ENTITY);

	self:DetectTargetInArea()

	self:Event_Pinged(self);
end

function AlienPinger_x:GenerateFocusPing()

	local pingerPos = g_Vectors.temp_v1
	self:GetWorldPos(pingerPos)

	local pingerDir = self.actor:GetAimDir() --self:GetDirectionVector(1)

	local targetPos = nil

	-- Try to get live attention target position
	local targetEntity = AI.GetAttentionTargetEntity(self.id)
	if (self:C3BalanceMod_IsCloakedPlayer(targetEntity)) then
		return false
	end

	if (targetEntity) then
		targetPos = g_Vectors.temp_v2
		targetEntity:GetWorldPos(targetPos)
	end

	local damage = 1000;
	local direction = pingerDir
	local radius = 10;
	local minRadius = 2;
	local minPhysRadius = 2
	local maxPhysRadius = 5
	local pressure = 5000;
	local effect = "Crysis2_weapon_alienpinger.sonic_weapon";
	local expType = g_gameRules.game:GetHitTypeId("pingerPing");
	local explo_pos = self:GetWorldPos();
	explo_pos.z = explo_pos.z + 1.0;

	g_gameRules:CreateExplosion(self.id,self.id,damage,explo_pos,direction,radius,nil,pressure,0,effect,1.5, minRadius, minPhysRadius, maxPhysRadius, expType);
	self:PlaySoundEvent("sounds/a_pinger:pinger_voice:focus_pulse", g_Vectors.v000, g_Vectors.v010, SOUND_DEFAULT_3D, 0, SOUND_SEMANTIC_LIVING_ENTITY)

	local targetWillGetHit = false
	local targetDist = nil

	if (targetPos) then
		targetDist = DistanceVectors(pingerPos, targetPos)

		local pingerToTargetDir = GetDirection(pingerPos, targetPos)
		NormalizeVector(pingerToTargetDir)
		NormalizeVector(pingerDir)

		local angleToTargetRad = GetAngleBetweenVectors(pingerToTargetDir, pingerDir)
		local angleToTarget = math.deg(angleToTargetRad)
		self:Log("Angle to target = "..angleToTarget);
		self:Log("Distance to target = "..targetDist);

		targetWillGetHit = (targetDist < self.FocusPingDetectRange) and (angleToTarget < 45);
	end

	if (targetWillGetHit) then
		self:Log("GenerateFocusPing: Target will get hit");
		local pingSpeed = 50;
		local timeUntilTargetGetsHit = targetDist / pingSpeed;
		Script.SetTimer(timeUntilTargetGetsHit * 1000,
			function()
				self:OnTargetHitByFocusPing(targetDist);
			end
		);
	else
		self:Log("GenerateFocusPing: Target will not get hit");
	end

	return targetWillGetHit;
end

function AlienPinger_x:OnTargetHitByFocusPing(targetDist)
	local target = AI.GetAttentionTargetEntity(self.id)
	if (target == nil) then
		self:OnError("OnTargetHitByFocusPing: Pinger has no target.")
		return
	end

	if (self:C3BalanceMod_IsCloakedPlayer(target)) then
		return
	end

	local pos = g_Vectors.temp_v1
	target:GetWorldPos(pos)
	self:SetSuspectPos(pos)

	if (targetDist < self.FocusPingEnergyDrainRange) then
		self:HitTargetWithPing(target, "player_focus_ping")
	end
end

function AlienPinger_x:HitTargetWithPing(target, hudEffect)
	if (target.actor) then
		target.actor:Fall(self:GetWorldPos(), true)

		target.actor:SendPlayerSuitEvent(eNanoSuitEvent_EMP_DISCHARGE)

		if (target.actor:IsPlayer()) then
			local effectID = MaterialEffects.GetEffectIdByLibName("player_fx", hudEffect)
			local effectParams = { pos = target:GetWorldPos() }
			MaterialEffects.ExecuteEffect(effectID, effectParams)
		end
	end
end

function AlienPinger_x:OnCustomKill()
	if (AlienBase.OnCustomKill) then AlienBase.OnCustomKill(self) end
	GameAudio.PlayEntitySignal(self.soundSignals.death, self.id)
	GameAudio.StopEntitySignal(self.soundSignals.idle, self.id)
end


function AlienPinger_x:DoPainSounds(dead, hitType, isSilenced)
	if ( not dead ) then
		--Only for the big stuff
		if(hitType == "gaussbullet" or hitType == "explosion" or hitType == "frag") then
			AI.PlayCommunication(self.id, "comm_pain", "InjuryPinger", 0.5);
		end
	end

end

function AlienPinger_x:PerformBulletReaction()
	-- Blocking the reaction like this. Do it the right way!
end

function AlienPinger_x:Event_Pinged(senderId)
	BroadcastEvent(self, "Pinged")
end

function AlienPinger_x:GetTimeSinceTargetWasVisible()
	if (self.targetIsVisible) then
		return 0.0;
	end

	return _time - self.lastTimeTargetWasVisible;
end

function AlienPinger_x:ShouldReactToSoundFromPotentialTarget(point)

	-- Are we allowed to react to sound yet?
	if (self.nextValidSoundReactionTime and _time < self.nextValidSoundReactionTime) then
		return false;
	end

	if (point) then
		local minAngleToBodyDir = 30.0;
		if (math.deg(GetAngleBetweenVectors2D(self:GetDirectionVector(), GetDirection(self:GetWorldPos(), point))) < minAngleToBodyDir) then
			return false;
		end
	end

	self:SetNextValidSoundReactionTime(_time + 7.0);
	return true;

end

function AlienPinger_x:SetNextValidSoundReactionTime(nextTime)
	self.nextValidSoundReactionTime = nextTime;
end

function AlienPinger_x:PlayFocusPingAnimation()
	AI.Animation(self.id, AIANIM_SIGNAL, "FocusPing");
end

function AlienPinger_x:PlayBigPingAnimation()
	AI.Animation(self.id, AIANIM_SIGNAL, "BigPing");
end

function AlienPinger_x:EnterPlasmaState()
	AI.SetBehaviorVariable(self.id, "Plasma", true)
end

function AlienPinger_x:EnterCombatState()
	AI.SetBehaviorVariable(self.id, "Plasma", false)
	AI.SetBehaviorVariable(self.id, "Combat", true)
end

function AlienPinger_x:EnterSeekState()
	AI.SetBehaviorVariable(self.id, "Plasma", false)
	AI.SetBehaviorVariable(self.id, "Combat", false)
	AI.SetBehaviorVariable(self.id, "Seek", true)
	AI.SetBehaviorVariable(self.id, "Detect", false)
end

function AlienPinger_x:EnterDetectState()
	AI.SetBehaviorVariable(self.id, "Plasma", false)
	AI.SetBehaviorVariable(self.id, "Combat", false)
	AI.SetBehaviorVariable(self.id, "Seek", false)
	AI.SetBehaviorVariable(self.id, "Detect", true)
end

function AlienPinger_x:EnterPatrolState()
	AI.SetBehaviorVariable(self.id, "Plasma", false)
	AI.SetBehaviorVariable(self.id, "Combat", false)
	AI.SetBehaviorVariable(self.id, "Detect", false)
	AI.SetBehaviorVariable(self.id, "Seek", false)
end

function AlienPinger_x:DistToSuspect()
	return DistanceVectors(self:GetWorldPos(g_Vectors.temp_v4), self.suspectPos)
end

function AlienPinger_x:StoreAttentionTargetAsSuspect()
	local targetPos = g_Vectors.temp_v1
	local validTargetPosition = AI.GetAttentionTargetPosition(self.id, targetPos)
	if (validTargetPosition) then
		local target = AI.GetAttentionTargetEntity(self.id)
		if (self:ValidateAttentionTarget(target)) then
			target:GetWorldPos(targetPos)
			self:SetSuspect(target.id, targetPos)
		else
			self:SetSuspectPos(targetPos)
		end
	else
		self:OnError("StoreAttentionTargetAsSuspect - Failed to retrive the attention target's position")
	end
end

function AlienPinger_x:SetSuspect(id, pos)
	self.suspectID = id
	if (pos ~= nil) then
		CopyVector(self.suspectPos, pos)
	end
end

function AlienPinger_x:SetSuspectPos(pos)
	CopyVector(self.suspectPos, pos)
end

function AlienPinger_x:HasAttentionTarget()
	return AI.GetTargetType(self.id) ~= AITARGET_NONE
end

function AlienPinger_x:ShouldIgnoreHit(hit)
	if (hit.type == "event") then
		return false
	end

	if (hit.shooter and (hit.shooter == self)) then
		return true
	end

	return false
end

function AlienPinger_x:IncomingProjectile(projectileID, timeOfImpact, pos, dir, impactLoc)
	if (self:CanDeflect(projectileID, math.rad(self.DeflectorHalfFieldOfView), pos, dir, impactLoc)) then
		if (timeOfImpact <= 0.15) then
			local dirToProj = GetDirection(pos, impactLoc)

			Particle.SpawnEffect(self.particleEffects.deflectorPulse, pos, dirToProj, 1.0)
			self.deflectingList[projectileID] = true
		end
	end
end

function AlienPinger_x:ImpactImminent(projectileID, timeOfImpact, pos, dir, impactLoc)
	if (self.deflectingList[projectileID]) then
		GameAI.DeflectProjectile(self.id, projectileID, 1.0)
	end
end

function AlienPinger_x:DeflectedProjectile(projectileID, pos, dir)
	Particle.SpawnEffect(self.particleEffects.deflectorRepulse, pos, dir, 1.0)
end

function AlienPinger_x:ProjectileLost(projectileID)
	self.deflectingList[projectileID] = nil
end

function AlienPinger_x:CanDeflect(projectileID, maxAngle, pos, dir, impactLoc)
	if ((not self:IsUsingPipe("PingerBigPing")) and (not self:IsUsingPipe("PingerFocusPing"))) then
		local dirToProj = GetDirection(pos, impactLoc)
		local angleToProj = GetAngleBetweenVectors(dirToProj, dir);

		if (angleToProj < maxAngle) then
			return true
		end
	end

	return false
end

function AlienPinger_x:AnimationEvent(event, value)
	if (event == "FocusPing") then
		AI.Signal(SIGNALFILTER_SENDER, 1, "StartFocusPingTail", self.id)
	elseif (event == "BigPing") then
		AI.Signal(SIGNALFILTER_SENDER, 1, "StartBigPingTail", self.id)
	elseif (event == "MeleeHit") then
		AI.Signal(SIGNALFILTER_SENDER, 1, "MeleeHit", self.id)
	elseif (event == "MouthOpened") then
		AI.Signal(SIGNALFILTER_SENDER, 1, "MouthOpened", self.id)
	elseif (BasicAI.AnimationEvent) then
		BasicAI.AnimationEvent(self, event, value)
	end
end

function AlienPinger_x:IsPerformingFocusPing()
	return self:IsUsingPipe("PingerFocusPing") or self:IsUsingPipe("PingerFocusPingTail")
end

function AlienPinger_x:IsPerformingBigPing()
	return self:IsUsingPipe("PingerBigPing") or self:IsUsingPipe("PingerBigPingTail")
end

function AlienPinger_x.DoFeedbackHit2DSounds(entity, hit)
	if (entity:IsWeakSpotHit(hit)) then
		GameAudio.JustPlayEntitySignal(entity.SharedSoundSignals.FeedbackHit2D_Electronics, entity.id)
		return
	end

	AlienBase.DoFeedbackHit2DSounds(entity, hit)
end
