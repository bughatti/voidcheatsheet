# VoidCheatSheet — Boss cheat sheets

**CurseForge Project ID:** 1512422 (originally; check current)
**Public repo:** `bughatti/voidcheatsheet`
**Status:** Published. 5 files, 53 encounters (9 raid + 31 dungeon + 13 delve).

## Features

- Compact tooltip + full panel
- Share to chat
- Role highlighting (DPS/Healer/Tank specific tips)
- Tyrannical/trash/companion notes
- **Auto-popup triggers:**
  - Zone-based (delves)
  - `ENCOUNTER_START` by encounterID (raids/dungeons)
  - `UnitName` pcall on mouseover (open world)

## Killed boss tracking (April 2026)

`VoidCheatSheetDB.killed[encounterID]` persists until weekly reset.

- `ENCOUNTER_END success=1` marks raid bosses killed
- `PLAYER_ENTERING_WORLD` triggers `RequestRaidInfo()` + `SyncKillsFromLockouts()` from `GetSavedInstanceInfo`
- Filter in `ShowBossList`: dim collapsed row + `(3/9 this week)` tag
- Filter in `ShowInstance` (raid only): skipped from main list, shown as dim footer
- Slash: `/cs killed`, `/cs unkill`, `/cs sync`
- Dungeons/delves never persist — reset each run

## Boss portraits + tank swap callouts (April 2026)

- `EJ_GetCreatureInfo` fetches `iconImage` (cached per `encounterID`)
- Portrait: 40×40 on full panel title, 28×28 on tooltip
- Title re-anchors via `_titleAnchor` / `_titleAnchorPortrait` when portrait shown
- All 9 raid bosses have `tankSwap = { trigger, debuff, stacks, note }` field
  - `trigger` ∈ `{ "stacks", "cast", "rotation", "mechanic" }`
- Rendered as red callout between TL;DR and Bloodlust on full panel
- Compact line in tooltip (note omitted when player is tank — duplicates full tip)
- Portrait hidden on `ShowBossList`/`ShowInstance` (multi-boss list views)
- Dungeons/delves don't have encounterIDs registered yet — extend `D.byEncounterID` to add portraits there

## Defensive coercion

`GetSavedInstanceInfo` returns `numEnc` as a **string** in some paths. Always:
```lua
local numEnc = tonumber(rawNumEnc) or 0
```
Otherwise: `attempt to compare number with string` error.

## Slash
- `/cs` — toggle panel
- `/cs <boss>` — show specific boss
- `/cs killed` / `/cs unkill` / `/cs sync` — kill tracking
