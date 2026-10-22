----------------------------------------------------------------------
-- VoidCheatSheet — WoW Forever dungeon data (Classic+ leveling dungeons)
-- Sources: method.gg/wow-forever/dungeons (RFC, WC, SFK, BFD, Stockade,
--   Hall of Thanes, Ruins of Lordaeron, Excavation Site: Wetlands, City of
--   Dalaran), warcrafttavern.com/forever/guides (dungeons list, Hall of
--   Thanes, Gnomeregan, Razorfen Kraul), conquestcapped.com WoW Forever
--   guides (Deadmines, Ruins of Lordaeron, City of Dalaran),
--   accountshark.net (Excavation Site: Wetlands), kami-labs.fr and
--   zockify.com dungeon lists, Blizzard "WoW Forever Beta Development
--   Notes" forum thread (us.forums.blizzard.com/en/wow/t/2360696).
--   Original-Classic boss data for unchanged dungeons = Classic-era
--   knowledge; anything not confirmed was left out.
-- Researched 2026-10-20 against the Oct 8 / Oct 16 beta builds (cap 30).
-- MUST load AFTER DungeonData.lua (that file resets D.dungeons = {}).
----------------------------------------------------------------------
if (select(4, GetBuildInfo()) or 0) >= 100000 then return end   -- retail: skip
local D = VoidCheatSheetData
D.dungeons = D.dungeons or {}

-- Remember where our entries start so the registration loop at the
-- bottom only touches Forever entries (DungeonData.lua already ran its own).
local FIRST_FOREVER_INDEX = #D.dungeons + 1

-- Alternate GetInstanceInfo() names. Guides disagree on the Forever
-- client's instance names (e.g. "The Stockade" vs "Stormwind Stockade"),
-- so every candidate is registered in D.byInstanceBoss below.
local INSTANCE_ALIASES = {
    ["The Hall of Thanes"] = { "Hall of Thanes" },
    ["The Deadmines"] = { "Deadmines" },
    ["The Stockade (Stormwind Stockade)"] = { "The Stockade", "Stormwind Stockade", "Stockade" },
    ["The City of Dalaran"] = { "City of Dalaran", "Dalaran" },
    ["The Temple of Atal'Hakkar (Sunken Temple)"] = { "The Temple of Atal'Hakkar", "Temple of Atal'Hakkar", "Sunken Temple" },
    ["Lower Blackrock Spire"] = { "Blackrock Spire" },
}

----------------------------------------------------------------------
-- RAGEFIRE CHASM (13-18, Horde, Orgrimmar)
-- Classic data; Forever changes not confirmed (Method's Forever guide
-- lists the same 4 bosses and abilities, labels the dungeon "Classic").
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Ragefire Chasm",
    trashNotes = "Searing Blade Enforcers Shield Slam the tank (2s stun) - pulling several = chain-stun, pull one pack at a time. Searing Blade Warlocks spam Shadow Bolt with a Voidwalker - LoS-pull them. Ragefire Shamans heal - interrupt. Molten Elementals have Fire Shield (melee takes fire damage).",
    bosses = {
        { name = "Oggleflint", order = 1, contentType = "dungeon", bossType = "Tank and spank with trogg adds",
          tldr = "Trogg chieftain sitting in a crowd of troggs. Pull the surrounding troggs off first or the group gets swarmed.",
          abilities = { { name = "Cleave", desc = "Frontal cleave - face him away from the group." } },
          tank = "Face him away from the group. Pull the nearby troggs in small groups first.",
          healer = "Easy fight once the room is cleared.",
          dps = "Stay behind him. Clear trogg packs before pulling.",
          positioning = "Boss faced away from party.",
          wipes = "Pulling him with the whole trogg room." },
        { name = "Taragaman the Hungerer", order = 2, contentType = "dungeon", bossType = "Melee AoE",
          tldr = "Fire Nova hits everyone in melee and Uppercut launches the tank. Tank him in the middle of the platform so the knockback does not throw anyone into lava.",
          abilities = {
              { name = "Fire Nova", desc = "Instant fire AoE on everyone in melee range." },
              { name = "Uppercut", desc = "Knocks the tank back and up." },
          },
          tank = "Center of the platform, back away from the lava edge. Retaunt/re-engage after Uppercut.",
          healer = "Fire Nova damage on all melee - group heals. Stay at range.",
          dps = "Ranged at max range. Melee expect Fire Nova ticks.",
          positioning = "Middle of the platform. Clear patrols first.",
          wipes = "Tank knocked into lava; patrol joining the fight." },
        { name = "Jergosh the Invoker", order = 3, contentType = "dungeon", bossType = "Caster with 2 adds",
          tldr = "Warlock boss with two adds. Kill Jergosh first - he is the strongest of the three.",
          abilities = {
              { name = "Immolate", desc = "Fire DoT." },
              { name = "Curse of Weakness", desc = "Reduces the target's damage. Decurse if possible." },
          },
          tank = "Grab Jergosh and both adds.",
          healer = "Watch Immolate ticks; decurse if you can.",
          dps = "Focus Jergosh, then the adds.",
          positioning = "Pull to a cleared area.",
          wipes = "Splitting DPS across all three targets." },
        { name = "Bazzalan", order = 4, contentType = "dungeon", bossType = "Melee with 2 adds (final boss)",
          tldr = "Rogue-type boss with two adds; poisons the tank and Sinister Strikes. Burn Bazzalan, then the adds.",
          abilities = {
              { name = "Poison", desc = "Poison on the current target - cleanse." },
              { name = "Sinister Strike", desc = "Instant physical hit." },
          },
          tank = "Hold boss and adds.",
          healer = "Cleanse the poison if you can.",
          dps = "Kill Bazzalan first.",
          positioning = "Standard.",
          wipes = "Rare - adds overwhelming an undergeared tank." },
    },
}

----------------------------------------------------------------------
-- HALL OF THANES (13-18, NEW in Forever, Old Ironforge / Dun Morogh)
-- Forever-only dungeon. Sources: Method + Warcraft Tavern (beta).
-- Final boss spelled "Durgen Dirgehammer" (WT, Icy Veins) /
-- "Dirgen Dirgehammer" (Method) - verify in game.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "The Hall of Thanes",
    trashNotes = "Dark Iron Engineers throw bombs at the tank's spot - step out before it lands. Dark Iron Looters do heavy poisoned-dagger damage. Dark Iron Summoners cast big Fireballs and summon a fire elemental - interrupt/stun, LoS-pull them. Lesser Stone Golems hit hard and are fast (cannot be outrun). Undead dwarf patrols near Faldrim's tomb. Beta data - may change.",
    bosses = {
        { name = "Faldrim Anvilmar", order = 1, contentType = "dungeon", bossType = "Single target caster (undead dwarf)",
          tldr = "Simple fight; the danger is pulling him together with the undead dwarf patrols around his tomb. Clear a safe spot first.",
          abilities = {
              { name = "Mind Blast", desc = "Shadow nuke. Interruptible, but does not need to be." },
              { name = "Anvilmar's Curse", desc = "Curse: -20% attack and casting speed (also makes the target immune to poisons and bleeds). Decurse if you can." },
          },
          tank = "Pull him only after the patrols near his tomb are dead.",
          healer = "Decurse Anvilmar's Curse when possible.",
          dps = "Optional Mind Blast kicks.",
          positioning = "Cleared area away from the tomb patrol path.",
          wipes = "Patrols added to the pull." },
        { name = "Magmatus", order = 2, contentType = "dungeon", bossType = "Fire elemental with a summoner add",
          tldr = "Fire elemental with a Dark Iron Summoner. Kill the Summoner first while the tank holds Magmatus away from the group.",
          abilities = {
              { name = "Fire Nova", desc = "Instant fire pulse on everyone nearby." },
              { name = "Combust", desc = "Fire damage on a random target." },
          },
          tank = "Hold Magmatus away from the party.",
          healer = "Melee take the Fire Nova pulses - keep them topped.",
          dps = "Kill the Dark Iron Summoner first (kill the patrolling one before the pull if possible). Ranged stay away from the boss.",
          positioning = "Boss away from group; ranged spread out of nova range.",
          wipes = "Leaving the Summoner alive; healer standing in nova range." },
        { name = "Plunder", order = 3, contentType = "dungeon", bossType = "Elemental guardian, knockback",
          tldr = "Only mechanic is Knock Away. Tank with your back to a wall so nobody gets knocked into another trash pack.",
          abilities = { { name = "Knock Away", desc = "Knockback on the target." } },
          tank = "Back to a wall/corner away from uncleared packs.",
          healer = "Low pressure.",
          dps = "Do not stand where a knockback sends you into trash.",
          positioning = "Corner, clear the trash around it first.",
          wipes = "Knocked into extra packs." },
        { name = "Durgen Dirgehammer", order = 4, contentType = "dungeon", bossType = "Melee + 2 golem adds (final boss)",
          tldr = "Clear every Dark Iron Looter in the room first. Boss plus two Lesser Stone Golems deal heavy tank damage, and an 8s AoE fear scatters the group.",
          abilities = {
              { name = "Fear", desc = "AoE fear, about 8 seconds. Tremor Totem helps." },
              { name = "Rend", desc = "Bleed on the tank (about 44 every 3s)." },
              { name = "Lesser Stone Golems", desc = "Two golem adds with the boss." },
          },
          tank = "Defensives early - boss + 2 golems on you. Guides disagree on kill order (boss first vs golems first) - pick one and focus.",
          healer = "Heavy tank damage plus Rend; pre-heal before fears.",
          dps = "Focus the same target. Do not get feared into uncleared corners.",
          positioning = "Clear the whole room so fears are safe.",
          wipes = "Fear into Looter packs; tank overwhelmed by boss + golems." },
    },
}

----------------------------------------------------------------------
-- RUINS OF LORDAERON (15-20, NEW in Forever, Tirisfal Glades)
-- Forever-only dungeon. Sources: Method + Conquest Capped (Oct 8 beta).
-- Bosses can be done in any order; listed in Method's route order.
-- Rare "Lordaeron Captain" omitted (no special abilities).
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Ruins of Lordaeron",
    trashNotes = "Ghouls/Ragged Ghouls in packs of 3-4 sit close together and hit very hard - kill the Ragged Ghoul first. Kings Alley spider packs patrol fast. Shrieking Banshees silence (Deafening Shriek) - kill them first. Flesh Golems knock players into other packs. Living Monstrosity hits hard - pull alone. Stone Watchers turn to stone (heal, physical immune) - swap target or use spells.",
    bosses = {
        { name = "Witherfang", order = 1, contentType = "dungeon", bossType = "Patrolling spider with 2 adds",
          tldr = "Giant spider patrolling Kings Alley with two adds. Clear spider patrols on her path, pull to a clean spot, kill the boss then adds.",
          abilities = { { name = "Leech Poison", desc = "Life-drain poison on the tank. Cure poison helps." } },
          tank = "Pull her alone once her patrol path is clear.",
          healer = "Cure Leech Poison if you can.",
          dps = "Boss first, then adds.",
          positioning = "Cleared section of Kings Alley.",
          wipes = "Spider patrols joining." },
        { name = "The Baron", order = 2, contentType = "dungeon", bossType = "Abomination tank-buster",
          tldr = "Huge melee swings; Knockout takes nearly half the tank's HP and stuns. Keep the tank near full at all times.",
          abilities = {
              { name = "Knockout", desc = "Massive hit (about half tank HP), knockback and stun." },
              { name = "Trample", desc = "Hits everyone around him." },
          },
          tank = "Stay topped; use cooldowns for Knockout. He can be stunned.",
          healer = "Never let the tank sit below ~60% - Knockout plus melee can kill.",
          dps = "Ranged stay out of Trample range. Use stuns.",
          positioning = "Clear the Skeletal Soldier/Mage packs guarding him first.",
          wipes = "Tank caught low when Knockout lands." },
        { name = "Viktor the Vile", order = 3, contentType = "dungeon", bossType = "Optional wave event",
          tldr = "Optional: click the chimney in the burned house SW of Lordamere Overlook. Five add waves with little downtime, Viktor on wave 6 - conserve mana.",
          abilities = { { name = "Leech Poison", desc = "Same life-drain poison as Witherfang - cure it." } },
          tank = "Have threat ready when he spawns - he hits hard.",
          healer = "Pace mana through 5 waves.",
          dps = "AoE the waves; save cooldowns for Viktor.",
          positioning = "Fight near the house.",
          wipes = "Healer out of mana before wave 6. Skip him if the group is struggling." },
        { name = "The Abandoned", order = 4, contentType = "dungeon", bossType = "Wave event caster",
          tldr = "Statue in Market Square starts the event; three add waves, boss on wave 4. Interrupt/stun Life Drain and spread for Frost Nova.",
          abilities = {
              { name = "Life Drain", desc = "Drains the tank (2s cast). Interrupt or stun at cast start." },
              { name = "Frost Nova", desc = "Roots nearby players. Spread a little." },
              { name = "Chilled", desc = "Melee who hit him get chilled." },
          },
          tank = "Pick up waves; position boss so kicks are easy.",
          healer = "Watch tank during uninterrupted drains.",
          dps = "Kick Life Drain every cast.",
          positioning = "Loose spread for Frost Nova.",
          wipes = "Life Drain uncontrolled; adds not handled." },
        { name = "Bjork", order = 5, contentType = "dungeon", bossType = "Patrolling melee",
          tldr = "Patrols the center near deadly ghoul packs. Pull him clean, tank against a wall (Mighty Blow knockback), stop casting during Anti-Magic Shield.",
          abilities = {
              { name = "Mighty Blow", desc = "Hard hit that knocks the tank back." },
              { name = "Anti-Magic Shield", desc = "Short (about 3s) magic immunity - pause spells." },
          },
          tank = "Back to a wall so you do not fly into another pack.",
          healer = "Steady tank healing.",
          dps = "Stop casting during Anti-Magic Shield.",
          positioning = "Clear ghoul packs around his patrol first.",
          wipes = "Pulling ghouls with him." },
        { name = "Rath'mael", order = 6, contentType = "dungeon", bossType = "Necromancer caster",
          tldr = "Not hard: move out of Flamestrike immediately, melee spread around him. Stuns stop his casts.",
          abilities = {
              { name = "Flamestrike", desc = "Ground fire AoE - move out." },
              { name = "Fire Shield", desc = "Self shield; damages attackers." },
          },
          tank = "Stun/interrupt casts where possible.",
          healer = "Heal Flamestrike damage on slow movers.",
          dps = "Spread around him; get out of fire.",
          positioning = "Spread.",
          wipes = "Group stacking in Flamestrike." },
    },
}

