C3BalanceMod
============

Effects:
- Single-player player damage is multiplied by 0.3 before actor damage processing, giving 70% damage reduction.
- Single-player nanosuit energy costs are reduced to 30% for armor hit drain, armor upkeep, stealth upkeep, and common suit action presets.
- Reserve ammo capacity is not changed. In single-player the mod enables the engine's g_infiniteAmmo cvar for inventory ammo, so magazines still deplete and reload normally while reserve ammo is not spent.
- The Lua ammo guard is kept as a fallback: real reserve-pool decreases are restored, pickups or other increases are remembered, and SP weapons whose whole ammo pool is the weapon magazine are restored without raising the original clip/energy pool size.
- In single-player, entering cloak marks the player as invisible to AI and repeatedly sends target-loss signals to enemies that still have the player as their attention target.
- Cloaked players are rejected by shared AI attention-target validation, human and Alien Grunt close-range cloak detection distances are set to 0, and Pinger radar/big ping/focus ping no longer reacquire or hit cloaked players.

Files in this pak:
- Scripts/Entities/actor/BasicActor.lua
- Scripts/Entities/actor/player.lua
- Scripts/Entities/NanoSuit/nanosuit.xml
- Scripts/Entities/AI/Shared/AIBase.lua
- Scripts/Entities/AI/Characters/Human_x.lua
- Scripts/Entities/AI/NewAliens/AlienGrunt_x.lua
- Scripts/Entities/AI/NewAliens/AlienPinger_x.lua

Mod folder layout:
- patch3_c3balance.pak is the built pak copy for this mod.
- active_stage contains the source files used for the currently built pak.
- legacy_temp/stage_v2 contains the source files used for the previous built pak.
- legacy_temp/stage and legacy_temp/stage_min are older intermediate work folders kept for reference only.
- abandoned_C3CloakTargetLossMod_draft is an unused draft kept only as history; the cloak feature is merged into this mod.
- No active C3BalanceMod work files should live under Mods/temp.

Install:
- Link this mod's patch3_c3balance.pak into the game's Patch folder as Patch/patch3.pak.
- The game loads patch paks by the numeric pattern Patch/patch%d.pak, so Patch/patch3_c3balance.pak is not a valid install name.
- Remove or rename Patch/patch3.pak to disable the mod.

Notes:
- Original game pak files are not modified.
- Multiplayer GAME="MP" rows are intentionally left unchanged.
- Another mod that replaces Scripts/Entities/actor/player.lua must be based on this modded player.lua if both mods should be active at the same time.
