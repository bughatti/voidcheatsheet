----------------------------------------------------------------------
-- VoidCheatSheet — Delve Data
-- Midnight Season 1 (Patch 12.0) — 10 delves + 1 Nemesis
-- Sources: Method.gg, Icy Veins, Wowhead (April 2026)
-- Companion: Valeera Sanguinar
----------------------------------------------------------------------

local D = VoidCheatSheetData
D.delves = {}

----------------------------------------------------------------------
-- DELVE 1: COLLEGIATE CALAMITY (Silvermoon City)
-- Note: Multiple story variants with different bosses
----------------------------------------------------------------------
D.delves[#D.delves + 1] = {
    name = "Collegiate Calamity",
    bosses = {
        {
            name = "Voidscorned Vagrant",
            order = 1,
            contentType = "delve",
            bossType = "Single target (Academy Under Siege variant)",
            tldr = "Dodge Void Eruption ground circles. INTERRUPT Terrifying Power (long cast AoE fear). NPC students assist you — keep them alive for extra DPS.",
            abilities = {
                { name = "Void Eruption", desc = "Creates ground circles dealing damage if you stand in them. Move out." },
                { name = "Terrifying Power", desc = "Long interruptible cast that fears everyone. MUST interrupt. Valeera (DPS spec) will interrupt if you miss." },
            },
            companion = "DPS Valeera recommended — she auto-interrupts Terrifying Power. NPC students provide extra DPS.",
            tank = "Interrupt Terrifying Power. Move from Void Eruption circles. Keep NPC students alive.",
            healer = "N/A (solo content).",
            dps = "Interrupt Terrifying Power. Dodge circles. Straightforward fight with NPC help.",
            wipes = "Terrifying Power fear going off (feared into circles). Standing in Void Eruption.",
        },
        {
            name = "Infiltrator Garand",
            order = 2,
            contentType = "delve",
            bossType = "Single target (Faculty of Fear variant)",
            tldr = "Twilight Crash = boss jumps on a target (spread out). Shadow Laceration = magic DoT (dispel or heal through). Free incapacitated students by standing in purple circles for NPC allies.",
            abilities = {
                { name = "Twilight Crash", desc = "Uninterruptible — boss jumps on a single target. Spread out to limit damage." },
                { name = "Shadow Laceration", desc = "Magic DoT. Can be dispelled. Set Valeera to healer spec for auto-dispel." },
            },
            companion = "Healer Valeera recommended — auto-dispels Shadow Laceration. Free students at start for extra allies.",
            tank = "Spread for Twilight Crash. Free incapacitated students (stand in purple circles) for NPC allies.",
            healer = "N/A (solo content).",
            dps = "Spread out. Heal through or dispel Shadow Laceration. Free students for help.",
            wipes = "Shadow Laceration stacking without dispel. Twilight Crash hitting multiple grouped players.",
        },
    },
}

----------------------------------------------------------------------
-- DELVE 2: THE DARKWAY (Silvermoon City docks)
----------------------------------------------------------------------
D.delves[#D.delves + 1] = {
    name = "The Darkway",
    bosses = {
        {
            name = "Infiltrator Gulkat",
            order = 1,
            contentType = "delve",
            bossType = "Single target with adds",
            tldr = "Dodge Abyssal Burst frontal cone (heavy damage). Illusory Deceit spawns 5-6 adds with exploding circles — DON'T DPS the adds, they die on their own. INTERRUPT Shadow Bolt.",
            abilities = {
                { name = "Abyssal Burst", desc = "Large frontal cone dealing heavy damage. Move out of the cone — stay mobile." },
                { name = "Illusory Deceit", desc = "Summons 5-6 adds with purple circles that explode on cast completion. Adds move slowly toward players. DON'T waste DPS on them — they die automatically. Dodge the circles." },
                { name = "Shadow Bolt", desc = "Interruptible single-target shadow damage. Interrupt when possible. DPS Valeera handles this automatically." },
            },
            companion = "DPS Valeera recommended — she auto-interrupts Shadow Bolt. Fight is more about dodging than healing.",
            tank = "Dodge Abyssal Burst frontal. Ignore Illusory Deceit adds (they despawn). Interrupt Shadow Bolt. Maintain space for add circle dodging.",
            healer = "N/A (solo content).",
            dps = "Dodge frontal cone. DON'T attack the illusion adds — they die on their own. Just dodge their circles. Interrupt Shadow Bolt.",
            wipes = "Standing in Abyssal Burst frontal. Getting hit by multiple illusion explosions. Wasting DPS on adds instead of boss.",
        },
    },
}

