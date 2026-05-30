C3BalanceMod
============

Effects:
- Single-player player damage is multiplied by 0.3 before actor damage processing, giving 70% damage reduction.
- Single-player nanosuit energy costs are reduced to 30% for armor hit drain, armor upkeep, stealth upkeep, and common suit action presets.
- Single-player player jump height and nanosuit power-jump scale are multiplied by 2.5.
- Reserve ammo capacity is not changed. In single-player the mod enables the engine's g_infiniteAmmo cvar for inventory ammo, so magazines still deplete and reload normally while reserve ammo is not spent.
- The Lua ammo guard is kept as a fallback: real reserve-pool decreases are restored, pickups or other increases are remembered, and SP weapons whose whole ammo pool is the weapon magazine are restored without raising the original clip/energy pool size.
- In single-player, entering cloak marks the player as invisible to AI and repeatedly sends target-loss signals to enemies that still have the player as their attention target.
- Cloaked players are rejected by shared AI attention-target validation, human and Alien Grunt close-range cloak detection distances are set to 0, and Pinger radar/big ping/focus ping no longer reacquire or hit cloaked players.
- Single-player collectible story items and nanosuit upgrades are forced into the tactical HUD path so they can be highlighted/scanned without building a separate map marker system.
- Visor thermal-vision view distance is doubled.
- Visor scan-distance candidate CVars are expanded at player reset: interest-point and look-at distances use x2, while g_highlightingMaxDistanceToHighlightSquared uses x4 because it stores squared distance.
- The single-player bow's regular StickyArrow ammo cap is raised from 9 to 30 and excluded from the infinite-ammo guard so it consumes and refills normally.
- Single-player Traditional Chinese (ChineseT) nanosuit upgrade status text is fixed through a separate language patch pak. In the stock ChineseT translation, 15 of the 16 module perk_<id>_namesp strings have a blank line (a double "\n") right before the "狀態：" status line, which the engine's status renderer drops -- leaving the status/progress blank for every module except HeavyArmor (the only module authored with a single "\n"). The patch collapses that blank line to a single newline for the other 15 modules so all of them show their condition/progress.

Files in the gameplay pak:
- Scripts/Entities/actor/BasicActor.lua
- Scripts/Entities/actor/player.lua
- Scripts/Entities/NanoSuit/nanosuit.xml
- Scripts/Entities/AI/Shared/AIBase.lua
- Scripts/Entities/AI/Characters/Human_x.lua
- Scripts/Entities/AI/NewAliens/AlienGrunt_x.lua
- Scripts/Entities/AI/NewAliens/AlienPinger_x.lua
- Scripts/Entities/Others/InteractiveEntity.lua
- Scripts/Entities/Others/NanosuitUpgrade.lua
- Scripts/Entities/Items/Crysis2/Weapons/Humans/NanoBow.xml
- Scripts/Entities/Items/Crysis2/Weapons/Humans/NanoBowMPPred.xml
- Libs/Libs/EntityArchetypes/Pickups.xml
- localization/ChineseT1/text_ui_messages.xml
- localization/ChineseT/text_ui_messages.xml

Files in the Chinese language patch pak:
- text_ui_messages.xml

Mod folder layout:
- patch3_c3balance.pak is the built pak copy for this mod.
- patch_localization_chineset2.pak is the built Chinese language patch pak copy for this mod.
- active_stage contains the source files used for the currently built pak.
- localization_stage/ChineseT2 contains the source file used for the Chinese language patch pak.
- build_patch3.bat rebuilds patch3_c3balance.pak from active_stage, rebuilds patch_localization_chineset2.pak from localization_stage/ChineseT2, and installs both live paks as hardlinks.
- build_patch3.ps1 contains the actual pak creation and hardlink verification logic used by build_patch3.bat.
- legacy_temp/stage_v2 contains the source files used for the previous built pak.
- legacy_temp/stage and legacy_temp/stage_min are older intermediate work folders kept for reference only.
- abandoned_C3CloakTargetLossMod_draft is an unused draft kept only as history; the cloak feature is merged into this mod.
- No active C3BalanceMod work files should live under Mods/temp.

Install:
- Link this mod's patch3_c3balance.pak into the game's Patch folder as Patch/patch3.pak.
- Link this mod's patch_localization_chineset2.pak into the game's Patch/localization folder as Patch/localization/ChineseT2.pak.
- The game loads patch paks by the numeric pattern Patch/patch%d.pak, so Patch/patch3_c3balance.pak is not a valid install name.
- The game loads Chinese language patches after Localization/ChineseT.pak by applying Patch/localization/ChineseT1.pak, then Patch/localization/ChineseT2.pak if present.
- Run build_patch3.bat after editing active_stage or localization_stage/ChineseT2 to rebuild and reinstall the hardlinked live paks.
- Remove or rename Patch/patch3.pak to disable the mod.
- Remove or rename Patch/localization/ChineseT2.pak to disable the Chinese status-text language patch.

Notes:
- Original game pak files are not modified.
- Multiplayer GAME="MP" rows are intentionally left unchanged.
- Another mod that replaces Scripts/Entities/actor/player.lua must be based on this modded player.lua if both mods should be active at the same time.
- The nanosuit upgrade status line is embedded in each module's perk_<id>_namesp localized string (after the MAXIMUM block) and filled with live %1/%2 progress by the engine UI builder; the visible text comes from namesp, not from a separate @perk_%scondition key. The blank status was purely a ChineseT text-formatting issue -- the extra blank line before "狀態：" -- which is present in the stock Localization/ChineseT.pak and was not introduced by this mod. The English text is unaffected because it uses a single newline throughout. The module-id/perk-id condition alias rows added by an earlier attempt are harmless and left in place.