----------------------------------------------------------------------
-- THE DEADMINES (15-22, Westfall)
-- Forever CHANGE (single source - Conquest Capped, Oct 8 beta): same layout
-- and boss order, but boss damage retuned (Rhahk'Zor Slam ~330 vs 64-86,
-- Smite Slam ~220 vs 50, Greenskin Poisoned Harpoon higher) + new loot.
-- Instance cap now 5 players (kami-labs). Mechanics otherwise Classic.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "The Deadmines",
    trashNotes = "Defias packs throughout - casters (Defias Wizards/Evokers) behind melee, pull with LoS. Goblin Engineers summon Remote-Controlled Golems near Gilnid. Ship deck: Defias Pirates/Squallshapers in big packs plus VanCleef's Blackguards (stealthed). Forever beta: evading mobs now walk to you instead of standing still, and the dungeon is darker.",
    bosses = {
        { name = "Rhahk'Zor", order = 1, contentType = "dungeon", bossType = "Tank and spank (stun)",
          tldr = "Ogre with two Defias Watchmen. Rhahk'Zor Slam stuns for 3s and hits much harder in Forever (about 330 in beta).",
          abilities = { { name = "Rhahk'Zor Slam", desc = "3s stun on the tank, ~330 damage in Forever beta." } },
          tank = "Expect the stun spikes; defensive if undergeared.",
          healer = "Keep the tank high before each Slam.",
          dps = "Kill the Watchmen or CC them.",
          positioning = "Standard.",
          wipes = "Slam + Watchmen at low tank HP." },
        { name = "Sneed's Shredder", order = 2, contentType = "dungeon", bossType = "Two-stage (Shredder then Sneed)",
          tldr = "Shredder fears players (Terrify) into leftover adds; when it dies Sneed hops out and disarms the tank. Clear the lumber room first.",
          abilities = {
              { name = "Terrify", desc = "Fear - can send players into surviving adds." },
              { name = "Disarm (Sneed)", desc = "Sneed disarms the tank after exiting the Shredder." },
          },
          tank = "Clear adds first. Grab Sneed fast when he pops out.",
          healer = "Watch feared players.",
          dps = "Swap to Sneed immediately.",
          positioning = "Fight in a cleared area.",
          wipes = "Fears into goblin packs." },
        { name = "Gilnid", order = 3, contentType = "dungeon", bossType = "Tank and spank + engineer adds",
          tldr = "Goblin smelter with Molten Metal. Kill the Goblin Engineers - their Remote-Controlled Golems vanish when they die.",
          abilities = { { name = "Molten Metal", desc = "Fire damage." } },
          tank = "Pick up golems as they appear.",
          healer = "Moderate.",
          dps = "Kill Goblin Engineers first.",
          positioning = "Clear the foundry ledges first.",
          wipes = "Golems piling up." },
        { name = "Mr. Smite", order = 4, contentType = "dungeon", bossType = "Weapon swap with group stuns",
          tldr = "At 66% and 33% he Smite Stomps (10s group stun) and swaps weapons. Smite Slam hits much harder in Forever (about 220 in beta).",
          abilities = {
              { name = "Smite Stomp", desc = "10s stun on the group at 66% and 33% while he changes weapons." },
              { name = "Smite Slam", desc = "3s stun on the tank, ~220 damage in Forever beta." },
          },
          tank = "Re-grab him after each weapon swap; defensives around Slam.",
          healer = "Top everyone before 66%/33% - you will be stunned 10s.",
          dps = "Slow damage near 66% and 33% if the tank or healer is low.",
          positioning = "Clear the ship-side pirates before pulling.",
          wipes = "Group pushed into a stomp at low HP." },
        { name = "Captain Greenskin", order = 5, contentType = "dungeon", bossType = "Cleave + poison",
          tldr = "Cleave - face him away. Poisoned Harpoon ticks much harder in Forever beta (198 every 10s for 1 min) - cure poison.",
          abilities = {
              { name = "Cleave", desc = "Frontal cleave." },
              { name = "Poisoned Harpoon", desc = "Hit plus 1-minute Nature DoT; cure poison." },
          },
          tank = "Face him away from the party.",
          healer = "Cure the harpoon poison.",
          dps = "Stay behind.",
          positioning = "Boss faced away.",
          wipes = "Cleave on melee; uncured harpoon stacks." },
        { name = "Edwin VanCleef", order = 6, contentType = "dungeon", bossType = "Final boss with Blackguard adds",
          tldr = "Starts with two Defias Blackguards and calls two more at ~50%. Stun at ~51-55% (e.g. Hammer of Justice) to stagger adds, kill adds fast.",
          abilities = { { name = "Call Blackguards", desc = "Two more Defias Blackguard adds at ~50% health." } },
          tank = "Pick up Blackguards as they come.",
          healer = "Spike when the second pair spawns.",
          dps = "Kill Blackguards, then VanCleef.",
          positioning = "Clear the deck first.",
          wipes = "Four adds + boss on the tank at once." },
    },
}

----------------------------------------------------------------------
-- WAILING CAVERNS (17-24, The Barrens)
-- Classic data; Forever changes not confirmed (Method labels it "Classic";
-- only beta note: Serpentbloom Snakes now despawn after a few minutes).
-- Rare Deviate Faerie Dragon omitted.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Wailing Caverns",
    trashNotes = "Druids of the Fang cast Druid's Slumber (sleep, can hit the healer) - interrupt; they turn into serpents near death and hit hard. Deviate Dreadfangs fear (Terrify). Deviate Shamblers heal with Wild Regeneration - interrupt. Deviate Vipers spit cleansable poison. Long paths with lots of respawn-free but wandering mobs.",
    bosses = {
        { name = "Lady Anacondra", order = 1, contentType = "dungeon", bossType = "Druid caster",
          tldr = "Fang lord caster: Lightning Bolt, heals, Sleep, Thorns. Pull her away from nearby mobs - the fight snowballs fast.",
          abilities = {
              { name = "Sleep", desc = "Sleeps a target - interrupt." },
              { name = "Healing Touch", desc = "Self/ally heal - interrupt." },
              { name = "Lightning Bolt", desc = "Nature nuke on the tank." },
              { name = "Thorns Aura", desc = "Melee take damage when hitting." },
          },
          tank = "LoS-pull her away from adds.",
          healer = "Watch for Sleep on yourself.",
          dps = "Kick Healing Touch and Sleep.",
          positioning = "Pull to a cleared corridor.",
          wipes = "Uninterrupted heals + slept healer." },
        { name = "Kresh", order = 2, contentType = "dungeon", bossType = "Tank and spank",
          tldr = "Turtle with high armor; just tank and spank. Casters do the heavy lifting.",
          abilities = { { name = "Bite", desc = "Melee bite on the tank." } },
          tank = "Easy.", healer = "Easy.", dps = "Spell damage preferred (high armor).",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Lord Cobrahn", order = 3, contentType = "dungeon", bossType = "Druid caster + snake adds",
          tldr = "Fang lord with Deviate Python adds; goes Serpent Form near death. Interrupt Druid's Slumber before Healing Touch.",
          abilities = {
              { name = "Druid's Slumber", desc = "Sleep - often on the healer. Highest-priority kick." },
              { name = "Healing Touch", desc = "Self-heal - interrupt." },
              { name = "Lightning Bolt", desc = "Nuke." },
              { name = "Cobrahn Serpent Form", desc = "Turns into a serpent near death and hits harder." },
          },
          tank = "Hold boss and pythons.",
          healer = "Stand where kicks can protect you; have a plan if slept.",
          dps = "Interrupts first, damage second.",
          positioning = "Standard.",
          wipes = "Slept healer + serpent-form damage." },
        { name = "Lord Pythas", order = 4, contentType = "dungeon", bossType = "Druid caster + adds",
          tldr = "Fang lord with a Druid of the Fang and a Deviate Shambler. Adds first (stun them), interrupt Sleep, watch Thunderclap slow.",
          abilities = {
              { name = "Thunderclap", desc = "AoE damage + movement/attack slow." },
              { name = "Druid's Slumber", desc = "Sleep - interrupt." },
              { name = "Healing Touch", desc = "Self-heal - interrupt." },
              { name = "Lightning Bolt", desc = "Nuke." },
          },
          tank = "Grab all three.",
          healer = "Thunderclap damage on melee.",
          dps = "Adds first, stun them, kick the boss.",
          positioning = "Standard.",
          wipes = "Shambler heals + sleeps overlapping." },
        { name = "Skum", order = 5, contentType = "dungeon", bossType = "Tank and spank",
          tldr = "Only mechanic is Chained Bolt - spread out and kill him.",
          abilities = { { name = "Chained Bolt", desc = "Chains between nearby players." } },
          tank = "Easy.", healer = "Light group damage.", dps = "Spread.",
          positioning = "Spread to limit chains.", wipes = "Rare." },
        { name = "Lord Serpentis", order = 6, contentType = "dungeon", bossType = "Druid caster + 2 adds",
          tldr = "Last Fang lord, two druid adds, same kit. Kill the adds, then the boss. All 4 Fang lords dead = Mutanus event can be started.",
          abilities = {
              { name = "Druid's Slumber", desc = "Sleep - interrupt." },
              { name = "Healing Touch", desc = "Heal - interrupt." },
              { name = "Lightning Bolt", desc = "Nuke." },
          },
          tank = "Hold all three.", healer = "Watch for sleeps.", dps = "Adds first, kick heals.",
          positioning = "Standard.", wipes = "Too many uninterrupted casts." },
        { name = "Verdan the Everliving", order = 7, contentType = "dungeon", bossType = "Heavy melee + group root",
          tldr = "Hits the tank VERY hard. Grasping Vines damages and roots everyone - healer focuses the tank.",
          abilities = { { name = "Grasping Vines", desc = "Physical AoE + root on everyone." } },
          tank = "Cooldowns - big melee hits.", healer = "Tank focus, top the group after Vines.",
          dps = "Burn him.", positioning = "Standard.", wipes = "Tank dies to melee." },
        { name = "Mutanus the Devourer", order = 8, contentType = "dungeon", bossType = "Escort event final boss",
          tldr = "Only spawns after all 4 Fang lords (Anacondra, Cobrahn, Pythas, Serpentis) are dead and you escort the Disciple of Naralex. Two add waves, then Mutanus with fear, stun and Naralex's Nightmare (sleep).",
          abilities = {
              { name = "Thundercrack", desc = "AoE 2s stun." },
              { name = "Terrify", desc = "4s fear." },
              { name = "Naralex's Nightmare", desc = "Sleep/control on a player." },
          },
          tank = "Grab wave adds off the Disciple; reposition after fears.",
          healer = "Heal the Disciple during waves if needed.",
          dps = "Clear the dungeon first; burn waves, then boss.",
          positioning = "Stay near the Disciple during waves.",
          wipes = "A Fang lord still alive (no event); Disciple dies to adds." },
    },
}

