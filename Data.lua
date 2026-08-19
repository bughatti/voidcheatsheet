----------------------------------------------------------------------
-- VoidCheatSheet -- Boss Data
-- Raid cheat sheets for Midnight Season 1
-- Auto-generated from midnight-s1-raid-bosses.md (1198 lines)
----------------------------------------------------------------------

VoidCheatSheetData = {}
local D = VoidCheatSheetData

D.raids = {
    ---------------------------------------------------------------------------
    -- RAID 1: THE VOIDSPIRE (6 bosses)
    ---------------------------------------------------------------------------
    {
        name = "The Voidspire",
        bosses = {
            ---------------------------------------------------------------
            -- BOSS 1: IMPERATOR AVERZIAN
            ---------------------------------------------------------------
            {
                name = "Imperator Averzian",
                order = 1,
                bossType = "Heavy cleave, positioning-heavy",
                tldr = "Tic-tac-toe board control. Boss claims tiles via Shadow's Advance. Prevent 3 adjacent claimed tiles or March of the Endless = instant wipe. Soak Umbral Collapse ON Voidshapers. Kill adds before 100 energy. Interrupt Pitch Bulwark.",
                phases = {
                    { name = "Repeating Phase", desc = "One repeating phase with no distinct transitions. Cycles of Shadow's Advance waves with adds and soak management. Escalating pressure as more tiles get claimed." },
                },
                abilities = {
                    { name = "Shadow's Advance", desc = "Spawns 3 Abyssal Voidshapers on designated board positions. Each Voidshaper casts Gathering Darkness; if cast completes, that tile is permanently claimed (Void Claimed). Voidshapers transform into Obsidian Endwalkers at 100 energy if not killed. Spawning deals Shadow damage to players within 10 yards and knocks back." },
                    { name = "Umbral Collapse", desc = "Random player gets a soak circle that explodes after a few seconds. Damage is split among all players within 10 yards. MUST be placed directly on top of a Voidshaper to destroy it (bypasses Umbral Barrier). Two consecutive soaks per wave -- save exactly 2 of 3 tiles per cycle. Raid leader calls which marker to soak on." },
                    { name = "Blackening Wounds", desc = "Tank debuff from boss melee attacks. Stacking debuff reducing maximum HP by 4% per stack, 20 seconds per stack. Tank swap at 8-10 stacks. Adds gravitate toward the tank with highest stacks." },
                    { name = "Imperator's Glory", desc = "Boss gains 75% increased damage and 90% reduced damage taken when within 10 yards of claimed tiles. Also buffs nearby adds. CRITICAL: Tank boss AWAY from claimed tiles at all times." },
                    { name = "Dark Upheaval", desc = "Persistent unavoidable raid-wide Shadow damage throughout the encounter. Constant healing check that intensifies as fight progresses." },
                    { name = "Void Fall", desc = "Knocks all players back. Spawns void pools on the ground that must be dodged. Move out of circles." },
                    { name = "Oblivion's Wrath", desc = "Boss launches spikes in a semicircle pattern. Spikes fire in a direction after a short delay. Dodge the spike trajectories." },
                    { name = "March of the Endless", desc = "WIPE MECHANIC. Triggered if boss claims 3 adjacent tiles in any direction (horizontal, vertical, or diagonal). Shadow damage every 1 sec to all players -- unsurvivable. Prevention is the entire fight." },
                    { name = "Gathering Darkness", desc = "Cast by Abyssal Voidshapers. If cast completes, that tile is permanently claimed. Interrupt or kill Voidshaper before completion." },
                    { name = "Pitch Bulwark", desc = "Cast by Shadowguard Stalwarts/Annihilators. Damage shield that must be interrupted." },
                },
                addPriority = "1) Abyssal Voidshaper -- kill before 100 energy or tile is claimed; use Umbral Collapse soak. 2) Shadowguard Stalwart / Annihilator -- interrupt Pitch Bulwark (damage shield). 3) Voidmaws -- prevent from reaching portals at sub-35% HP (they heal via Dark Resilience).",
                tankSwap = { trigger = "stacks", debuff = "Blackening Wounds", stacks = "8-10", note = "4% max HP reduction per stack, 20s duration. Adds prefer tank with highest stacks." },
                tank = "Swap at 8-10 stacks of Blackening Wounds. Keep boss away from claimed tiles (Imperator's Glory = 75% damage + 90% damage reduction). Position adds for cleave. Manage add aggro -- adds prefer highest-stack tank.",
                healer = "Constant rot from Dark Upheaval requires sustained throughput. Burst healing needed during Umbral Collapse soaks. Healing intensity increases as fight progresses (more adds, more claimed tiles).",
                dps = "Priority: Voidshaper > Stalwart/Annihilator > Voidmaws > Boss. Interrupt Pitch Bulwark on Stalwarts. Stack on soak targets when called. Cleave is strong -- position for multi-target damage.",
                positioning = "Prioritize soaking corner/edge tiles over center positions. Tank boss in center or near unclaimed tiles. Drop Void Fall pools at edges. Soak groups stack tight for Umbral Collapse split.",
                wipes = "Lost tempo on board control (3-in-a-row). Missed soaks or delayed repositioning. Voidshaper reaching 100 energy (tile auto-claimed). Boss standing on claimed tiles (Imperator's Glory = unkillable). Adds reaching portals and healing.",
                bloodlust = "On pull.",
            },
            ---------------------------------------------------------------
            -- BOSS 2: VORASIUS
            ---------------------------------------------------------------
            {
                name = "Vorasius",
                order = 2,
                bossType = "Single target with add phases",
                tldr = "Void Godzilla. Stomps floor creating crystal walls, spawns Blistercreep adds that must detonate near walls to break them, then fires lethal Void Breath requiring safe zones behind broken walls. Escalating damage via Primordial Power stacks.",
                phases = {
                    { name = "Repeating Cycle", desc = "Primordial Roar -> Shadowclaw Slam (creates walls) -> Blistercreep spawns -> Void Breath. Repeats approximately 3 times with escalating damage via Primordial Power stacks." },
                },
                abilities = {
                    { name = "Primordial Roar", desc = "Pulls entire raid toward boss, then knocks back. Deals heavy raid-wide damage. Applies Primordial Power -- stacking raid DoT dealing damage every 2 seconds. Stacks accumulate throughout fight = soft enrage. Occurs at fight start and after each laser phase." },
                    { name = "Shadowclaw Slam (Smashing Frenzy)", desc = "Boss smashes the ground dealing heavy physical damage. Creates Void Crystal walls dividing the arena. First two hits apply Smashed -- 2-minute debuff increasing physical damage taken by 150%. TANK MECHANIC: Tank 1 takes first two hits (reaching 300% increased physical damage taken), then plays defensively for 2 minutes while Tank 2 soaks subsequent smash circles." },
                    { name = "Aftershock", desc = "Expanding rings emanate from each smash impact point. Deals physical damage on contact. Melee: step INTO the impact spot after slam lands (rings expand outward). Ranged: outrange entirely." },
                    { name = "Parasite Expulsion / Blistercreep Phase", desc = "Boss spawns multiple Blistercreep adds that fixate on random players. Strategy: melee drag adds to LEFT wall, ranged drag adds to RIGHT wall. Adds must die near walls to break them." },
                    { name = "Blisterburst", desc = "When Blistercreeps die, they create explosion circles. Explosions damage nearby players and apply 30-second shadow damage debuff. Explosions also damage walls -- TWO explosions per wall needed to break them. On Heroic, each wall requires multiple explosions." },
                    { name = "Void Breath", desc = "Boss fires lethal sweeping laser beam from one hand approximately 30 seconds after creeps spawn. Players must identify which hand and run the OPPOSITE direction. Broken walls provide essential safe zones to hide behind. If walls are not broken, nowhere to hide = wipe." },
                    { name = "Overpowering Pulse", desc = "Triggers if NO melee target exists on the boss. Maintain melee uptime at ALL times." },
                    { name = "Gathering Void", desc = "Stacking raid DoT that ramps throughout fight. Makes later Void Breath cycles increasingly dangerous." },
                },
                tankSwap = { trigger = "rotation", debuff = "Smashed", stacks = "after 2 slams", note = "Tank 1 takes first 2 Shadowclaw Slams = 300% phys dmg taken for 2min. Tank 2 handles rest of cycle until Tank 1's debuff expires." },
                tank = "Tank 1 takes first 2 Shadowclaw Slams with defensive cooldowns (gets Smashed to 300%). Tank 1 plays safe for 2 minutes while debuff expires. Tank 2 soaks every other smash circle during this period. ALWAYS keep at least one tank in melee (Overpowering Pulse). Swap cleanly between slam phases.",
                healer = "Manage ramping Primordial Power/Gathering Void damage. Burst healing during Blisterburst detonations. Plan cooldowns for final Void Breath cycles (highest damage). Constant healing pressure increases each cycle.",
                dps = "Guide Blistercreeps to walls -- positioning > raw damage. Kill adds ON the walls, not randomly. Avoid Aftershock rings. Maintain melee uptime on boss to prevent Overpowering Pulse. Use knockbacks/grips to position creeps on walls.",
                positioning = "Stack in front of boss on pull for healing. Melee hug tank during slams, step into impact spots after landing. During creep phase: melee go left wall, ranged go right wall. After Void Breath: return to starting position and repeat.",
                wipes = "Failed wall destruction before Void Breath. Overlapping creep explosions (debuff stacking). Lost melee uptime triggering Overpowering Pulse. Poor Blistercreep positioning (dying away from walls). Running wrong direction during Void Breath.",
                bloodlust = "On pull or during highest-pressure cycle.",
            },
            ---------------------------------------------------------------
            -- BOSS 3: FALLEN-KING SALHADAAR
            ---------------------------------------------------------------
            {
                name = "Fallen-King Salhadaar",
                order = 3,
                bossType = "Single target with orb management",
                tldr = "Repeating phase with orbs advancing toward boss. If ANY orb reaches boss = Void Infusion = instant wipe. Stagger orb kills 8 seconds apart. Interrupt Fractured Images. Burn during Entropic Unraveling (25% damage amp). Room slowly fills with puddles -- space management is key.",
                phases = {
                    { name = "Repeating Cycle", desc = "One phase repeating on a cycle. Orbs spawn and advance toward boss. Adds appear. Despotic Command drops puddles." },
                    { name = "Entropic Unraveling (100 Energy)", desc = "Boss becomes stationary for 20 seconds. Takes 25% INCREASED damage. Heavy unavoidable raid-wide damage. Umbral Beams spin clockwise around boss -- lethal to anyone struck. Massive puddle spawns on conclusion. Rotate with beams clockwise; pop cooldowns during 25% amp window." },
                },
                abilities = {
                    { name = "Void Convergence", desc = "PRIMARY WIPE MECHANIC. Spawns 2 orbs (Concentrated Void) that slowly advance toward the boss. Boss marks 2 of 3 gates at pull indicating spawn locations. If ANY orb reaches the boss = Void Infusion = instant wipe. Orbs damage players on contact via Void Exposure debuff. Strategy: move boss toward marked gates; DPS kills orbs before they reach boss. Kill closest orb to boss first." },
                    { name = "Dark Radiation", desc = "Released raid-wide when an orb is destroyed. Lasts 8 seconds, stacks if multiple orbs die simultaneously. STAGGER ORB KILLS: wait 8 seconds between first and second orb kill. Stacked Dark Radiation = lethal raid damage." },
                    { name = "Galactic Miasma", desc = "Heroic+. Stacking raid DoT applied when orbs are killed. Makes each orb cycle progressively more dangerous." },
                    { name = "Entropic Unraveling", desc = "At 100 energy. Boss stationary for 20 seconds, takes 25% INCREASED damage. Heavy unavoidable raid-wide damage. Umbral Beams spin clockwise around the boss -- lethal damage to anyone struck. Massive puddle spawns upon conclusion. Strategy: rotate with beams clockwise; pop cooldowns during 25% amp window. Tank boss off-center for beam dodging space." },
                    { name = "Shattering Twilight", desc = "Tank receives debuff spawning Twilight Spike arrows in multiple directions. After affecting tank, spreads to several other raid members with smaller spike effects. Direct arrows AWAY from all players and NEVER toward the boss." },
                    { name = "Despotic Command", desc = "Several players receive a circle lasting 10 seconds. On expiration: drops permanent puddle at location + applies large absorb shield. MOVE TO ROOM EDGE before expiration to preserve arena space. Dispelling removes it but applies Oppressive Darkness + drops puddle." },
                    { name = "Fractured Images", desc = "Stationary adds that cast Shadow Fracture (also called Unstable Nexus). ANY crowd control or interrupt destroys the image. If cast COMPLETES: image despawns but leaves PERMANENT puddle. INTERRUPT IMMEDIATELY -- never let cast finish." },
                    { name = "Twisting Obscurity", desc = "Unavoidable raid-wide damage jumping between players. Applies 23-second damage-over-time effect." },
                    { name = "Destabilizing Strikes", desc = "Tank debuff. Boss melee attacks apply stacking shadow DoT lasting 15 seconds. Tank swap when stacks become dangerous." },
                },
                tankSwap = { trigger = "stacks", debuff = "Destabilizing Strikes", stacks = "~8 or on drop", note = "Shadow DoT every 1s for 15s, stacks on melee hits. Swap at ~8 stacks or let debuff fall off before returning." },
                tank = "Kite boss toward marked gates (where orbs spawn) for faster kills. Aim Shattering Twilight spikes away from raid. Swap on Destabilizing Strikes stacks. Position boss off-center before Entropic Unraveling for beam dodge space. Position boss near edge before intermission to preserve central space.",
                healer = "Handle rot from Galactic Miasma + burst from Dark Radiation. Despotic Command absorb shields need fast healing. Save major cooldowns for Entropic Unraveling (heavy raid damage). Dispel timing on Despotic Command is critical.",
                dps = "Priority: Orbs > Fractured Images > Boss. Kill closest orb to boss first. Stagger orb kills (8 seconds apart). CC/interrupt Fractured Images IMMEDIATELY. Don't kill orbs too fast (Dark Radiation stacking).",
                positioning = "Boss toward marked gates. Despotic Command players run to room edges. During Entropic Unraveling: rotate clockwise with beams. Keep center of room clear of puddles as long as possible.",
                wipes = "Orb reaching the boss (Void Infusion = wipe). Stacked Dark Radiation from simultaneous orb kills. Fractured Images completing casts (permanent puddles). Poor Despotic Command placement (losing arena space). Getting hit by Umbral Beams during Entropic Unraveling.",
                bloodlust = "On pull OR during Entropic Unraveling for 25% damage amp.",
            },
            ---------------------------------------------------------------
            -- BOSS 4: VAELGOR AND EZZORAK
            ---------------------------------------------------------------
            {
                name = "Vaelgor & Ezzorak",
                order = 4,
                bossType = "Dual-target dragon council, no shared health",
                tldr = "Two dragons that must die within 10% HP of each other, kept 15+ yards apart. Tether management, orb soaking, and intermission add. Balance DPS evenly. Never stand behind either dragon.",
                phases = {
                    { name = "Combat Loop", desc = "Repeating combat loop: Void Howl -> Nullbeam/Nullzone -> Gloom (approximately every 10 seconds). Balance DPS between both dragons." },
                    { name = "Midnight Flames (100 Energy Intermission)", desc = "Both dragons fly up. Unavoidable raid-wide damage. Players MUST stack inside Radiant Barrier in room center. Manifestation of Midnight spawns -- must be killed quickly. Manifestation gains stat escalation every 30 seconds. If not killed fast: Unbound Shadow ramps and wipes raid. After intermission: dragons return and cycle repeats." },
                },
                abilities = {
                    { name = "Nullbeam (Vaelgor)", desc = "Frontal beam on current tank lasting 4 seconds. Applies stacking DoT to everyone hit. Creates Nullzone where beam was soaked." },
                    { name = "Nullzone", desc = "Spawns where Nullbeam was soaked. Tethers ALL players and pulls them inward. Breaking tether prematurely causes Nullsnap (damage). Failed tether management causes Nullzone Implosion (heavy raid damage)." },
                    { name = "Dread Breath (Vaelgor)", desc = "Targets a random player with a large frontal cone. FEARS anyone hit. Targeted player steps to the side so cone does not hit the raid. Get dispelled after it resolves." },
                    { name = "Vaelwing", desc = "Distance-scaling physical tank hit from Vaelgor. Ramps in strength; resets on tank swap." },
                    { name = "Tail Lash", desc = "Knocks back anyone standing behind the boss. NEVER stand behind either dragon." },
                    { name = "Gloom (Ezzorak)", desc = "Fires a large orb in the direction Ezzorak is facing. When orb reaches arena edge: explodes and leaves a MASSIVE permanent puddle. Puddle shrinks based on how many players touch the Gloom orb on the way (up to 5 players). Players who touch Gloom gain Diminish -- 1-minute debuff (increased damage taken). Soaking Gloom intentionally but managing Diminish stacks is critical." },
                    { name = "Void Howl (Ezzorak)", desc = "Marks ALL players with a circle. After short delay: deals damage to anyone standing in it and spawns a Voidorb. Voidorbs permanently cast Voidbolt at random players (INTERRUPTIBLE). Group up Voidorbs, stun + AoE them down quickly." },
                    { name = "Rakfang (Ezzorak)", desc = "Massive physical hit on tank applying healing absorb. Ramps up and resets on new target (tank swap mechanic). Immediately followed by Impale -- cone-shaped attack that applies bleed + 3-second stun. Point Impale away from raid." },
                    { name = "Voidbolt", desc = "Cast by spawned Voidorbs. INTERRUPTIBLE -- assign interrupt rotation." },
                    { name = "Twilight Bond", desc = "If dragons are within 15 yards of each other: both gain 100% increased damage. If health differs by more than 10%: both gain 100% increased damage. Stays active until condition is corrected. BALANCE DPS AND POSITIONING." },
                    { name = "Twilight Fury", desc = "If one dragon dies while the other lives: surviving dragon gains massive damage increase. Kill both within seconds of each other." },
                    { name = "Midnight Flames (Intermission)", desc = "Both dragons fly up. Unavoidable raid-wide damage. Players MUST stack inside Radiant Barrier in room center. Manifestation of Midnight spawns -- must be killed quickly. Manifestation gains stat escalation every 30 seconds. If not killed fast: Unbound Shadow ramps and wipes raid." },
                },
                tankSwap = { trigger = "cast", debuff = "Gloom", note = "Swap after each Gloom cast. Keep dragons 15+ yards apart (Twilight Bond) — never drag bosses through each other." },
                tank = "Tank dragons 15+ yards apart (Twilight Bond). Swap after Gloom cast (don't drag bosses). Face Nullbeam away from raid. Vaelwing resets on swap; Rakfang resets on swap. Point Impale (after Rakfang) away from raid. During intermission: pick up Manifestation.",
                healer = "Burst healing during Nullzone tether breaks. Sustained pressure from Gloomtouched/Diminish debuffs. Heavy cooldown coordination during Midnight Flames intermission. Healing absorbs from Rakfang need attention.",
                dps = "BALANCE damage between both dragons (within 10% HP). Kill Voidorbs fast (interrupt Voidbolt). Soak Gloom orbs (up to 5 players) to minimize puddle size. Manage Diminish stacks -- don't over-soak. During intermission: kill Manifestation of Midnight FAST.",
                positioning = "Tank dragons near spawn locations, 15+ yards apart. Raid stands BETWEEN the two bosses, attacking from sides. NEVER stand behind either boss (Tail Lash). Bait Dread Breath to sides. Stack center for Midnight Flames intermission.",
                wipes = "Health imbalance triggering Twilight Bond. Failed tether management (Nullzone Implosion). Over-stacking Gloomtouched/Diminish. Slow Manifestation kill during intermission. One dragon dying too early (Twilight Fury). Voidorbs left alive casting Voidbolt.",
                bloodlust = "On pull with cleave value.",
            },
            ---------------------------------------------------------------
            -- BOSS 5: LIGHTBLINDED VANGUARD
            ---------------------------------------------------------------
            {
                name = "Lightblinded Vanguard",
                order = 5,
                bossType = "3-boss council fight (Paladin-themed)",
                tldr = "Three former paladins (Protection, Retribution, Holy) with independent energy bars. At 100 energy each activates devastating aura buffing the other two. Must die at roughly same time or Retribution stacks wipe you. Hero on PULL but wait 8s for bubbles.",
                phases = {
                    { name = "Continuous Fight", desc = "Bosses reach 100 energy in fixed rotation: Bellamy first -> Venel -> Senn. Each ultimate drops permanent Consecration puddle. Fight is a DPS and positioning race. Hero/Bloodlust on PULL, but Bellamy and Senn bubble for 8 seconds. Start on Venel, wait 8s, then pop cooldowns and cleave all three." },
                },
                abilities = {
                    -- Commander Venel Lightblood (Retribution)
                    { name = "Aura of Wrath (Venel - 100 Energy)", desc = "Increases Holy damage done by allies within 40 yards by 100%. MOVE OTHER BOSSES OUT of aura immediately. Leaves permanent Consecration puddle where activated." },
                    { name = "Execution Sentence (Venel)", desc = "3 marked players receive circles that detonate after 3 seconds. Damage split among nearby targets -- requires 3-5 players per soak. Spawns Divine Hammers after detonation (spiral pattern to dodge). Multiple overlapping soaks = lethal." },
                    { name = "Divine Storm (Venel)", desc = "Heavy damage within 8-yard radius. Stay spread if not soaking." },
                    { name = "Sacred Toll (Venel)", desc = "Unavoidable raid-wide damage. Requires healer cooldowns." },
                    { name = "Judgment + Final Verdict (Venel)", desc = "Judgment hits tank and increases subsequent damage by 200% for 5 seconds. Final Verdict follows immediately with massive damage. SWAP AS SOON AS JUDGMENT HITS." },
                    { name = "Avenging Wrath (Venel)", desc = "Self-buff: +30% damage dealt, +20% damage taken. Good burn window when active." },
                    -- General Amias Bellamy (Protection)
                    { name = "Aura of Devotion (Bellamy - 100 Energy)", desc = "Reduces damage taken by allies within 40 yards by 75%. MOVE OTHER BOSSES OUT immediately (they become nearly unkillable). Leaves permanent Consecration puddle." },
                    { name = "Divine Toll (Bellamy)", desc = "Fires shield volleys every 2 seconds for 18 seconds. Shields SILENCE hit players for 4 seconds. Spread to avoid multiple hits." },
                    { name = "Avenger's Shield (Bellamy)", desc = "Targets multiple players with 5-yard radius damage circles. Players must spread out. Must be DISPELLED." },
                    { name = "Light Infused (Bellamy)", desc = "Constant raid damage that increases 25% per boss ultimate cast. Soft enrage mechanic -- longer fight = harder." },
                    { name = "Judgment + Shield of the Righteous (Bellamy)", desc = "Similar to Venel: Judgment increases subsequent damage by 200%. Shield of the Righteous follows with massive hit. SWAP AS SOON AS JUDGMENT HITS." },
                    -- War Chaplain Senn (Holy)
                    { name = "Aura of Peace (Senn - 100 Energy)", desc = "PACIFIES players who attack protected allies for 4 seconds. Effectively silences and locks actions for anyone attacking buffed targets. MOVE OTHER BOSSES OUT immediately." },
                    { name = "Tyr's Wrath (Senn)", desc = "Applies stacking healing absorbs on the 3 closest players. ROTATE closest players to prevent stack accumulation. Sustained healer pressure." },
                    { name = "Searing Radiance (Senn)", desc = "15-second raid damage channel. Requires healer throughput." },
                    { name = "Sacred Shield + Blinding Light (Senn)", desc = "Sacred Shield makes Senn immune -- must be burned down fast. Once shield breaks: Senn immediately casts Blinding Light. Blinding Light = heavy damage + disorient to entire raid. MUST BE INTERRUPTED before cast completes." },
                    { name = "Exorcism (Senn)", desc = "Moderate tank damage." },
                    -- Shared
                    { name = "Retribution (Wipe Mechanic)", desc = "If one boss dies too early: survivors gain Retribution. Stacking 5% damage increase per stack. Quickly becomes unhealable. ALL THREE must die at roughly the same time." },
                    { name = "Consecration Puddles", desc = "Each ultimate leaves a permanent Consecration puddle. Position boss at arena EDGES before they hit 100 energy. Central space must be preserved." },
                },
                tankSwap = { trigger = "mechanic", debuff = "Judgment → finisher", note = "Precise taunt swap during Judgment → finisher sequence for BOTH Venel and Bellamy. Prevent aura overlap at all costs." },
                tank = "Manage THREE bosses' positioning simultaneously. Prevent aura overlap at all costs. Execute precise taunt swaps during Judgment -> finisher sequences for BOTH Venel and Bellamy. Move boss approaching 100 energy to arena edge (Consecration puddle placement). Pick up adds/Sacred Shield breaks.",
                healer = "Burst healing for Execution Sentence soaks. Sustained pressure from Tyr's Wrath absorbs. Raid-wide damage from Light Infused increases each ultimate. Cooldown rotation during aura windows. Dispel Avenger's Shield targets.",
                dps = "Maintain EVEN cleave damage across all three bosses. Prioritize Sacred Shield destruction on Senn (break before Blinding Light). Interrupt Blinding Light immediately after shield breaks. Don't overcommit to single targets (Retribution stacking). Hero on pull, start on Venel, cleave after 8s bubble expires.",
                positioning = "Bosses spread around arena. Boss approaching 100 energy tanked at edge. Spread for Avenger's Shield circles. Stack 3-5 per Execution Sentence soak. Keep center clear for movement.",
                wipes = "Aura overlap (two bosses buffing each other). Failed Execution Sentence soaks. Delayed Sacred Shield break -> Blinding Light casts. Health imbalance triggering Retribution stacking. Poor Consecration puddle placement (running out of space). Missed Judgment tank swaps (one-shot).",
                bloodlust = "On pull (but wait 8s for bubbles to drop).",
            },
            ---------------------------------------------------------------
            -- BOSS 6: CROWN OF THE COSMOS (Final Boss of Voidspire)
            ---------------------------------------------------------------
            {
                name = "Crown of the Cosmos",
                order = 6,
                bossType = "Multi-phase, cleave until Phase 3, then pure single target",
                tldr = "Fight against Alleria Windrunner consumed by Void power. Three phases with two intermissions. Adds, positioning, debuff management, and arena space denial. The hardest encounter in the tier. Kill order Phase 1: Demair -> Vorelus -> Morium.",
                phases = {
                    { name = "Phase 1: Three Undying Sentinels", desc = "Kill Order: Demair -> Vorelus -> Morium. One tank permanently handles Morium near its portal while collecting Void Droplets. Second tank + raid stack on Demair. Ranged slightly outside to bait Void Expulsion puddles away. Sentinels cannot die until hit by Silverstrike Arrow (Umbral Tether)." },
                    { name = "Intermission 1: Crushing Singularity", desc = "Room splits into three slices. Stay in assigned slice near center. Stellar Emission DoT ramps in damage AND pull intensity. Reset by arrow hits but creates vulnerability window. Get hit early by arrows to reset DoT, avoid second hit while 8-second debuff active, hit again when debuff expires, repeat." },
                    { name = "Phase 2: Rift Simulacrum + Alleria", desc = "Boss and Simulacrum share health. Simulacrum dies at 62%. Hug a fissure edge (left or right, be consistent). Raid stacks near outer slice edge. Speed matters more than final health %." },
                    { name = "Intermission 2", desc = "Identical to Intermission 1 with added Orbiting Matter -- line of orbs blocking passage. Getting close pulls you in, forcing slice rotation. Avoid moving during arrow damage debuff." },
                    { name = "Phase 3: The End of the End (Final Phase)", desc = "Everyone stacks near Alleria. Hero/Lust/potions/cooldowns IMMEDIATELY. Hard enrage after three Devouring Cosmos casts covering entire platform. This is the DPS check." },
                },
                abilities = {
                    -- Phase 1
                    { name = "Silverstrike Arrow (P1)", desc = "Marks players, fires THROUGH them to remove Void Effects. Must hit Sentinels to overcome Umbral Tether (prevents sentinel death until hit by arrow). Hitting same sentinel twice resets Corrupting Essence stacks. First arrow set: prioritize Demair, optionally clip Vorelus. Second set: hit Vorelus (if missed), optionally Morium. Third set: reserve for missed targets." },
                    { name = "Umbral Tether (P1)", desc = "Prevents sentinel death until hit by Silverstrike Arrow. Each sentinel must be unlinked before it can be killed." },
                    { name = "Void Droplets (P1)", desc = "Small adds; when killed apply increased damage taken debuff (helpful for sentinel damage). Can be gripped into stack for cleave value. Apply Corrupting Essence on death." },
                    { name = "Echoing Darkness (P1)", desc = "Deals small damage every 2 seconds. Increases 4% when no melee is present on a sentinel. ALWAYS keep tanks in melee range." },
                    { name = "Null Corona (P1/P3)", desc = "Large healing absorb applied to random players. CAN be dispelled but jumps to another player with remaining value. HEAL through it instead of dispelling unless target is about to die." },
                    { name = "Grasp of Emptiness (P1/P3)", desc = "Root plus burst damage on removal. Anchors to obelisks, reduces damage, fires beams on expiration." },
                    { name = "Void Expulsion (P1)", desc = "Ranged-targeted puddles. Bait away from group near edges." },
                    -- Intermission 1
                    { name = "Stellar Emission (Intermission)", desc = "DoT ramping in damage AND pull intensity. Reset by arrow hits but creates vulnerability window. Strategy: get hit early by arrows to reset DoT, avoid second hit while 8-second debuff active, hit again when debuff expires, repeat." },
                    { name = "Silverstrike Barrage (Intermission)", desc = "Arrow variant applying 300% increased damage taken from arrows for 8 seconds. DON'T get hit by arrows while this debuff is active." },
                    { name = "Singularity Eruption (Intermission)", desc = "Dangerous puddles requiring avoidance. Use movement cooldowns for pull resistance." },
                    -- Phase 2
                    { name = "Volatile Fissure (P2)", desc = "Crossing between slices applies stacking DoT. Move quickly between slices when repositioning." },
                    { name = "Ranger Captain's Mark (P2)", desc = "Arrow mechanic that ricochets between marked players. Must hit Voidspawns to remove their Umbral Tether before they can be killed." },
                    { name = "Call of the Void (P2)", desc = "Spawns 2 Undying Voidspawns attempting Void Barrage. Voidspawns at 100 energy become unkillable. Interrupt Void Barrage." },
                    { name = "Rift Slash (P2)", desc = "Heavy physical hit reducing stats by 10%. Tank swap at 2-3 stacks." },
                    { name = "Voidstalker Sting (P2)", desc = "Random target DoT lasting 25 seconds." },
                    { name = "Empowering Darkness (P2)", desc = "Simulacrum grants nearby allies 10% reduced damage taken + 10% increased damage done per second within 25 yards. Stacks dangerously -- keep adds away from Simulacrum." },
                    { name = "Cosmic Barrier (P2)", desc = "Simulacrum barrier dealing raid damage while active. Burn through quickly." },
                    -- Intermission 2
                    { name = "Orbiting Matter (Intermission 2)", desc = "Line of orbs blocking passage. Getting close pulls you in, forcing slice rotation. Avoid moving during arrow damage debuff." },
                    -- Phase 3
                    { name = "Aspect of the End (P3)", desc = "Tethers 3 players (one tank, one melee, one ranged) reducing healing 10%, increasing every 2 seconds. Breaking tether at 30 yards triggers Gravity Collapse: raid damage + 300% increased physical damage taken for 12 seconds. BREAK ORDER: Ranged first -> Melee second -> Tank last. Tanks swap around tank break for physical damage reduction." },
                    { name = "Devouring Cosmos (P3)", desc = "Drops void puddle covering current slice, preventing healing inside. HARD ENRAGE after three casts covering entire platform. This is the DPS check." },
                    { name = "Dark Rush (P3)", desc = "Feather granting glide ability to reach next slice when jumping. Applies 12-second damage effect. Use to escape Devouring Cosmos coverage." },
                },
                tankSwap = { trigger = "stacks", debuff = "Rift Slash (Phase 2)", stacks = "2-3", note = "Phase 2 only. Phase 1 is split-tank (Morium permanent / other on Demair+Vorelus). Phase 3: tank breaks Aspect of the End LAST." },
                tank = "Phase 1: One tank on Morium permanently, other on Demair/Vorelus. Keep sentinels in melee (Echoing Darkness). Phase 2: Swap at 2-3 Rift Slash stacks. Phase 3: Coordinate Aspect of the End break order (tank breaks LAST).",
                healer = "One of the most demanding healing fights in the tier. Phase 1: Null Corona absorbs, rot from multiple sources. Intermissions: heavy cooldown windows. Phase 3: Sustained Aspect of the End damage + Devouring Cosmos coverage reducing healing. Cooldown planning across ALL phases essential.",
                dps = "Phase 1: Sentinels > Droplets > Boss in kill order (Demair -> Vorelus -> Morium). Phase 2: Voidspawns > Simulacrum > Boss; interrupt Void Barrage. Phase 3: PURE BURN -- hard enrage after 3 Devouring Cosmos. Delayed add kills cause exponential damage escalation. Strict priority targeting is MANDATORY.",
                positioning = "Phase 1: Stack on current kill target, ranged bait Void Expulsion to edges. Intermission: Stay in assigned slice near center. Phase 2: Hug fissure edge, move counter-clockwise as space shrinks. Phase 3: Stack on Alleria, use Dark Rush feathers to reach next slice.",
                wipes = "Phase 1: Sentinel not hit by arrow (can't die), Echoing Darkness ramp from no melee. Intermission: Getting hit by arrows while Silverstrike Barrage debuff active. Phase 2: Voidspawns reaching 100 energy, bad puddle placement. Phase 3: Wrong Aspect of the End break order, not enough DPS before 3rd Devouring Cosmos. General: Bad dispels on Null Corona (jumping to another player).",
                bloodlust = "Phase 3 (hard enrage race).",
            },
        },
    },
    ---------------------------------------------------------------------------
    -- RAID 2: THE DREAMRIFT (1 boss)
    ---------------------------------------------------------------------------
    {
        name = "The Dreamrift",
        bosses = {
            ---------------------------------------------------------------
            -- BOSS 7: CHIMAERUS THE UNDREAMT GOD
            ---------------------------------------------------------------
            {
                name = "Chimaerus",
                order = 1,
                bossType = "Single target with heavy add pressure, dual-realm mechanic",
                tldr = "Raid splits into two groups alternating between Normal and Shadow realms. One group soaks to enter Shadow Realm and damages Manifestation adds; other group handles boss + fixated adds in Normal Realm. Adds MUST NOT reach the boss (Insatiable = wipe). Interrupt Fearsome Cry or entire raid feared.",
                phases = {
                    { name = "Phase 1: Dual-Realm Loop", desc = "Repeats until boss reaches 100 energy. Groups alternate between Normal and Shadow Realm every 40 seconds via Alndust Upheaval soaking. Each group: 1 Tank, 2 Healers, 7 DPS. Shadow Realm breaks Manifestation shields; Normal Realm intercepts adds before they reach boss." },
                    { name = "Air Phase (100 Energy Intermission)", desc = "Boss flies through arena in 3 strafing runs (Corrupted Devastation) dealing massive damage + stun, spawning adds and leaving puddles. Move PERPENDICULAR to flight path. Assign a lead player/marker for raid to follow. Boss takes 99% reduced damage (Rift Shroud). Ends with Ravenous Dive -- boss crashes into arena center consuming ALL remaining adds. Each consumed add heals boss 500% of remaining health + 50% damage increase (stacking). ALL adds MUST die before Ravenous Dive. Returns to Phase 1." },
                },
                abilities = {
                    -- Phase 1
                    { name = "Alndust Upheaval", desc = "Targets current tank with a 10-yard soak circle. Entering grants Alnsight buff for 40 seconds -- allows seeing/damaging adds in Shadow Realm. Applies Rift Vulnerability -- 90-second debuff increasing damage from subsequent Upheavals by 600%. Groups alternate soaking every 40 seconds (Group A -> Group B -> Group A...)." },
                    { name = "Colossal Horror (Shadow Realm Add)", desc = "High Priority add requiring tank focus. Casts Roar dealing escalating raid damage. Must be pulled to outer edges before breaking Alnshroud shield." },
                    { name = "Haunting Essence (Shadow Realm Add)", desc = "Casts Fearsome Cry (MUST INTERRUPT or entire raid feared) and Essence Bolt. Interrupt rotation mandatory." },
                    { name = "Swarming Shades (Shadow Realm Add)", desc = "Minor adds, quick kill. Low priority." },
                    { name = "Insatiable", desc = "PRIMARY WIPE MECHANIC. Boss consumes any Manifestation that reaches him. Each consumed add: heals boss 200% of add's missing health, raid-wide damage, DOUBLES boss damage (stacking). Multiple stacks = immediate wipe. If ANY add is active, ALL DPS stop attacking boss immediately." },
                    { name = "Rending Tear", desc = "Random player frontal cone. Applies bleed and knockback. Tank must face boss AWAY from raid." },
                    { name = "Caustic Phlegm", desc = "Persistent 20-second raid-wide DoT. Requires sustained healer throughput." },
                    { name = "Rift Sickness", desc = "Stacking raid-wide healing absorb applied by Manifestation waves. Healers must prioritize clearing these absorbs immediately." },
                    { name = "Alnshroud", desc = "Absorb shields protecting Manifestations in Shadow Realm. Players with Alnsight have approximately 40 seconds to break shields. Pull manifestations to outer edges before breaking shields. Breaking shields = adds teleport to Normal Realm." },
                    -- Heroic
                    { name = "Consuming Miasma (Heroic)", desc = "Random players receive 60-second DoT with 10-yard ring. When dispelled: ring clears any floor void puddles within its radius. Strategy: player with ring runs to cluster of puddles, THEN gets dispelled. Multiple puddles cleared per dispel = space management. On Heroic, void puddles persist after Ravenous Dive (don't clear automatically). Miasma dispels become the ONLY way to manage floor space." },
                    -- Air Phase
                    { name = "Corrupted Devastation (Air Phase)", desc = "Boss flies through arena in 3 strafing runs. Deals massive damage + stun. Spawns adds and leaves puddles. Move PERPENDICULAR to flight path. Assign a lead player/marker for raid to follow." },
                    { name = "Rift Shroud (Air Phase)", desc = "Boss takes 99% reduced damage during intermission." },
                    { name = "Ravenous Dive (Air Phase)", desc = "Boss crashes into arena center. Knocks up entire raid. Consumes ALL remaining adds. Each consumed add: heals boss 500% of remaining health + 50% damage increase (stacking). ALL adds MUST die before Ravenous Dive. Returns to Phase 1." },
                },
                addPriority = "Shadow Realm: Break Alnshroud shields on Manifestations, pull to edges. Normal Realm: 1) Colossal Horror (tank focus, escalating Roar). 2) Haunting Essence (interrupt Fearsome Cry). 3) Swarming Shades (minor, quick kill). ABSOLUTE PRIORITY: if ANY add is active in Normal Realm, ALL DPS stop attacking boss immediately.",
                tankSwap = { trigger = "mechanic", debuff = "Alndust Upheaval / Rending Tear bleed", note = "Swap after Alndust Upheaval cast, or when Rending Tear bleed stacks become dangerous. Rending Tear bleeds for 6s, 1.5s tick." },
                tank = "Swap after Alndust Upheaval or after significant Rending Tear bleed buildup. Face Rending Tear away from raid. In Shadow Realm: pull adds to room edges before breaking shields. Colossal Horror requires tank focus-targeting. Maintain facing consistency.",
                healer = "Continuous Caustic Phlegm DoT management. Prioritize Rift Sickness healing absorbs immediately. Heroic: coordinate Consuming Miasma dispel timing (run to puddles first). Cooldown rotation for intermission phase. Burst healing when adds die near boss (if any reach).",
                dps = "If add gets close to boss: STOP ALL BOSS DPS, kill add instantly. Shadow Realm: break Manifestation shields. Normal Realm: kill fixated adds before reaching boss. Mandatory interrupt rotation for Fearsome Cry. Use displacement tools proactively (grips, knockbacks, roots, slows).",
                positioning = "Boss near edge of arena for maximum add movement space. Spread loosely upstairs with clear lines to intercept incoming adds. Bait strafing runs toward edges to preserve center space. Stack void puddles at arena edges as tightly as possible. Heroic: position Consuming Miasma players over puddle clusters.",
                wipes = "1) Adds reaching Chimaerus (Insatiable stacking). 2) Missed Fearsome Cry interrupts (raid-wide fear). 3) Poor positioning during strafing runs. 4) Breakdown in group rotation for Alndust Upheaval soaking. 5) Overlapping damage without defensive cooldowns. 6) Failure to kill adds before Ravenous Dive. 7) Heroic: poor puddle management consuming floor space.",
                heroic = "Consuming Miasma mechanic added. Random players receive 60-second DoT with 10-yard ring. When dispelled, ring clears floor void puddles within radius. Void puddles persist after Ravenous Dive (don't clear automatically). Miasma dispels become the ONLY way to manage floor space.",
                bloodlust = "On pull or post-intermission.",
            },
        },
    },
    ---------------------------------------------------------------------------
    -- RAID 3: MARCH ON QUEL'DANAS (2 bosses)
    ---------------------------------------------------------------------------
    {
        name = "March on Quel'Danas",
        bosses = {
            ---------------------------------------------------------------
            -- BOSS 8: BELO'REN, CHILD OF AL'AR
            ---------------------------------------------------------------
            {
                name = "Belo'ren",
                order = 1,
                bossType = "Single target with add phases, color-polarity mechanic",
                tldr = "Light vs. Void polarity system. Players receive Light (Gold) or Void (Purple) feathers. Interacting with OPPOSITE color = lethal. Phase 1: Phoenix form (manage mechanics). Phase 2: Egg form (true damage window -- LUST HERE). Rebirth adds permanent 10% healing reduction per cycle.",
                phases = {
                    { name = "Phase 1: Phoenix Form", desc = "Manage Light/Void Dive soaks, Ember adds + eggs, Radiant Echo orb walls, Infused Quills interception, and Guardian's Edict tank sequence. Boss HP damage is NOT permanent in this phase." },
                    { name = "Death Drop (Transition)", desc = "Boss crashes dealing physical damage with knockup. Position near recent puddles for reference. Warlock Gateway strongly recommended to negate knockup. Place gateway from outer circle toward center." },
                    { name = "Phase 2: Immortal Flame (Egg Phase)", desc = "Egg's TRUE health pool -- damage here is permanent progress. This is where you burn the boss. BLOODLUST/HEROISM HERE. Pinwheel Dance / Incubation of Flames: rotating beams emit from egg, players must rotate within matching-color slice. Continue clearing Radiant Echoes during this phase." },
                    { name = "Rebirth + Repeat", desc = "After Egg phase, boss is reborn and Phase 1 repeats. Each rebirth adds permanent 10% healing reduction (Ashen Benediction). Later cycles spawn dual adds." },
                },
                abilities = {
                    -- Feather System
                    { name = "Feather System (Core Mechanic)", desc = "Players receive Light Feather (Gold) or Void Feather (Purple) at fight start. Light Feather: 50% Holy damage reduction. Void Feather: 50% Shadow damage reduction. Tanks are GUARANTEED opposite colors from each other. Never get hit by anything that is the opposite color = instant death or near-lethal. Players CAN freely stack regardless of color -- only opposite-colored DAMAGE matters." },
                    -- Phase 1
                    { name = "Burning Heart", desc = "Continuous raid damage every 3 seconds. Escalates during rebirth phases." },
                    { name = "Light/Void Dive", desc = "Boss targets player with colored dive attacks. Creates soak circles: matching-color players MUST stack to split damage. Failure is lethal. Creates permanent puddles -- place on designated markers near room edges. Respawned eggs from adds must be destroyed within 15 seconds or adds respawn fully." },
                    { name = "Embers of Belo'ren (Add Phase)", desc = "Two add types: Light Embers and Void Embers. Players should engage adds matching their feather color. Ember spawns alongside an egg -- defeat Ember first, then destroy egg before Rebirth cast completes. Later phases spawn TWO Embers simultaneously (increased pressure)." },
                    { name = "Radiant Echoes (Orb Walls)", desc = "Floating orb walls cross the arena. Touching wrong-color orbs = instant death. Matching-color players must clear 3-4 orbs to create safe lanes for opposite team. Selfless mechanic -- clear orbs for others, not yourself." },
                    { name = "Infused Quills", desc = "Targeted player receives incoming quill fire after 6-second delay. Matching-color player MUST intercept as bodyguard. If not intercepted: targeted player takes lethal damage." },
                    { name = "Guardian's Edict (Tank Mechanic)", desc = "Three-step sequence: 1) Light Edict: Light-feathered tank soaks frontal cone. 2) Void Edict: Immediate taunt swap; Void-feathered tank soaks. 3) Voidlight Edict (Heroic+): Both tanks split dual-color frontal (Void left, Light right). Missed soaks grant boss significant damage buff (often wipe-causing). Post-Edict: 5 melee hits require heavy mitigation and externals." },
                    { name = "Eternal Burns", desc = "DoT applying healing absorb debuff. Healers MUST burst-heal through absorption immediately. Delay = unmanageable scaling damage." },
                    { name = "Light/Void Blast", desc = "High damage on random target. INTERRUPTIBLE." },
                    { name = "Light/Void Eruption", desc = "Raid-wide damage unless interrupted. Only MATCHING-COLOR players can interrupt successfully." },
                    -- Phase 2
                    { name = "Immortal Flame (Egg Phase)", desc = "Egg's TRUE health pool -- damage here is permanent progress. This is where you burn the boss. BLOODLUST/HEROISM HERE (not during Phoenix phase)." },
                    { name = "Pinwheel Dance / Incubation of Flames", desc = "Rotating beams emit from egg. Players must rotate within matching-color slice. Incorrect positioning in wrong-color slice = lethal. Continue clearing Radiant Echoes during this phase." },
                    { name = "Ashen Benediction (Soft Enrage)", desc = "Permanent debuff applied each rebirth: -10% healing per stack. Extended fights become unhealable. Insufficient Egg-phase DPS extends encounter and accelerates difficulty." },
                },
                tankSwap = { trigger = "rotation", debuff = "Light/Void Edict", note = "3-step rotation: Light tank soaks Light Edict → immediate swap → Void tank soaks Void Edict. Heroic: split Voidlight Edict (Void left, Light right). Tanks always hold opposite color feathers." },
                tank = "Execute rigid 3-step Edict sequence flawlessly. Light tank soaks Light Edict, immediate swap, Void tank soaks Void Edict. Heroic: both tanks split Voidlight Edict (Void left, Light right). Post-Edict: heavy mitigation required for 5 melee hits. Minimize unnecessary movement. Tanks always have opposite color feathers.",
                healer = "Prioritize Eternal Burns absorb-clearing over general raid healing. Coordinate cooldowns during high-pressure overlap phases. Healing becomes progressively harder due to Ashen Benediction stacking. Burst-heal absorb shields IMMEDIATELY (delay = death).",
                dps = "Add priority: Small Phoenix Eggs > Ember Phoenixes > Boss. Correct target selection outweighs uptime. SAVE COOLDOWNS for Phase 2 Egg burn. Clear Radiant Echo orbs matching your color to create paths for teammates. Intercept Infused Quills for matching-color allies.",
                positioning = "Markers around arena for consistent Dive placement. Place puddles near edges to prevent room saturation. During Egg phase: rotate with matching-color beam slices. Warlock Gateway from edge toward center for Death Drop.",
                wipes = "Polarity mismatches (instant death from wrong-color damage). Failed Radiant Echo clearing (no safe paths). Unmanaged Phoenix eggs respawning adds. Incorrect tank positioning during Edicts (boss gains damage buff). Delayed Infused Quill interception. Insufficient Egg-phase DPS extending encounter (Ashen Benediction stacking). Overlapping mechanics in later cycles (dual Ember spawns).",
                heroic = "Voidlight Edict added as third step of Guardian's Edict sequence (both tanks split dual-color frontal, Void left, Light right). Each wall requires multiple Blisterburst explosions.",
                bloodlust = "Phase 2 Egg burn (true damage window).",
            },
            ---------------------------------------------------------------
            -- BOSS 9: MIDNIGHT FALLS (L'URA) — FINAL BOSS OF THE TIER
            ---------------------------------------------------------------
            {
                name = "Midnight Falls (L'ura)",
                order = 2,
                bossType = "Multi-phase, memory/rhythm mechanics, environmental control",
                tldr = "The hardest fight in Midnight Season 1. Features Death's Dirge memory game (5 players hit by laser in correct symbol order or wipe), bouncing glaives, crystal management (heal Dusk -> Dawn for safe zones), and Mythic-exclusive secret Phase 4. Three phases plus intermission.",
                phases = {
                    { name = "Phase 1: The Darkwell Siege", desc = "Central Darkwell is INSTANTLY LETHAL to enter. Rotating beams from Darkwell. Death's Dirge memory game. Heaven's Glaives bouncing off walls. Crystal management (Midnight Crystals = kill, Dusk Crystals = heal to full). Safeguard Prism adds on Heroic." },
                    { name = "Intermission: Total Eclipse", desc = "Darkwell remains lethal. Beams shoot outward but DON'T spin. All players continually marked, shooting beams from their character. All players receive small healing absorb shields each second. Starsplinter on random players fires spikes directionally. Crystal holders should drop crystals momentarily to dodge safely. Heavy raid-wide damage + pull toward center -- resist actively." },
                    { name = "Phase 2: Iris Containment (Inside the Darkwell)", desc = "Players transported inside the Darkwell. Iris of Oblivion prevents leaving bounds -- instant death on contact. Continuous rot damage (Abyssal Pool). Galvanize line mechanic -- 4 marked players position beams to hit rotating Void Cores. ALL cores must be eliminated before Phase 3 or Decay wipes raid. At 100 energy: Dark Meltdown knocks raid into Phase 3." },
                    { name = "Phase 3: Crystal Shield Phase (Final Phase)", desc = "Continuous raid damage every 2 seconds (Thunderous Well). Dawn Crystal holders emit 12-yard safe zone (Torchbearer). Outside = ramping damage + 30% slow. The Dark Archangel = wipe unless players stand in Dawnlight Barrier (consumes a Dawn Crystal). Light Siphon soaks must be fully soaked within 22 seconds or Stellar Implosion = wipe." },
                    { name = "Mythic Phase 4: The Secret Phase", desc = "Phase 3 ends when L'ura reaches 0% HP. She does NOT die. Reintegration: L'ura resets to 100% HP. Phase 4 begins immediately. Heaven & Hell: a single player targeted becomes anchor for slow-moving persistent void-tornado with NO DURATION. Multiple tornadoes accumulate. The Last Light: constant Sha waves that must be cleared. Phase 4 ends when L'ura reaches 0% HP a SECOND time." },
                },
                abilities = {
                    -- Phase 1
                    { name = "The Darkwell", desc = "Central void well is INSTANTLY LETHAL to enter. Beams shoot out from Darkwell and spin around the room." },
                    { name = "Dark Quasar (Rotating Beams)", desc = "Rotating laser beams from central Darkwell. Continuous movement required to avoid. Beams deal massive Shadow damage." },
                    { name = "Death's Dirge (Memory Game)", desc = "THE defining mechanic. 5 players receive Dark Rune symbols shown in a specific order. Boss fires rotating laser clockwise. Those 5 players must get hit by the laser IN THE SAME ORDER the symbols were shown. Form a semicircle in correct sequence order. Success: triggers Resonance (low raid damage). Failure (out of order): triggers Dissonance -- heavy raid damage for several seconds, usually wipes. Laser rotates clockwise from tank position -- consistent reference point. WeakAuras heavily recommended for tracking order." },
                    { name = "Heaven's Glaives", desc = "Spinning projectiles shoot out around the boss. Ricochet off arena walls. Find safe gap on spawn, keep dodging as they drift. Damage decreases the longer they keep spinning. Continuous dodge mechanic throughout Phase 1." },
                    { name = "Heaven's Lance (Tankbuster)", desc = "5-hit ability applying Impaled stacks. Each stack increases damage taken by 50% for 25 seconds. Tank swap after each cast at 5 stacks." },
                    { name = "Termination Prism / Safeguard Prism (Heroic)", desc = "L'ura gains 33% reduced damage (Safeguard Prism). 3 rotating Safeguard Matrix adds spawn. Each Matrix reduces boss damage taken by 33%. INTERRUPT the Matrices to remove Safeguard stacks. Destroy Matrices by removing all protection stacks." },
                    { name = "Midnight Crystals (Enemy)", desc = "Cast Cosmic Fracture; must be grouped and killed before cast completes." },
                    { name = "Dusk Crystals", desc = "Must be HEALED to full; become Dawn Crystals on success. If crystals left on ground for 3+ seconds: pulse massive raid damage." },
                    { name = "Dawn Crystals", desc = "Crystal holders take low passive damage + gain aura creating safe zone (critical for Phase 3). Crystal holders hit by cosmic damage create Tears of L'ura soak circles." },
                    { name = "Shattered Sky", desc = "Continuous raid-wide shadow damage for 25 seconds. Requires healing throughput." },
                    -- Intermission
                    { name = "Starsplinter (Intermission)", desc = "Random players targeted with spikes fired directionally. Crystal holders should drop crystals momentarily to dodge safely." },
                    -- Phase 2
                    { name = "Abyssal Pool (P2)", desc = "Continuous rot damage requiring sustained healing inside the Darkwell." },
                    { name = "Galvanize (P2)", desc = "Void Cores rotate around room perimeter. 4 players marked with beams; position beams to hit rotating Cores. Extra players soak beams to reduce Overkill Current raid damage. Hit cores from different sides to cancel Cosmic Fission pulls. Split into 4 marker groups around arena perimeter." },
                    { name = "Core Harvest (P2)", desc = "Pulls active cores; avoid indicated lines or one-shot. At 100 energy: Dark Meltdown knocks raid into Phase 3 (stack beforehand). ALL cores must be eliminated before Phase 3 or Decay wipes raid." },
                    { name = "Cosmic Fission (P2)", desc = "Destroyed Void Cores pull players inward temporarily. L'ura absorbs planets causing massive pulls + raid damage. Players in marked planetary paths take critical damage." },
                    -- Phase 3
                    { name = "Thunderous Well (P3)", desc = "Continuous raid damage every 2 seconds." },
                    { name = "Torchbearer (P3)", desc = "Dawn Crystal holders emit 12-yard radius safe zone (Torchbearer aura). Outside this zone: ramping damage + 30% movement slow. STAY NEAR Crystal holders at all times." },
                    { name = "The Dark Archangel (P3 Wipe Mechanic)", desc = "L'ura casts lethal raid-wide ability. Players MUST stand in Dawnlight Barrier (created by consuming a Dawn Crystal via Extra Action Button). One crystal consumed per cast -- limited resource. Pre-assign reliable crystal holders." },
                    { name = "Black Tide (P3)", desc = "Frontal after Dark Archangel -- dodge or use Warlock Gateway." },
                    { name = "Dark Constellation (P3)", desc = "Star orbs land on platform dealing impact damage. Stars connect with light beams -- avoid both spawn locations AND beam paths. Move to safe space between stars." },
                    { name = "Light Siphon (P3)", desc = "Multiple soak circles appear. Must be FULLY soaked within 22 seconds. Failure triggers Stellar Implosion = raid wipe. Requires tight team coordination." },
                    -- Mythic Phase 4
                    { name = "Reintegration (Mythic P4)", desc = "L'ura resets to 100% HP. Phase 4 begins immediately with no pause. Boss transforms into Dark Archangel form." },
                    { name = "Heaven & Hell (Mythic P4)", desc = "A single player targeted becomes anchor for slow-moving, persistent void-tornado. NO DURATION -- follows target for remainder of encounter or until target dies. Tornado gradually consumes arena space. Multiple tornadoes accumulate as fight progresses." },
                    { name = "The Last Light (Mythic P4)", desc = "Constant Sha waves that must be cleared. Last Light bearers critical to keep alive." },
                },
                tankSwap = { trigger = "stacks", debuff = "Impaled (Phase 1)", stacks = "5", note = "Phase 1: Heaven's Lance applies Impaled stacks — swap at 5. Tank L'ura where she stands for consistent Death's Dirge laser reference (rotates clockwise from tank)." },
                tank = "Phase 1: Swap after Heaven's Lance at 5 Impaled stacks. Tank L'ura where she stands for consistent Death's Dirge reference (laser rotates clockwise from tank). Phase 2: Manage positioning around Void Cores. Phase 3: Position within crystal safe zones. Phase 4 (Mythic): Keep L'ura centered; avoid forcing Heaven & Hell carrier through melee.",
                healer = "Manage throughput during constant rot phases (Shattered Sky, Abyssal Pool, Thunderous Well). Save major cooldowns for intermission (Total Eclipse). Phase 2: Galvanize beam soak healing. Phase 3: Triage between crystal-zone healing and Light Siphon soaks. Phase 4 (Mythic): Simultaneously triage transition damage, Shattered Sky, Sha contact damage, and Heaven & Hell carrier. Heal Dusk Crystals to full to create Dawn Crystals (Phase 1). Pre-assign crystal holders -- keep them alive at all costs.",
                dps = "Phase 1: Interrupt Safeguard Matrix adds; kill Midnight Crystals before Cosmic Fracture. Phase 2: Focus Void Core elimination; soak Galvanize beams. Phase 3: Pure burn -- race against Dark Archangel / Light Siphon mechanics. Phase 4 (Mythic): Maximum burn -- no mechanics to handle beyond staying alive. Interrupt discipline throughout entire fight.",
                positioning = "Phase 1: Arena edge, dodge rotating beams + glaives; Death's Dirge semicircle formation. Intermission: Resist pull toward center; dodge Starsplinter. Phase 2: Split into 4 marker groups at perimeter. Phase 3: Cluster near Dawn Crystal holders (12-yard safe zone); move between stars. Phase 4 (Mythic): Stack center; kite tornado to edges.",
                wipes = "1) Death's Dirge out of order (Dissonance = wipe). 2) Entering the Darkwell (instant death). 3) Glaive hits during high-damage windows. 4) Crystal holders dying (no safe zones in Phase 3). 5) Light Siphon circles not fully soaked (Stellar Implosion). 6) Dark Archangel cast without Dawnlight Barrier active. 7) Phase 2: Cores not killed before transition (Decay). 8) Phase 4 (Mythic): Arena consumed by Heaven & Hell tornadoes. 9) Intermission: Getting pulled into center Darkwell.",
                heroic = "Dawn Crystals and holders must avoid Cosmic damage (creates extra soak circles). Phase 2 Galvanize beams become high-damage soaks requiring pre-assigned groups. Phase 3 includes additional Light Siphon mechanics. Safeguard Prism mechanics added in Phase 1.",
                mythic = "Secret Phase 4 after L'ura reaches 0% (Reintegration to 100%). Heaven & Hell persistent tornado mechanic. Sequential kick orders (green bar targets only) requiring extremely tight interrupt coordination. Substantially tighter DPS check across all phases.",
                bloodlust = "Phase 3 burn or Phase 4 (Mythic).",
            },
        },
    },
    ---------------------------------------------------------------------------
    -- RAID 4: THE VENOMOUS ABYSS (8 bosses, Season 2, opened 2026-08-18)
    -- Sources: Icy Veins per-boss guides + skycoach full-raid guide + expcarry
    -- (Ula'tek is journal-derived -- no proven live meta yet; update as it settles)
    ---------------------------------------------------------------------------
    {
        name = "The Venomous Abyss",
        bosses = {
            {
                name = "Nek'zali the Soulcoiler",
                order = 1,
                bossType = "Two-phase add-containment, energy soft enrage",
                tldr = "Boss gains 5 Energy per spirit add reaching the Soulcoil Well; 100 Energy = Uncoiled Rage (effective wipe). Break add shields with MAGIC damage, cleave adds on the boss, push through the 50% intermission (two Echoes of Jawae), kill in Phase 2 before Invoke stacks outpace healing.",
                phases = {
                    { name = "Phase 1 (100-50%)", desc = "Adds spawn from glowing coffins behind magic-absorb shields and march to the Well. Manage Sever tank stacks, Essence Rend dispels, Possession Barrage." },
                    { name = "Intermission (50%)", desc = "Boss retreats. Kill two Echoes of Jawae one at a time; soak Hungering Pyre on the tank ON corpse piles to clear them. Adds keep spawning." },
                    { name = "Phase 2 (to kill)", desc = "Energy resets. Same as P1 plus Invoke: indefinitely stacking Soulcoil Rite raid DoT = soft enrage. Kill before 100 Energy." },
                },
                abilities = {
                    { name = "Soulcoil Rite / Ignition", desc = "Heavy raid-wide Shadow damage; Ignition teleports boss to center at 5 stacks. Also fires every time a spirit reaches the Well. Healer cooldowns." },
                    { name = "Restless Amani (adds)", desc = "Spawn shielded (MAGIC absorb) from coffins, walk to the Well. Ranged magic breaks shields, then stack and AoE. Each one reaching the Well = 5 Energy." },
                    { name = "Essence Rend", desc = "Pulls targets to center + dispellable DoT. Targets RUN TO THE EDGE before the dispel -- the drop spawns pools/Latent Cultists where it lands." },
                    { name = "Possession Barrage", desc = "Spirit barrage in a line at the tank; tank runs straight away. Anyone between boss and tank detonates ghosts early for raid damage." },
                    { name = "Sever -> Hollowed", desc = "Tank stacks: -5% healing/absorbs received per stack. Swap at 5-6 stacks." },
                    { name = "Hungering Pyre (intermission)", desc = "Group soak centered on the tank; drag the Echo onto corpse piles so the soak burns them." },
                },
                addPriority = "Shielded Restless Amani immediately (magic shield break -> AoE) > Latent Cultists > boss. Intermission: one Echo of Jawae at a time + corpse cleanup.",
                tankSwap = { trigger = "stacks", debuff = "Hollowed (Sever)", stacks = "5-6", note = "Also use a personal for Possession Barrage." },
                tank = "Drag boss to the biggest coffin cluster so adds die in cleave. Run Barrage away from the raid. Intermission: park Echoes on corpse piles for Pyre soaks.",
                healer = "CDs on Soulcoil Rite/Ignition. Time Essence Rend dispels for when targets reach the edge. P2 is an escalating rot -- map CDs to Invoke stacks.",
                dps = "Adds > boss. Ranged MAGIC breaks shields on spawn (physical specs are poor breakers). Cleave adds on boss. Echoes fast in intermission.",
                positioning = "Boss near coffin spawns, away from the central Well. Rend pools to edges. Nobody between boss and Barrage tank.",
                wipes = "Adds reaching the Well (Energy snowball). Players between boss and tank on Barrage. Mid-room Essence Rend dispels. Tank dying to Hollowed. P2 too slow (Invoke/100 Energy).",
                bloodlust = "Phase 2 as she reactivates -- beat the soft enrage.",
            },
            {
                name = "Entombed Sentinels",
                order = 2,
                bossType = "Two-boss split-raid, HP-balance, puzzle intermission",
                tldr = "Split the raid: one group per Sentinel (green Breath side / red Blood side), 40+ yards apart. Keep BOTH HP bars even -- at each intermission the lower one heals up to match. Intermission = Helical Toxins pairing: collide with a partner so your stacks sum to exactly 4 (1+3 or 2+2).",
                phases = {
                    { name = "Main phase (repeats)", desc = "Each Sentinel runs its own package; your side's mark stacks build over the phase." },
                    { name = "Intermission (100 Energy)", desc = "Vitriolic Stasis: bosses immune, lower-HP boss heals to match. Solve Helical Toxins (sum to exactly 4; Heroic: over 4 is lethal)." },
                },
                abilities = {
                    { name = "Venom Coagulation (green)", desc = "Spawns a slime pulsing raid-wide Contaminate -- kill instantly, before the next spawns." },
                    { name = "Toxic Droplets (green)", desc = "Small orbs; assigned players run them over before they explode. Heroic: destroyed droplets send venom back toward the boss." },
                    { name = "Empowering Slam (green)", desc = "Tank hit ramping per consecutive hit on the same tank; resets at intermission." },
                    { name = "Unstable Miasma (red)", desc = "One-player mark the group soaks before it explodes; applies Clinging Murk stacks (Heroic: blood pools on expiry)." },
                    { name = "Blighted Blood (red)", desc = "18s dispellable Shadow DoT on several players -- chain-dispel immediately." },
                    { name = "Bloodvenom Injection (red)", desc = "Tank DoT whose stacks carry into the next phase." },
                },
                tankSwap = { trigger = "rotation", debuff = "Empowering Slam / Bloodvenom Injection", stacks = "each intermission", note = "Tanks SWAP SIDES after every intermission to reset ramp stacks." },
                tank = "Hold your Sentinel 40+ yards from the other (they buff each other close). Ramp defensives toward 100 Energy. Swap sides at intermission.",
                healer = "Damage peaks at the END of each sequence -- CDs there. Instant Blighted Blood dispels. Sustain through Contaminate while a slime lives.",
                dps = "Keep both bosses EVEN (imbalance = free boss healing). Swarm slimes instantly. Help clear droplets.",
                positioning = "Two fixed camps 40+ yards apart; stay with your assigned group. Pre-assign soak groups per side.",
                wipes = "HP imbalance. Slimes living. Helical Toxins mispairs (Heroic: >4 = death). Droplets exploding. Ramped Slams without CDs.",
                bloodlust = "On pull.",
                addPriority = "Venom Coagulation slime (instant) > Toxic Droplets (assigned) > boss.",
            },
            {
                name = "The Lost Explorers",
                order = 3,
                bossType = "Council (3 targets), fish-fed ultimate system",
                tldr = "Keep the three tortollans split (all three within 30yd = United Defense, 99% damage reduction) and their HP even. At ~90-95 shared Energy, GRAB FISH from Gebbo's crates and feed it (Extra Action Button) to a chosen boss -- triggers that boss's controlled ultimate and marks them (each boss only once). Fail to feed before the empower cast = Empowered Ascension wipe.",
                phases = {
                    { name = "Single phase + 3 ultimates", desc = "One ultimate per boss, chosen by where you feed the fish. Common orders: Gebbo -> Nama -> Iku (Icy Veins) or Nama -> Iku -> Gebbo (skycoach). Pick one, pre-assign." },
                },
                abilities = {
                    { name = "United Defense", desc = "All three within 30yd = 99% damage reduction. Keep them split at all times." },
                    { name = "Steady Strikes (Nama)", desc = "Stacking physical damage-taken on tank -- swap to control." },
                    { name = "Shell Spin (Nama)", desc = "Three spinning shells at a player; clip = 4s stun. Melee bait outward, sidestep." },
                    { name = "Mighty Thud (Nama ult)", desc = "Three marked players take consecutive group soaks -- one melee, two ranged spots. Assign groups; no overlap." },
                    { name = "Blink Nova (Iku)", desc = "Teleports to a ranged player and novas; damage falls off with distance -- bait it FAR." },
                    { name = "Icebound Flames (Iku)", desc = "Interruptible: heavy damage + slow. Kick on cooldown." },
                    { name = "Frostfire Volley (Iku ult)", desc = "Huge Frost/Fire circles -- spread; opposite-element pools clear by touching (costs damage)." },
                    { name = "Throw Junk / Grab Fish (Gebbo)", desc = "Crates land; breaking them stacks Splinters raid damage BUT contains the fish -- break deliberately, on schedule." },
                    { name = "Explosive Surprise / Blast Wave (Gebbo ult)", desc = "Bombs create an arena-crossing wave -- JUMP it with the Bouncy Mushrooms. Keep bombs off mushrooms." },
                },
                tankSwap = { trigger = "stacks", debuff = "Shredding Shards (Iku) / Steady Strikes (Nama)", stacks = "per application", note = "Two tanks split the trio; keep them apart." },
                tank = "Split the trio -- Gebbo isolated, Nama and Iku apart. Taunt-swap on Shards/Strikes. Never let them stack (United Defense).",
                healer = "Pre-plan CDs per ultimate window (Thud soaks, Volley + pool clears). Watch Icebound slows and Splinters ticks.",
                dps = "Kick Icebound Flames. Balance all three HP bars to die together. Break crates on schedule -- a fish must be READY before every Energy cap; someone carries and uses it.",
                positioning = "Three-point split; ranged loose in the middle baiting Blink Nova/Shell Spin away from camps. Pre-mark ultimate soak spots.",
                wipes = "Missed fish feed (Empowered Ascension = wipe). Bosses stacked (99% DR). Thud circle overlaps. Uncleared Volley pools. Uneven HP at the end.",
                bloodlust = "On pull.",
                addPriority = "No adds -- interrupts (Icebound Flames) + crate/fish logistics ARE the priority.",
            },
            {
                name = "Vashnik the Malignant",
                order = 4,
                bossType = "Add-heavy fountain rotation, stacking soft enrage",
                tldr = "Tank Vashnik between two of three fountains (Flame/Shadow/Blood); at full Energy, Imbibe empowers the two nearest -- spawning their adds and Infections. Rotate him clockwise each cycle, kill every add before it reaches the center pool (Malignant Burst), race the permanently stacking Toxic Vapor.",
                phases = {
                    { name = "Imbibe cycles", desc = "Rotation: Flame+Shadow -> Flame+Blood -> Blood+Shadow, clockwise. One fountain repeats per set and gains an Infusion stack (Heroic: avoid double-stacking Flame)." },
                },
                abilities = {
                    { name = "Imbibe (100 Energy)", desc = "Empowers the two nearest fountains: spawns their adds + applies matching Infections." },
                    { name = "Toxic Vapor", desc = "Permanently stacking raid-wide damage -- the soft enrage." },
                    { name = "Siphoning Infection (Blood)", desc = "Healing absorb that HEALING CANNOT REMOVE -- other players stand in the target's circle to siphon it off." },
                    { name = "Exploding Infection (Flame)", desc = "Target runs far out; damage falls with distance; dispel early once clear." },
                    { name = "Stygian Infection (Shadow)", desc = "Healing absorb + damaging trails at the target's feet -- keep moving, stay in healer range, dodge eruptions." },
                    { name = "Plague Froth", desc = "Marked players fire four cardinal damage lines on expiry -- aim away from the raid." },
                    { name = "Dripping Fangs", desc = "Tank stacking DoT -- swap at 1 stack, defensive for the swap hit." },
                },
                addPriority = "Burning Venoms first -- STAGGER the two deaths (Heroic Caustic Surge DoT) > Clotting Venom + splits (CC-immune, splits twice) > Shrouded Venoms (absorb shields; slow, kill last).",
                tankSwap = { trigger = "stacks", debuff = "Dripping Fangs", stacks = "1", note = "Defensive on the swap hit." },
                tank = "Park boss between the NEXT Imbibe pair before full Energy. Pick up adds. Defensive on swaps.",
                healer = "CDs for Imbibe/Caustic Surge overlaps. Siphoning absorb needs the soak call, not heals. Dispel Exploding runners once clear.",
                dps = "NOTHING reaches the center pool. Staggered Burning kills, then Clotting chain, Shrouded last. Grip/stack adds for cleave.",
                positioning = "Boss on the ring between active fountains; raid loosely behind; runners out; Froth lines outward; ranged spread for Catalytic Bile (Heroic).",
                wipes = "Any add reaching center (Malignant Burst). Double Caustic Surge (Heroic). Late swaps. Wrong fountain position at Imbibe. Long fight = Toxic Vapor death.",
                bloodlust = "On pull.",
            },
            {
                name = "Sszorak",
                order = 5,
                bossType = "Single-target, choreographed tank combo + wind intermission",
                tldr = "Apex Predator = 5-hit combo (2x Ravage tank-only, 2x Mutilate raid soak, 1x Tempest tornadoes, random order) -- tanks alternate through it. Marked players drop Viscous Cysts at spots OPPOSITE the wind tunnels; during Howling Maelstrom the winds push you across and you bounce off the cysts back to safety while the boss Digs In (+30% damage taken for 25s = burn window).",
                phases = {
                    { name = "Main phase", desc = "Apex Predator combos, Venomous Surge cyst placement, Raging Crosswinds partner collisions." },
                    { name = "Maelstrom (~2 min)", desc = "Wind tunnels fire in the order shown by their mote counts; bounce off cysts back to middle. Dig In: +30% damage taken 25s." },
                },
                abilities = {
                    { name = "Apex Predator", desc = "Five attacks, random order: 2 Ravage, 2 Mutilate, 1 Tempest (never first or last). Tanks swap after the first Ravage-or-Mutilate so each eats one of each." },
                    { name = "Ravage (white)", desc = "Tank-only hit -- face away, only the tank in it, defensive." },
                    { name = "Mutilate (green)", desc = "Raid-split soak. Heroic: two alternating soak groups." },
                    { name = "Tempest", desc = "Poison tornadoes from the boss -- dodge (DoT + slow if clipped)." },
                    { name = "Venomous Surge / Viscous Cyst", desc = "2 marked players run to assigned world markers and drop knockback cysts -- your bumpers against the Maelstrom winds." },
                    { name = "Raging Crosswinds", desc = "Opposing directional winds on players -- pair with your opposite, launch, collide mid-air, return." },
                    { name = "Corroding Venom", desc = "Tank stacking debuff -- swap ~6 stacks." },
                },
                tankSwap = { trigger = "combo + stacks", debuff = "Corroding Venom", stacks = "~6", note = "Also scripted swap inside each Apex Predator combo." },
                tank = "Ravage away from raid; aim Mutilate into the soak group; dodge Tempest; swap on script. Heroic: drag boss/pools to the edge pre-Maelstrom so winds clear them.",
                healer = "Burst on Mutilate soaks and Crosswinds collisions. Track Surge runners (they carry DoTs). Top everyone before Maelstrom.",
                dps = "Pure single-target -- hold 2-minute CDs for Dig In (+30% for 25s). Help place cysts correctly.",
                positioning = "PRE-PULL: read the wind tunnels and place world markers OPPOSITE the wind clusters for cyst drops. Two pre-assigned Mutilate groups behind boss. Collapse middle before Maelstrom.",
                wipes = "Not reading tunnel order at pull. Cysts in wrong spots (no bumper = blown off). Botched Mutilate groups (Heroic). Missing your Crosswinds partner.",
                bloodlust = "On pull, or hold to stack with a Dig In window.",
            },
            {
                name = "The Twin Fangs",
                order = 6,
                bossType = "Two-boss even-kill, permanent poison economy",
                tldr = "Nearly everything applies PERMANENT Eternal Venom stacks (lethal around 7-10 on Heroic); the ONLY removal is soaking Ithraz's Ravenous Feast -- the fight is bookkeeping who takes stacks and which team soaks each Feast hit. Kill both bosses together (survivor ramps +25% damage every 4s).",
                phases = {
                    { name = "Main phase", desc = "Vexhul's globule/wave package + Ithraz's soak/pool package concurrently." },
                    { name = "Intermission (100 Energy)", desc = "Bosses submerge, lower-HP heals up. Dodge Vile Flood (rotating beam -- read direction from the orbs, cross it once) + Sanguine Storm impact circles; solve Helical Toxins pairing (sum to 4)." },
                },
                abilities = {
                    { name = "Eternal Venom", desc = "Permanent stacking DoT from most mechanics. ONLY removed by Ravenous Feast soaks. Treat 6+ stacks as critical." },
                    { name = "Caustic Deluge (Vexhul)", desc = "Huge tank hit + knockback scattering Caustic Globules -- each needs ONE soaker (who takes 1 stack); any unsoaked = the WHOLE raid gains a stack." },
                    { name = "Venomous Emergence (Vexhul)", desc = "Raid gains a stack; spawns 3 adds casting Corrosive Spit -- kill fast." },
                    { name = "Stir the Depths (Vexhul)", desc = "Raid hit + slow green waves to dodge (stack if hit)." },
                    { name = "Stone Breaker (Ithraz)", desc = "Three sequential white impact zones the tank soaks in order, then swaps." },
                    { name = "Coiling Ichor (Ithraz)", desc = "Red circles -- spread; drop the permanent pools at the arena EDGES." },
                    { name = "Ravenous Feast (Ithraz)", desc = "Three consecutive group soaks; each removes one Eternal Venom stack from soakers. Feasted: after one soak you take +800% from the next -- Heroic needs THREE separate soak teams." },
                },
                tankSwap = { trigger = "rotation", debuff = "Deluge / Stone Breaker", stacks = "per sequence", note = "Swap after Caustic Deluge and after each full Stone Breaker set." },
                tank = "One per boss, always in melee. Soak all three Stone Breaker zones in order. Deluge with CDs (big knockback).",
                healer = "Feast trios + intermission are the spikes. Track individual Venom counts like a resource bar. Watch globule soakers.",
                dps = "Balance both HP bars obsessively. Nuke Emergence Spawns. Take your assigned globule. Don't eat avoidable stacks.",
                positioning = "Raid between/behind the bosses. Ichor pools to edges. Globule soakers fan out post-Deluge. Three labeled Feast teams. Keep center clear for intermission.",
                wipes = "Venom capping (unsoaked globules feed the raid). Double-soaking Feast with Feasted (+800%). Uneven HP -> Uncoiled Wrath. Arena choked by pools.",
                bloodlust = "On pull.",
                addPriority = "Venomous Emergence Spawns (kick Corrosive Spit) > bosses, kept even.",
            },
            {
                name = "The Coiled Altar",
                order = 7,
                bossType = "Three-phase duo: Zul'jan -> Malacrass -> both",
                tldr = "P1 is venom logistics: collect Coalesced Venom orbs and feed them into Zul'jan's Sever frontal. P2 is Malacrass's mind controls plus look-to-freeze ghosts destroyed by Soul Sever. The INTERMISSION is the burn: revived Zul'jan takes +100% damage while healing 2%/sec -- Lust there and soak Fragments before they reach him. P3 runs both kits: stack, cleave, kill together.",
                phases = {
                    { name = "P1 -- Zul'jan", desc = "Toxic Deluge orbs, Sever frontals, Guillotine 5-man soaks, Axegrinders. Clear leftover orbs BEFORE pushing (they detonate)." },
                    { name = "P2 -- Malacrass", desc = "Dreadmarch mind controls (break absorbs before they leap off the edge), Manifestation ghosts (freeze by LOOKING at them, park in the Soul Sever lane), Gloombomb spreads, Eternal Nightfall shield-break." },
                    { name = "Intermission -- Soulbinding", desc = "Zul'jan revived at +100% damage taken, healing 2%/sec; Fragments crawl to him -- each soaked = raid damage (stagger soakers), each arriving = 10% heal. LUST HERE." },
                    { name = "P3 -- Coiled Union", desc = "Both active; Blighted Sever destroys orbs AND ghosts; Grim Guillotine adds a healing absorb. Even kill or survivor gains +500% damage/attack speed." },
                },
                abilities = {
                    { name = "Toxic Deluge / Coalesced Venom", desc = "Green circles leave venom orbs; assigned collectors carry them into the boss's frontal lane." },
                    { name = "Sever", desc = "Tank frontal that destroys orbs in the cone (each pops a Venom Rupture) and amps its next cast -- taunt swap after EVERY cast; aim through the orb pile." },
                    { name = "Guillotine", desc = "5+ player soak, then soakers sprint out (Widow's Kiss). Heroic: +500% from the next one -- two alternating soak groups." },
                    { name = "Dreadmarch", desc = "Mind controls players (absorb shield) walking to the edge to leap -- break the absorbs in time; Ring of Peace / Death Grip stalls. Breaking spawns ghosts." },
                    { name = "Unnerving Fixation (ghosts)", desc = "Ghost fixates a player and moves only when NOT looked at -- face it to freeze, kite to the Soul Sever stack point. Damage-immune otherwise." },
                    { name = "Soul Sever", desc = "Tank frontal destroying ghosts in the cone; hit players gain Gravebound -- grab three Soul Fragments before it expires or die. Taunt after each cast." },
                    { name = "Gloombomb", desc = "Purple spread circles; overlap on Heroic chains Gravebound -- spread wide." },
                    { name = "Eternal Nightfall", desc = "Absorb shield -- break it and interrupt, or eat heavy raid damage. Kick late for damage uptime." },
                },
                tankSwap = { trigger = "per cast", debuff = "Sever / Soul Sever / Blighted Sever", stacks = "every frontal", note = "The frontal amps its next cast on the same target -- taunt every time." },
                tank = "Aim every frontal through the orb pile / parked ghosts -- the frontal IS the cleanup tool. Taunt per cast. Grab Soul Fragments instantly. Intermission: soak Fragments as priority.",
                healer = "Venom Rupture bursts on Sever pops. Fast Venomfang dispels (Poison Cleansing Totem trivializes). Rotate CDs across staggered Fragment soaks. Pre-plan P3 Grim Guillotine absorb clears.",
                dps = "Assigned collectors run orbs. Break Dreadmarch absorbs FAST. Fixated players park ghosts on the stack point. Kick Spiritcackle/Eternal Nightfall. ALL CDs + Lust in the intermission. P3: cleave stacked bosses evenly.",
                positioning = "P1: frontal lane with orb pile in front, Guillotine spot marked, avoid Noxious Ground sides. P2: ghost stack point in the Sever lane, Gloombombs outward. Intermission: ring around Zul'jan intercepting Fragments. P3: bosses stacked.",
                wipes = "Uncontrolled Fragment soak overlap. Ghosts reaching fixate targets. Unkicked Nightfall/Wail. Missed frontal taunts. Gloombomb overlaps. MC'd players leaping. Leftover orbs at the P1 push.",
                bloodlust = "Intermission (Soulbinding) -- Zul'jan at +100% damage taken.",
                addPriority = "Break Dreadmarch MCs > Manifestations (via Soul Sever) > Abandoned Soulcoilers (kick Wail of Terror, Heroic) > bosses kept even in P3.",
            },
            {
                name = "Ula'tek",
                order = 8,
                bossType = "Three-phase final boss: eggs, soaks, shrinking platform, hard enrage",
                tldr = "Offspring control is everything: Caustic Waves INSTANTLY hatch any egg they touch, and every hatch permanently raises raid-wide rot (Putrid Membrane) -- keep eggs out of wave lanes. P2 is an add gauntlet (kick Malice, disrupt Doomscale Eggs before they mature into a 20s raid stun). P3 shrinks the platform while Serpent's Bite venom is leeched between assigned partners. Burn the exposed Venomous Heart (+200%) windows and beat Fury Unleashed. NOTE: skipped PTR -- strategy still settling on live.",
                phases = {
                    { name = "P1 -- Fury of the Serpent Mother", desc = "Waves + eggs + Spectral Coil soaks + tank knockback loop. Rage of the Shackled exposes the Venomous Heart: +200% damage for 20s under falling debris." },
                    { name = "P2 -- Children of the Doomscale", desc = "Adds: Wardens (KICK Malice), Doomscale Eggs (disrupt -> Weakened at +100% taken; ignored -> Ravenous with 20s raid-stun Dread Roar), Writhing Gestation growing clutches." },
                    { name = "Intermission -- The Shattering", desc = "Constant Necrotic Vapors rot + another Spectral Coils sequence in shrinking space." },
                    { name = "P3 -- Ula'tek's Ascension", desc = "P1 kit returns + Circling Prey destroys platform chunks + add waves + Serpent's Bite partner-leeching. Ends in Fury Unleashed hard enrage." },
                },
                abilities = {
                    { name = "Caustic Waves", desc = "Crossing venom waves -- dodge, and NEVER let one touch an egg (instant hatch)." },
                    { name = "Blightscale Eggs", desc = "Can be CARRIED -- move them out of wave lanes. Every hatch = a Viper add + Putrid Membrane, a PERMANENT stacking raid tick." },
                    { name = "Spectral Coils", desc = "Raid hit reduced per player in the impact zone -- assigned group soaks. Heroic: last group is barred from the next -- rotate 2+ groups." },
                    { name = "Mother's Wrath / Rattler Slam", desc = "Tank knockback + Stone Venom stacks. If NO tank is in melee she slams the raid -- off-tank must be in melee BEFORE the knockback; return instantly." },
                    { name = "Rage of the Shackled -> Venomous Heart", desc = "Raid-wide + falling debris; the Heart takes +200% damage for 20s -- the burn window." },
                    { name = "Malice (Warden)", desc = "Heavy raid cast -- MUST interrupt." },
                    { name = "Doomscale Eggs / Dread Roar", desc = "Disrupt -> Weakened (+100% taken; kick Anguished Cry, face Desperate Thrash away). Ignored -> Ravenous: ~20s raid stun. Heroic Mass Gestation: disrupting one starts the others on that side -- sequence carefully." },
                    { name = "Serpent's Bite / Volatile Purge (P3)", desc = "Bitten player's venom leeched by an assigned partner standing close; partner then runs 7+ yards out before exploding (~5s). Untreated = death. PRE-ASSIGN PAIRS." },
                    { name = "Circling Prey (P3)", desc = "Permanently destroys a platform section -- clear the zone, plan the shrinking space." },
                    { name = "Fury Unleashed", desc = "Hard enrage: escalating massive damage per second." },
                },
                tankSwap = { trigger = "stacks", debuff = "Stone Venom (Mother's Wrath)", stacks = "per knockback", note = "Off-tank in melee BEFORE the active tank is knocked -- any melee gap = Rattler Slam." },
                tank = "Melee contact is the prime directive: pre-position against the knockback, sprint back instantly, swap on Stone Venom. Face all Doomscales away.",
                healer = "Rot fight that only worsens -- every hatch permanently raises floor damage. Map CDs to Coils, Rage, Vapors, and Blight Vein breaks. Watch Petrifying Sting absorbs (Heroic) and Purge runners.",
                dps = "Adds > boss almost always (Wardens > Clutches > Vipers). Kick Malice + Anguished Cry. Disrupt eggs on the called sequence. Burst the Heart windows. Beat the enrage.",
                positioning = "Learn wave lanes; keep eggs and yourself out of them. Rotating Coil soak groups on marks. Doomscales faced out. P3: collapse toward surviving platform; Purge carriers run to dump spots.",
                wipes = "Waves hatching eggs (permanent rot snowball). A Ravenous completing Dread Roar. Wrong Coil group (Soul Constrictor). Tank melee gap (Rattler Slam). Bite expiring / Purge exploding in the group. Running out of platform. Fury Unleashed.",
                bloodlust = "During a Venomous Heart window (+200% amp). Optimal timing still unsettled on live.",
                addPriority = "Doomscale Wardens (kick Malice) > Blightscale Clutches before full gestation > Vipers > Weakened/Ravenous Doomscales > boss.",
            },
        },
    },
}

----------------------------------------------------------------------
-- Lookup by boss name (lowercase, with and without spaces)
----------------------------------------------------------------------
D.byName = {}
for _, raid in ipairs(D.raids) do
    for _, boss in ipairs(raid.bosses) do
        boss.raid = raid.name
        D.byName[boss.name:lower()] = boss
        D.byName[boss.name:lower():gsub("%s+", "")] = boss
        -- Add common aliases
        if boss.name == "Midnight Falls (L'ura)" then
            D.byName["l'ura"] = boss
            D.byName["lura"] = boss
            D.byName["midnight falls"] = boss
            D.byName["midnightfalls"] = boss
        elseif boss.name == "Vaelgor & Ezzorak" then
            D.byName["vaelgor and ezzorak"] = boss
            D.byName["vaelgorandezzorak"] = boss
            D.byName["vaelgor"] = boss
            D.byName["ezzorak"] = boss
        elseif boss.name == "Belo'ren" then
            D.byName["beloren"] = boss
            D.byName["belo'ren, child of al'ar"] = boss
            D.byName["child of al'ar"] = boss
        elseif boss.name == "Chimaerus" then
            D.byName["chimaerus the undreamt god"] = boss
            D.byName["chimaerustheundreamtgod"] = boss
        elseif boss.name == "Fallen-King Salhadaar" then
            D.byName["salhadaar"] = boss
            D.byName["fallen king salhadaar"] = boss
        elseif boss.name == "Imperator Averzian" then
            D.byName["averzian"] = boss
        elseif boss.name == "Crown of the Cosmos" then
            D.byName["crownofthecosmos"] = boss
            D.byName["alleria"] = boss
        elseif boss.name == "Lightblinded Vanguard" then
            D.byName["lightblindedvanguard"] = boss
            D.byName["vanguard"] = boss
        end
    end
end

----------------------------------------------------------------------
-- Bloodlust timing reference
----------------------------------------------------------------------
D.bloodlustTimings = {
    ["Imperator Averzian"] = "On pull",
    ["Vorasius"] = "On pull or during highest-pressure cycle",
    ["Fallen-King Salhadaar"] = "On pull OR during Entropic Unraveling (25% damage amp)",
    ["Vaelgor & Ezzorak"] = "On pull with cleave value",
    ["Lightblinded Vanguard"] = "On pull (but wait 8s for bubbles to drop)",
    ["Crown of the Cosmos"] = "Phase 3 (hard enrage race)",
    ["Chimaerus"] = "On pull or post-intermission",
    ["Belo'ren"] = "Phase 2 Egg burn (true damage window)",
    ["Midnight Falls (L'ura)"] = "Phase 3 burn or Phase 4 (Mythic)",
}

----------------------------------------------------------------------
-- Core Principle
----------------------------------------------------------------------
D.corePrinciple = "Consistency over greed -- mechanical execution matters more than raw damage output across all encounters this tier."

----------------------------------------------------------------------
-- NPC ID lookup (for tainted string bypass in WoW 12.0)
-- UnitGUID gives clean numeric NPC IDs even when UnitName is tainted
----------------------------------------------------------------------
D.byNpcID = {}
D.byExactName = {}
D.byInstanceBoss = {}  -- instanceName → {boss1, boss2, ...}
D.byEncounterID = {}   -- ENCOUNTER_START encounterID → boss (from DBM source)

-- Encounter IDs (from DBM source code)
local raidEncounterIDs = {
    [3176] = "Imperator Averzian",
    [3177] = "Vorasius",
    [3179] = "Fallen-King Salhadaar",
    [3178] = "Vaelgor & Ezzorak",
    [3180] = "Lightblinded Vanguard",
    [3181] = "Crown of the Cosmos",
    [3306] = "Chimaerus",
    [3182] = "Belo'ren",
    [3183] = "Midnight Falls (L'ura)",
    -- The Venomous Abyss (S2, from the in-game /vs s2 EJ probe 2026-08-19)
    [3470] = "Nek'zali the Soulcoiler",
    [3445] = "Entombed Sentinels",
    [3497] = "The Lost Explorers",
    [3455] = "Vashnik the Malignant",
    [3420] = "Sszorak",
    [3421] = "The Twin Fangs",
    [3429] = "The Coiled Altar",
    [3492] = "Ula'tek",
}

-- Register raid bosses
for _, raid in ipairs(D.raids) do
    D.byInstanceBoss[raid.name] = {}
    for _, boss in ipairs(raid.bosses) do
        D.byExactName[boss.name] = boss
        D.byInstanceBoss[raid.name][#D.byInstanceBoss[raid.name] + 1] = boss
    end
end

-- Register encounter IDs
for eid, bossName in pairs(raidEncounterIDs) do
    local boss = D.byName[bossName:lower():gsub("%s+", "")]
    if boss then
        D.byEncounterID[eid] = boss
        boss.encounterID = eid
        boss.raidEncounter = true
    end
end

-- Raid NPC IDs
local raidNpcIDs = {
    -- The Voidspire
    [240435] = "Imperator Averzian",
    [240434] = "Vorasius",
    [240432] = "Fallen-King Salhadaar",
    [242056] = "Vaelgor & Ezzorak",  -- Vaelgor
    [244552] = "Vaelgor & Ezzorak",  -- Ezzorak
    [250588] = "Lightblinded Vanguard",  -- Commander Venel Lightblood
    [250587] = "Lightblinded Vanguard",  -- General Amias Bellamy
    [244761] = "Crown of the Cosmos",  -- Alleria
    -- The Dreamrift
    [256116] = "Chimaerus",
    -- March on Quel'Danas
    [240387] = "Belo'ren",
}
for npcID, bossName in pairs(raidNpcIDs) do
    local boss = D.byName[bossName:lower():gsub("%s+", "")]
    if boss then
        D.byNpcID[npcID] = boss
    end
end
-- Dungeon and delve NPC IDs populated by DungeonData.lua and DelveData.lua

----------------------------------------------------------------------
-- Boss positions for proximity detection (bypasses WoW 12.0 taint)
-- Coordinates from Wowhead zone maps (0-100 scale, converted to 0-1)
----------------------------------------------------------------------
D.bossPositions = {}

-- The Voidspire (zone 16340)
-- TODO: 2912 is a placeholder. To verify: enter the raid, run `/cs scan`
-- inside the instance, and update this value to the printed mapID.
-- Until verified, proximity-based boss detection inside Voidspire silently fails.
local voidspireMap = 2912
D.bossPositions["Imperator Averzian"]     = { mapID = voidspireMap, x = 0.398, y = 0.685 }
D.bossPositions["Vorasius"]               = { mapID = voidspireMap, x = 0.425, y = 0.352 }
D.bossPositions["Fallen-King Salhadaar"]  = { mapID = voidspireMap, x = 0.656, y = 0.764 }
D.bossPositions["Vaelgor & Ezzorak"]      = { mapID = voidspireMap, x = 0.554, y = 0.460 }
D.bossPositions["Lightblinded Vanguard"]  = { mapID = voidspireMap, x = 0.758, y = 0.173 }
D.bossPositions["Crown of the Cosmos"]    = { mapID = voidspireMap, x = 0.472, y = 0.513 }
