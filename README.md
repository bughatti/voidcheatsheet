# VoidCheatSheet

**In-game cheat sheets for every Midnight raid, the full Mythic+ pool, and delve bosses — auto-pops on pull.**

Hand-curated, role-aware boss strategy panel with mechanics, phase breakdowns, dangerous trash notes, and Tank/Healer/DPS-specific tips. No theorycrafting required — just pull the boss and read.

---

## Features

- **96 encounters** across raids, M+ dungeons, and delves — Season 1 and Season 2
- **17 raid bosses** across 4 raids: **The Venomous Abyss** (Season 2), plus Voidspire, Dreamrift, March on Quel'Danas
- **57 dungeon bosses** across 16 dungeons — the full **Season 2 Mythic+ pool** (Altar of Fangs, Murder Row, Den of Nalorakk, The Blinding Vale, Voidscar Arena, Kings' Rest, Ruby Life Pools, Temple of Sethraliss) plus the Season 1 pool
- **22 delve bosses** across 14 delves — including Season 2's **Venomfall Deeps** Nemesis (Azta'rec), **The Ring of Glory**, **Gnarldor Isle**, and the new "Children of Ula'tek" story bosses
- **Kept current with hotfixes** — strategies re-checked against live guides and Blizzard's hotfix notes
- **Auto-popup** when targeting a boss or on `ENCOUNTER_START`
- Every ability with descriptions and what to do
- Phase breakdowns, positioning tips, common wipe causes
- Tank/Healer/DPS role-specific tips with **your role highlighted**
- Bloodlust timing recommendations
- Tyrannical-specific notes for M+ dungeons
- Dangerous trash notes per dungeon
- Companion recommendations for delves
- Heroic/Mythic raid differences
- **Share** boss info to party/raid chat with one click
- Resizable, draggable, scrollable panel
- View by raid, dungeon, delve, or boss name

---

## Slash Commands

| Command | Action |
|---|---|
| `/cs` | Show full content list (raids, dungeons, delves) |
| `/cs venomous` | Show all Venomous Abyss bosses |
| `/cs ulatek` | Show a specific boss (works without the apostrophe) |
| `/cs voidspire` | Show all Voidspire bosses |
| `/cs magisters` | Show Magisters' Terrace dungeon guide |
| `/cs darza` | Show specific boss (e.g. Blademaster Darza) |
| `/cs share` | Post current boss TL;DR + tips to party/raid chat |
| `/cs popup on\|off` | Toggle auto-popup on target |
| `/cs hide` | Close panel |
| `/cs reset` | Reset position/size |

---

## Auto-Popup Behavior

- **Target a boss in a delve/dungeon** → compact tooltip appears with TL;DR + your role tip
- **Click the tooltip** to expand to the full cheat sheet
- **Boss pulled in a raid** → full cheat sheet auto-opens via encounter detection
- Works around WoW 12.0 tainted-string restrictions using zone-based detection

---

## Install

**CurseForge (recommended):** search for "VoidCheatSheet"

**Manual:**
1. Download this repo as a ZIP (green Code button → Download ZIP)
2. Extract — you'll get `voidcheatsheet-main/`
3. Rename `voidcheatsheet-main` to `VoidCheatSheet`
4. Drop into `World of Warcraft/_retail_/Interface/AddOns/`
5. Restart WoW or `/reload`

---

## Data Sources

Boss mechanics are cross-checked across multiple guides — each claim against at least two independent sources where possible — and re-checked against Blizzard's official hotfix notes:
- [Wowhead](https://www.wowhead.com) dungeon/raid/delve guides
- [Icy Veins](https://www.icy-veins.com) boss strategy guides
- [Method.gg](https://www.method.gg) raid, M+ and delve guides
- Blizzard's official hotfix posts

---

## Security

- **No network access** — no HTTP calls, no telemetry
- **No account data collection** — doesn't read gold, character names, or account info
- **No mail/trade/AH manipulation** — display-only
- **No hidden code execution** — no `loadstring`, no `RunScript`
- **Read-only** — only displays static boss data, doesn't modify game state
- **Open source** — all code is in this repo, fully auditable

---

## License

MIT — see [LICENSE](LICENSE).

*Part of the Void addon family · free M+ & raid player lookups at [voidscout.io](https://voidscout.io)*