----------------------------------------------------------------------
-- SHADOWFANG KEEP (20-26, Silverpine Forest)
-- Classic data; Forever changes not confirmed (Method labels it "Classic").
-- Rare Deathsworn Captain omitted.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Shadowfang Keep",
    trashNotes = "Wailing Guardsmen silence everyone in melee (Screams of the Past) repeatedly. Haunted Servitors curse (Haunting Spirits summons ghosts). Lupine Horrors summon Lupine Delusions - kill them fast. Son of Arugal casts Arugal's Gift (shadow DoT). Shadowfang Moonwalkers can go magic-immune (Anti-Magic Shield). Fel Steeds stun with Fel Stomp. Tormented Officers curse a weapon skill down.",
    bosses = {
        { name = "Rethilgore", order = 1, contentType = "dungeon", bossType = "Tank and spank + adds",
          tldr = "Kill adds then boss; Soul Drain stuns and drains the target. Killing him frees the prisoners who open the courtyard door.",
          abilities = { { name = "Soul Drain", desc = "Stun + drain on the target." } },
          tank = "Hold boss and adds.", healer = "Heal through Soul Drain.", dps = "Adds, then boss. Use stuns.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Razorclaw the Butcher", order = 2, contentType = "dungeon", bossType = "Tank and spank",
          tldr = "Butcher Drain drains a player. Minor adds - kill them, then the boss.",
          abilities = { { name = "Butcher Drain", desc = "Drains a player." } },
          tank = "Easy.", healer = "Easy.", dps = "Adds first.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Baron Silverlaine", order = 3, contentType = "dungeon", bossType = "Healing debuff on tank",
          tldr = "Veil of Shadow cuts healing on the tank by 75% for 15s. Do not pull him with extra adds.",
          abilities = { { name = "Veil of Shadow", desc = "Curse: -75% healing taken for 15s on the tank. Decurse if you can." } },
          tank = "Defensives while Veil is up; pull him alone.",
          healer = "Pre-heal before Veil; decurse if possible.",
          dps = "Stuns help.", positioning = "Clear his room first.",
          wipes = "Veil + adds = tank dies." },
        { name = "Commander Springvale", order = 4, contentType = "dungeon", bossType = "Paladin with 2 adds",
          tldr = "Comes with a Haunted Servitor and a Wailing Guardsman - kill the Guardsman first (AoE silence). Interrupt Holy Light; he can Divine Shield.",
          abilities = {
              { name = "Holy Light", desc = "Self-heal - interrupt." },
              { name = "Hammer of Justice", desc = "Stun." },
              { name = "Divine Shield", desc = "Full immunity for 10s." },
          },
          tank = "Hold all three.", healer = "Stay out of the Guardsman's melee silence.",
          dps = "Guardsman first, kick Holy Light.",
          positioning = "Standard.", wipes = "Silenced healer; uninterrupted heals." },
        { name = "Odo the Blindwatcher", order = 5, contentType = "dungeon", bossType = "Soft enrage",
          tldr = "Howling Rage stacks up his damage and size over time - shorter fight is safer. Kill the two Vile Bats first.",
          abilities = {
              { name = "Howling Rage", desc = "Growing damage buff over the fight." },
              { name = "Vile Bats", desc = "Two bat adds that cleave and can disarm." },
          },
          tank = "Face bats away from the group.", healer = "Ramping tank damage.",
          dps = "Bats first, then burn Odo.", positioning = "Bats faced away.",
          wipes = "Fight runs long; Howling Rage stacks." },
        { name = "Fenrus the Devourer", order = 6, contentType = "dungeon", bossType = "Tank and spank (poison)",
          tldr = "Toxic Saliva poison DoT - cleanse it. Otherwise dies fast.",
          abilities = { { name = "Toxic Saliva", desc = "Poison DoT. Cleanse." } },
          tank = "Easy.", healer = "Cure poison.", dps = "Burn.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Wolf Master Nandos", order = 7, contentType = "dungeon", bossType = "Add summoner",
          tldr = "Guarded by four wolves; killing them aggros Nandos. He hits hard and summons Bleak Worgs / Lupine Horrors - kill adds, then boss.",
          abilities = { { name = "Summon Worgen", desc = "Summons Bleak Worg or Lupine Horror adds." } },
          tank = "Pick up every summon.", healer = "Spiky tank damage.",
          dps = "Swap to adds, Lupine Horrors fastest.", positioning = "Standard.",
          wipes = "Adds piling up." },
        { name = "Archmage Arugal", order = 8, contentType = "dungeon", bossType = "Teleporting caster (final boss)",
          tldr = "Void Bolt hits the tank hard, Shadow Port teleports him around the room, Arugal's Curse takes control of a player for 10s. Use LoS on Void Bolt and crowd-control the cursed player.",
          abilities = {
              { name = "Void Bolt", desc = "Big shadow hit on the tank - break LoS when possible." },
              { name = "Shadow Port", desc = "Teleports to another spot in the room." },
              { name = "Arugal's Curse", desc = "Controls a player for 10s - taunt/CC them." },
              { name = "Thundershock", desc = "AoE damage around him." },
          },
          tank = "Chase him after each teleport; LoS Void Bolts.",
          healer = "Tank spikes from Void Bolt.",
          dps = "Follow the teleports; CC the cursed player.",
          positioning = "Use pillars for LoS.",
          wipes = "Tank eats repeated Void Bolts; cursed player kills the healer." },
    },
}

----------------------------------------------------------------------
-- BLACKFATHOM DEEPS (22-28, Ashenvale)
-- Classic data; Forever changes not confirmed (Method labels it "Classic";
-- only Forever note is the new Stormwind Harbor boat to Auberdine).
-- Optional Lorgus Jett / Baron Aquanis omitted.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Blackfathom Deeps",
    trashNotes = "Twilight Shadowmages mind control (Dominate Mind) - kill first. Fallenroot Hellcallers Mana Burn - interrupt/stun. Twilight Acolytes heal - interrupt. Fallenroot Shadowstalkers are stealthed. Murkshallow Snapclaws and Blackfathom Myrmidons disarm the tank. Sea Witches Frost Nova. Murloc packs at Gelihast - pull 1-2 at a time.",
    bosses = {
        { name = "Ghamoo-Ra", order = 1, contentType = "dungeon", bossType = "Tank and spank (high armor)",
          tldr = "Turtle with high armor. Trample hits everyone around him; use Sunder Armor/Faerie Fire.",
          abilities = { { name = "Trample", desc = "AoE hit on everyone nearby." } },
          tank = "Easy.", healer = "Melee take Trample.", dps = "Armor reduction; casters shine.",
          positioning = "Ranged at range.", wipes = "Rare." },
        { name = "Lady Sarevess", order = 2, contentType = "dungeon", bossType = "Naga caster + 2 adds",
          tldr = "Two naga adds - CC/kill them first. Face her away so Forked Lightning does not hit the group.",
          abilities = {
              { name = "Forked Lightning", desc = "Frontal lightning cone." },
              { name = "Frost Nova", desc = "Roots nearby players." },
              { name = "Slow", desc = "Slows a target." },
          },
          tank = "Face her away from the party.", healer = "Avoid her front.",
          dps = "Adds first, then boss.", positioning = "Boss faced away.",
          wipes = "Group in the Forked Lightning cone." },
        { name = "Gelihast", order = 3, contentType = "dungeon", bossType = "Murloc boss",
          tldr = "Clear the murlocs in small pulls first. His only ability is Net (10s root).",
          abilities = { { name = "Net", desc = "10s root on a target." } },
          tank = "Pull murlocs back in 1-2 packs.", healer = "Easy once cleared.",
          dps = "Do not chase pulls.", positioning = "Room cleared first.",
          wipes = "Pulling the whole murloc cave." },
        { name = "Old Serra'kis", order = 4, contentType = "dungeon", bossType = "Underwater",
          tldr = "No abilities - the risk is drowning. Kill him in the water before breath runs out.",
          abilities = { { name = "Underwater fight", desc = "Watch your breath bar." } },
          tank = "Engage quickly.", healer = "Watch breath, not just HP.",
          dps = "Burn fast; surface if needed.", positioning = "Underwater.",
          wipes = "Drowning." },
        { name = "Twilight Lord Kelris", order = 5, contentType = "dungeon", bossType = "Caster",
          tldr = "Clear the adds in his room, LoS-pull using the entrance wall. Mind Blast on tank, Sleep on random players.",
          abilities = {
              { name = "Mind Blast", desc = "Shadow nuke on the tank." },
              { name = "Sleep", desc = "Sleeps a random player." },
          },
          tank = "LoS-pull to the wall.", healer = "Wake/cover slept players.",
          dps = "Burn.", positioning = "Entrance wall for LoS.",
          wipes = "Pulled with room adds." },
        { name = "Aku'mai", order = 6, contentType = "dungeon", bossType = "Brazier event + final boss",
          tldr = "Lighting the 4 braziers past Kelris spawns add waves - light them ONE at a time and clear each wave. Aku'mai drops Poison Clouds and frenzies.",
          abilities = {
              { name = "Poison Cloud", desc = "Heavy nature damage cloud - move out." },
              { name = "Frenzied Rage", desc = "+75% attack speed - tank cooldowns." },
          },
          tank = "Cooldowns on Frenzied Rage.", healer = "Tank focus during frenzy.",
          dps = "Move out of clouds.", positioning = "Away from clouds.",
          wipes = "Lighting multiple braziers at once." },
    },
}

----------------------------------------------------------------------
-- THE STOCKADE (25-29, Stormwind City, Alliance quests)
-- Classic data; Forever changes not confirmed (Method labels it "Classic").
-- NAME: Blizzard beta notes/Method/WT say "The Stockade"; datamined lists
-- (kami-labs, zockify) say "Stormwind Stockade". Combined name so the
-- substring lookup matches either; both exact names registered as aliases.
-- Rare Bruegal Ironknuckle omitted.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "The Stockade (Stormwind Stockade)",
    trashNotes = "Corridors of open cells with linked prisoner packs (Defias Inmates/Convicts/Captives/Insurgents). Fears and knockbacks send people into extra cells - pull slowly. Captives apply Infected Wound (more physical damage taken), Inmates Rend (worse with Infected Wound). Insurgents Demoralizing Shout. Runners at low HP pull more packs.",
    bosses = {
        { name = "Targorr the Dread", order = 1, contentType = "dungeon", bossType = "Tank and spank, enrage",
          tldr = "Can be in different cells of the first hallway - check before pulling. Enrages at 20%.",
          abilities = {
              { name = "Thrash", desc = "Extra attacks." },
              { name = "Enrage", desc = "At 20% HP." },
          },
          tank = "Cooldown at 20%.", healer = "Spike at enrage.", dps = "Burn the last 20%.",
          positioning = "Pull him out of his cell.", wipes = "Extra prisoner pulls." },
        { name = "Dextren Ward", order = 2, contentType = "dungeon", bossType = "AoE fear",
          tldr = "Intimidating Shout fears the group - pull him where fears will not run people into other cells. Tremor Totem negates it.",
          abilities = { { name = "Intimidating Shout", desc = "AoE fear." } },
          tank = "Pull to a cleared section.", healer = "Fear Ward/Tremor if available.",
          dps = "Burn.", positioning = "Away from uncleared cells.", wipes = "Fears into extra packs." },
        { name = "Kam Deepfury", order = 3, contentType = "dungeon", bossType = "Strong prisoner",
          tldr = "More of a strong prisoner than a boss: Shield Slam stuns the tank 2s, Improved Blocking raises block.",
          abilities = { { name = "Shield Slam", desc = "2s stun on the tank." } },
          tank = "Easy.", healer = "Easy.", dps = "Burn.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Hamhock", order = 4, contentType = "dungeon", bossType = "Caster + Bloodlust",
          tldr = "Spams Chain Lightning and Bloodlusts himself and nearby adds. Stuns and attack-speed slows (Thunderclap) help.",
          abilities = {
              { name = "Chain Lightning", desc = "Bouncing nature damage - spread." },
              { name = "Bloodlust", desc = "+30% attack and cast speed on him and adds." },
          },
          tank = "Thunderclap/slows.", healer = "Group damage from chains.",
          dps = "Spread; stun him.", positioning = "Spread.", wipes = "Bloodlusted adds." },
        { name = "Bazil Thredd", order = 5, contentType = "dungeon", bossType = "Final boss, AoE stun",
          tldr = "Smoke Bomb stuns everyone near him for 4s - ranged stay away. When the tank is stunned he hits the next player on threat.",
          abilities = { { name = "Smoke Bomb", desc = "4s AoE stun around him." } },
          tank = "Expect threat loss windows.", healer = "Stay out of Smoke Bomb range.",
          dps = "Ranged stay back; melee watch threat.", positioning = "Ranged at max range.",
          wipes = "Healer stunned while he chews a DPS." },
    },
}

