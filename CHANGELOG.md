# Changelog

## [2.1.0] — 2026-05-15

### New features
- **Boss portraits**: encounter cards now show the boss's portrait from the Encounter Journal (cached per encounterID).
- **Tank swap helper**: every raid boss now has a `tankSwap` data field with trigger (stacks/cast/rotation), debuff name, swap point, and a short note. Compact + expanded views render the swap rules inline.
- **Kill tracking + raid lockout awareness**: the addon now listens to `ENCOUNTER_END` and `GetSavedInstanceInfo` to know which bosses you've already killed this lockout. Killed bosses are marked in the encounter list. Auto-purges on weekly reset.
- **Boss positions for proximity detection**: added `bossPositions` map coordinates for Magisters' Terrace, Maisara Caverns, Windrunner Spire, Seat of the Triumvirate, Algeth'ar Academy, and Skyreach. Cheat sheet auto-pops when you're near a tracked boss.

### Data updates
- Tank swap rules added to all 6 Voidspire bosses (Imperator Averzian, Vorasius, Salhadaar, Vaelgor & Ezzorak, Lightblinded Vanguard, Crown of the Cosmos).
- Interface version bumped 12.0.01 → 12.0.05.

### Internal
- NPC ID → Boss lookup tables fleshed out (bypasses WoW 12.0 tainted-string restrictions).
- Boss portrait icon cache to avoid repeated EJ_GetCreatureInfo calls.

## [2.0.1] — earlier

- Fix encounter detection, encounter ID lookup, cleanup debug.

## [2.0.0] — initial

- M+ dungeons, delves, auto-popup, share to chat.

## [1.0.0] — initial CurseForge release

- 9 raid bosses across Voidspire, Dreamrift, March on Quel'Danas.
- Per-role tips (Tank, Healer, DPS) with player-role highlighting.