----------------------------------------------------------------------
-- DELVE 3: THE SHADOW ENCLAVE (Eversong Woods)
----------------------------------------------------------------------
D.delves[#D.delves + 1] = {
    name = "The Shadow Enclave",
    bosses = {
        {
            name = "Lord Antenorian",
            order = 1,
            contentType = "delve",
            bossType = "Single target — HARDEST DELVE BOSS (one-shot mechanic)",
            tldr = "MOST DIFFICULT delve boss. Annihilation = long cast that ONE-SHOTS if not stopped. Boss summons 3 orbs and shields 2 + himself. Kill the UNSHIELDED orb first — this unshields the next. Destroy all 3 orbs to break boss shield and interrupt Annihilation. INTERRUPT Shadow Bolt. Avoid Teleport puddles.",
            abilities = {
                { name = "Shadow Bolt", desc = "Cast frequently. Interruptible. Deals moderate damage — if you miss an interrupt, use a defensive." },
                { name = "Teleport", desc = "Boss blinks a short distance. Leaves a damage puddle between old and new position. Don't stand in the puddle." },
                { name = "Annihilation", desc = "ONE-SHOT MECHANIC. Long cast that kills you if completed. Boss summons 3 orbs and shields 2 of them + himself. Kill the UNSHIELDED orb → next orb becomes unshielded → kill it → final orb unshields → kill it → boss shield breaks → Annihilation interrupted → boss stunned + takes bonus damage." },
            },
            companion = "Healer Valeera recommended for survivability. The DPS check on orbs is tight — you need to survive long enough to break all 3.",
            tank = "INTERRUPT Shadow Bolt. Avoid Teleport puddles. During Annihilation: find the unshielded orb, kill it, then the next, then the next, then boss shield breaks. This is a DPS race — use cooldowns on orbs.",
            healer = "N/A (solo content).",
            dps = "Annihilation orb order is THE fight. Find unshielded orb → kill → next unshields → kill → next → kill → boss shield breaks. Save DPS cooldowns for Annihilation phase. Interrupt Shadow Bolt between phases.",
            wipes = "Annihilation completing (instant death). Not finding/killing orbs fast enough. Shadow Bolt damage stacking without interrupts. Standing in Teleport puddles.",
        },
    },
}

----------------------------------------------------------------------
-- DELVE 4: ATAL'AMAN (Zul'Aman border)
----------------------------------------------------------------------
D.delves[#D.delves + 1] = {
    name = "Atal'Aman",
    bosses = {
        {
            name = "Spiritflayer Jin'Ma",
            order = 1,
            contentType = "delve",
            bossType = "Single target with soul collection mechanic",
            tldr = "Flayed Knife spawns damage circle around you + 3 soul orbs. COLLECT the souls before boss does (Collect Souls cast). Each soul YOU collect = 10% damage buff for you. Each soul BOSS collects = 10% damage buff for HIM. Don't kill souls with your circle — wait for it to fade, then grab them.",
            abilities = {
                { name = "Flayed Knife", desc = "Puts a damage circle around all players and spawns 3 soul orbs. Circle damages nearby players AND the souls. Wait for circle to fade before moving to collect souls — don't accidentally kill them." },
                { name = "Collect Souls", desc = "Uninterruptible cast. Boss gathers ALL remaining souls in the room. You must collect souls before this completes. Each uncollected soul = 10% damage increase for boss." },
            },
            companion = "DPS Valeera recommended — faster soul collection with more DPS. Fight is a race to collect souls.",
            tank = "Wait for Flayed Knife circle to fade, then rush to collect soul orbs. Each soul = 10% damage buff for you. Don't let boss collect them. Pull boss to open area so souls have room to spawn.",
            healer = "N/A (solo content).",
            dps = "COLLECT SOULS — this is the entire fight. Let Flayed Knife circle fade first (don't kill the souls). Rush to grab all 3 before Collect Souls cast completes. Each soul you get = 10% more damage. Each boss gets = 10% harder.",
            wipes = "Boss collecting multiple souls (stacking damage buff makes fight impossible). Accidentally killing souls with Flayed Knife circle. Not reaching souls in time.",
        },
    },
}