----------------------------------------------------------------------
-- EXCAVATION SITE: WETLANDS (26-31, NEW in Forever, Wetlands)
-- Forever-only dungeon (added Oct 1 beta). Sources: Method + AccountShark.
-- Guides disagree on minor numbers (Shadetooth enrage 20% vs 30%;
-- Saltspine Dust Storm = threat loss vs -25% hit) - generic text used.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Excavation Site: Wetlands",
    trashNotes = "Thicket Lurkers/Stalkers hide invisibly in tall grass until aggroed - fear paths into grass = wipes. Thicket Hunters apply Infected Wound (disease) - cleanse. Thicket Matriarchs/Lurkers Rend Flesh (big bleed). Young Riptooth packs of 3 - kill one at a time. Dragonmaw Warders Mortal Strike (-50% healing) and Net (10s root, Blessing of Freedom breaks it). Dragonmaw Saboteurs throw bombs at an area. Dragonmaw Thaumaturgists come with a fire elemental - kill it first. Highland Lurkers poison - cleanse.",
    bosses = {
        { name = "Saltspine", order = 1, contentType = "dungeon", bossType = "Patrolling crocolisk",
          tldr = "Patrols the edge of the crocolisk lake - clear nearby trash first or the pull overwhelms the group. Dust Storm hampers everyone within 10 yards.",
          abilities = {
              { name = "Dust Storm", desc = "10-yard effect that hurts the tank's threat/hit chance." },
              { name = "Tendon Rip", desc = "Heavy slow on the target." },
              { name = "Fatal Bite", desc = "Hard bite on the target." },
          },
          tank = "Build threat early; Dust Storm hurts it.", healer = "Stay out of 10 yards.",
          dps = "Casters stay out of Dust Storm range; watch threat.", positioning = "Clear the lake edge first.",
          wipes = "Pulling him with lake packs." },
        { name = "Shadetooth", order = 2, contentType = "dungeon", bossType = "Raptor + 2 adds, fear",
          tldr = "Patrols the raptor path with two Thicket Hunters. Terrifying Roar fears players into hidden grass packs - Tremor Totem/Fear Ward, or clear the grass first. Enrages at low health.",
          abilities = {
              { name = "Terrifying Roar", desc = "Fear - sends players into hidden stealthed packs." },
              { name = "Rend", desc = "Bleed on the tank (~77 every 3s)." },
              { name = "Enrage", desc = "At low health: faster, harder attacks. Stuns/slows help." },
          },
          tank = "Fight on cleared ground; save cooldowns for the enrage.",
          healer = "Cleanse Infected Wound from the Thicket Hunters.",
          dps = "CC one Hunter, burn the other, then boss.", positioning = "Cleared cove, away from tall grass.",
          wipes = "Fear into hidden Lurker packs." },
        { name = "Highland Horror", order = 3, contentType = "dungeon", bossType = "Quest boss (no loot)",
          tldr = "Alliance quest boss. Do not pull the slimes around him; kill fast and grab the quest item.",
          abilities = {
              { name = "Entangling Roots", desc = "Root." },
              { name = "Wild Regeneration", desc = "Heal - interrupt." },
          },
          tank = "Pull clean.", healer = "Easy.", dps = "Kick heals.",
          positioning = "Away from slimes.", wipes = "Slimes added." },
        { name = "Relic Guardian", order = 4, contentType = "dungeon", bossType = "Titan construct (final boss)",
          tldr = "Activate it at the Titan panel beside it; it is higher level (misses/dodges hurt threat). Arcing Smash frontal, Knock Away drops threat, War Stomp knocks back and stuns - ranged stay far.",
          abilities = {
              { name = "Arcing Smash", desc = "Frontal cleave - face away." },
              { name = "Knock Away", desc = "Single-target knock that reduces threat." },
              { name = "War Stomp", desc = "AoE knockback + stun." },
              { name = "Thunderclap", desc = "AoE damage + attack/movement slow." },
          },
          tank = "Face away; retaunt after Knock Away.", healer = "Stay out of Thunderclap/War Stomp range.",
          dps = "Ranged stay back; watch threat. It can be stunned/slowed (kite if needed).",
          positioning = "Boss faced away, ranged spread at range.",
          wipes = "Threat loss after Knock Away; mana runs out on a long fight." },
    },
}

----------------------------------------------------------------------
-- CITY OF DALARAN (28-33, NEW in Forever, Alterac Mountains)
-- Forever-only dungeon (added Oct 8 beta). Needs Dalaran Sewers Key.
-- Sources: Method + Conquest Capped. Boss lists differ between guides
-- (kami-labs/games.gg also mention a Mana Wraith/Mana Elemental - not
-- confirmed, omitted). Lyn the Ignored needs the Tome of Dalaran.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "The City of Dalaran",
    trashNotes = "Most damage (even melee) is ARCANE - warrior/paladin tanks block little. Kirin Tor Necromancers spam Raise Dead and Unholy Frenzy (+75% attack speed) - kill first. Mana Phantoms Mana Burn - interrupt/stun. Phantasms Reflection Field reflects spells - check target. Seeking Remnants detect stealth. Fallen Mages Frostbolt - LoS-pull. Fragmented Sentries Arcing Smash frontal.",
    bosses = {
        { name = "Atrexis the Grave Knight", order = 1, contentType = "dungeon", bossType = "Patrolling melee + raised adds",
          tldr = "Patrols with three Kirin Tor Necromancers - kill a couple before the pull. Hits the tank hard and raises dead; kill the first adds, then focus him.",
          abilities = {
              { name = "Raise Dead", desc = "Summons undead adds until he dies." },
              { name = "Disarm", desc = "Disarms the tank." },
              { name = "Unholy Frenzy", desc = "Attack speed buff on himself/allies." },
              { name = "Strike", desc = "Instant hit." },
          },
          tank = "Cooldowns; he hits hard, especially frenzied.", healer = "Heavy tank healing.",
          dps = "First adds, then boss.", positioning = "Thin out the necromancers before engaging.",
          wipes = "Necromancers + frenzied adds overwhelm the tank." },
        { name = "Lyn the Ignored", order = 2, contentType = "dungeon", bossType = "Secret boss (Tome of Dalaran)",
          tldr = "Only appears if someone brings the Tome of Dalaran. Raises dead, Shadow Bolt Volleys the group, and puts Curse of Thorns on the tank - decurse.",
          abilities = {
              { name = "Raise Dead", desc = "Continuous undead adds." },
              { name = "Shadow Bolt Volley", desc = "Hits the whole group." },
              { name = "Curse of Thorns", desc = "Tank takes damage whenever they deal damage - decurse." },
          },
          tank = "Grab raised adds.", healer = "Group healing for volleys; decurse.",
          dps = "Boss focus, clean adds as needed.", positioning = "Standard.",
          wipes = "Curse left on tank; volley damage + adds." },
        { name = "Arcane Anomaly", order = 3, contentType = "dungeon", bossType = "Rotating beam",
          tldr = "Arcane Bolt blasts the tank (~500). Focal Blast is a 3s beam sweeping clockwise or counterclockwise - read the direction and move with it.",
          abilities = {
              { name = "Arcane Bolt", desc = "~500 arcane on the tank." },
              { name = "Focal Blast", desc = "3s channeled sweeping beam." },
          },
          tank = "Tank spikes from Arcane Bolt.", healer = "Big tank heals, heal beam hits.",
          dps = "Move with the beam direction.", positioning = "Krasus Landing.",
          wipes = "Group caught by the sweep." },
        { name = "Arcanic Enigma", order = 4, contentType = "dungeon", bossType = "Caster + Mana Phantoms",
          tldr = "Two Mana Phantoms - interrupt/stun their Mana Burn, do not let it go off. Dispel Manamorph (polymorph), ranged avoid the Silence, split damage between Manalings and boss.",
          abilities = {
              { name = "Manamorph", desc = "Polymorph-like on random targets - dispel." },
              { name = "Silence", desc = "AoE silence - ranged can avoid." },
              { name = "Summon Manaling", desc = "Adds." },
          },
          tank = "Hold boss, grab Manalings.", healer = "Dispel Manamorph; stay out of Silence.",
          dps = "Kill Phantoms first, kick Mana Burn.", positioning = "Southern bank garden.",
          wipes = "Mana Burn draining the healer." },
        { name = "Unstable Sentinel", order = 5, contentType = "dungeon", bossType = "Construct, pulsing AoE",
          tldr = "Arcing Smash frontal - face away. Malfunction pulses AoE within 25 yards; ranged stand beyond 25 yd and a stun before the cast prevents it.",
          abilities = {
              { name = "Arcing Smash", desc = "Frontal cleave." },
              { name = "Malfunction", desc = "Pulsing AoE within 25 yards - stun to prevent." },
          },
          tank = "Face away; he hits relatively hard.", healer = "Stay 25+ yards out.",
          dps = "Stun on Malfunction cast.", positioning = "Ranged 25+ yards away.",
          wipes = "Melee/healer eating full Malfunction." },
        { name = "Fel Ancient", order = 6, contentType = "dungeon", bossType = "Roots + ground pools",
          tldr = "Talk to Grindle Firespark to drop the barriers. Entangle roots for 10s with damage; move out of green Fel Timbers pools immediately.",
          abilities = {
              { name = "Entangle", desc = "10s root that deals damage. Blessing of Freedom removes it." },
              { name = "Fel Timbers", desc = "Green damaging pool on the ground - move." },
          },
          tank = "Move boss out of pools.", healer = "Freedom/heal rooted players.",
          dps = "Get out of green.", positioning = "Keep clean ground.",
          wipes = "Rooted in a pool." },
        { name = "Mana Devourer", order = 7, contentType = "dungeon", bossType = "Mana drain DPS check",
          tldr = "Clear the whole room near the Violet Hold first. Debilitate hits everyone and drains mana - kill him before the healer runs dry.",
          abilities = {
              { name = "Drain Vitality", desc = "Arcane DoT on the tank." },
              { name = "Debilitate", desc = "Group arcane damage + drains 200 mana from everyone." },
          },
          tank = "Pull clean.", healer = "Efficient heals; mana is the clock.",
          dps = "Cooldowns - this is a burn.", positioning = "Room cleared.",
          wipes = "Healer out of mana." },
        { name = "Shade of the Archmage", order = 8, contentType = "dungeon", bossType = "Mana-cycle caster (final boss)",
          tldr = "Speak to Archmage Modela for the Purple Parlor portal. Move him away from where Bounding Mana was cast (sphere returns + Arcane Explosion 20 yd). At 0 mana: Mass Polymorph, then Evocation and the fight resets - save cooldowns for after.",
          abilities = {
              { name = "Arcane Bolt", desc = "Heavy arcane damage on the tank." },
              { name = "Bounding Mana", desc = "Sphere moves out and back; explodes for Arcane Explosion (20 yd) on return." },
              { name = "Mass Polymorph", desc = "At 0 mana; polymorphs the group." },
              { name = "Evocation", desc = "Restores his mana after Mass Polymorph." },
          },
          tank = "Drag him away from the Bounding Mana spot.", healer = "Top everyone before Mass Polymorph.",
          dps = "Cooldowns after Evocation phases.", positioning = "Relocate after every Bounding Mana.",
          wipes = "Standing near the sphere return; low HP going into polymorph." },
    },
}

----------------------------------------------------------------------
-- GNOMEREGAN (29-38, Dun Morogh)
-- Classic data; Forever changes not confirmed (Warcraft Tavern: "hasn't
-- changed much", only loot/reward updates). Rare Dark Iron Ambassador
-- omitted.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Gnomeregan",
    trashNotes = "Long, multi-level dungeon - pulls from ramps and lower paths drag in extra packs. Irradiated troggs/leper gnomes in big groups. Mechanical mobs in the Launch Bay and Engineering Labs hit hard. Workshop Key from Electrocutioner 6000 opens the back entrance for later runs.",
    bosses = {
        { name = "Grubbis", order = 1, contentType = "dungeon", bossType = "Escort/defense event",
          tldr = "Blastmaster Emi Shortfuse starts an event near the entrance (trogg waves); Grubbis and his pet Chomper arrive at the end. Kill Chomper first.",
          abilities = { { name = "Chomper", desc = "Pet add - both can be stunned or feared." } },
          tank = "Hold Grubbis and Chomper; protect Emi during waves.", healer = "Tank focus; save DPS who pull aggro.",
          dps = "Kill Chomper, then Grubbis.", positioning = "Near Emi.",
          wipes = "Waves overrunning the group." },
        { name = "Viscous Fallout", order = 2, contentType = "dungeon", bossType = "Tank and spank",
          tldr = "Simple tank-and-spank ooze.",
          abilities = { { name = "Melee", desc = "No notable abilities." } },
          tank = "Easy.", healer = "Tank focus.", dps = "Burn.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Electrocutioner 6000", order = 3, contentType = "dungeon", bossType = "Chain lightning",
          tldr = "Chain Bolt and Megavolt cannot be interrupted. Spread out; tank at max melee range so chains do not jump into melee.",
          abilities = {
              { name = "Chain Bolt", desc = "Uninterruptible chain lightning - spread." },
              { name = "Megavolt", desc = "Uninterruptible nature hit." },
          },
          tank = "Max melee range from others.", healer = "Top the group after chains.",
          dps = "Spread out.", positioning = "Spread on the Launch Bay platform.",
          wipes = "Stacked group taking full chains." },
        { name = "Crowd Pummeler 9-60", order = 4, contentType = "dungeon", bossType = "Melee AoE",
          tldr = "Arcing Smash hits around him and he tramples nearby players. Tank him against a wall away from the healer; casters at max range.",
          abilities = {
              { name = "Arcing Smash", desc = "Small-radius AoE around him." },
              { name = "Trample", desc = "Hits nearby players." },
          },
          tank = "Back to a wall, away from the healer.", healer = "Max range.",
          dps = "Ranged at max range; melee from behind.", positioning = "Engineering Labs wall.",
          wipes = "Healer in Trample range." },
        { name = "Mekgineer Thermaplugg", order = 5, contentType = "dungeon", bossType = "Bomb adds + threat reset (final boss)",
          tldr = "Walking Bombs pour from the wall vents - DPS kill/kite them; spawns increase at 50% and speed up at 20%. Knock Away resets threat: tank recenters and taunts. Press the button at an active vent to stop it briefly.",
          abilities = {
              { name = "Summon Walking Bomb", desc = "Bomb adds walk to players and explode." },
              { name = "Knock Away", desc = "Knocks the tank back and resets threat." },
          },
          tank = "Middle of the room; taunt immediately after each knockback.",
          healer = "Stay away from bombs; tank first, bomb damage second.",
          dps = "Swap to bombs, watch threat after knockbacks. A ranged can hit the vent buttons.",
          positioning = "Boss centered so bombs walk farther.",
          wipes = "Bombs reaching the healer; DPS pulling aggro after Knock Away." },
    },
}

----------------------------------------------------------------------
-- RAZORFEN KRAUL (29-38, The Barrens)
-- Classic data; Forever changes not confirmed (Warcraft Tavern: "hasn't
-- really changed", only loot/rewards). Rares Earthcaller Halmgar and
-- Blind Hunter omitted.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Razorfen Kraul",
    trashNotes = "Quillboar casters: Death's Head Acolytes Mana Burn, Razorfen Groundshakers AoE stun, Death's Head Seers are high priority. Beast trainers bring pets. Tight thorn tunnels make LoS pulls easy but patrols common.",
    bosses = {
        { name = "Roogug", order = 1, contentType = "dungeon", bossType = "Shaman + adds",
          tldr = "Summons a Stone Rumbler and fights next to a Death's Head Seer - the Seer is the most dangerous add.",
          abilities = { { name = "Summon Stone Rumbler", desc = "Earth elemental add." } },
          tank = "Grab boss + Rumbler.", healer = "Moderate.", dps = "Seer first.",
          positioning = "Standard.", wipes = "Seer ignored." },
        { name = "Aggem Thorncurse", order = 2, contentType = "dungeon", bossType = "Add summoner",
          tldr = "Beastmaster that keeps summoning low-HP boar spirits - cleave them down and focus the boss.",
          abilities = { { name = "Summon Boar Spirit", desc = "Repeated low-HP adds." } },
          tank = "Pick up spirits.", healer = "Moderate.", dps = "Cleave spirits, focus boss.",
          positioning = "Standard.", wipes = "Spirits stacking up on the healer." },
        { name = "Death Speaker Jargba", order = 3, contentType = "dungeon", bossType = "Caster with mind control",
          tldr = "Dominate Mind takes over a player and Shadow Bolt hits harder with nobody in melee. Adds: Acolyte (Mana Burn) and Groundshaker (AoE stun).",
          abilities = {
              { name = "Dominate Mind", desc = "Mind controls a player - CC them." },
              { name = "Shadow Bolt", desc = "Stronger when no one is in melee range." },
          },
          tank = "Keep him in melee.", healer = "Watch the Mana Burn add.",
          dps = "Kill the Acolyte/Groundshaker; CC the MC'd player.", positioning = "Melee on him.",
          wipes = "MC'd player killing the healer." },
        { name = "Overlord Ramtusk", order = 4, contentType = "dungeon", bossType = "Warrior + 2 adds",
          tldr = "Two Razorfen Spearhides whose Whirling Barrage is a heavy AoE. Kill/CC the Spearhides.",
          abilities = { { name = "Whirling Barrage (adds)", desc = "Heavy AoE from the Spearhides." } },
          tank = "Hold all three.", healer = "Group damage from the adds.", dps = "Adds first.",
          positioning = "Standard.", wipes = "Spearhides left alive." },
        { name = "Agathelos the Raging", order = 5, contentType = "dungeon", bossType = "Heavy-hitting boar",
          tldr = "Sealed in his pen until the guards around it die. Very high melee damage plus Rushing Charge - tank cooldowns.",
          abilities = { { name = "Rushing Charge", desc = "Charge at a target." } },
          tank = "Cooldowns; he hits very hard.", healer = "Big tank healing.", dps = "Burn.",
          positioning = "Standard.", wipes = "Tank dies to melee." },
        { name = "Charlga Razorflank", order = 6, contentType = "dungeon", bossType = "Priestess (final boss)",
          tldr = "Chain Bolt bounces between players - spread out.",
          abilities = { { name = "Chain Bolt", desc = "Bouncing nature damage." } },
          tank = "Hold her.", healer = "Group damage.", dps = "Spread.",
          positioning = "Spread.", wipes = "Rare." },
    },
}

----------------------------------------------------------------------
-- SCARLET MONASTERY (30-46, Tirisfal Glades) - all 4 wings in one entry
-- Classic data; Forever changes not confirmed (in beta, labeled "Classic"
-- by Method). Classic GetInstanceInfo returns "Scarlet Monastery" for all
-- wings; Warcraft Tavern lists "The Scarlet Monastery - <Wing>" - verify.
-- Rares (Ironspine, Azshir, Fallen Champion) and Fairbanks omitted.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Scarlet Monastery",
    trashNotes = "Humanoid Scarlet packs flee at low HP and pull more packs - stun/slow runners. Library and Cathedral have healer/caster mobs - interrupt heals. Cathedral courtyard has many patrols. Armory: big packs before Herod. Graveyard: undead + spirits, easy.",
    bosses = {
        { name = "Interrogator Vishas", order = 1, contentType = "dungeon", bossType = "Graveyard - caster",
          tldr = "Graveyard. Easy caster; Shadow Word: Pain on players.",
          abilities = { { name = "Shadow Word: Pain", desc = "Shadow DoT." } },
          tank = "Easy.", healer = "Dispel/heal DoT.", dps = "Burn.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Bloodmage Thalnos", order = 2, contentType = "dungeon", bossType = "Graveyard - fire/shadow caster",
          tldr = "Graveyard end boss. Fire caster with Fire Nova - melee take bursts.",
          abilities = {
              { name = "Fire Nova", desc = "AoE around him." },
              { name = "Flame Spike", desc = "Fire on the ground - move." },
          },
          tank = "Easy.", healer = "Melee damage.", dps = "Move out of fire.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Houndmaster Loksey", order = 3, contentType = "dungeon", bossType = "Library - boss + hounds",
          tldr = "Library. Comes with Scarlet tracking hounds and Bloodlusts. Kill hounds or AoE them.",
          abilities = { { name = "Bloodlust", desc = "Self attack speed buff." } },
          tank = "Grab all hounds.", healer = "Bloodlust spike.", dps = "Hounds, then boss.",
          positioning = "Standard.", wipes = "Hounds on the healer." },
        { name = "Arcanist Doan", order = 4, contentType = "dungeon", bossType = "Library - caster, 50% blast",
          tldr = "Library end boss. At 50% he casts Arcane Bubble then Detonation - RUN AWAY from him immediately. Also Silence and Polymorph.",
          abilities = {
              { name = "Arcane Bubble + Detonation", desc = "At 50%: bubble, then huge AoE - get out of range." },
              { name = "Silence", desc = "AoE silence." },
              { name = "Polymorph", desc = "Sheeps a player." },
          },
          tank = "Run out with the group at 50%, retaunt after.", healer = "Run at the bubble.",
          dps = "Run at the bubble, back in after.", positioning = "Clear exit space.",
          wipes = "Standing in Detonation." },
        { name = "Herod", order = 5, contentType = "dungeon", bossType = "Armory - Whirlwind",
          tldr = "Armory. Whirlwind (yells Blades of Light) - melee step out. Enrages at low HP; on death a swarm of Scarlet Trainees runs in - AoE them.",
          abilities = {
              { name = "Whirlwind", desc = "Spinning AoE - melee back off." },
              { name = "Rushing Charge", desc = "Charges a target." },
              { name = "Enrage", desc = "At low health." },
              { name = "Scarlet Trainees", desc = "Swarm of weak adds after he dies." },
          },
          tank = "Cooldown at enrage.", healer = "Save mana for the trainee swarm.",
          dps = "Melee leave during Whirlwind; AoE trainees.", positioning = "Room cleared.",
          wipes = "Melee eating Whirlwind; OOM healer when trainees arrive." },
        { name = "Scarlet Commander Mograine", order = 6, contentType = "dungeon", bossType = "Cathedral - paladin",
          tldr = "Cathedral. Paladin with Divine Shield, Hammer of Justice, Crusader Strike, Lay on Hands. Killing him brings Whitemane.",
          abilities = {
              { name = "Divine Shield", desc = "Immunity bubble." },
              { name = "Hammer of Justice", desc = "Stun." },
              { name = "Crusader Strike", desc = "Melee strike." },
              { name = "Lay on Hands", desc = "Big self heal." },
          },
          tank = "Hold him.", healer = "Save mana for Whitemane.", dps = "Burn.",
          positioning = "Center of the chapel.", wipes = "Low mana going into Whitemane." },
        { name = "High Inquisitor Whitemane", order = 7, contentType = "dungeon", bossType = "Cathedral - resurrection (final)",
          tldr = "Enters when Mograine dies. At 50% she Deep Sleeps the group and resurrects Mograine - then kill both. Interrupt her heals.",
          abilities = {
              { name = "Deep Sleep", desc = "Sleeps the whole group at ~50%." },
              { name = "Scarlet Resurrection", desc = "Revives Mograine." },
              { name = "Heal", desc = "Interrupt." },
              { name = "Holy Smite", desc = "Holy nuke." },
          },
          tank = "Pick up the revived Mograine fast.", healer = "Top everyone before 50%.",
          dps = "Kick heals; burn her after the res.", positioning = "Standard.",
          wipes = "Mograine + Whitemane together with a drained healer." },
    },
}