----------------------------------------------------------------------
-- DELVE 5: TWILIGHT CRYPTS (Zul'Aman)
----------------------------------------------------------------------
D.delves[#D.delves + 1] = {
    name = "Twilight Crypts",
    bosses = {
        {
            name = "Blademaster Darza",
            order = 1,
            contentType = "delve",
            bossType = "Single target — VERY DANGEROUS",
            tldr = "Shade Cleave = wide frontal cone that locks onto a location. Sidestep it (easier when fighting close). Bask in Twilight = circle around boss dealing heavy damage + knockback + leaving void puddles. Fight near edges so puddles don't fill the room. Stay close to avoid Charge.",
            abilities = {
                { name = "Shade Cleave", desc = "Wide frontal cone that LOCKS onto a location (doesn't track). Sidestep to avoid. Easier to dodge when fighting close to Darza. Known to be bugged — sometimes hits even when dodged (delayed hit detection). Can one-shot on higher tiers." },
                { name = "Bask in Twilight", desc = "Long cast — spawns a circle around boss. Heavy damage + knockback if you stay inside. Leaves void puddles on the ground that persist. Move out when cast starts. Puddles shrink the arena over time." },
                { name = "Charge", desc = "Only used when you're at range. Deals damage + knocks back. Stay close to prevent this entirely." },
            },
            companion = "Healer Valeera recommended. Shade Cleave damage is extreme on T8+. Fight is dangerous enough that sustained healing matters.",
            tank = "Stay CLOSE to Darza (prevents Charge, makes Shade Cleave easier to sidestep). Fight near room edges so Bask in Twilight puddles don't fill center. Sidestep Shade Cleave — watch for the lock-on animation.",
            healer = "N/A (solo content).",
            dps = "Stay close. Sidestep Shade Cleave when you see the animation lock on. Move out of Bask in Twilight circle immediately. Fight near edges to manage puddle placement. Be patient — don't greed for damage during Shade Cleave.",
            wipes = "Shade Cleave hitting you (can one-shot on higher tiers, especially if bugged). Room filled with Bask in Twilight puddles (no safe ground). Getting Charged at range into puddles.",
        },
    },
}

----------------------------------------------------------------------
-- DELVE 6: THE GULF OF MEMORY (Western Harandar)
----------------------------------------------------------------------
D.delves[#D.delves + 1] = {
    name = "The Gulf of Memory",
    bosses = {
        {
            name = "Lumenia",
            order = 1,
            contentType = "delve",
            bossType = "Single target with add kiting",
            tldr = "Command Light spawns a slow add that deals HEAVY damage if it reaches you — KITE IT. Boss spawns disorient circles on the ground (look away or face away). Thorn Bolt = heavy single-target damage. Kite adds through floor circles to stun them.",
            abilities = {
                { name = "Radiant Command", desc = "Summons a fixating add that moves slowly toward you. Explodes for HEAVY damage if it reaches you. Kite it — route through floor circles to kill passively." },
                { name = "Searing Light", desc = "Spawns bright yellow circles on the ground. Disorients you if you're FACING them when they activate. Circles persist dealing damage + stunning if stepped in. Turn your camera AWAY before they pop." },
                { name = "Malignant Gleam", desc = "Single-target holy damage. Moderate-to-high. Use defensive if needed." },
            },
            companion = "Healer Valeera recommended. Sustained damage from Thorn Bolt + add management requires healing.",
            tank = "Clear a large area before pulling. Keep boss centered. Kite Command Light adds through floor circles to stun them. Face away from disorient circles.",
            healer = "N/A (solo content).",
            dps = "KITE the Command Light add — don't let it reach you. Use floor circles strategically (kite adds through them to stun). Face away from disorient circles when they activate. Focus boss DPS between mechanics.",
            wipes = "Command Light add reaching you (massive damage). Standing in persistent circles. Getting disoriented into an add. Running out of room from circle placement.",
        },
        {
            name = "Mul'tha'ul",
            order = 2,
            contentType = "delve",
            bossType = "Single target with tentacles (Descent of the Haranir variant)",
            tldr = "Dodge Tentacle Slams (ground indicators). Hopelessness = curse dealing damage + slowing movement (dispel/decurse). Unanswered Call = 8-second fixate, KITE or boss deals heavy physical damage on contact.",
            abilities = {
                { name = "Tentacle Slams", desc = "Tentacles strike the ground after brief delay. Watch for ground indicators and dodge." },
                { name = "Hopelessness", desc = "Curse applied to all players. Deals ongoing damage + reduces movement speed. Dispel/decurse immediately. Interrupt if possible." },
                { name = "Unanswered Call", desc = "8-second fixate. Boss moves slower (60% reduced speed) BUT deals 500% increased physical damage. ONE-SHOTS if he reaches you. KITE — use the boulder on arena's left side for cover." },
            },
            companion = "Healer Valeera recommended — can dispel Hopelessness curse.",
            tank = "Clear room before pull. Position boss centrally for tentacle dodge space. Use movement abilities during Unanswered Call fixate. Dispel/decurse Hopelessness.",
            healer = "N/A (solo content).",
            dps = "Dodge tentacle ground indicators. Kite during Unanswered Call (8 seconds). Get Hopelessness dispelled ASAP (movement speed reduction makes kiting harder).",
            wipes = "Unanswered Call reaching you with Hopelessness slow active (can't kite). Tentacle Slams in confined space. Hopelessness stacking without dispel.",
        },
    },
}

----------------------------------------------------------------------
-- DELVE 7: THE GRUDGE PIT (SE Harandar)
----------------------------------------------------------------------
D.delves[#D.delves + 1] = {
    name = "The Grudge Pit",
    bosses = {
        {
            name = "Brightthorn",
            order = 1,
            contentType = "delve",
            bossType = "Single target — easier boss",
            tldr = "Solar Charge = frontal charge leaving damage puddles (tank near edges, bait into walls). Binding Burst = look AWAY or get disoriented. INTERRUPT Thorn Burst (heavy single-target damage).",
            abilities = {
                { name = "Solar Charge", desc = "Frontal charge leaving damage-over-time puddles behind. Tank boss near arena edges and bait charges into walls to minimize puddle spread." },
                { name = "Binding Burst", desc = "Short cast — disorients anyone LOOKING AT the boss when it finishes. Turn your camera AWAY during the cast." },
                { name = "Thorn Burst", desc = "Interruptible single-target burst damage. Hits quite hard. INTERRUPT whenever possible." },
            },
            companion = "DPS Valeera recommended — this is an easier boss. She auto-interrupts Thorn Burst.",
            tank = "Tank near edges. Bait Solar Charge into walls. Look away for Binding Burst. Interrupt Thorn Burst.",
            healer = "N/A (solo content).",
            dps = "Tank near edges for charge management. Turn camera away during Binding Burst cast. Interrupt Thorn Burst. Straightforward fight.",
            wipes = "Room filled with Solar Charge puddles (fight too long). Getting disoriented by Binding Burst into puddles. Thorn Burst hitting without interrupt repeatedly.",
        },
    },
}

----------------------------------------------------------------------
-- DELVE 8: SHADOWGUARD POINT (Western Voidstorm)
----------------------------------------------------------------------
D.delves[#D.delves + 1] = {
    name = "Shadowguard Point",
    bosses = {
        {
            name = "Chief-Arcanist Patram",
            order = 1,
            contentType = "delve",
            bossType = "Single target with Dark Harbinger add",
            tldr = "Dodge Discordant Hymn circles (UNINTERRUPTIBLE channel). INTERRUPT Submit to the Void (stacking magic DoT). Dark Communion summons a Dark Harbinger — kill it before Dark Prayer completes or boss gets a massive damage buff. Killing Harbinger = 20% versatility + 30% cooldown speed for YOU.",
            abilities = {
                { name = "Discordant Hymn", desc = "UNINTERRUPTIBLE channel spawning circles on the ground. Heavy damage if caught. Keep moving during the channel." },
                { name = "Submit to the Void", desc = "Interruptible cast applying stacking magic DoT. INTERRUPT — but delay interrupt slightly if Valeera is in DPS spec (she interrupts frequently)." },
                { name = "Dark Communion", desc = "After a short cast, summons a Dark Harbinger (ghostly Xal'atath). Harbinger has low HP but a large shield. Kill it for 20% versatility + 30% cooldown speed buff." },
                { name = "Dark Prayer (Harbinger)", desc = "Uninterruptible 15-second cast by the Harbinger. If it completes, boss gains increased damage based on remaining shield size. KILL the Harbinger before this finishes. Execute abilities work immediately past the shield." },
            },
            companion = "DPS Valeera recommended — she handles Submit to the Void interrupts, and the 30% cooldown speed buff from killing Harbinger synergizes with offensive play.",
            tank = "Keep moving during Discordant Hymn. Interrupt Submit to the Void. When Dark Communion summons Harbinger, SWAP to it immediately — kill before Dark Prayer finishes. The buff from killing it (20% vers + 30% CD speed) is huge.",
            healer = "N/A (solo content).",
            dps = "Dodge Discordant Hymn circles. Interrupt Submit to the Void. Priority swap to Dark Harbinger — kill it before Dark Prayer completes. The reward (20% versatility + 30% cooldown speed) makes you significantly stronger. Use execute abilities past shield.",
            wipes = "Dark Prayer completing (boss damage ramps). Standing in Discordant Hymn circles. Submit to the Void stacking without interrupt. Not swapping to Harbinger fast enough.",
        },
    },
}

----------------------------------------------------------------------
-- DELVE 9: SUNKILLER SANCTUM (Central Voidstorm)
----------------------------------------------------------------------
D.delves[#D.delves + 1] = {
    name = "Sunkiller Sanctum",
    bosses = {
        {
            name = "Esuritus",
            order = 1,
            contentType = "delve",
            bossType = "Single target with add management — easier boss",
            tldr = "Crushing Rift = circle around boss dealing heavy damage (step out). INTERRUPT Singular Bolt. Boss summons Void Walker adds that channel falling debris — kill adds FAST because Gorge kills all remaining adds and gives boss 5% damage per add consumed.",
            abilities = {
                { name = "Crushing Rift", desc = "Circle around Esuritus dealing heavy damage to anyone inside. Step out when it appears." },
                { name = "Calling Bolt", desc = "Interruptible cast dealing shadow damage AND summoning 1 Voidcaller add. INTERRUPT ON COOLDOWN — prevents add spawns entirely." },
                { name = "Void Walker Summons", desc = "Summons void walker adds that channel an ability spawning falling debris circles. Avoid debris — deals substantial damage." },
                { name = "Gorge", desc = "Boss kills ALL remaining adds and gains 5% increased damage PER ADD consumed. Kill adds before this happens or boss becomes overwhelming." },
            },
            companion = "DPS Valeera recommended — she interrupts Singular Bolt and helps burn adds before Gorge.",
            tank = "Step out of Crushing Rift. INTERRUPT Calling Bolt on cooldown (prevents add spawns). Kill any adds ASAP before Gorge. Dodge falling debris.",
            healer = "N/A (solo content).",
            dps = "INTERRUPT Calling Bolt religiously — prevents add spawns entirely. Kill any Voidcallers before Gorge (5% damage per add consumed, stacks). Step out of Crushing Rift. Dodge debris.",
            wipes = "Multiple adds alive when Gorge fires (stacking damage buff). Standing in Crushing Rift. Debris circles hitting you while fighting adds.",
        },
    },
}

----------------------------------------------------------------------
-- DELVE 10: PARHELION PLAZA (Isle of Quel'Danas)
----------------------------------------------------------------------
D.delves[#D.delves + 1] = {
    name = "Parhelion Plaza",
    bosses = {
        {
            name = "Gladius Slaurna",
            order = 1,
            contentType = "delve",
            bossType = "Single target — TOUGH boss with platform edges",
            tldr = "Voidscar Raze = frontal beam targeting furthest player, then sends a copy along it (damage + knockback + consumes adds for 10% damage buff each). Devouring Nova = uninterruptible AoE + knockback (CAN PUSH YOU OFF PLATFORM) + kills adds for 10% damage each. Kill Void Caller adds ASAP — every add alive when boss uses an ability = permanent 10% damage increase.",
            abilities = {
                { name = "Voidscar Raze", desc = "Frontal beam targeting furthest player. After a short duration, sends a copy along the beam dealing damage + knockback. Consumes any adds in the path — boss gains 10% increased damage per add consumed." },
                { name = "Devouring Nova", desc = "Short UNINTERRUPTIBLE cast dealing moderate AoE damage + knockback. CAN PUSH YOU OFF THE PLATFORM. Also kills all remaining adds — boss gains 10% permanent damage per add killed." },
                { name = "Sacrificial Void Callers", desc = "Summoned adds that spam Void Bolts. CC immune but CAN be interrupted. Kill them BEFORE Voidscar Raze or Devouring Nova or boss gets permanent damage stacks." },
            },
            companion = "Healer Valeera recommended. Boss hits hard and the knockback from Devouring Nova is dangerous near edges. Need survivability.",
            tank = "Kill Void Caller adds IMMEDIATELY — every add alive during Raze or Nova = permanent 10% damage increase for boss. Position away from platform edges (Devouring Nova knockback). Don't be furthest player during Voidscar Raze unless you can dodge the copy.",
            healer = "N/A (solo content).",
            dps = "PRIORITY: Kill Void Callers before boss uses any ability. Position with back to wall (not edge) for Devouring Nova knockback. Stay close to boss to avoid being Voidscar Raze target. This fight snowballs — if adds live through abilities, boss becomes unkillable.",
            wipes = "Adds alive during Raze/Nova (permanent stacking damage buff). Devouring Nova knocking you off platform. Voidscar Raze copy hitting you + consuming adds. Boss damage snowballing from multiple add buffs.",
        },
    },
}

----------------------------------------------------------------------
-- NEMESIS DELVE: TORMENT'S RISE (SE Voidstorm)
----------------------------------------------------------------------
D.delves[#D.delves + 1] = {
    name = "Torment's Rise",
    bosses = {
        {
            name = "Nullaeus",
            order = 1,
            contentType = "delve",
            bossType = "Multi-phase — NEMESIS BOSS (T8 and T11 only)",
            tldr = "Hardest solo content. 4 phases with intermissions at 75/50/25%. INTERRUPT Emptiness of the Void (massive AoE). Dispel Devouring Essence (magic DoT). Intermission 1: kill Razorshell Ravagers + dodge expanding voidzone. Intermission 2: kill 7 Spitting Ticks + dodge Black Hole. Intermission 3: interrupt Enslaved Voidcaster. Final phase: burn with everything.",
            abilities = {
                { name = "Imploding Strike", desc = "Moderate physical hit on highest threat. Basic tank damage." },
                { name = "Emptiness of the Void", desc = "MUST INTERRUPT. Massive AoE damage if it goes off. Save interrupt for this — top priority." },
                { name = "Devouring Essence", desc = "Magic DoT dealing shadow damage every 2 sec for 18 sec. Dispellable. Set Valeera to healer for auto-dispel." },
            },
            phases = {
                { name = "Phase 1 (100-75%)", desc = "Interrupt Emptiness of the Void. Dispel Devouring Essence. DPS boss to 75%." },
                { name = "Intermission 1 (75%)", desc = "2 Razorshell Ravagers spawn. Dodge Spiny Leap (targets furthest player — sidestep circle). Move away from Jagged Rip. Void Orb creates expanding voidzone covering 1/3 of room. Kill adds to resume." },
                { name = "Phase 2 (75-50%)", desc = "Same as P1 but now dodge active voidzone from Intermission 1." },
                { name = "Intermission 2 (50%)", desc = "7 Spitting Ticks spawn (Poisonous Spit stacking damage). Black Hole bounces around room pulling you closer (stronger when near). Kill all ticks." },
                { name = "Phase 3 (50-25%)", desc = "Boss abilities + voidzone + Black Hole all active simultaneously." },
                { name = "Intermission 3 (25%)", desc = "Enslaved Voidcaster spawns. Shadow Bolt (interrupt), Shadow Crash (interrupt + dodge circle), Curse of Hesitation (5-min curse, -30% move speed). Save 1 interrupt only — preserve for boss return." },
                { name = "Final Phase (25-0%)", desc = "All mechanics active. Use ALL cooldowns. Burn boss. This is the DPS check." },
            },
            companion = "Healer Valeera for T8 (auto-dispels Devouring Essence). For T11, some prefer DPS Valeera to meet the burn check in final phase.",
            tank = "INTERRUPT Emptiness of the Void every time. Manage voidzone positioning (1/3 of room lost per intermission). Kite from Black Hole (stronger when close). Save cooldowns for final phase burn.",
            healer = "N/A (solo content).",
            dps = "Interrupt Emptiness of the Void — #1 priority. Get Devouring Essence dispelled. Kill intermission adds fast. During Intermission 3, use only 1 interrupt on Voidcaster (save the rest for Nullaeus). Final phase: every cooldown, every potion, burn.",
            positioning = "Keep center clear of voidzones. Voidzones expand from edges — don't stack them. Stay away from Black Hole. Final phase has very limited safe space.",
            wipes = "Emptiness of the Void going off (massive AoE). Voidzones covering entire room. Black Hole pulling you into voidzone. Final phase DPS check failed. Devouring Essence ticking without dispel.",
        },
    },
}

----------------------------------------------------------------------
-- General Delve Tips
----------------------------------------------------------------------
D.delveTips = {
    "COMPANION: Valeera Sanguinar. DPS spec = auto-interrupts. Healer spec = auto-dispels + sustained healing.",
    "TIERS: T1-T3 easy, T4-T7 moderate, T8-T10 challenging (Hero-track loot), T11 hardest (Myth crests).",
    "BOUNTIFUL: Marked with special icon on map. Use 1 Coffer Key per Bountiful run for guaranteed loot.",
    "BOUNTIFUL ROTATION: Different delves are Bountiful on different days.",
    "DEATHS: Companion stress increases with deaths — minimize deaths on harder tiers.",
    "NEMESIS: Torment's Rise (Nullaeus) — T8 and T11 only. First kill = 30 Hero Dawncrests (uncapped).",
    "HARDEST BOSSES: Lord Antenorian (one-shot mechanic), Blademaster Darza (Shade Cleave), Gladius Slaurna (snowball damage).",
    "EASIEST BOSSES: Brightthorn, Esuritus, Voidscorned Vagrant.",
}

----------------------------------------------------------------------
-- Register delve bosses in byName lookup
----------------------------------------------------------------------
for _, delve in ipairs(D.delves) do
    D.byInstanceBoss[delve.name] = {}
    local bossList = delve.bosses or delve.encounters
    if bossList then
        for _, boss in ipairs(bossList) do
            D.byExactName[boss.name] = boss
            D.byInstanceBoss[delve.name][#D.byInstanceBoss[delve.name] + 1] = boss
            local key = boss.name:lower():gsub("[%s%-'']", "")
            D.byName[key] = boss

            if boss.name == "Blademaster Darza" then
                D.byName["darza"] = boss
                D.byName["blademaster"] = boss
            elseif boss.name == "Nullaeus" then
                D.byName["nemesis"] = boss
                D.byName["tormentsrise"] = boss
            elseif boss.name == "Lord Antenorian" then
                D.byName["antenorian"] = boss
            elseif boss.name == "Spiritflayer Jin'Ma" then
                D.byName["jinma"] = boss
                D.byName["spiritflayer"] = boss
            elseif boss.name == "Gladius Slaurna" then
                D.byName["slaurna"] = boss
                D.byName["gladius"] = boss
            elseif boss.name == "Chief-Arcanist Patram" then
                D.byName["patram"] = boss
            elseif boss.name == "Brightthorn" then
                -- already covered by gsub
            elseif boss.name == "Infiltrator Gulkat" then
                D.byName["gulkat"] = boss
            elseif boss.name == "Lumenia" then
                -- already covered
            elseif boss.name == "Mul'tha'ul" then
                D.byName["multhaul"] = boss
            elseif boss.name == "Esuritus" then
                -- already covered
            end
        end
    end
end

----------------------------------------------------------------------
-- NPC ID → Boss lookup (bypasses WoW 12.0 tainted strings)
----------------------------------------------------------------------
local delveNpcIDs = {
    [254773] = "Voidscorned Vagrant",
    [254769] = "Infiltrator Garand",
    [256817] = "Infiltrator Gulkat",
    [252352] = "Lord Antenorian",
    [247114] = "Spiritflayer Jin'Ma",
    [251032] = "Blademaster Darza",
    [246680] = "Lumenia",
    [250939] = "Mul'tha'ul",
    [247397] = "Brightthorn",
    [248676] = "Chief-Arcanist Patram",
    [256683] = "Esuritus",
    [246621] = "Gladius Slaurna",
    [252892] = "Nullaeus",
}
for npcID, bossName in pairs(delveNpcIDs) do
    local boss = D.byName[bossName:lower():gsub("[%s%-'']", "")]
    if boss then
        D.byNpcID[npcID] = boss
    end
end