----------------------------------------------------------------------
-- RAZORFEN DOWNS (37-46, The Barrens) - opened in beta Oct 1
-- Classic data; Forever changes not confirmed. Rares (Ragglesnout,
-- Plaguemaw) omitted.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Razorfen Downs",
    trashNotes = "Dense linked undead and quillboar packs. Death's Head Necromancers raise adds - kill first. Belnistrasz idol event (quest) spawns waves - defend him until the ritual finishes.",
    bosses = {
        { name = "Tuten'kash", order = 1, contentType = "dungeon", bossType = "Gong event",
          tldr = "Optional gong event: ring the gong for two add waves, the third ring brings Tuten'kash. Poison - cleanse.",
          abilities = { { name = "Virulent Poison", desc = "Poison - cleanse." } },
          tank = "Pick up the waves.", healer = "Cleanse poison.", dps = "AoE waves.",
          positioning = "Near the gong.", wipes = "Waves overwhelm the group." },
        { name = "Mordresh Fire Eye", order = 2, contentType = "dungeon", bossType = "Fire caster",
          tldr = "Skeletal fire caster - Fireball and Fire Nova. Interrupt where possible.",
          abilities = {
              { name = "Fireball", desc = "Fire nuke." },
              { name = "Fire Nova", desc = "AoE around him." },
          },
          tank = "Hold him.", healer = "Melee take novas.", dps = "Kick Fireball.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Glutton", order = 3, contentType = "dungeon", bossType = "Tank and spank",
          tldr = "Disease cloud and a frenzy - tank cooldowns at frenzy.",
          abilities = { { name = "Disease Cloud", desc = "Disease damage around him." } },
          tank = "Cooldown at frenzy.", healer = "Cleanse disease.", dps = "Burn.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Amnennar the Coldbringer", order = 4, contentType = "dungeon", bossType = "Frost lich (final boss)",
          tldr = "Lich with Frost Nova and Amnennar's Wrath (AoE frost); summons frost spectres as his health drops. Kill spectres fast.",
          abilities = {
              { name = "Amnennar's Wrath", desc = "AoE frost damage." },
              { name = "Frost Nova", desc = "Roots nearby players." },
              { name = "Frost spectres", desc = "Adds as his health drops." },
          },
          tank = "Grab spectres.", healer = "Group frost damage.", dps = "Spectres, then boss.",
          positioning = "Standard.", wipes = "Spectres + Wrath on low group." },
    },
}

----------------------------------------------------------------------
-- ULDAMAN (36-45, Badlands) - opened in beta Oct 1
-- Classic data; Forever changes not confirmed. Revelosh, Obsidian
-- Sentinel, Ancient Stone Keeper omitted (not confident on mechanics).
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Uldaman",
    trashNotes = "Shadowforge dwarves and Stonevault troggs in linked packs; dwarf casters behind melee. Earthen constructs in the lower halls hit hard. Scorpids and basilisks near the excavation.",
    bosses = {
        { name = "Baelog", order = 1, contentType = "dungeon", bossType = "The Lost Dwarves (3 bosses)",
          tldr = "Baelog, Eric the Swift and Olaf fight together. Focus one at a time; CC if possible.",
          abilities = { { name = "Three dwarves", desc = "Baelog, Eric the Swift and Olaf engage together." } },
          tank = "Grab all three.", healer = "Heavy tank damage early.", dps = "Focus one at a time.",
          positioning = "Standard.", wipes = "Spread damage across all three." },
        { name = "Ironaya", order = 2, contentType = "dungeon", bossType = "Stone giant",
          tldr = "Knock Away (threat drop), Arcing Smash frontal, War Stomp AoE stun.",
          abilities = {
              { name = "Knock Away", desc = "Knockback + threat drop." },
              { name = "Arcing Smash", desc = "Frontal cleave." },
              { name = "War Stomp", desc = "AoE stun." },
          },
          tank = "Retaunt after Knock Away; face away.", healer = "Out of stomp range.",
          dps = "Watch threat.", positioning = "Boss faced away.",
          wipes = "Threat loss to a DPS." },
        { name = "Galgann Firehammer", order = 3, contentType = "dungeon", bossType = "Fire caster dwarf",
          tldr = "Dwarf fire caster - ranged stay spread, interrupt casts.",
          abilities = { { name = "Fire spells", desc = "Fire damage on the group." } },
          tank = "Hold him.", healer = "Fire damage.", dps = "Kick.",
          positioning = "Spread.", wipes = "Rare." },
        { name = "Grimlok", order = 4, contentType = "dungeon", bossType = "Trogg caster",
          tldr = "Trogg chieftain caster; interrupt his Lightning Bolts.",
          abilities = { { name = "Lightning Bolt", desc = "Nature nuke." } },
          tank = "Hold him.", healer = "Moderate.", dps = "Kick.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Archaedas", order = 5, contentType = "dungeon", bossType = "Titan construct, add waves (final)",
          tldr = "Activated at his altar. He keeps awakening Earthen Guardians and later Vault Warders; Ground Tremor stuns the group. Burn him while the tank holds the awakened adds.",
          abilities = {
              { name = "Awaken Earthen Guardian", desc = "Wakes the statues in the room." },
              { name = "Awaken Vault Warder", desc = "Bigger constructs later in the fight." },
              { name = "Ground Tremor", desc = "AoE stun." },
          },
          tank = "Pick up every awakened add.", healer = "Heavy tank damage; mana check.",
          dps = "Boss focus unless adds get loose.", positioning = "Center of the chamber.",
          wipes = "Adds stacking faster than the boss dies." },
    },
}

----------------------------------------------------------------------
-- ZUL'FARRAK (40-47, Tanaris) - not yet in beta (cap 30)
-- Classic data; Forever changes not confirmed. Theka/Zerillis/Dustwraith
-- omitted (Theka mechanics not confirmed).
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Zul'Farrak",
    trashNotes = "Open-area troll packs that link and run. Sandfury casters heal and Shadow Bolt. Scarab swarms near Theka. Basilisks around Antu'sul. Pyramid stairs event: huge troll waves - the classic wipe.",
    bosses = {
        { name = "Antu'sul", order = 1, contentType = "dungeon", bossType = "Totem caster + basilisks",
          tldr = "Calls basilisk adds as his health drops and drops totems. Kill the healing ward/totems, pick up basilisks.",
          abilities = { { name = "Basilisk adds", desc = "Summoned as his health drops." } },
          tank = "Grab basilisks.", healer = "Ramping damage.", dps = "Kill totems; burn him.",
          positioning = "Standard.", wipes = "Too many basilisks." },
        { name = "Witch Doctor Zum'rah", order = 2, contentType = "dungeon", bossType = "Caster + graveyard zombies",
          tldr = "Raises zombies from the graves around him and casts Shadow Bolt. Burn him, AoE zombies.",
          abilities = {
              { name = "Shadow Bolt", desc = "Shadow nuke." },
              { name = "Summon Zombies", desc = "Zombies rise from graves." },
          },
          tank = "Pull him out of the graveyard if possible.", healer = "Shadow damage.",
          dps = "Boss focus.", positioning = "Away from graves.", wipes = "Zombie swarm." },
        { name = "Hydromancer Velratha", order = 3, contentType = "dungeon", bossType = "Water caster (Gahz'rilla pool)",
          tldr = "Naga caster at the pool - interrupt her heals. Her pool is where you summon Gahz'rilla.",
          abilities = {
              { name = "Healing Wave", desc = "Interrupt." },
          },
          tank = "Hold her.", healer = "Easy.", dps = "Kick heals.",
          positioning = "Pool edge.", wipes = "Rare." },
        { name = "Gahz'rilla", order = 4, contentType = "dungeon", bossType = "Summoned hydra",
          tldr = "Summoned with the Mallet of Zul'Farrak at the pool. Freeze Solid freezes a player; Gahz'rilla Slam knocks the group up.",
          abilities = {
              { name = "Freeze Solid", desc = "Freezes a target." },
              { name = "Gahz'rilla Slam", desc = "Knocks players into the air." },
              { name = "Icicle", desc = "Frost damage." },
          },
          tank = "Hold her at the pool.", healer = "Heal through Slam falls.", dps = "Burn.",
          positioning = "Pool platform.", wipes = "Rare if the group is geared." },
        { name = "Sergeant Bly", order = 5, contentType = "dungeon", bossType = "Pyramid stairs event",
          tldr = "Freeing the prisoners (key from Sandfury Executioner) starts the stairs event: waves of trolls charge up while Shadowpriest Sezz'ziz and Nekrum Gutchewer join. At the top, Bly and his crew turn hostile.",
          abilities = { { name = "Troll waves", desc = "Large waves on the stairs; Sezz'ziz (priest) and Nekrum come down." } },
          tank = "Hold the top of the stairs; let waves come to you.", healer = "Pace mana for a long event.",
          dps = "AoE waves; kill Sezz'ziz.", positioning = "Top of the pyramid.",
          wipes = "Healer OOM mid-waves; group spread down the stairs." },
        { name = "Chief Ukorz Sandscalp", order = 6, contentType = "dungeon", bossType = "Final boss + Ruuzlu",
          tldr = "Fights alongside Ruuzlu. Ukorz cleaves and enrages - tank both, face away.",
          abilities = {
              { name = "Cleave", desc = "Frontal." },
              { name = "Enrage", desc = "At low health." },
          },
          tank = "Face both away.", healer = "Spike at enrage.", dps = "Behind; kill one at a time.",
          positioning = "Faced away.", wipes = "Cleave on melee." },
    },
}

----------------------------------------------------------------------
-- MARAUDON (45-51, Desolace) - not yet in beta
-- Classic data; Forever changes not confirmed. Razorlash, Rotgrip
-- omitted (not confident on mechanics).
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Maraudon",
    trashNotes = "Satyr wing (purple) has stealthed Putridus Shadowstalkers. Inner caverns: large elementals and Theradrim Guardians hit hard and knock back. Many linked plant packs. Long dungeon - pick a wing (orange/purple) or inner route.",
    bosses = {
        { name = "Noxxion", order = 1, contentType = "dungeon", bossType = "Ooze split",
          tldr = "Periodically goes untargetable and splits into Noxxion's Spawns - kill/AoE the spawns. Toxic Volley poisons the group.",
          abilities = {
              { name = "Toxic Volley", desc = "Group poison damage." },
              { name = "Summon Spawns", desc = "Becomes untargetable and spawns small oozes." },
          },
          tank = "Grab spawns.", healer = "Cure poison; group heals.", dps = "AoE spawns.",
          positioning = "Standard.", wipes = "Spawns ignored." },
        { name = "Lord Vyletongue", order = 2, contentType = "dungeon", bossType = "Ranged satyr",
          tldr = "Satyr lord with Multi-Shot and Blink, plus satyr adds. Clear stealthed adds first.",
          abilities = {
              { name = "Multi-Shot", desc = "Hits several players." },
              { name = "Blink", desc = "Teleports away." },
          },
          tank = "Re-engage after Blink.", healer = "Group damage.", dps = "Adds first.",
          positioning = "Standard.", wipes = "Stealthed adds joining." },
        { name = "Celebras the Cursed", order = 3, contentType = "dungeon", bossType = "Druid caster",
          tldr = "Wrath and Entangling Roots. After he dies he returns friendly (Celebras the Redeemed) for the Scepter quest.",
          abilities = {
              { name = "Wrath", desc = "Nature nuke." },
              { name = "Entangling Roots", desc = "Root." },
          },
          tank = "Hold him.", healer = "Moderate.", dps = "Kick Wrath.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Landslide", order = 4, contentType = "dungeon", bossType = "Earth giant",
          tldr = "Knock Away and Trample; summons rock adds. Tank against a wall, kill adds.",
          abilities = {
              { name = "Knock Away", desc = "Knockback on the tank." },
              { name = "Trample", desc = "Hits nearby players." },
              { name = "Landslide", desc = "Summons rock elemental adds." },
          },
          tank = "Back to a wall.", healer = "Melee take Trample.", dps = "Kill adds.",
          positioning = "Wall.", wipes = "Adds + knockbacks into packs." },
        { name = "Tinkerer Gizlock", order = 5, contentType = "dungeon", bossType = "Goblin engineer",
          tldr = "Throws bombs and uses a Goblin Dragon Gun cone. Avoid his front.",
          abilities = {
              { name = "Bomb", desc = "AoE explosive." },
              { name = "Goblin Dragon Gun", desc = "Frontal fire cone." },
          },
          tank = "Face away.", healer = "AoE damage.", dps = "Behind him.",
          positioning = "Faced away.", wipes = "Rare." },
        { name = "Princess Theradras", order = 6, contentType = "dungeon", bossType = "Final boss",
          tldr = "Dust Field around her, Boulders on players, Repulsive Gaze knocks back and drops threat. Tank retaunts; ranged spread.",
          abilities = {
              { name = "Dust Field", desc = "AoE around her." },
              { name = "Boulder", desc = "Hurls boulders at players." },
              { name = "Repulsive Gaze", desc = "Knockback + threat drop." },
              { name = "Thrash", desc = "Extra attacks." },
          },
          tank = "Retaunt after Repulsive Gaze.", healer = "Spread damage.",
          dps = "Watch threat after Gaze.", positioning = "Ranged spread.",
          wipes = "Threat loss." },
    },
}

----------------------------------------------------------------------
-- THE TEMPLE OF ATAL'HAKKAR / SUNKEN TEMPLE (50-55, Swamp of Sorrows)
-- Classic data; Forever changes not confirmed. NAME: lists say "Sunken
-- Temple" (kami-labs) vs "Temple of Atal'Hakkar" (Warcraft Tavern) -
-- combined name + aliases. Atal'ai Defender minibosses folded into one.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "The Temple of Atal'Hakkar (Sunken Temple)",
    trashNotes = "Dragonkin (Nightmare Wyrmkin/Wanderers etc.) sleep and breathe - face them away. Atal'ai troll casters hex and heal - interrupt. Oozes and drakes downstairs. Big linked packs on the balconies around Jammal'an.",
    bosses = {
        { name = "Atal'alarion", order = 1, contentType = "dungeon", bossType = "Statue puzzle boss",
          tldr = "Summoned by activating the statues in the upper ring in the correct order. Sweeping Slam and Pound - tank faces him away.",
          abilities = {
              { name = "Sweeping Slam", desc = "Frontal knock." },
              { name = "Pound", desc = "Tank hit." },
          },
          tank = "Face away.", healer = "Tank focus.", dps = "Behind.",
          positioning = "Faced away.", wipes = "Rare." },
        { name = "Atal'ai Defenders", order = 2, contentType = "dungeon", bossType = "6 balcony trolls",
          tldr = "Gasher, Loro, Hukku, Zolo, Mijan and Zul'Lor on the balconies - all six must die to drop the barrier to Jammal'an.",
          abilities = { { name = "Mixed troll kits", desc = "Each is a single elite troll miniboss." } },
          tank = "Pull each balcony carefully.", healer = "Pace mana.", dps = "Kick casters.",
          positioning = "Balconies.", wipes = "Overpulling balcony packs." },
        { name = "Jammal'an the Prophet", order = 3, contentType = "dungeon", bossType = "Caster + Ogom",
          tldr = "With Ogom the Wretched. Hex of Jammal'an takes control of a player; interrupt Healing Wave; kill Earthgrab Totem.",
          abilities = {
              { name = "Hex of Jammal'an", desc = "Controls a player." },
              { name = "Healing Wave", desc = "Interrupt." },
              { name = "Earthgrab Totem", desc = "Roots - kill it." },
          },
          tank = "Hold both.", healer = "Watch for the hex.", dps = "Kick heals, kill totems.",
          positioning = "Standard.", wipes = "Hexed player + uninterrupted heals." },
        { name = "Dreamscythe", order = 4, contentType = "dungeon", bossType = "Dragon pair (with Weaver)",
          tldr = "Green dragon pair Dreamscythe and Weaver (also Morphaz and Hazzas later) - Acid Breath and Wing Flap; face them away.",
          abilities = {
              { name = "Acid Breath", desc = "Frontal breath." },
              { name = "Wing Flap", desc = "Knockback." },
          },
          tank = "Face away.", healer = "Tank focus.", dps = "Behind.",
          positioning = "Faced away.", wipes = "Breath on the group." },
        { name = "Avatar of Hakkar", order = 5, contentType = "dungeon", bossType = "Quest event",
          tldr = "Quest event (Egg of Hakkar): kill Hakkari Bloodkeepers and use their blood to extinguish the eternal flames before the Avatar is summoned.",
          abilities = { { name = "Flames/waves", desc = "Waves of adds while you extinguish the flames." } },
          tank = "Hold adds.", healer = "Long event - pace mana.", dps = "Kill Bloodkeepers, extinguish flames.",
          positioning = "Central chamber.", wipes = "Flames not put out in time." },
        { name = "Shade of Eranikus", order = 6, contentType = "dungeon", bossType = "Final boss",
          tldr = "Deep Slumber sleeps the group, Acid Breath, War Stomp. Face away, cleanse what you can.",
          abilities = {
              { name = "Deep Slumber", desc = "AoE sleep." },
              { name = "Acid Breath", desc = "Frontal breath." },
              { name = "War Stomp", desc = "AoE stun." },
          },
          tank = "Face away.", healer = "Pre-heal before sleeps.", dps = "Behind.",
          positioning = "Faced away.", wipes = "Sleep + breath on the group." },
    },
}

----------------------------------------------------------------------
-- BLACKROCK DEPTHS (52-60, Blackrock Mountain) - not yet in beta
-- Classic data; Forever changes not confirmed. Only the main/route bosses
-- are covered (21 total in BRD).
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Blackrock Depths",
    trashNotes = "Dark Iron patrols on the highway and in the city - watch pathing. Anvilrage guards in linked packs. Fireguard elementals and golems in the Manufactory. Grim Guzzler bar: attacking patrons or getting caught stealing ale turns the whole bar hostile. Bloodhound packs around the Houndmaster.",
    bosses = {
        { name = "High Interrogator Gerstahn", order = 1, contentType = "dungeon", bossType = "Shadow priest",
          tldr = "Psychic Scream fears, Mana Burn, Shadow Word: Pain and a Shadow Shield. Tremor/Fear Ward, dispel.",
          abilities = {
              { name = "Psychic Scream", desc = "AoE fear." },
              { name = "Mana Burn", desc = "Drains mana." },
              { name = "Shadow Word: Pain", desc = "DoT." },
              { name = "Shadow Shield", desc = "Self shield." },
          },
          tank = "Hold her.", healer = "Dispel; fear protection.", dps = "Kick Mana Burn.",
          positioning = "Standard.", wipes = "Fears into patrols." },
        { name = "Ring of Law", order = 2, contentType = "dungeon", bossType = "Arena event",
          tldr = "Walking into the arena starts it: add waves, then one random arena boss. Stay central and pace mana.",
          abilities = { { name = "Random boss", desc = "One of several possible arena bosses after the waves." } },
          tank = "Pick up waves.", healer = "Pace mana.", dps = "AoE waves.",
          positioning = "Center of the ring.", wipes = "OOM before the boss." },
        { name = "Lord Incendius", order = 3, contentType = "dungeon", bossType = "Fire elemental lord",
          tldr = "Fire Storm on the group, Mighty Blow knocks the tank away, Curse of the Elemental Lord. Tank against the anvil/wall.",
          abilities = {
              { name = "Fire Storm", desc = "Fire AoE." },
              { name = "Mighty Blow", desc = "Knocks the tank back." },
              { name = "Curse of the Elemental Lord", desc = "Curse - decurse." },
          },
          tank = "Back to a wall.", healer = "Fire damage; decurse.", dps = "Burn.",
          positioning = "Wall.", wipes = "Tank knocked into lava/packs." },
        { name = "General Angerforge", order = 4, contentType = "dungeon", bossType = "Adds at low health",
          tldr = "At low health he calls Anvilrage reinforcements. Burn the last third fast or have CC/AoE ready.",
          abilities = { { name = "Call reinforcements", desc = "Anvilrage adds near the end." } },
          tank = "Grab the adds.", healer = "Spike at adds.", dps = "Burn the last 30%.",
          positioning = "Clear his room first.", wipes = "Adds swarm the healer." },
        { name = "Golem Lord Argelmach", order = 5, contentType = "dungeon", bossType = "Golem activator",
          tldr = "He activates golems in his room - clear them first. Chain Lightning and Shock.",
          abilities = { { name = "Chain Lightning", desc = "Bouncing nature damage." } },
          tank = "Pull after the room is cleared.", healer = "Group damage.", dps = "Spread.",
          positioning = "Spread.", wipes = "Waking extra golems." },
        { name = "Ambassador Flamelash", order = 6, contentType = "dungeon", bossType = "Fire elemental + spirits",
          tldr = "Burning Spirits spawn around the room and run to empower him - kill them before they reach him.",
          abilities = { { name = "Burning Spirits", desc = "Adds that buff him on arrival." } },
          tank = "Hold him.", healer = "Fire damage.", dps = "Intercept spirits.",
          positioning = "Spread to intercept.", wipes = "Spirits reaching him." },
        { name = "The Seven", order = 7, contentType = "dungeon", bossType = "Gauntlet of 7 dwarf spirits",
          tldr = "Talk to Doom'rel to start: Anger'rel, Seeth'rel, Dope'rel, Gloom'rel, Vile'rel, Hate'rel come one at a time, then Doom'rel himself. Long - pace mana.",
          abilities = { { name = "Sequential bosses", desc = "Each dwarf has its own class-like kit." } },
          tank = "Pick up each as it activates.", healer = "Mana management.", dps = "One at a time.",
          positioning = "Vault room.", wipes = "Healer OOM mid-sequence." },
        { name = "Magmus", order = 8, contentType = "dungeon", bossType = "Gatekeeper giant",
          tldr = "Molten giant guarding the palace. The statues along the hall spout fire during the fight - keep the group out of their path.",
          abilities = {
              { name = "War Stomp", desc = "AoE stun." },
              { name = "Fiery Burst", desc = "Fire damage." },
          },
          tank = "Hold him away from statue fire.", healer = "Fire damage.", dps = "Burn.",
          positioning = "Center, away from statues.", wipes = "Group in statue fire." },
        { name = "Emperor Dagran Thaurissan", order = 9, contentType = "dungeon", bossType = "Final boss + Moira",
          tldr = "Princess Moira Bronzebeard heals him - interrupt/CC her (killing her fails the Alliance quest; kill the Emperor first and she turns friendly). Hand of Thaurissan stuns.",
          abilities = {
              { name = "Hand of Thaurissan", desc = "Stun." },
              { name = "Avatar of Flame", desc = "Fire burst." },
              { name = "Moira's heals", desc = "Interrupt/CC her." },
          },
          tank = "Hold the Emperor.", healer = "Big damage.", dps = "Kick Moira, burn the Emperor.",
          positioning = "Throne room.", wipes = "Moira healing him freely." },
    },
}

----------------------------------------------------------------------
-- LOWER BLACKROCK SPIRE (57-60, Blackrock Mountain) - not yet in beta
-- Classic data; Forever changes not confirmed. Classic GetInstanceInfo
-- returns "Blackrock Spire" (LBRS + UBRS share it) - aliased; substring
-- lookup also matches.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Lower Blackrock Spire",
    trashNotes = "Huge ogre/orc/troll packs that link - Smolderthorn trolls hex and enrage. Spire spider room: eggs hatch spiderlings. Orc packs near Wyrmthalak. Patrols in the main halls. Long clear - drink between pulls.",
    bosses = {
        { name = "Highlord Omokk", order = 1, contentType = "dungeon", bossType = "Ogre boss",
          tldr = "Big ogre with Knock Away; clear the ogres around his platform first.",
          abilities = { { name = "Knock Away", desc = "Knocks the tank back." } },
          tank = "Back to a wall.", healer = "Tank focus.", dps = "Burn.",
          positioning = "Platform cleared.", wipes = "Ogre packs joining." },
        { name = "Shadow Hunter Vosh'gajin", order = 2, contentType = "dungeon", bossType = "Troll caster",
          tldr = "Hex and Curse of Blood. Decurse, burn.",
          abilities = {
              { name = "Hex", desc = "Polymorph-like." },
              { name = "Curse of Blood", desc = "Curse - decurse." },
          },
          tank = "Hold her.", healer = "Decurse.", dps = "Burn.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "War Master Voone", order = 3, contentType = "dungeon", bossType = "Troll warrior",
          tldr = "Throw Axe, Mortal Strike, Cleave and Snap Kick. Face away, heal through MS.",
          abilities = {
              { name = "Mortal Strike", desc = "Reduces healing on the tank." },
              { name = "Cleave", desc = "Frontal." },
              { name = "Throw Axe", desc = "Ranged hit." },
          },
          tank = "Face away; cooldown during MS.", healer = "Pre-heal through MS.", dps = "Behind.",
          positioning = "Faced away.", wipes = "Tank dies under MS." },
        { name = "Mother Smolderweb", order = 4, contentType = "dungeon", bossType = "Spider",
          tldr = "Crystallize stuns players in place; poison. Clear the spider room first.",
          abilities = {
              { name = "Crystallize", desc = "Stun/encases players." },
              { name = "Mother's Milk", desc = "Poison." },
          },
          tank = "Hold her.", healer = "Cure poison.", dps = "Burn.",
          positioning = "Room cleared.", wipes = "Spiderlings + stuns." },
        { name = "Urok Doomhowl", order = 5, contentType = "dungeon", bossType = "Summon event",
          tldr = "Optional quest summon: waves of ogres before Urok. Big pulls - be ready.",
          abilities = { { name = "Ogre waves", desc = "Adds before Urok appears." } },
          tank = "Hold waves.", healer = "Pace mana.", dps = "AoE.",
          positioning = "Standard.", wipes = "OOM before Urok." },
        { name = "Overlord Wyrmthalak", order = 6, contentType = "dungeon", bossType = "Final boss + adds",
          tldr = "Blast Wave, Cleave, Knock Away; calls in adds at low health. Clear the room and save cooldowns for the adds.",
          abilities = {
              { name = "Blast Wave", desc = "AoE knock + slow." },
              { name = "Cleave", desc = "Frontal." },
              { name = "Knock Away", desc = "Tank knockback." },
              { name = "Adds", desc = "Called at low health." },
          },
          tank = "Face away; grab adds.", healer = "Spike at adds.", dps = "Burn boss, CC adds.",
          positioning = "Faced away.", wipes = "Adds + boss on healer." },
    },
}

----------------------------------------------------------------------
-- DIRE MAUL (58-60, Feralas) - East, West, North in one entry
-- Classic data; Forever changes not confirmed. Classic GetInstanceInfo
-- returns "Dire Maul" for all wings. Many minor bosses omitted.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Dire Maul",
    trashNotes = "East: imps, satyrs and Warpwood treants/lashers; Pusillin runs away (chase him for the key). West: Highborne arcane casters and constructs; pylon areas packed. North: ogre packs; for a tribute run do not kill the guards.",
    bosses = {
        { name = "Zevrim Thornhoof", order = 1, contentType = "dungeon", bossType = "East - satyr",
          tldr = "East. Sacrifice locks a player in place and drains them - heal them through it.",
          abilities = { { name = "Sacrifice", desc = "Pins and drains a player." } },
          tank = "Hold him.", healer = "Heal the sacrificed player.", dps = "Burn.",
          positioning = "Standard.", wipes = "Healer sacrificed." },
        { name = "Alzzin the Wildshaper", order = 2, contentType = "dungeon", bossType = "East - shapeshifter (end)",
          tldr = "East end boss. Shifts forms during the fight - tank keeps threat through each change.",
          abilities = { { name = "Shapeshift", desc = "Changes forms during the fight." } },
          tank = "Retaunt on form changes.", healer = "Steady.", dps = "Watch threat after shifts.",
          positioning = "Standard.", wipes = "Threat loss on a form change." },
        { name = "Tendris Warpwood", order = 3, contentType = "dungeon", bossType = "West - ancient",
          tldr = "West. Big treant with Entangle and Trample, with Ironbark protectors nearby.",
          abilities = {
              { name = "Entangle", desc = "Root." },
              { name = "Trample", desc = "Hits nearby players." },
          },
          tank = "Hold him.", healer = "Melee damage.", dps = "Burn.",
          positioning = "Standard.", wipes = "Protectors added." },
        { name = "Immol'thar", order = 4, contentType = "dungeon", bossType = "West - pylon-sealed demon",
          tldr = "West. Shut down all 5 pylons first (each guarded) to open his prison. He summons Eyes of Immol'thar and Portal teleports a player to him.",
          abilities = {
              { name = "Eye of Immol'thar", desc = "Adds." },
              { name = "Portal of Immol'thar", desc = "Teleports a player." },
              { name = "Trample", desc = "Hits nearby." },
          },
          tank = "Hold him, retaunt if needed.", healer = "Heal the ported player.", dps = "Kill eyes.",
          positioning = "Center.", wipes = "Eyes swarm." },
        { name = "Prince Tortheldrin", order = 5, contentType = "dungeon", bossType = "West - end boss",
          tldr = "West end. Whirlwind and Arcane Blast knockback.",
          abilities = {
              { name = "Whirlwind", desc = "Melee AoE." },
              { name = "Arcane Blast", desc = "Arcane hit + knockback." },
          },
          tank = "Hold him.", healer = "Melee damage.", dps = "Melee leave on Whirlwind.",
          positioning = "Standard.", wipes = "Melee in Whirlwind." },
        { name = "King Gordok", order = 6, contentType = "dungeon", bossType = "North - ogre king (tribute)",
          tldr = "North. Fights with Cho'Rush the Observer. Tribute run: kill Gordok with Guard Mol'dar, Fengus, Slip'kik and Captain Kromcrush alive for bonus loot.",
          abilities = {
              { name = "Mortal Strike", desc = "Healing reduction on the tank." },
              { name = "War Stomp", desc = "AoE stun." },
          },
          tank = "Hold both.", healer = "Heal through MS.", dps = "Cho'Rush or Gordok - pick one.",
          positioning = "Throne room.", wipes = "MS + stomp on low tank." },
    },
}

----------------------------------------------------------------------
-- SCHOLOMANCE (58-60, Western Plaguelands) - not yet in beta
-- Classic data; Forever changes not confirmed. Side-room bosses folded
-- into the Gandling entry.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Scholomance",
    trashNotes = "Necromancers raise skeletons; Spectral Tutors silence; Risen Constructs and Bone Golems hit hard. Viewing Room: event with Vectus/Marduk. Narrow corridors - watch linked packs.",
    bosses = {
        { name = "Kirtonos the Herald", order = 1, contentType = "dungeon", bossType = "Summoned event",
          tldr = "Summoned with the Blood of Innocents at the balcony brazier. Alternates bat and humanoid forms; disarms and swoops.",
          abilities = {
              { name = "Disarm", desc = "Disarms the tank." },
              { name = "Swoop", desc = "Bat form knockdown." },
          },
          tank = "Hold through form changes.", healer = "Steady.", dps = "Burn.",
          positioning = "Balcony.", wipes = "Rare." },
        { name = "Jandice Barov", order = 2, contentType = "dungeon", bossType = "Illusions",
          tldr = "Spawns many illusions of herself - find the real one and kill her. Curse of Blood - decurse.",
          abilities = {
              { name = "Illusions", desc = "Many copies - find the real Jandice." },
              { name = "Curse of Blood", desc = "Curse." },
          },
          tank = "Find and grab the real one.", healer = "Decurse.", dps = "AoE illusions or tab-target.",
          positioning = "Standard.", wipes = "Losing track of her." },
        { name = "Rattlegore", order = 3, contentType = "dungeon", bossType = "Bone golem",
          tldr = "Hits hard with Knock Away. Tank against a wall.",
          abilities = { { name = "Knock Away", desc = "Knocks the tank." } },
          tank = "Back to wall.", healer = "Tank focus.", dps = "Burn.",
          positioning = "Wall.", wipes = "Rare." },
        { name = "Ras Frostwhisper", order = 4, contentType = "dungeon", bossType = "Frost lich",
          tldr = "Frost caster with heavy frost AoE and freeze/stun effects.",
          abilities = { { name = "Frost spells", desc = "AoE frost damage." } },
          tank = "Hold him.", healer = "Group frost damage.", dps = "Burn.",
          positioning = "Spread.", wipes = "Group damage." },
        { name = "Darkmaster Gandling", order = 5, contentType = "dungeon", bossType = "Final boss",
          tldr = "Unlocks after the six side-room bosses (Malicia, Krastinov, Polkelt, Ravenian, Alexei and Illucia Barov). Shadow Portal teleports a player into a side room full of adds - they must fight out.",
          abilities = { { name = "Shadow Portal", desc = "Teleports a player into a side room with adds." } },
          tank = "Hold him; expect being ported.", healer = "Heal ported players.", dps = "Burn him.",
          positioning = "Center.", wipes = "Healer ported and dies." },
    },
}

----------------------------------------------------------------------
-- STRATHOLME (58-60, Eastern Plaguelands) - Live + Undead sides
-- Classic data; Forever changes not confirmed. Classic GetInstanceInfo
-- returns "Stratholme" for both sides.
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Stratholme",
    trashNotes = "Live: Scarlet Crusade packs (Battle Mages, Sorcerers, Guardsmen) in linked groups. Undead: Plague Ghouls, Bile Spewers (spawn slimes), Venom Belchers, Crypt Beasts; ziggurat acolytes/shadowcasters. Patrols in the streets.",
    bosses = {
        { name = "Timmy the Cruel", order = 1, contentType = "dungeon", bossType = "Live - courtyard",
          tldr = "Spawns after you clear the scourge in his square. Ravenous Claw on the tank.",
          abilities = { { name = "Ravenous Claw", desc = "Tank damage debuff." } },
          tank = "Hold him.", healer = "Tank focus.", dps = "Burn.",
          positioning = "Square.", wipes = "Rare." },
        { name = "Cannon Master Willey", order = 2, contentType = "dungeon", bossType = "Live - rifleman summoner",
          tldr = "Calls Crimson Riflemen - kill them or tank them.",
          abilities = { { name = "Summon Crimson Riflemen", desc = "Ranged adds." } },
          tank = "Grab riflemen.", healer = "Ranged damage.", dps = "Adds first.",
          positioning = "Standard.", wipes = "Rifleman stacks." },
        { name = "Archivist Galford", order = 3, contentType = "dungeon", bossType = "Live - fire caster",
          tldr = "Fire Nova and Burning Winds. Burn the archive for the quest.",
          abilities = {
              { name = "Fire Nova", desc = "AoE." },
              { name = "Burning Winds", desc = "Fire damage." },
          },
          tank = "Hold him.", healer = "Fire damage.", dps = "Burn.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Balnazzar", order = 4, contentType = "dungeon", bossType = "Live - final (Dathrohan transform)",
          tldr = "Grand Crusader Dathrohan transforms into Balnazzar. Mind control and Psychic Scream - CC the controlled player, fear protection.",
          abilities = {
              { name = "Mind Control", desc = "Controls a player." },
              { name = "Psychic Scream", desc = "AoE fear." },
          },
          tank = "Hold through the transform.", healer = "Fear ward; watch MC.", dps = "Burn.",
          positioning = "Standard.", wipes = "MC'd player + fear." },
        { name = "Baroness Anastari", order = 5, contentType = "dungeon", bossType = "Undead - ziggurat",
          tldr = "Possess takes over a player. CC them.",
          abilities = { { name = "Possess", desc = "Takes control of a player." } },
          tank = "Hold her.", healer = "Watch possessed player.", dps = "Burn.",
          positioning = "Standard.", wipes = "Possessed tank." },
        { name = "Nerub'enkan", order = 6, contentType = "dungeon", bossType = "Undead - ziggurat",
          tldr = "Encasing Webs root/slow players.",
          abilities = { { name = "Encasing Webs", desc = "Root/slow." } },
          tank = "Hold him.", healer = "Steady.", dps = "Burn.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Maleki the Pallid", order = 7, contentType = "dungeon", bossType = "Undead - ziggurat",
          tldr = "Frostbolt and Drain Life. Interrupt.",
          abilities = {
              { name = "Frostbolt", desc = "Frost nuke." },
              { name = "Drain Life", desc = "Drain." },
          },
          tank = "Hold him.", healer = "Steady.", dps = "Kick.",
          positioning = "Standard.", wipes = "Rare." },
        { name = "Ramstein the Gorger", order = 8, contentType = "dungeon", bossType = "Undead - abomination",
          tldr = "After the 3 ziggurat bosses the Slaughterhouse opens: abomination waves, then Ramstein. Trample hits hard.",
          abilities = { { name = "Trample", desc = "Hits nearby players." } },
          tank = "Cooldowns.", healer = "Heavy tank damage.", dps = "Burn.",
          positioning = "Standard.", wipes = "Tank dies to Ramstein." },
        { name = "Baron Rivendare", order = 9, contentType = "dungeon", bossType = "Undead - final boss",
          tldr = "Raises skeletons and uses Death Pact to sacrifice them for a big heal - kill skeletons. Unholy Aura damages everyone.",
          abilities = {
              { name = "Raise Dead", desc = "Skeleton adds." },
              { name = "Death Pact", desc = "Sacrifices skeletons to heal himself." },
              { name = "Unholy Aura", desc = "Damage aura." },
              { name = "Mortal Strike", desc = "Healing reduction on tank." },
          },
          tank = "Hold him.", healer = "Aura damage.", dps = "Skeletons first.",
          positioning = "Standard.", wipes = "Death Pact heals." },
    },
}

----------------------------------------------------------------------
-- Register Forever dungeon bosses (DungeonData.lua's own registration
-- loop already ran before this file loaded, so it skipped these).
----------------------------------------------------------------------
D.byExactName = D.byExactName or {}
D.byInstanceBoss = D.byInstanceBoss or {}
D.byName = D.byName or {}

for i = FIRST_FOREVER_INDEX, #D.dungeons do
    local dungeon = D.dungeons[i]
    local list = {}
    for _, boss in ipairs(dungeon.bosses or {}) do
        D.byExactName[boss.name] = boss
        list[#list + 1] = boss
        local key = boss.name:lower():gsub("[%s%-'']", "")
        D.byName[key] = boss
    end
    D.byInstanceBoss[dungeon.name] = list
    local aliases = INSTANCE_ALIASES[dungeon.name]
    if aliases then
        for _, alt in ipairs(aliases) do
            D.byInstanceBoss[alt] = list
        end
    end
end
