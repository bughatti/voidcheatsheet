----------------------------------------------------------------------
-- VoidCheatSheet — M+ Dungeon Data
-- Midnight Season 1 (Patch 12.0) — 8 dungeons
-- Sources: Wowhead, Icy Veins, Method guides (April 2026)
----------------------------------------------------------------------

local D = VoidCheatSheetData
D.dungeons = {}

----------------------------------------------------------------------
-- DUNGEON 1: MAGISTERS' TERRACE (34:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Magisters' Terrace",
    trashNotes = "Arcane Magister — INTERRUPT Polymorph (priority). Blazing Pyromancer — INTERRUPT Pyroblast, dodge Flamestrike AoE. Void Infuser — INTERRUPT Terror Wave. Animated Codex — continuous Arcane Volley pulse, limit pack size. Shadowrift Voidcaller — Consuming Shadows heavy group damage, LoS to negate. Devouring Tyrant — massive healing absorb. Lightward Healer — dispel Holy Fire and PWS. Sunblade Enforcer — dispel Arcane Blade.",
    bosses = {
        {
            name = "Arcanotron Custos",
            order = 1,
            contentType = "dungeon",
            bossType = "Single target, energy management",
            tldr = "Tank-and-spank with energy bar. At 0 energy = Refueling Protocol, soak Energy Spheres before they reach boss. Boss takes bonus damage during Refueling. Dispel Ethereal Shackles immediately.",
            abilities = {
                { name = "Arcane Expulsion", desc = "AoE knockback creating persistent puddles. Place at arena edges." },
                { name = "Ethereal Shackles", desc = "Magic debuff on 2 players. DISPEL immediately." },
                { name = "Repulsing Slam", desc = "Tank buster with knockback. Use defensive + knockback immunity." },
                { name = "Refueling Protocol", desc = "At 0 energy, boss pulls Energy Spheres toward self. Boss takes bonus damage during this window — use CDs." },
                { name = "Energy Orb", desc = "Must be soaked by group. Applies healing absorb stacks." },
            },
            tank = "Defensive for Repulsing Slam. Use knockback immunity if available. Position boss away from puddles.",
            healer = "Dispel Ethereal Shackles FAST. Monitor healing absorbs during Energy Orb soaks. Heavy healing during overlap phases.",
            dps = "Use damage CDs during Refueling Protocol (boss takes bonus damage). Manage puddle placement. Soak Energy Orbs.",
            positioning = "Drop Arcane Expulsion puddles at edges. Spread for Energy Orb soaks. Keep center clean.",
            wipes = "Puddle accumulation blocking movement. Failing to soak Energy Orbs. Undispelled Ethereal Shackles during overlaps.",
            tyrannical = "Repulsing Slam can one-shot. Energy Orb healing absorbs are massive. Puddle management is critical — arena gets cluttered fast.",
        },
        {
            name = "Seranel Sunlash",
            order = 2,
            contentType = "dungeon",
            bossType = "Single target, coordination/sequencing",
            tldr = "Marks 3 players with Runic Marks — must enter Suppression Zone dome one at a time. Wave of Silence = step into dome before it hits or 8-second group silence. Purge Hastening Ward.",
            abilities = {
                { name = "Suppression Zone", desc = "Dome created at boss location. Central positioning is key for access." },
                { name = "Runic Mark", desc = "2-3 players debuffed. Must reach Suppression Zone with proper spacing to cleanse. Too close = Null Reaction AoE." },
                { name = "Null Reaction", desc = "AoE triggered when Runic Mark targets are too close. Space out when entering dome." },
                { name = "Hastening Ward", desc = "Magic buff on boss increasing speed. Purge/spellsteal it." },
                { name = "Wave of Silence", desc = "Step into Suppression Zone before it hits or suffer 8-second pacify/silence." },
            },
            tank = "Position boss so Suppression Zone remains accessible. Purge Hastening Ward if possible.",
            healer = "Burst heal through Null Reaction. Purge Hastening Ward. Enter dome for Wave of Silence.",
            dps = "Coordinate Runic Mark clearing — enter dome ONE AT A TIME with spacing. Watch Wave of Silence timing. Purge Hastening Ward.",
            positioning = "Boss center of room for dome access. Marked players enter dome one at a time, not simultaneously.",
            wipes = "Players combining Null Reaction hits by stacking. Failing to enter dome before Wave of Silence. Hastening Ward left up too long.",
            tyrannical = "Null Reaction damage is extreme. Wave of Silence duration feels eternal. Must execute dome sequence perfectly.",
        },
        {
            name = "Gemellus",
            order = 3,
            contentType = "dungeon",
            bossType = "Multi-phase clone fight (splits at 90% and 50%)",
            tldr = "Boss creates clones at 90% and 50% that share health. Cleave all 3. Neural Link arrows show which clone to damage to break its shield. Dodge Astral Grasp pulls. Cosmic Sting = drop puddle away.",
            abilities = {
                { name = "Triplicate", desc = "Boss creates clones at 90% and 50% HP. All share combined health pool. Must cleave efficiently." },
                { name = "Cosmic Sting", desc = "Targets player, drops puddle. Place away from group." },
                { name = "Neural Link", desc = "Links player to a specific clone. Arrow indicator shows which clone to damage to break the shield." },
                { name = "Astral Grasp", desc = "Pull-in effect with simultaneous circles around clones. Maintain distance." },
            },
            tank = "Cleave clones efficiently. Stack them together. Rotate defensives for clone abilities.",
            healer = "Monitor spread damage from multiple clone casts below 50%. Burst heal through Astral Grasp pulls.",
            dps = "Maximize cleave on all 3 clones. Follow Neural Link arrow to break correct shield. Avoid Astral Grasp overlaps. Drop Cosmic Sting at edges.",
            positioning = "Keep clones stacked for cleave. Spread during Astral Grasp. Drop Cosmic Sting puddles at edges.",
            wipes = "Failure to cleave (extended fight = more mechanics). Players caught in simultaneous Astral Grasp + clone circles. Neural Link shield not broken.",
            tyrannical = "Clone HP shared pool is massive. Astral Grasp pulls are lethal. Neural Link shields must be broken quickly or damage stalls.",
        },
        {
            name = "Degentrius",
            order = 4,
            contentType = "dungeon",
            bossType = "Split-arena quadrant puzzle",
            tldr = "Arena split into 4 quadrants by Void Torrent beams. NEVER cross beams (massive damage + stun). Unstable Void Essence bounces to all 4 quadrants — soak each landing or stacking Void Destruction wipes. Below 30% is DPS race.",
            abilities = {
                { name = "Void Torrent", desc = "Beams from statues divide arena into 4 quadrants. Crossing a beam = massive Shadow damage + 3-sec stun. NEVER cross." },
                { name = "Unstable Void Essence", desc = "Bounces to 4 quadrant locations. Players MUST soak each landing. Unsoaked = Void Destruction (stacking DoT every 0.5s for 40s)." },
                { name = "Void Destruction", desc = "Stacking DoT from unsoaked Essence. STACKS. Multiple misses = wipe." },
                { name = "Devouring Entropy", desc = "Different-duration Shadow DoTs on several players. On expiration, launches Entropy Orbs." },
                { name = "Entropy Orb", desc = "Orbs deal Shadow damage + 70% slow for 5 seconds. Dodge them." },
                { name = "Hulking Fragment", desc = "Tank-targeted 8-yard AoE. Knocks away other players. Dispel magic DoT." },
            },
            tank = "Position away from group for Hulking Fragment (8-yard AoE). Get magic debuff dispelled fast. Drop puddles at edges.",
            healer = "Dispel Hulking Fragment magic effect immediately. Coordinate for extended Devouring Entropy durations. Heavy healing on unsoaked Void Destruction.",
            dps = "Pre-assign quadrants before pull. Stand in soak zones for Unstable Void Essence. Use defensives for longer Devouring Entropy debuffs. Dodge Entropy Orbs.",
            positioning = "Pre-position 1+ player per quadrant before pull. NEVER cross beam lines. Drop puddles at edges.",
            wipes = "Unsoaked Void Essence (stacking Void Destruction). Arena congestion from Entropy Orbs + puddles. Players crossing beams. Sub-30% DPS check failed.",
            tyrannical = "Void Destruction stacks are lethal with even 1 miss. Entropy Orbs one-shot. Hulking Fragment hits extremely hard. Must have perfect quadrant coverage.",
        },
    },
}

----------------------------------------------------------------------
-- DUNGEON 2: MAISARA CAVERNS (33:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Maisara Caverns",
    trashNotes = "Dread Souleater (CC IMMUNE) — Necrotic Wave arcs to all players, stagger defensives. Hex Guardian (CC IMMUNE, HIGH PRIORITY) — constant Searing Presence AoE pulse, Magma Surge = spread, dispel Ritual Firebrand. Tormented Shade — INTERRUPT Spirit Rend every cast. Ritual Hexxer — INTERRUPT Hex (or magic dispel), secondary interrupt Shadow Bolt. Hulking Juggernaut — Deafening Roar = stop casting. Hollow Soulrender — INTERRUPT Shadowfrost Blast. Rokh'zal Miniboss — Ritual Sacrifice roots a random player on altar.",
    bosses = {
        {
            name = "Muro'jin & Nekraxx",
            order = 1,
            contentType = "dungeon",
            bossType = "Dual boss, cleave fight",
            tldr = "Kill both evenly — Muro'jin resurrects Nekraxx if she dies first, Nekraxx enrages if alone. Lure Nekraxx into Freezing Traps during Carrion Swoop. PRIORITY DISPEL Infected Pinions (11k plague/sec for 30s = death).",
            abilities = {
                { name = "Revive Pet", desc = "Muro'jin resurrects Nekraxx if she dies first. Keep damage even." },
                { name = "Bestial Wrath", desc = "Nekraxx gains stacking damage when Muro'jin takes damage alone." },
                { name = "Freezing Trap", desc = "Environmental hazard. Stun Nekraxx by luring Carrion Swoop onto trap." },
                { name = "Carrion Swoop", desc = "Nekraxx charges a target. Bait onto Freezing Trap to stun her." },
                { name = "Flanking Spear", desc = "Tank buster with bleed. Use defensive or cleanse bleed." },
                { name = "Infected Pinions", desc = "Disease debuff. PRIORITY DISPEL. 11,556 plague damage/sec for 30 seconds." },
                { name = "Fetid Quillstorm", desc = "Circular AoE. Move out." },
                { name = "Barrage", desc = "Frontal channel with magical slow. Don't stand in front." },
            },
            tank = "Maintain even damage on both. Defensive for Flanking Spear. Position bosses together for cleave. Avoid knockback into traps.",
            healer = "PRIORITY dispel Infected Pinions — it will kill in seconds. Stagger defensives for overlapping abilities.",
            dps = "Balance damage between both bosses. Position to avoid Carrion Swoop paths. Bait Swoop onto Freezing Traps. Stay out of Barrage frontal.",
            positioning = "Keep bosses stacked for cleave. Know Freezing Trap locations — bait Carrion Swoop target to nearest trap.",
            wipes = "Killing one boss while other lives (Revive/Bestial Wrath). Undispelled Infected Pinions. Missing Freezing Trap stun on Nekraxx.",
            tyrannical = "Infected Pinions ticks are instantly lethal without dispel. Flanking Spear bleed is brutal. Both bosses hit extremely hard.",
        },
        {
            name = "Vordaza",
            order = 2,
            contentType = "dungeon",
            bossType = "Single target with shield + add management",
            tldr = "Boss shields with Deathshroud and channels ramping damage (Necrotic Convergence). BURST shield FAST or group dies. Unstable Phantoms fixate — kite them. Don't get hit twice (200% damage taken debuff). Dodge Unmake frontal.",
            abilities = {
                { name = "Necrotic Convergence", desc = "Boss shields self and channels ramping Shadow damage every 2 seconds for up to 1 minute. Break Deathshroud shield to stop channel." },
                { name = "Deathshroud", desc = "Absorb shield making boss immune to interrupts. MUST burn through with damage CDs." },
                { name = "Wrest Phantoms", desc = "Spawns Unstable Phantoms that chase players via Final Pursuit. Phantoms have 99% damage reduction (Veiled Presence) — you CANNOT DPS them down normally." },
                { name = "Final Pursuit", desc = "Phantom chases target. Must COLLIDE phantoms into each other to destroy them (only way to bypass 99% DR). Getting hit applies Haunting Remains (200% increased damage from next phantom)." },
                { name = "Lingering Dread", desc = "Phantom death scream deals group Shadow damage + 3-second DoT. Soulrot pools left where phantoms die." },
                { name = "Unmake", desc = "4.5-second frontal channel dealing Shadow damage every 0.5s. Step out immediately." },
                { name = "Drain Soul", desc = "Channels on tank. Heavy Shadow damage + absorbs next healing. Major tank defensive." },
            },
            tank = "Major defensive for every Drain Soul. Position for Unmake avoidance. Hold threat during shield phase.",
            healer = "Save CDs for Necrotic Convergence (ramping group damage while shield is up). Time healing around phantom deaths.",
            dps = "SAVE BURST for Deathshroud — this is the DPS check. Phantoms have 99% DR — COLLIDE them into each other to destroy them. Don't get hit twice (200% vulnerability from Haunting Remains).",
            positioning = "Kite phantoms toward each other to force collisions. Position Soulrot pools at edges. Stack for Convergence burn.",
            wipes = "Deathshroud not broken fast enough (Convergence ramps to lethal). Phantom hitting player twice (Haunting Remains). Standing in Unmake frontal. Phantoms not collided (can't kill them).",
            tyrannical = "Deathshroud absorb is massive — coordinate ALL burst CDs. Necrotic Convergence ramps much faster. Drain Soul can one-shot tanks.",
        },
        {
            name = "Rak'tul, Vessel of Souls",
            order = 3,
            contentType = "dungeon",
            bossType = "Single target with totems + spirit realm intermission",
            tldr = "Kill Soulbind Totems from Crush Souls IMMEDIATELY. During Soulrending Roar, your soul enters spirit realm — run back to boss while interrupting Malignant Souls for 25% stacking damage/healing buff. Tank needs MAJOR defensive for every Spiritbreaker.",
            abilities = {
                { name = "Spiritbreaker", desc = "Double physical hit + final Shadow hit launching tank airborne. MAJOR defensive every time. Leaves Spectral Decay pool." },
                { name = "Crush Souls", desc = "Boss leaps, planting Soulbind Totems under 3 players." },
                { name = "Soulbind Totem", desc = "Ensnares nearby players with Shadow damage and pulls them toward totem. KILL IMMEDIATELY." },
                { name = "Soulrending Roar", desc = "Casts all players' souls into spirit realm. Boss stunned for 45 seconds. Withering Soul = stacking damage while incorporeal." },
                { name = "Malignant Soul (Spirit Realm)", desc = "Radiates Shadow magic, slows nearby players 60%. INTERRUPT them for Spectral Residue buff (25% damage/healing/absorb per stack)." },
                { name = "Lost Soul (Spirit Realm)", desc = "Contact = Shadow damage + 3-second root. Avoid them." },
            },
            tank = "MAJOR defensive every Spiritbreaker — no exceptions. Position boss center-arena for totem cleave. Collect totems for AoE.",
            healer = "Major healing CD after every Spiritbreaker. Heal through Deathgorged Vessel eruptions. Prep for post-intermission burst.",
            dps = "Totems are TOP PRIORITY — burn them instantly. During spirit phase, interrupt every Malignant Soul on the way back (stacking 25% buff is HUGE). Avoid Lost Souls (root).",
            positioning = "Boss centered. Don't spread too far for Crush Souls (totems cluster near player positions). Spirit realm: run back to boss while interrupting.",
            wipes = "Totems left alive during Soulrending Roar. Spiritbreaker without defensive (one-shot). Not interrupting Malignant Souls (missing damage buff = fight too long). Getting rooted by Lost Souls.",
            tyrannical = "Spiritbreaker is a guaranteed tank death without major CDs. Soulbind Totems have massive HP. Malignant Soul interrupt windows are tighter. The 25% buff stacking is essential to meet DPS check.",
        },
    },
}

----------------------------------------------------------------------
-- DUNGEON 3: NEXUS-POINT XENAS (30:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Nexus-Point Xenas",
    trashNotes = "Flux Engineer (HIGH PRIORITY) — Suppression Field debuff on random player, drops Mana Battery on death (DESTROY immediately). Circuit Seer (CC IMMUNE) — Arcing Mana channel heavy damage. Grand Nullifier — INTERRUPT every Nullify cast, transforms into Smudge on death (CC it). Dreadflail (CC IMMUNE) — Void Lash frontal away from group. Lightwrought — INTERRUPT Holy Bolt, dispel Burning Radiance. Flarebat — PURGE Holy Echo or AoE zone on death.",
    bosses = {
        {
            name = "Chief Corewright Kasreth",
            order = 1,
            contentType = "dungeon",
            bossType = "Single target, floor management puzzle",
            tldr = "Boss covers arena in garbage. Leyline Array beams divide room — stand in beam intersections ONLY with Reflux Charge debuff to disable beams. Soak Corespark Detonation. Manage Sparkburn healing absorb. Bait Flux Collapse puddles to edges.",
            abilities = {
                { name = "Arcane Zap", desc = "Boss does NOT melee. All tank damage is Arcane via instant cast." },
                { name = "Leyline Array", desc = "Beams divide arena into sectors. Crossing beams = heavy damage + slow. Stand in intersections ONLY with Reflux Charge debuff." },
                { name = "Reflux Charge", desc = "Random player debuff. Standing in Leyline Array intersection clears it and disables that beam section." },
                { name = "Corespark Detonation", desc = "At 100 energy: 15-yard AoE Arcane damage. Causes Flux Collapse puddles and applies Sparkburn to all players." },
                { name = "Sparkburn", desc = "Absorbs healing and deals Arcane damage every second to all players." },
                { name = "Flux Collapse", desc = "Broken pipes leak arcane puddles at impact zones. Bait toward edges." },
            },
            tank = "Expect Arcane damage, not physical — use magic reduction defensives. Position for Flux Collapse baiting at edges.",
            healer = "Prepare CDs for Corespark Detonation (Sparkburn healing absorb on everyone). Heavy spike damage from puddle mechanics.",
            dps = "Avoid beam intersections unless you have Reflux Charge. Drop Flux Collapse puddles at edges. Maintain arena space.",
            positioning = "Arena management is everything. Bait puddles to edges. Pre-position for Reflux Charge beam clearing.",
            wipes = "Arena fully covered in puddles. Stacking in beams without Reflux Charge. Failed healing absorb management from Sparkburn.",
            tyrannical = "Sparkburn absorbs are massive. Flux Collapse puddles persist longer. Arena management becomes the entire fight. One bad puddle placement spirals.",
        },
        {
            name = "Corewarden Nysarra",
            order = 2,
            contentType = "dungeon",
            bossType = "Single target with add phases + damage amp",
            tldr = "Lothraxion's image periodically slams into Nysarra creating 300% damage amp zone (Lightscar Flare). STAND IN IT for bonus damage. Kill ALL adds before Flare ends or Devour the Unworthy wipes. INTERRUPT Nullify on Grand Nullifiers.",
            abilities = {
                { name = "Eclipsing Step", desc = "Targets 2 players with hit + DoT. Requires spacing to prevent cleaving." },
                { name = "Null Vanguard", desc = "Summons Dreadflail + 2 Grand Nullifiers. INTERRUPT Nullify on Nullifiers immediately." },
                { name = "Umbral Lash", desc = "Tank channel. Requires defensive. Extra dangerous with adds alive." },
                { name = "Lightscar Flare", desc = "Lothraxion's image stuns Nysarra 18 seconds. Glowing wound on ground = 300% damage to boss + 30% bonus healing. STAND IN IT." },
                { name = "Devour the Unworthy", desc = "Triggered if adds survive when Lightscar Flare ends. Deadly group-wide burst." },
            },
            tank = "Position Dreadflail away from group (Void Lash frontal). Major defensive for Umbral Lash. Stack adds for cleave during Flare.",
            healer = "Heavy throughput during Lightscar Flare windows. Standing in Flare zone gives 30% healing bonus. Monitor Eclipsing Step DoT spread.",
            dps = "PRIORITIZE Nullify interrupts on Grand Nullifiers. Stand in damage amp zone during Lightscar Flare — 300% bonus. Kill ALL adds before Flare ends.",
            positioning = "Stack in damage amp zone during Lightscar Flare. Spread for Eclipsing Step. Keep Dreadflail frontal away from group.",
            wipes = "Adds surviving Lightscar Flare (Devour the Unworthy). Missed Nullify interrupts. Not standing in amp zone (missing damage window). Umbral Lash without defensive.",
            tyrannical = "Devour the Unworthy is instant wipe. Add HP is massive — must focus burst during Flare. Umbral Lash can kill tanks outright.",
        },
        {
            name = "Lothraxion",
            order = 3,
            contentType = "dungeon",
            bossType = "Single target, 'find the real boss' puzzle",
            tldr = "Boss hides among Fractured Images at 100 energy (Divine Guile). Find the REAL Lothraxion (the one WITHOUT light horns) and interrupt him. Interrupting a COPY = Core Exposure (wipe). Searing Rend puddles are PERMANENT — drop at edges.",
            abilities = {
                { name = "Searing Rend", desc = "Tank-targeted double-slash dealing Physical + Holy DoT (4 Holy damage/sec for 6 sec). Requires tank defensive." },
                { name = "Brilliant Dispersion", desc = "Targets 3 players. Spawns 2 Fractured Images per target. Triggers Mirrored Rend on proximity (5-yard damage)." },
                { name = "Flicker", desc = "Images dash to new locations, damaging anyone in path. Active avoidance required." },
                { name = "Divine Guile", desc = "At 100 energy: boss hides among images. ALL channel escalating Holy damage. Find and interrupt the REAL Lothraxion." },
                { name = "Core Exposure", desc = "Triggered by interrupting the WRONG image. Wipe-level debuff. The real Lothraxion = the one WITHOUT horns." },
                { name = "Mirrored Rend", desc = "Proximity damage from Fractured Images. Stay 5+ yards away." },
            },
            tank = "Major defensive for every Searing Rend (double-slash + Holy DoT). Position boss consistently for group.",
            healer = "Manage proximity damage from Mirrored Rend. Prep for Divine Guile spike damage. Coordinate healing during image phases.",
            dps = "MEMORIZE: real boss = NO horns. Interrupt correct target during Divine Guile — wrong target = wipe. Maintain safe distance from Fractured Images.",
            positioning = "Spread during Brilliant Dispersion. Stay 5+ yards from Fractured Images (Mirrored Rend). Stack for healing during Divine Guile.",
            wipes = "Interrupting wrong image (Core Exposure = wipe). Clustering near Fractured Images (Mirrored Rend). Failing to find real boss during Divine Guile. Flicker dashes hitting group.",
            tyrannical = "Divine Guile escalating damage kills fast — must find real boss quickly. One wrong interrupt = instant wipe regardless of key level. Mirrored Rend proximity damage is extreme.",
        },
    },
}

----------------------------------------------------------------------
-- DUNGEON 4: WINDRUNNER SPIRE (33:30 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Windrunner Spire",
    trashNotes = "Bloated Lasher — INTERRUPT Fungal Bolt (empowers nearby adds). Devoted Woebringer — INTERRUPT Shadow Bolt + Pulsing Shriek. Phantasmal Mystic (CC IMMUNE) — INTERRUPT Chain Lightning, enrages at 50%. Spellguard Magus — drops 99% damage reduction zone at 50% HP, reposition out. Apex Lynx (CC IMMUNE) — multi-target leap, spread to avoid cleave.",
    bosses = {
        {
            name = "Emberdawn",
            order = 1,
            contentType = "dungeon",
            bossType = "Single target dragonhawk with fire intermission",
            tldr = "Drop Flaming Updraft puddles at edges. At 100 energy, room fills with rotating Fire Breath frontals and twisters from puddles for 16 seconds. Survive the intermission, repeat.",
            abilities = {
                { name = "Flaming Updraft", desc = "Debuffs 2 players. Creates puddles that spawn twisters during intermission. DROP AT EDGES." },
                { name = "Burning Gale", desc = "Intermission. Heavy party-wide fire damage for 16 seconds." },
                { name = "Fire Breath", desc = "4 rotating frontal attacks sweeping counter-clockwise from tank position during intermission." },
                { name = "Searing Beak", desc = "Tank hit with initial damage + DoT follow-up." },
            },
            tank = "Major defensive covering both Searing Beak hit and DoT. Return to boss quickly after intermission.",
            healer = "Heavy healing during Burning Gale intermission. Pre-HoT group before it starts. Save major CD for intermission.",
            dps = "Drop Updraft puddles at arena edges — center puddles = twisters everywhere during intermission. Dodge Fire Breath rotations. Maintain uptime between intermissions.",
            positioning = "Puddles at edges. During intermission, rotate COUNTER-clockwise to stay ahead of Fire Breath. Avoid twisters from puddles.",
            wipes = "Puddles in center (twisters cover entire room). Getting hit by rotating Fire Breath. Healer OOM from sustained intermission damage.",
            tyrannical = "Burning Gale damage is extreme — need healing cooldown rotation. Fire Breath one-shots. Searing Beak DoT is brutal on tanks.",
        },
        {
            name = "Derelict Duo",
            order = 2,
            contentType = "dungeon",
            bossType = "Dual boss encounter (Kalis and Latch)",
            tldr = "Cleave both evenly. Killing one = Broken Bond enrage. INTERRUPT Kalis's Shadow Bolt. KEY MECHANIC: Debilitating Shriek is unstoppable UNLESS Latch's Heaving Yank hook hits Kalis — marked player must position so Kalis is between them and Latch.",
            abilities = {
                { name = "Broken Bond", desc = "Remaining boss gains +50% stacking damage every 5 seconds when one dies. KILL TOGETHER." },
                { name = "Shadow Bolt (Kalis)", desc = "INTERRUPT on rotation. Most dangerous single cast in the fight." },
                { name = "Curse of Darkness", desc = "Removable curse. If not decursed, summons a dark entity add that fixates on cursed player." },
                { name = "Debilitating Shriek (Kalis)", desc = "At 100 energy, Kalis channels ramping Shadow damage. CANNOT be interrupted by players. Only stopped by Latch's Heaving Yank hitting her." },
                { name = "Heaving Yank (Latch)", desc = "CORE MECHANIC. Latch throws a hook at a marked player. Hook hits the FIRST target in its path. Marked player must position so KALIS is between them and Latch — hook intercepts Kalis, stunning her for 6 sec and ending the Shriek." },
                { name = "Splattering Spew (Latch)", desc = "Bile creating ground hazards. Requires loose spread along arena perimeter." },
                { name = "Bone Hack (Latch)", desc = "Tank channel requiring defensive." },
            },
            tank = "Even cleave both. Defensive for Bone Hack. During Debilitating Shriek, ensure Kalis is between marked player and Latch for hook intercept.",
            healer = "Decurse Curse of Darkness ASAP. Heavy healing during Shriek if hook misses. Group healing during Splattering Spew.",
            dps = "Maintain even damage on both. INTERRUPT Shadow Bolt. During Shriek, marked player positions so Kalis is in Heaving Yank's path. Spread for Splattering Spew.",
            positioning = "Bosses stacked for cleave. During Shriek: marked player runs to opposite side of Kalis from Latch so hook intercepts her. Spread for Spew.",
            wipes = "Heaving Yank missing Kalis (Shriek ramps to lethal). Uneven damage leading to Broken Bond. Uninterrupted Shadow Bolt. Undecursed Curse of Darkness.",
            tyrannical = "Shadow Bolt one-shots if not interrupted. Shriek ramps extremely fast — must land Heaving Yank quickly. Broken Bond stacks make surviving impossible if bosses die unevenly.",
        },
        {
            name = "Commander Kroluk",
            order = 3,
            contentType = "dungeon",
            bossType = "Single target with add waves at 66% and 33%",
            tldr = "Bait Reckless Leap at ranged (targets furthest player). Add waves at 66% and 33% — INTERRUPT Chain Lightning on Phantasmal Mystic. Bladestorm fixates a player — kite away.",
            abilities = {
                { name = "Reckless Leap", desc = "Back-to-back leaps targeting furthest player. Coordinate baiting with ranged." },
                { name = "Rampage", desc = "Channel requiring tank defensive." },
                { name = "Intimidating Shout", desc = "Group loosely." },
                { name = "Rallying Bellow (66% and 33%)", desc = "Summons Spectral Axe Thrower, Phantasmal Mystic, and 4 Haunting Grunts." },
                { name = "Bladestorm", desc = "Fixates a player. Kite away from group." },
                { name = "Chain Lightning (Mystic)", desc = "INTERRUPT on rotation. High priority. Mystic enrages at 50%." },
            },
            tank = "Collect spawned adds. Defensive for Rampage. Coordinate Reckless Leap baiting with ranged DPS.",
            healer = "Defensives for add phase overlap. Monitor Bladestorm fixate target.",
            dps = "INTERRUPT Chain Lightning on Mystics. Kill adds quickly. Have ranged bait Reckless Leap (furthest player targeted).",
            positioning = "Ranged at max distance to bait Reckless Leap. Tank collects add spawns. Bladestorm target kites away from group.",
            wipes = "Uninterrupted Chain Lightning from Mystics. Add packs overwhelming group. Reckless Leap landing on stacked melee.",
            tyrannical = "Chain Lightning is lethal. Add HP is massive. Reckless Leap can one-shot. Bladestorm damage is extreme on fixated player.",
        },
        {
            name = "The Restless Heart",
            order = 4,
            contentType = "dungeon",
            bossType = "Single target, stacking debuff + arena control",
            tldr = "Squall Leap applies permanent stacking Nature DoT (NEVER falls off). Clear stacks by walking through Turbulent Arrow puddles (launches you airborne). At 100 energy, Bullseye Windblast shockwave — jump on an Arrow puddle to go airborne and dodge it.",
            abilities = {
                { name = "Squall Leap", desc = "Every boss leap applies stacking Nature DoT to non-tank players. NEVER FALLS OFF naturally. Clear by triggering Turbulent Arrows." },
                { name = "Arrow Rain", desc = "Channel creating Turbulent Arrow puddles. These are your lifeline for clearing Squall Leap." },
                { name = "Turbulent Arrows", desc = "Standing on one = detonation, knocked airborne, clears Squall Leap stacks. Creates Storming Soulfont pool after." },
                { name = "Gust Shot", desc = "Marks all non-tank players. 8-yard eruption after 6 seconds. Spread loosely AND destroys Storming Soulfonts it overlaps." },
                { name = "Bolt Gale", desc = "5-second frontal cone at random player. Side-step out." },
                { name = "Tempest Slash", desc = "Tank knockback + 100% physical damage taken debuff for 10 seconds. Major defensive." },
                { name = "Bullseye Windblast", desc = "At 100 energy: expanding ring shockwave from arena edge. Jump on Turbulent Arrow to go airborne and dodge. Hit = severe DoT + 5-sec stun." },
            },
            tank = "Major defensive for Tempest Slash (100% physical damage increase 10 seconds). Position to keep arena manageable.",
            healer = "Monitor Squall Leap stacks on all players — remind them to clear at 2-3 stacks. Heavy healing through Bolt Gale targets.",
            dps = "Clear Squall Leap stacks PROACTIVELY at 2-3 stacks, don't wait. SAVE at least one Turbulent Arrow for Bullseye Windblast dodge. Spread for Gust Shot to clear Soulfont clutter.",
            positioning = "Always know where nearest Turbulent Arrow is. Spread for Gust Shot. During Bullseye Windblast, everyone needs an arrow to jump on.",
            wipes = "Squall Leap stacking to lethal (forgot to clear). No Turbulent Arrows available during Bullseye Windblast. Arena filled with Storming Soulfonts. Bolt Gale frontal hitting multiple players.",
            tyrannical = "Squall Leap DoT ticks are massive per stack. Bullseye Windblast stun is a death sentence. Tempest Slash one-shots tanks without major CD. Must proactively manage every mechanic.",
        },
    },
}

----------------------------------------------------------------------
-- DUNGEON 5: ALGETH'AR ACADEMY (30:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Algeth'ar Academy",
    trashNotes = "Alpha Eagle — INTERRUPT Raging Screech, dodge Gust frontal, soothe enrage. Arcane Ravager — INTERRUPT immediately, dodge Vicious Ambush leap, sidestep Rift Breath frontal. Corrupted Manafiend — INTERRUPT Surge, avoid Mana Void cleave. Unruly Textbook — INTERRUPT Monotonous Lecture. Guardian Sentry — dodge Deadly Winds tornadoes, LoS Expel Intruders AoE.",
    bosses = {
        {
            name = "Overgrown Ancient",
            order = 1,
            contentType = "dungeon",
            bossType = "Single target with add management",
            tldr = "Germinate spawns seeds under players that become Hungry Lashers. At 100 energy Burst Forth activates ALL lashers. Kill Ancient Branch adds — INTERRUPT their Healing Touch. Stand in Abundance circles to cleanse Splinterbark bleed.",
            abilities = {
                { name = "Germinate", desc = "Channel spawning seeds under every player every second for 4 seconds. Seeds become dormant Hungry Lashers." },
                { name = "Branch Out", desc = "Spawns Ancient Branch add. INTERRUPT Healing Touch cast." },
                { name = "Abundance", desc = "Circle on add death. Stand in it to cleanse Splinterbark bleed stacks." },
                { name = "Burst Forth", desc = "At 100 energy: activates ALL dormant Hungry Lashers." },
                { name = "Barkbreaker", desc = "Physical damage amp debuff. Dangerous with active Lashers." },
                { name = "Splinterbark", desc = "Stacking bleed DoT. Cleanse by standing in Abundance circles." },
            },
            tank = "Pick up Lashers quickly after Burst Forth. Defensive for Barkbreaker. Position for cleave.",
            healer = "Burst healing when Lashers activate. Manage Splinterbark bleeds. Poison dispels on Lasher debuffs.",
            dps = "INTERRUPT Healing Touch on Ancient Branch. Kill adds immediately. Step in Abundance circles for bleed cleanse. Group during Germinate to concentrate Lasher spawns for AoE.",
            positioning = "Stay grouped during Germinate (concentrate Lasher spawns). Move together. Use Abundance circles.",
            wipes = "Uncontrolled Lasher stacking. Missed Healing Touch interrupts. Not using Abundance circles. Barkbreaker + active Lashers.",
            tyrannical = "Lasher HP is massive. Healing Touch heals for huge amounts if missed. Splinterbark bleeds stack dangerously fast.",
        },
        {
            name = "Crawth",
            order = 2,
            contentType = "dungeon",
            bossType = "Single target with sports minigame",
            tldr = "Dodge Wind Chakrams and tornadoes. At 75% and 45%, score 3 goals to stop Ruinous Winds. Goal of Searing Blaze stuns Crawth + boss takes 75% more damage for 12 sec (use ALL CDs!). STOP CASTING before Deafening Screech or 6-sec silence.",
            abilities = {
                { name = "Savage Peck", desc = "Tank hit with 10-second stacking Physical DoT. Defensive every cast." },
                { name = "Overpowering Gust", desc = "Random target frontal knockback. Sidestep." },
                { name = "Deafening Screech", desc = "AoE with 6-sec silence if casting when hit. STOP CASTING before it lands. Applies Sonic Vulnerability (50% increased Screech damage, stacks)." },
                { name = "Ruinous Winds", desc = "At 75% and 45% — score 3 goals to interrupt or wipe." },
                { name = "Goal of Searing Blaze", desc = "Scoring triggers Firestorm — stuns Crawth and boss takes 75% INCREASED DAMAGE for 12 sec (Blistering Fire). Also pulses fire damage to group. USE ALL DPS CDs during this window." },
                { name = "Goal of Rushing Winds", desc = "Scoring triggers Gale Force (haste buff). Spawns permanent Roving Cyclones + damage motes — grab motes for DPS boost." },
            },
            tank = "Defensive for every Savage Peck (stacking DoT). Position for goal throws. Stop casting before Screech.",
            healer = "CDs for Deafening Screech DoT. Heavy healing during goal phases. STOP CASTING before Screech (silence).",
            dps = "Coordinate ball throws into goals (3 needed). Searing Blaze goal = use ALL CDs during damage amp. STOP CASTING before Deafening Screech. Grab damage motes from Rushing Winds.",
            positioning = "Loose spread for Screech. Regroup for goal throws. Avoid tornadoes.",
            wipes = "Missed ball throws (Ruinous Winds kills everyone). Casting during Screech (silence). Poor goal coordination.",
            tyrannical = "Savage Peck stacking DoT is brutal. Screech damage one-shots with Sonic Vulnerability stacks. Goal throws must be perfect.",
        },
        {
            name = "Vexamus",
            order = 3,
            contentType = "dungeon",
            bossType = "Single target with orb soak",
            tldr = "5 Arcane Orbs spawn at edges — soak before they reach boss. Soaking applies Oversurge debuff (limits how many one player takes). Mana Bombs on 3 players = drop puddles at edges. Arcane Fissure at 100 energy = dodge expanding circles.",
            abilities = {
                { name = "Arcane Orbs", desc = "5 orbs spawn at edges, drift toward boss. Soak before reaching boss. Soaking applies Oversurge debuff." },
                { name = "Oversurge", desc = "Debuff from soaking. Limits how many orbs one player can take. Rotate soakers." },
                { name = "Arcane Expulsion", desc = "Tank frontal. Point away from group." },
                { name = "Mana Bombs", desc = "3 random players targeted. Drop puddles at edges." },
                { name = "Arcane Fissure", desc = "At 100 energy: 3 expanding circles with knockback. Spread and avoid." },
            },
            tank = "Position Expulsion frontal away from group. Help soak orbs if DPS have Oversurge.",
            healer = "Manage Mana Bomb damage. Prep for Arcane Fissure burst. Monitor Oversurge stacking.",
            dps = "Spread around arena to cover orb soaking. Drop Mana Bomb puddles at edges. Rotate who soaks (Oversurge limits).",
            positioning = "Spread at arena edges for orb coverage. Edges for Mana Bomb puddles. Dodge Fissure circles.",
            wipes = "Multiple orbs reaching boss. Clustered Mana Bomb puddles in center. One player soaking too many orbs (Oversurge kills).",
            tyrannical = "Orbs have more energy — faster travel. Oversurge debuff ticks harder. Arcane Fissure knockback into puddles is lethal.",
        },
        {
            name = "Echo of Doragosa",
            order = 4,
            contentType = "dungeon",
            bossType = "Single target with rift management",
            tldr = "Nearly everything gives Overwhelming Power stacks (5% damage buff per stack). At 3 stacks, you drop an Arcane Rift under yourself. Power Vacuum pulls everyone toward boss and rifts. MANAGE RIFT PLACEMENT or arena becomes unplayable.",
            abilities = {
                { name = "Unleash Energy", desc = "On pull: spawns 2 Arcane Rifts shooting Uncontrolled Energy orbs." },
                { name = "Overwhelming Power", desc = "Stacking buff from ANY hit. 5% damage per stack. At 3 stacks = drops Arcane Rift at your location." },
                { name = "Energy Bomb", desc = "Random target AoE. Loose spread." },
                { name = "Arcane Missiles", desc = "Random target chain. Can combo with Energy Bomb." },
                { name = "Power Vacuum", desc = "Pulls all players toward boss. Don't get pulled through rifts." },
                { name = "Astral Blast", desc = "Tank hit. Creates rift if tank at 2+ stacks." },
            },
            tank = "Pull boss toward entrance (away from initial rifts). Major defensive for Astral Blast. Escape Power Vacuum pull. Manage your Overwhelming Power stacks.",
            healer = "Top group before pull. Manage combo damage from Missiles + Energy Bomb. CD for Power Vacuum recovery.",
            dps = "Spread for Energy Bomb. Place rifts strategically when at 2 stacks (drop it at edge before 3rd stack forces it). Dodge Uncontrolled Energy orbs from rifts.",
            positioning = "Start at entrance. Rifts at edges ALWAYS. Be aware of Power Vacuum pull direction relative to rifts.",
            wipes = "Rifts blocking all safe space (poor placement). Power Vacuum pulling players through rifts. Combo damage from simultaneous mechanics.",
            tyrannical = "Rifts deal much more damage. Power Vacuum pull is stronger. Astral Blast can one-shot tanks. Rift placement is THE fight.",
        },
    },
}

----------------------------------------------------------------------
-- DUNGEON 6: SEAT OF THE TRIUMVIRATE (34:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Seat of the Triumvirate",
    trashNotes = "Merciless Subjugators (CC IMMUNE, 4-pack) — Chains of Subjugation on all players, use defensives. Dark Conjuror — INTERRUPT Summon Voidcaller (EVERY cast). Bound Voidcaller (CC IMMUNE) — constant Pulsing Void group damage. Rift Wardens (CC IMMUNE, 4-pack) — fight within 30 yards of rift or lethal explosion, dispel Rift Essence. Shadowguard Champions — soothe Battle Rage. Dire Voidbender — INTERRUPT/PURGE Abyssal Enhancement every cast.",
    bosses = {
        {
            name = "Zuraal the Ascended",
            order = 1,
            contentType = "dungeon",
            bossType = "Single target with add management",
            tldr = "Drop Decimate puddles at edges. Kill/CC Coalesced Void oozes before they reach boss. Crashing Void speeds up oozes + pulls players in + explodes. Dodge Null Palm frontal.",
            abilities = {
                { name = "Decimate", desc = "Targets random player, boss leaps creating persistent puddle. Drop at edges or overlap existing." },
                { name = "Void Slash", desc = "Tank combo attack. Heavy damage. Requires defensive." },
                { name = "Null Palm", desc = "Random frontal. Dodge." },
                { name = "Oozing Slam", desc = "Group DoT + spawns 2 Coalesced Void adds that move toward boss. Slow/stun/knockback them." },
                { name = "Crashing Void", desc = "Speeds up oozes, pulls players in, explodes for group damage + knockback. Kill adds before this." },
            },
            tank = "Defensive for Void Slash combos. Position boss to manage puddle space.",
            healer = "Top group before Crashing Void. Sustained healing through Oozing Slam DoT.",
            dps = "PRIORITY: Kill Coalesced Void adds before Crashing Void. Use CC (stuns, knockbacks, slows). Manage puddle positioning at edges.",
            positioning = "Puddles at edges. Keep arena clean. Adds must not reach boss during Crashing Void.",
            wipes = "Oozes reaching boss during Crashing Void. Puddle accumulation. Crashing Void on low HP group.",
            tyrannical = "Crashing Void explosion is lethal. Void Slash combo can one-shot tanks. Ooze HP is much higher — CC is essential.",
        },
        {
            name = "Saprish",
            order = 2,
            contentType = "dungeon",
            bossType = "Boss + 2 pets (shared health)",
            tldr = "Stack boss with pets for cleave. Void Bombs on floor — cleave with Phase Dash circles. INTERRUPT Dread Screech on Shadewing pet. Top group before Overload.",
            abilities = {
                { name = "Void Bomb", desc = "Environmental hazard. Cleave with Phase Dash circles to remove." },
                { name = "Phase Dash", desc = "Creates circles that remove Void Bombs. Also triggers heavy group damage." },
                { name = "Overload", desc = "Heavy group damage cast. Must be topped before it lands. Applies DoT." },
                { name = "Dread Screech (Shadewing)", desc = "INTERRUPT on rotation. Assign 2+ interrupts, preferably ranged alternating." },
                { name = "Shadow Pounce (Darkfang)", desc = "Random target damage with bleed. Cleanse or defensive." },
            },
            tank = "Stack boss with pets for cleave. Soak remaining Void Bombs with immunity if available.",
            healer = "Top group before Phase Dash and Overload. Manage Shadow Pounce bleed. Stagger CDs.",
            dps = "Cleave pets with boss. Maintain Dread Screech interrupt rotation. Clear Void Bombs via Phase Dash circles.",
            positioning = "Stack everything together for cleave. Spread during Phase Dash for Void Bomb coverage.",
            wipes = "Unmanaged Void Bombs detonating. Failed Dread Screech interrupts overlapping Phase Dash. Not topped for Overload.",
            tyrannical = "Overload can wipe without healing CD. Dread Screech damage is massive. Shadow Pounce bleed is brutal.",
        },
        {
            name = "Viceroy Nezhar",
            order = 3,
            contentType = "dungeon",
            bossType = "Single target with portals + tentacles",
            tldr = "Portals (Gates of the Abyss) fire Umbral Waves — dodge projectiles. INTERRUPT Mind Blast on tank. At 100 energy = Collapsing Void, everyone must stand DIRECTLY UNDER boss to survive. Kill Umbral Tentacles fast.",
            abilities = {
                { name = "Gates of the Abyss", desc = "3 portals spawn near boss emitting Umbral Waves. Dodge projectiles." },
                { name = "Mass Void Infusion", desc = "Targets 3 players with damage. Use defensives." },
                { name = "Mind Blast", desc = "Tank-targeted. INTERRUPT. Deals very high damage." },
                { name = "Umbral Tentacles", desc = "5 tentacles channeling Mind Flay on different targets. Cleave fast." },
                { name = "Collapsing Void", desc = "At 100 energy: STACK UNDER BOSS. Only safe zone. Heavy group damage." },
            },
            tank = "INTERRUPT Mind Blast on rotation. Position to avoid gates. Stand under boss for Collapsing Void.",
            healer = "CDs for Tentacle phase and Collapsing Void. Major CDs at channel end.",
            dps = "Cleave tentacles fast. Burst during Collapsing Void. Interrupt Mind Blast if tank interrupt is on CD. Dodge Umbral Waves from portals.",
            positioning = "Stay near boss. Dodge gate projectiles. STACK UNDER BOSS during Collapsing Void — only safe zone.",
            wipes = "Failed Mind Blast interrupts (tank death). Not under boss during Collapsing Void. Tentacles living too long. Gate projectiles during movement.",
            tyrannical = "Collapsing Void is instant death outside safe zone. Mind Blast one-shots if not interrupted. Tentacles deal extreme damage.",
        },
        {
            name = "L'ura",
            order = 4,
            contentType = "dungeon",
            bossType = "Single target with musical note mechanic",
            tldr = "Dirge of Despair spawns 6 Notes of Despair pulsing group damage. Players get Discordant Beam — shoot Notes to silence them. Silence all 6 or stacking Anguish from Grim Chorus wipes. Dodge rotating Disintegrate beams. Tank swap at 3 Abyssal Lance stacks.",
            abilities = {
                { name = "Dirge of Despair", desc = "Group hit spawning 6 Notes of Despair (constant pulsing group damage while active)." },
                { name = "Discordant Beam", desc = "Players targeted can shoot active Notes to silence them (massively reducing damage)." },
                { name = "Siphon Void (Alleria)", desc = "Cast by Alleria (NPC ally) after all Notes silenced. Stuns L'ura and boss takes 200% INCREASED DAMAGE for 20 sec — USE ALL DAMAGE CDs during this window." },
                { name = "Grim Chorus", desc = "Repositions Notes. Circles around active Notes. Applies stacking Anguish debuff." },
                { name = "Disintegrate", desc = "Rotating beams around boss. Constant movement required." },
                { name = "Abyssal Lance", desc = "Tears open void rifts every 4 sec. After 3 portals, lances strike the tank for heavy Shadow damage. Requires major tank defensive — NOT a swap mechanic." },
            },
            tank = "Major defensive for every 3rd Abyssal Lance (heavy Shadow hit). Monitor rotating Disintegrate beams. Position for Note shooting.",
            healer = "Spread CDs across Note phases. Major CDs for Grim Chorus when Anguish stacks escalate.",
            dps = "Coordinate Discordant Beam to silence all 6 Notes efficiently. Burst during Siphon Void window (boss takes more damage). Dodge rotating Disintegrate beams.",
            positioning = "Spread for beam avoidance. Stack near Notes when shooting with Discordant Beam. Constant movement during Disintegrate.",
            wipes = "Notes not silenced (Grim Chorus + Anguish = unsurvivable). Abyssal Lance without defensive (3rd hit kills tank). Standing in Disintegrate beams. Missing Siphon Void burst window.",
            tyrannical = "Note silencing is harder (more damage while active). Anguish stacks much faster. Abyssal Lance 3rd hit is lethal without major CD. Disintegrate beams one-shot. Must execute Note mechanic perfectly.",
        },
    },
}

----------------------------------------------------------------------
-- DUNGEON 7: SKYREACH (28:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Skyreach",
    trashNotes = "Adorned Bladetalon (CC IMMUNE, HIGH PRIORITY) — Blade Rush dashes to 2 players + tank, heavy damage + bleed, cleanse bleeds. Dread Raven (CC IMMUNE) — Dread Wind knockback (PLATFORM EDGE THREAT). Solar Elemental (CC IMMUNE) — Solar Orb spawns, KILL IMMEDIATELY. Driving Gale-Caller — INTERRUPT Repel every cast. Blinding Sun Priestess — INTERRUPT Blinding Light, PURGE Solar Barrier. Outcast Warrior — PURGE Rushing Winds.",
    bosses = {
        {
            name = "Ranjit",
            order = 1,
            contentType = "dungeon",
            bossType = "Single target, movement gauntlet on platform",
            tldr = "Dodge Four Winds (4 rotating wind trails), Windwall (rotating wind zones), and Wind Chakrams. Fan of Blades bleeds entire group. Platform has EDGES — knockbacks kill. Pure movement fight.",
            abilities = {
                { name = "Four Winds", desc = "MAJOR MECHANIC. Massive vortex with 4 rotating wind trails extending from boss. Find gaps between them. Getting hit = heavy Nature damage." },
                { name = "Windwall", desc = "Creates rotating wind zones dealing Nature damage on contact. Dodge through gaps in the wall." },
                { name = "Wind Chakram", desc = "Projectile hurled at random player, returns to boss. Sidestep it." },
                { name = "Chakram Vortex", desc = "Powerful wind chakram thrown to center creating tornadoes. Dodge them." },
                { name = "Fan of Blades", desc = "Bleeds ALL players. Healing CDs or bleed cleanse required." },
                { name = "Gale Surge", desc = "Wind orbs with knockback. DANGEROUS near platform edges — can push you off." },
            },
            tank = "Position away from edges. Keep boss centered. Don't get knocked off by Gale Surge.",
            healer = "Healing CDs for Fan of Blades bleeds. Monitor knockback proximity to edges.",
            dps = "Focus on avoiding mechanics. Dodge tornadoes and chakrams. Stay away from edges.",
            positioning = "Center of platform. Maximum distance from edges. Track wind orb positions.",
            wipes = "Knockback off the platform. Overlapping tornado + chakram + Fan of Blades. Too close to edges.",
            tyrannical = "Fan of Blades bleed ticks are extreme. Gale Surge knockback distance increased. One mistake near edge = death.",
        },
        {
            name = "Araknath",
            order = 2,
            contentType = "dungeon",
            bossType = "Single target, DPS check with beam interception",
            tldr = "3 beams from Lesser Constructs point at boss, healing him. Players MUST stand in beams to intercept (take damage yourself). If beams reach boss, Supernova damage scales up. Tank MUST stay in melee (Blast Wave punish).",
            abilities = {
                { name = "Blast Wave", desc = "Punishes tank for leaving melee range. STAY IN MELEE." },
                { name = "Defensive Protocol", desc = "5-yard AoE under boss. Step out briefly then return." },
                { name = "Energize", desc = "Beams from Lesser Constructs toward boss (3 sets). Players intercept with defensives." },
                { name = "Fiery Smash", desc = "Line attack. Tank positions away from intercepting players." },
                { name = "Supernova", desc = "High damage scaling up if Energize beams reached boss." },
            },
            tank = "NEVER leave melee range (Blast Wave). Position Fiery Smash away from beam interceptors. Defensive for combo hits.",
            healer = "Track beam intercept damage. Group defensives for Supernova if beams leaked through.",
            dps = "Rotate through beam interception. Use personal defensives when soaking beams. Priority: prevent beams from reaching boss.",
            positioning = "Non-tanks form interception line between adds and boss. Tank angles line attacks away from interceptors.",
            wipes = "Beams reaching boss (Supernova one-shots). Tank leaving melee (Blast Wave). No defensive rotation for beam soaking.",
            tyrannical = "Supernova with even 1 leaked beam is lethal. Beam soak damage is extreme. Tank must have perfect melee uptime.",
        },
        {
            name = "Rukhran",
            order = 3,
            contentType = "dungeon",
            bossType = "Single target solar phoenix with adds",
            tldr = "Kill Sunwing adds from Sunbreak AWAY from eggs (they respawn near eggs). Tank MUST stay in melee or Screech triggers. HIDE behind central pillar during Searing Quills — lethal if caught in open.",
            abilities = {
                { name = "Sunbreak", desc = "Spawns Sunwing add with Burning Pursuit fixate on random player." },
                { name = "Burning Pursuit", desc = "Sunwing fixates random player. Add pulses heavy group damage." },
                { name = "Screech", desc = "Only cast if tank NOT in melee range. Stay in melee to prevent." },
                { name = "Searing Quills", desc = "HIDE behind central pillar. Lethal if caught in the open." },
                { name = "Burning Claws", desc = "Tank hit. Defensive for every cast." },
            },
            tank = "Stay in melee ALWAYS (except pillar phase). Defensive for every Burning Claws. Return immediately after pillar.",
            healer = "Monitor Sunwing fixate target. Group healing during Burning Pursuit. CD for Searing Quills transition.",
            dps = "SWAP to Sunwing adds immediately. Kill adds AWAY from egg clusters (they respawn near eggs). Get behind pillar FAST for Searing Quills.",
            positioning = "Kill Sunwings far from eggs. ALL behind central pillar during Searing Quills. Tank in melee at all other times.",
            wipes = "Sunwing killed near eggs (respawns = overwhelming). Standing in open during Searing Quills. Tank out of melee. Multiple Sunwings alive.",
            tyrannical = "Sunwing HP is massive. Searing Quills instant death in open. Burning Claws hits extremely hard. Burning Pursuit group damage is intense.",
        },
        {
            name = "High Sage Viryx",
            order = 4,
            contentType = "dungeon",
            bossType = "Single target with platform edge mechanics",
            tldr = "Cast Down drags player toward edge — kill the Cast Down add or player dies. Lens Flare beam follows player leaving PERMANENT fire trail. INTERRUPT Solar Blast on rotation. Platform edges = death.",
            abilities = {
                { name = "Scorching Ray", desc = "Targets 3 players with repeated damage. Requires healing CDs." },
                { name = "Cast Down", desc = "Drags random player toward platform edge. Kill the Cast Down add fast or player falls off and dies." },
                { name = "Lens Flare", desc = "Beam follows player, leaving PERMANENT fire trail. Position carefully — arena shrinks." },
                { name = "Solar Blast", desc = "INTERRUPT on rotation. Increases tank damage taken." },
            },
            tank = "Maintain Solar Blast interrupt rotation. Stay aware of platform edges. Defensive if interrupt missed.",
            healer = "Track Scorching Ray targets (3 at once). Burst heal Cast Down targets. Stay central.",
            dps = "INTERRUPT Solar Blast. Stun/kill Cast Down adds immediately. Move Lens Flare beam to platform EDGES (fire trail is permanent). Use movement CDs.",
            positioning = "Cast Down targets run TOWARD ENTRANCE (away from edges). Lens Flare to edges. Stay away from platform edges at all times.",
            wipes = "Cast Down dragging player off. Lens Flare fire covering walkable area. Missed Solar Blast interrupts. Edges.",
            tyrannical = "Cast Down add has massive HP. Lens Flare trail persists forever — arena management. Solar Blast one-shots. Scorching Ray on 3 targets simultaneously is extreme.",
        },
    },
}

----------------------------------------------------------------------
-- DUNGEON 8: PIT OF SARON (30:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Pit of Saron",
    trashNotes = "Dreadpulse Lich (CC IMMUNE, EXTREMELY HIGH PRIORITY) — INTERRUPT Icy Blast, at 50% applies Dread Pulse constant AoE, Torrent of Misery needs defensives. Arcanist Cadaver — INTERRUPT Netherburst every cast. Rimebone Coldwraith — INTERRUPT Icebolt, DISPEL Permeating Cold. Glacieth Miniboss (CC IMMUNE) — Cryoburst spread, use damage CDs. Quarry Tormentors — DECURSE. Rotting Ghouls — disease stacks on tank.",
    bosses = {
        {
            name = "Forgemaster Garfrost",
            order = 1,
            contentType = "dungeon",
            bossType = "Single target, LoS mechanic",
            tldr = "Boss throws Saronite Ore at players — these become LoS objects. HIDE behind Saronite Ore during Glacial Overload or die. Orebreaker = major tank hit (must be near Saronite for stun protection). Cryostomp destroys all Saronite + sends Cryoshards.",
            abilities = {
                { name = "Throw Saronite", desc = "Targets 2 players with circles. Creates Saronite Ore on the ground — these are your LoS objects for Glacial Overload. Don't overlap circles." },
                { name = "Saronite Ore", desc = "Destructible objects created by Throw Saronite. HIDE BEHIND these during Glacial Overload. Don't destroy them prematurely — you need them." },
                { name = "Orebreaker", desc = "MAJOR tank hit — devastating mace slam with stun. Must be near Saronite Ore to block the stun effect. Requires defensive." },
                { name = "Glacial Overload", desc = "At 100 energy, boss channels massive frost AoE. HIDE behind Saronite Ore for LoS protection. Applies stacking 75% frost damage taken debuff." },
                { name = "Cryostomp", desc = "AoE physical damage that DESTROYS all Saronite Ore. Sends out Cryoshards increasing frost damage taken. Applies magic debuff to 2 players — dispel." },
                { name = "Siphoning Chill", desc = "Constant frost damage aura. Increased by magic debuffs — dispel Cryostomp debuff fast." },
            },
            tank = "Position near Saronite Ore for Orebreaker stun block. Major defensive for Orebreaker. Face boss away. Get Cryostomp magic debuff dispelled fast.",
            healer = "Spike healing on magic-debuffed targets (Siphoning Chill + Cryostomp debuff). Dispel magic debuffs immediately. Top group before Glacial Overload.",
            dps = "Spread Throw Saronite circles — don't overlap. Don't destroy Saronite Ore prematurely. Get behind Saronite for Glacial Overload. Save CDs for burn windows.",
            positioning = "Near Saronite Ore for LoS. Tank keeps boss near Saronite for Orebreaker protection. Group LoS behind Saronite during Glacial Overload.",
            wipes = "Full Glacial Overload damage (not behind Saronite Ore). Saronite destroyed before Overload. Orebreaker without Saronite nearby (stun + big hit). Magic debuff undispelled.",
            tyrannical = "Glacial Overload one-shots without LoS. Orebreaker can one-shot without defensive. Cryostomp magic debuff + Siphoning Chill is lethal without instant dispel.",
        },
        {
            name = "Ick and Krick",
            order = 2,
            contentType = "dungeon",
            bossType = "Dual boss (shared health), chaos fight",
            tldr = "Shared health via Necrolink — cleave both. Shade Shift spawns Shades — INTERRUPT their Shadowbind. Ick fixates random player (Get 'em, Ick!). INTERRUPT Death Bolt. Manage puddles from Plague Explosion and Blight Smash.",
            abilities = {
                { name = "Necrolink", desc = "Shared health. Cleave both." },
                { name = "Shade Shift", desc = "Creates 2 Shades of Krick. INTERRUPT Shadowbind cast." },
                { name = "Death Bolt (Krick)", desc = "INTERRUPT on random players. Priority interrupt." },
                { name = "Blight Smash", desc = "Tank ability creating puddle. Drop at edges." },
                { name = "Plague Explosion", desc = "4 random players get puddles underneath. Move out." },
                { name = "Get 'em, Ick!", desc = "Ick fixates random player for 7 seconds. Repeats over 28-second window. Kite." },
            },
            tank = "Defensive for Blight Smash. Drop puddles at edges. Position for cleave.",
            healer = "Pre-position for Plague Explosion. Group defensives during heavy puddle phases.",
            dps = "INTERRUPT Shadowbind on Shades. INTERRUPT Death Bolt on Krick. Cleave both. Kite during fixate. Save CDs for non-kiting windows.",
            positioning = "Pre-position before Plague Explosion. Stay mobile for fixate. Keep arena clean of puddles.",
            wipes = "Puddles covering all safe space. Missed Death Bolt interrupts. Missed Shadowbind on Shades. Group caught during fixate.",
            tyrannical = "Death Bolt one-shots. Shadowbind is lethal. Fixate damage is extreme. Puddle management is critical.",
        },
        {
            name = "Scourgelord Tyrannus",
            order = 3,
            contentType = "dungeon",
            bossType = "Single target with Rimefang air support + bone pile management",
            tldr = "Rimefang fires Rime Blast at players — position so blast FREEZES nearby Infused Bone Piles (prevents Plaguespreader spawns). Bone Infusion creates Infused Piles. Army of the Dead activates all piles. INTERRUPT Plague Bolt. Brand = knockback + 200% shadow debuff + Reckoning leap.",
            abilities = {
                { name = "Bone Infusion", desc = "CORE SETUP MECHANIC. Tyrannus stomps necrotic energy, turning some Bone Piles into Infused Bone Piles. Infused piles spawn deadly Plaguespreaders during Army of the Dead. Regular piles spawn weaker Rotlings." },
                { name = "Rime Blast (Rimefang)", desc = "Rimefang targets a PLAYER with ice blast. As secondary effect, FREEZES nearby Bone Piles. Position so Rime Blast hits near Infused Bone Piles to freeze them (frozen piles don't spawn Plaguespreaders during Army)." },
                { name = "Ice Barrage (Rimefang)", desc = "Barrage of ice chunks at players. Dodge circles." },
                { name = "Army of the Dead", desc = "At 100 energy, raises undead from all Bone Piles. Unfrozen Infused Piles = Plaguespreaders. Frozen/Regular Piles = Rotlings." },
                { name = "Plaguespreader", desc = "Passive Festering Pulse = constant heavy group damage (NOT interruptible). INTERRUPT Plague Bolt (single-target, IS interruptible). Kill ASAP." },
                { name = "Rotling", desc = "Applies Rotting Strikes disease stacks on tank, reducing max health per hit. Dispel disease." },
                { name = "Scourgelord's Brand", desc = "Knocks tank away + applies 200% increased Shadow damage taken for 6 sec. Followed by Scourgelord's Reckoning — boss leaps to branded tank's landing location, 10-yard AoE. Angle knockback AWAY from group." },
                { name = "Death's Grasp", desc = "Hands of the dead emerge at player locations dealing Shadow damage and slowing. Dodge circles." },
            },
            tank = "Angle Scourgelord's Brand knockback AWAY from group (Reckoning leaps to your landing spot). Use major defensive for Brand (200% shadow damage taken). Manage Rotting Strikes disease stacks.",
            healer = "Dispel disease stacks on tank. Prep for Festering Pulse (constant group damage from Plaguespreaders). Heavy healing during add phases. Branded tank takes 200% more shadow.",
            dps = "Position so Rime Blast freezes Infused Bone Piles (stand near them when targeted). SWAP to Plaguespreaders immediately. INTERRUPT every Plague Bolt. Cleave Rotlings.",
            positioning = "Stand near Infused Bone Piles when targeted by Rime Blast (freezes them). Tank angles Brand knockback away from group. Dodge Death's Grasp circles and Ice Barrage.",
            wipes = "Infused Piles not frozen before Army (multiple Plaguespreaders). Disease stacks undispelled. Missed Plague Bolt interrupts. Brand + Reckoning landing on group. Multiple Plaguespreaders alive (Festering Pulse stacking).",
            tyrannical = "Plague Bolt one-shots if not interrupted. Festering Pulse with multiple Plaguespreaders is unhealable. Scourgelord's Reckoning + Brand debuff is lethal. Bone Pile management is THE fight.",
        },
    },
}

----------------------------------------------------------------------
-- Season-wide M+ notes
----------------------------------------------------------------------
D.mplusNotes = {
    "AFFIXES: Tyrannical/Fortified at +7-9 (one active). Both active at +10-12.",
    "XALATATH'S GUILE (+12): Each player death subtracts 15 seconds from timer directly.",
    "DIFFICULTY RANKING (community): Maisara Caverns (hardest) > Nexus-Point Xenas > Seat of the Triumvirate > Windrunner Spire > Magisters' Terrace > Pit of Saron > Skyreach > Algeth'ar Academy (easiest).",
    "CRESTS: +2-5 = Veteran, +6-8 = Champion, +9-11 = Hero, +12+ = Myth (no timing required for crests).",
}

----------------------------------------------------------------------
-- SEASON 2 (12.1) M+ POOL — 5 new Midnight dungeons
-- Sources: Method + Icy Veins + skycoach/koroboost (Aug 2026, week 1)
----------------------------------------------------------------------

----------------------------------------------------------------------
-- S2 DUNGEON: ALTAR OF FANGS (30:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Altar of Fangs",
    trashNotes = "Rav'i wing: INTERRUPT Piercing Hiss (Primal Serpent, top priority). Dispel/freedom Paralyzing Shots (Twinfang Harrower); face its Toxic Breath away; defensive on Duostrike. SOOTHE Ravenous Descendant's stacking enrage. Avoid Venom Leech Septic Spatter death circles. Ritual Chieftain: Blood Sacrifice AoE + healing absorb. Destroy 6 Caustic Mist Totems to progress. Writhing Coil wing: INTERRUPT Envenom + CC the Evolve channel (High Evolutionist -- Evolve = group-wide Mass Envenom); poison-dispel the DoTs. Rattling Writhe: healer CD for Rattle. CC/slow fixating Hatchlings. Zul'jan wing: INTERRUPT Mass Envenom (Ula'tek's Chosen) every cast; dodge Toxic Surge lines. Ascendant Serpent: spread for Infest, dodge Virulent Whirl tornadoes, frontal away. STAGGER-KILL Living Venoms (simultaneous Venom Bursts = wipe). Bonus: 25+ Midnight Cooking/Alchemy can click the Unfinished Mixture near Zul'jan trash for a group buff.",
    bosses = {
        {
            name = "Rav'i",
            order = 1,
            contentType = "dungeon",
            bossType = "Feed-phase hydra: soaks + burn-the-shield",
            tldr = "At empty energy Rav'i runs to a carrion/bone pile, shields itself, and eats -- soak every Messy Eater chunk (each miss = extra Carrion Burst) and burst the shield down. Tank steers it AWAY from Fresh Meat corpses or Feeding Frenzy doubles the tick rate.",
            abilities = {
                { name = "Ssscavenging", desc = "Energy-empty channel at a pile: absorb shield + Messy Eater chunks on the ground. Soak every chunk, burst the shield." },
                { name = "Feeding Frenzy", desc = "Near a Fresh Meat corpse, Carrion Burst ticks every 1.5s instead of 3s. Tank pre-positions at the corpse-free pile." },
                { name = "Ravenous Stomp", desc = "Heavy group-wide hit. Be topped; rotate CDs/defensives." },
                { name = "Triple Shot", desc = "Cleave shots at multiple players -- loose spread." },
                { name = "Regurgitate", desc = "Waves toward a player + disease debuff. Dodge; DISPEL the disease." },
                { name = "Hydrastrike", desc = "Hard tank melee -- active mitigation every time." },
            },
            tank = "Mitigate Hydrastrike on CD. Your real job is walking the boss to the corpse-free pile before energy empties.",
            healer = "Ravenous Stomp is the check; disease dispel for Regurgitate; CD any fast-tick Frenzy.",
            dps = "Spread for Triple Shot, soak chunks, then dump everything into the Ssscavenging shield.",
            positioning = "Loose spread; collapse to the pile during Ssscavenging to soak + cleave the shield.",
            wipes = "Unsoaked chunks cascading Carrion Bursts. Boss eating a Fresh Meat corpse. Stomp into an untopped group.",
            tyrannical = "Fast-tick Frenzy out-damages any healer -- pile choice and soaks must be perfect. Hydrastrike threatens tank one-shots; every Stomp wants a rotated CD.",
        },
        {
            name = "The Writhing Coil",
            order = 2,
            contentType = "dungeon",
            bossType = "Serpent: interrupt triple + tether-break intermission",
            tldr = "Interrupt every Toxic Atrophy (cast 3x back-to-back), dodge the charge+frontal combo, and on Death Rattle SNAP your tether with movement abilities, then stack and nuke the 5 Uncoiled Writhes -- their damage mirrors to the boss. Synchronized Venom makes the whole fight a healer throughput check.",
            abilities = {
                { name = "Synchronized Venom", desc = "Constant ticking group DoT all fight -- sustained healing check." },
                { name = "Toxic Atrophy", desc = "Interruptible, 3x back-to-back (Writhes cast it too). Each completed cast = -15% damage dealt / -10% movement stack. KICK EVERY ONE." },
                { name = "Vindictive Onslaught", desc = "Line charge at a player then a frontal. Step out of the line; point the frontal away." },
                { name = "Death Rattle / Uncoil", desc = "Tethers everyone + spawns 5 fixating Writhes. Sprint/blink to snap tethers (damage ramps while tethered); stack + CC + AoE the Writhes -- damage carries to the boss. Dodge their Undermining shockwaves at ~25s." },
            },
            tank = "Contribute a kick to the triple; group the Writhes for cleave; mitigate Tail Scythe.",
            healer = "Your fight: Venom never stops and tether damage ramps on slow snappers. Save a throughput CD for Uncoil.",
            dps = "Kick rotation on Toxic Atrophy is non-negotiable; hold AoE CDs for Uncoil -- add damage is boss damage.",
            positioning = "Loose spread near the boss; snap tethers outward; collapse on a stack point for Writhes; frontal faced away.",
            wipes = "Missed Atrophy kicks stacking the group into a death spiral. Unsnapped tethers. Writhes living to Undermine the stack.",
            tyrannical = "Baseline Venom alone approaches heal-cap; one completed Atrophy usually ends the run. Tether ramp kills anyone without a movement ability within seconds.",
        },
        {
            name = "Zul'jan",
            order = 3,
            contentType = "dungeon",
            bossType = "Ritualist: soak beams, then CLEANSE stacks in frontals",
            tldr = "Ritual of the Fang fires 4 beams that must each be soaked, applying stacking Ritual Venom that EXPLODES on expiry (~50s). You cleanse stacks by deliberately standing in Boneslicer (clears up to 8) or clipping an Axegrinder blade. Stacks still held during Bloodletting/Chop Down drop permanent blood pools that eat the room.",
            abilities = {
                { name = "Ritual of the Fang", desc = "4 beams toward the boss -- each must be intercepted or the group takes massive damage. Soakers gain Ritual Venom." },
                { name = "Ritual Venom", desc = "Stacking debuff, LETHAL explosion on expiry. Clear it by taking physical damage (Boneslicer / Axegrinder) in time." },
                { name = "Boneslicer", desc = "Frontal + 7s DoT -- the intended cleanse: stand in it ON PURPOSE to strip stacks. Healing-intensive." },
                { name = "Chop Down", desc = "Heavy tank combo; drops blood pools if the tank still holds Venom. Big defensive every cast." },
                { name = "Bloodletting", desc = "30s blood pools from stack-carriers -- the room-shrink mechanic." },
                { name = "Axegrinder", desc = "3 spinning axes bouncing around. Dodge -- or clip one deliberately to cleanse." },
            },
            tank = "Strong mitigation every Chop Down; clear your own venom first; drift the boss so pools never cover beam lanes.",
            healer = "Pre-plan the Boneslicer soak plan (split across casts in pugs). Fang + Boneslicer DoT overlap is the check.",
            dps = "Pre-assign beam soaks; know which Boneslicer cast is yours; keep mid-room pool-free.",
            positioning = "Spread to intercept 4 beams; arena center kept clean; kite around persistent axes.",
            wipes = "Venom expiring uncleansed (explosion). Missed beam soaks. Blood pools consuming the dodge space.",
            tyrannical = "Expiry and unsoaked beams are true one-shots; the cleanse damage itself becomes a burst-heal check -- never soak at low HP with stacks. Chop Down one-shots without a major CD.",
        },
    },
}

----------------------------------------------------------------------
-- S2 DUNGEON: MURDER ROW (34:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Murder Row",
    trashNotes = "Pre-Kystia: INTERRUPT/CC Seduction (Seductive Sayaad). Kill Bribed Captain FIRST (Deep Corruption buffs everything); manage Shield Bash stacks, cleanse Glaive Toss bleed. Massive Felwyrm: constant pulse, DISPEL Corroding Spittle, avoid death AoE. Pre-Zaen: SOOTHE Keen Taskmaster enrage; dodge Workplace Accident. BAR EVENT: random roles (Server/Entertainer/Cleaner/Bouncer) -- reach 5 stars for +10% damage/healing 5min; INTERRUPT Scathing Review. Pre-Xathuux: Shivan Punisher frenzies at 50% (kill priority), dodge Whirlwind. Soothe/kick Fel Rage (Wrathguard Flayer), cleanse Flay. Corrupted Warlock: DISPEL Curse of Doom (or stack-split), defensive Drain Life. Felmaster Lucsei: CDs for Blade Dance, face Eye Beam away. Kick Felfire Burst (Imps) + Health Funnel (Fel Invoker); dodge Felfire Bombardment. Pre-Lithiel: Defiled Golem -- healer CD for Defiled Slam, dodge Fel Beam lines. Vendors sell one-purchase actives (Felwyrm Egg, Heartstop Blade, etc.).",
    bosses = {
        {
            name = "Kystia Manaheart",
            order = 1,
            contentType = "dungeon",
            bossType = "Boss + pet council with a burn-phase pivot",
            tldr = "Kystia takes ~80% reduced damage behind Felshield -- kill Nibbles the wyrm to 20% first. Then she channels Destabilized/Chaotic Burst: she takes bonus damage but pulses heavy group AoE -- lust/CDs there, healer all-in. Kick/CC Mirror Images, dispel Corroding Spittle fast.",
            abilities = {
                { name = "Felshield", desc = "Kystia near-immune until Nibbles hits 20%. Hit the wyrm." },
                { name = "Destabilized / Chaotic Burst", desc = "Post-pivot channel: boss takes bonus damage, group takes pulsing AoE. Burn window + healing check." },
                { name = "Mirror Images", desc = "5 images periodically -- interrupt/CC/stun and clear." },
                { name = "Corroding Spittle", desc = "Magic debuff on players. DISPEL fast." },
                { name = "Fel Spray", desc = "Frontal cone from Nibbles -- tank faces it away." },
                { name = "Fel Nova", desc = "Explosion at a player -- step out, stay spread." },
            },
            tank = "Face Nibbles away; hold both stacked for cleave; mitigate Chaos Barrage during image waves.",
            healer = "Quiet until Destabilized -- bank the big CD for that channel. Spittle dispels on sight.",
            dps = "Cleave both, prioritize Nibbles to 20%; hold burst for the amp window; kick images.",
            positioning = "Boss + pet stacked, group behind the wyrm; spread on Fel Nova telegraphs.",
            wipes = "Damage wasted into the shield. Ignored images. Entering Destabilized without a healer CD.",
            tyrannical = "Destabilized becomes a brutal timed check -- the longer she lives past the pivot, the more pulses you eat. Spittle + Chaos Barrage during images one-shots squishies.",
        },
        {
            name = "Zaen Bladesorrow",
            order = 2,
            contentType = "dungeon",
            bossType = "Warehouse cover fight -- hide behind barrels",
            tldr = "Murder In A Row is a lethal channel: every player breaks line of sight behind their OWN Forbidden Freight barrel or eats a one-shot + bleed. Fire Bomb turns barrels into Fel-Infused Freight adds -- cleave them down or Killing Spree becomes unhealable.",
            abilities = {
                { name = "Same-Day Delivery", desc = "Barrels spawn around the room -- they are your cover; track them." },
                { name = "Murder In A Row", desc = "Lethal room-wide channel -- LoS behind your own barrel. One barrel per player." },
                { name = "Fire Bomb", desc = "Spawns Fel-Infused Freight from barrels -- kill immediately." },
                { name = "Killing Spree", desc = "Channeled AoE burst, far deadlier with Freight alive. Topped + healer CD." },
                { name = "Envenom", desc = "Tank hit + poison -- defensive, then poison-dispel." },
            },
            tank = "Defensive into Envenom, call the dispel; keep the boss centered so cover stays reachable.",
            healer = "Pre-top for Killing Spree; cleanse Envenom; fast heals on Murder In A Row bleed victims.",
            dps = "Freight dies the moment it spawns. Claim your barrel BEFORE the channel starts.",
            positioning = "Mid-room; everyone mentally owns a barrel; cover is a consumable -- don't waste it.",
            wipes = "Two players sharing one barrel. Freight alive into Killing Spree. No Envenom dispel.",
            tyrannical = "Murder In A Row without cover is a flat one-shot; Killing Spree with one Freight up out-damages heals. Envenom can solo the tank between casts.",
        },
        {
            name = "Xathuux the Annihilator",
            order = 3,
            contentType = "dungeon",
            bossType = "Brute: priority-kill axe add + edge kiting",
            tldr = "When Axe Toss lands, everyone swaps to the Legion Axe INSTANTLY -- it pulses escalating AoE until dead. Tank holds the boss at the arena edge facing out and slow-kites Demonic Rage fire puddles along the wall -- floor discipline decides the last 30%.",
            abilities = {
                { name = "Legion Strike", desc = "Frontal tank hit -- faced out at the edge." },
                { name = "Axe Toss", desc = "Summons the Legion Axe with escalating Fel Lightning AoE. ALL DPS swap; drag it to the boss for cleave." },
                { name = "Infernal Crush", desc = "Heavy group AoE -- loose spread + defensive; overlaps Demonic Rage." },
                { name = "Demonic Rage", desc = "Boss enrages, drops fire puddles; takes/deals more. Tank wall-kites; DPS burst the amp window." },
            },
            tank = "Edge of arena facing out; practice the slow wall-kite -- use less than half the room per Rage.",
            healer = "Crush into Rage is the spike -- call defensives for the overlap; spot-heal the axe target.",
            dps = "Axe first, always. Hold 2-min burst for the Demonic Rage amp.",
            positioning = "Boss on the edge facing out; group spread behind; kite path on the perimeter, never through the middle.",
            wipes = "Slow axe kill (lethal pulse ramp). Tank burning half the room per Rage. Unspread Crush.",
            tyrannical = "The axe becomes a hard DPS check -- it ramps to one-shots before slow groups kill it. Crush needs personals every cast; Legion Strike trucks tanks without CDs.",
        },
        {
            name = "Lithiel Cinderfury",
            order = 4,
            contentType = "dungeon",
            bossType = "Fel-warlock finale: gateway dodges + add control",
            tldr = "Use HER Demonic Gateway to dodge Malefic Wave -- getting hit is near-one-shot + DoT + fire vulnerability, and the wave EMPOWERS any surviving adds, so clear every imp/Vilefiend before each wave. Kick Chaos Bolt on rotation. The Infernal is an unkillable chaser -- never park it on a gateway.",
            abilities = {
                { name = "Chaos Bolt", desc = "Interruptible nuke at a player -- dedicated kick rotation." },
                { name = "Malefic Wave", desc = "Room-crossing wave -- take the gateway at the right moment. Hit = heavy damage + DoT + Fire vulnerability; empowers surviving adds." },
                { name = "Fingers of Gul'dan", desc = "Circles on players -- spread; each hit spawns a Wild Imp (kick/CC/knock them)." },
                { name = "Summon Vilefiend", desc = "Add -- tank grabs, DPS focus." },
                { name = "Infernal", desc = "Unkillable fixating hazard chasing the tank -- near-certain death on contact. Kite it wide; NEVER onto a gateway." },
                { name = "Searing Fel Flame", desc = "Constant pulsing group damage all fight." },
            },
            tank = "Three jobs: hold boss + Vilefiend, kite the Infernal away from gates and group, plan your own gate trip.",
            healer = "Steady throughput into Fel Flame; externals for anyone clipped by the wave (the DoT finishes them otherwise).",
            dps = "Kick Chaos Bolt, stomp imps, kill Vilefiends -- board CLEAR before every wave.",
            positioning = "Mid-room near the gateway network; spread-with-overlap for Fingers; wide berth around the Infernal; gate-adjacent before wave timers.",
            wipes = "Missed gateway (wave one-shot). Infernal parked on the gate exit. Imps alive into a wave. Chaos Bolt into a squishy.",
            tyrannical = "Malefic Wave one-shots through minor defensives; Chaos Bolt kills clothies; ambient flame + imp bursts overwhelm healers the moment the kick rotation slips.",
        },
    },
}

----------------------------------------------------------------------
-- S2 DUNGEON: DEN OF NALORAKK (32:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Den of Nalorakk",
    trashNotes = "Hoardmonger wing: INTERRUPT Scavenge (Keen-Eyed Striker); defensive + bleed-cleanse Razor Dive. Thornclaw Gatherer stacks Shredding Claws (kite at high stacks). INTERRUPT every Healing Breeze (Earthwhisper Tender, priority). Spirit of Hunger: kill the Starvation Effigy on spawn; healer CD for Feast of Misery. SOOTHE Territorial Matriarch's enrage when her cub dies. Sentinel wing: Frostfang's Bloodrush opener is dangerous. Focus Terra Rumbler during Rumbling Ward. INTERRUPT every Frigid Roar (Frigid Mauler). Glacial Revenant: spread for Cryo Surge, magic-dispel, avoid death Snowdrift. Avatar of Determination: break allies from Glacial Tomb roots. Kill The Winter Squall to stop the Harsh Winds gauntlet. Nalorakk wing: INTERRUPT Arc Lightning (Stormbound Mystic). DESTROY Magma Totem instantly. Grizzled Warbringer pulses Primal Echo + Poison Spear Volley circles. SOOTHE Bestial Wrath; kite Loyal Saberfang's Shred Armor stacks. Loa Speaker Nanea: kick rotation on Lightning Bolt, drop Earthquake circles on existing puddles, kill Volatile Totems fast.",
    bosses = {
        {
            name = "The Hoardmonger",
            order = 1,
            contentType = "dungeon",
            bossType = "Empowerment thresholds + mushroom soaks",
            tldr = "At HP thresholds (~90/70/40%) it empowers from the NEAREST resource pile -- tank steers the order (meat -> bone -> mushroom is easiest). Soak every Rotten Mushroom within 12s or Putrid Burst fires; soakers take stacking Toxic Spores poison -- rotate soakers, dispel.",
            abilities = {
                { name = "Resourceful Measures", desc = "Threshold empowerment from the nearest pile: meat = harder knockback Bellow; bone = spike area denial; mushroom = extra mushroom soaks. Tank picks the pile." },
                { name = "Ravenous/Hearty Bellow", desc = "Group hit (+knockback when empowered) -- healer CD, brace." },
                { name = "Earthshatter/Bonespike Slam", desc = "Impact zones -- step out fast." },
                { name = "Rotten Mushrooms", desc = "MUST be soaked within 12s or Putrid Burst AoE. Soaking applies Toxic Spores poison -- dispel/rotate." },
            },
            tank = "You control the order: pre-drag toward meat first. Defensive through empowered Bellows; keep him centered for soak room.",
            healer = "Poison-dispel soakers; every post-empowerment window is a mini healing check.",
            dps = "Spread for mushroom coverage; don't greed through spike zones; control when thresholds hit.",
            positioning = "Boss center, group ringed for mushroom coverage; out for slams, collapse after Bellow.",
            wipes = "Unsoaked mushrooms chaining bursts. One player soaking everything (Spores death). Slam zones in the melee stack.",
            tyrannical = "Empowered Bellows are healing walls, Putrid Burst hits wipe-level, double-soaker Spores lethal without instant dispel. More cycles = denser mushroom field.",
        },
        {
            name = "Sentinel of Winter",
            order = 2,
            contentType = "dungeon",
            bossType = "Ice-floor control: bait tornadoes, snowdrift immunity",
            tldr = "The floor is ice -- movement is committed. Bait Raging Squall tornadoes stacked, then rotate away. Kill the two Fractured Shivercores (kick Winter's Shroud), one player soaks each Rimeshatter, and their Snowdrift piles grant KNOCKBACK IMMUNITY -- stand there for the 100-energy Frozen Tempest/Eternal Winter channel.",
            abilities = {
                { name = "Glacial Torment", desc = "16s frost DoT -- DISPEL immediately; spread so it can't overlap." },
                { name = "Raging Squall", desc = "Tornadoes -- stack to bait into one cluster, then rotate around the room." },
                { name = "Shattering Frostspike", desc = "Dodge circles; spawns 2 Shivercores casting Winter's Shroud (stacking frost-damage-taken) -- kick, kill." },
                { name = "Rimeshatter / Snowdrift", desc = "On add death: one player soaks each snow pile; the pile then grants knockback immunity -- the safe stand for the channel." },
                { name = "Eternal Winter (100 energy)", desc = "Heavy channeled AoE + pushback. Stand in Snowdrift or behind terrain; healer CD." },
            },
            tank = "Boss near the snow piles so the group cleaves and stands in Snowdrift for the channel. Watch your Shroud stacks.",
            healer = "Torment dispels on CD; ramp for every 100-energy channel -- it escalates with Shroud stacks.",
            dps = "Kick Winter's Shroud, burn Shivercores (time deaths so Snowdrift is up for the channel), claim your Rimeshatter soak.",
            positioning = "Loose 10-12yd spread by default; brief stack to bait tornadoes; converge on Snowdrift for channels.",
            wipes = "Tornadoes baited everywhere. Eternal Winter without Snowdrift (knocked into hazards). Undispelled Torment stacking with channel ticks.",
            tyrannical = "Eternal Winter is lethal without CDs + Snowdrift; Shroud stacks push frost damage into one-shot range; DoT + channel overlap is the hardest sustained check in the dungeon.",
        },
        {
            name = "Nalorakk",
            order = 3,
            contentType = "dungeon",
            bossType = "Loa of War: echo parking + shield-wall hides",
            tldr = "Echoing Maul marks 3 players who each spawn a Spectral Echo where they stand -- park them clustered at the room edge, away from everyone. On Overwhelming Onslaught the WHOLE group hides behind the boss's shield through 3 big hits, then the tank sprints back to soak Forceful Slam. During Fury of the War God, bodyblock charging echoes before they reach the center -- anything that connects triggers Demoralizing Scream. (Week-1 sources still disagree on details -- verify in-run.)",
            abilities = {
                { name = "Echoing Maul", desc = "Marks 3 players; an Echo spawns at their position. Walk out and drop it next to existing echoes at the edge." },
                { name = "Spectral Slash", desc = "Echoes damage anyone nearby -- keep distance from all parked echoes." },
                { name = "Overwhelming Onslaught", desc = "Boss leaps behind the tank + raises a shield: ENTIRE group stacks behind it through 3 heavy hits (healer CDs)." },
                { name = "Forceful Slam", desc = "Post-Onslaught tank soak -- sprint back and eat it with a major CD, or it's a Demoralizing Scream." },
                { name = "Fury of the War God", desc = "Echoes charge the center -- form a wall and intercept with your bodies (small hits each; stagger defensives). Anything through = Scream." },
                { name = "Demoralizing Scream", desc = "Punish for failed blocks/soaks -- heavy group damage. Prevent it entirely." },
            },
            tank = "Biggest CD for Forceful Slam and be FAST back to the boss after the knockback. Keep edge parking spots reachable.",
            healer = "Two scripted spikes: the 3 shield hits and the Fury blocking wall -- pre-ramp both.",
            dps = "Echo discipline: edges, clustered, never in melee. Spread across charge lanes during Fury.",
            positioning = "Echo graveyard in one corner; group BEHIND the shield on Onslaught; ring formation during Fury.",
            wipes = "Echoes dropped in the group. Standing outside the shield. Late Slam soak. Echoes reaching center -> chained Screams.",
            tyrannical = "Shield hits and Forceful Slam scale to one-shot territory (tank CD mandatory); per-block Fury damage forces a planned defensive rotation; a single Scream on top of anything else is a wipe.",
        },
    },
}

----------------------------------------------------------------------
-- S2 DUNGEON: THE BLINDING VALE (30:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "The Blinding Vale",
    trashNotes = "Trinity wing: INTERRUPT every Light Bolt Volley (Radiant Spellsower, TOP priority; CC+burst it on Call The Grove -- wakes dormant adds). INTERRUPT Disorienting Screech (Lightfeather Petalwing). Kill Lightgorged Lasher fast (shields allies). Underbrush Stalker's Thornblade bleed needs focused healing. Virid Grovekeeper: Earthrupture puddle away, brace Uproot knockback. Sporeblight Belcher: healer CD for Spouting Floret, dodge Belch Spores. Overgrown Hydra: aim Lightmaw Beams away + defensives, dodge Bullet Seeds. Spineshield Beetle REFLECTS during Spiny Shield -- stop attacking. Ruia wing: Blighted mobs EXPLODE on death (drop bodies off the path). Luminous Thornmaw: bleed-cleanse Grievous Gash, dodge Solar Breath. Ziekket wing: Potatoad Matriarch -- Tongue Toss launches the tank; POISON-DISPEL Toxic Spew; destroy Toadspawn eggs before they hatch. Route: left-first lets Paladins/Priests/Herbalists (25+) grab the Light-Starved Blossom buff (+20% speed +5% haste 2min).",
    bosses = {
        {
            name = "Lightblossom Trinity",
            order = 1,
            contentType = "dungeon",
            bossType = "Council of three: cleave + beam soaks",
            tldr = "Stack the bosses for cleave, kick Kezkitt's Light Bolt on rotation, and when Lightblossom Beam converts the three Fertile Loam circles into soaks, tank + 2 players step in IMMEDIATELY -- unsoaked beams = group AoE + stacking boss buffs. Dodge the Lightsower Dash lane through all three circles.",
            abilities = {
                { name = "Light Bolt (Kezkitt)", desc = "Spammed cast -- the fight's rot damage. Kick rotation." },
                { name = "Thornblade (Lekshi)", desc = "Bleed strike -- move away so it can't cleave; cleanse/defensive." },
                { name = "Bedrock Slam", desc = "Tank buster + spawns three Fertile Loam circles + party DoT. Mitigate; healer CD." },
                { name = "Lightblossom Beam", desc = "The Loam circles become soaks: tank + 2 assigned players in them ASAP." },
                { name = "Lightsower Dash", desc = "Line charge through all three circles -- clear the lane." },
                { name = "Light-Scorched Earth", desc = "Area denial post-beam -- tanks reposition out immediately." },
            },
            tank = "Council stacked tight, mitigate every Bedrock Slam, claim one beam soak, drag off Scorched Earth fast.",
            healer = "Bedrock Slam's party DoT is the recurring check; watch bleeds; you may be a soaker.",
            dps = "Own the kick rotation; pre-assign the two non-tank soaks; cleave everything.",
            positioning = "Bosses stacked mid-room; know your Loam circle before the beam; clear the Dash lane.",
            wipes = "Missed beam soaks. Free-cast Light Bolts. Unmitigated Slam. Thornblade in the stack.",
            tyrannical = "Slam one-shots without CDs; unsoaked beams hit wipe-level; uninterrupted Light Bolts alone out-damage a healer.",
        },
        {
            name = "Ikuzz the Light Hunter",
            order = 2,
            contentType = "dungeon",
            bossType = "Fixate/kiting beast, soft enrage at 50%",
            tldr = "Clear Bloodthorn Roots (cleave or freedom) and RUN when Bloodthirsty Gaze fixates you -- getting caught is a massive hit + 5s stun. Kite the charge over roots to destroy them. At 50%, Lightcrazed Frenzy spikes all damage -- bank healer CDs for the back half.",
            abilities = {
                { name = "Bloodthorn Roots", desc = "Ground roots that snare -- destroy with cleave or clear with freedoms (clears several at once)." },
                { name = "Bloodthirsty Gaze", desc = "Fixate charge -- massive hit + 5s stun if he catches you. Sprint away, path over roots." },
                { name = "Verdant Stomp", desc = "AoE + knockback -- stay off the arena rim." },
                { name = "Thorncaller Roar", desc = "Pulsing raid-wide all fight -- personals + steady healing." },
                { name = "Lightcrazed Frenzy", desc = "At 50%: damage output spikes for the rest of the fight." },
            },
            tank = "Keep him centered so Gaze targets have run-room; help clear melee-side roots; mind Stomp knockback.",
            healer = "Bank major CDs for sub-50% (Frenzy + Roar together). Instant spot-heals on Gaze victims.",
            dps = "Fixated: move first, dps second -- path over roots. Everyone carries a root-removal plan.",
            positioning = "Center-weighted, never the edge; keep root fields between you and probable charge lanes.",
            wipes = "Gaze catching a rooted/slow player. Knockback off the edge. Healer oom before Frenzy.",
            tyrannical = "A Gaze connect is effectively a one-shot; Frenzy-phase Roar pulses are a sustained CD-rotation check; Gaze-onto-rooted overlaps kill runs.",
        },
        {
            name = "Lightwarden Ruia",
            order = 3,
            contentType = "dungeon",
            bossType = "Shapeshifter: Moonkin -> Bear -> Haranir burn race",
            tldr = "Moonkin (100-70%): kick Warden's Wrath, dodge Lightfall, spread Lightfire tornado debuffs. Bear (70-40%): Grievous Thrash bleeds DON'T fall off until the target is healed to FULL -- top them instantly. Haranir (40-0%): Spirits of the Vale machine-guns all previous abilities on an 8s cycle until death -- lust and burn.",
            abilities = {
                { name = "Warden's Wrath (Moonkin)", desc = "Interruptible blast -- kick it." },
                { name = "Lightfall (Moonkin)", desc = "Ground circles -- dodge." },
                { name = "Lightfire (Moonkin)", desc = "Debuff on 3 players; expiry fires tornadoes + silence beams. Spread, defensive, dodge." },
                { name = "Grievous Thrash (Bear)", desc = "Bleed that persists until the target is FULL-healed. Heal to full immediately; cleanse/defensives." },
                { name = "Pulverizing Strikes (Bear)", desc = "Frontal at a target -- spread so it can't cleave." },
                { name = "Spirits of the Vale (40%)", desc = "Cycles Lightfire -> Thrash -> Lightfall -> Pulverizing every ~8s until dead. Burn window; hardest phase." },
            },
            tank = "Bear phase is yours: CDs through Mangling Claws + Thrash. Kick help in P1. Survive P3 while the team burns.",
            healer = "Rule: Thrash targets to FULL, NOW -- partial heals do nothing. Best throughput CD saved for sub-40%.",
            dps = "Kick duty P1, spread discipline P2, every CD held for 40% shortens the deadliest phase.",
            positioning = "Spread 8-10yd for Pulverizing/Lightfire; map Lightfall zones and silence beams.",
            wipes = "Thrash bleeds never topped. Healer silenced during the P3 cycle. Slow P3 out-damaging heals.",
            tyrannical = "P3 is the wall -- each 8s rotation demands a defensive or external. Bear-phase tank combos near-one-shot without CDs; multi-target Thrash can be unhealable.",
        },
        {
            name = "Ziekket",
            order = 4,
            contentType = "dungeon",
            bossType = "Attrition finale: adds, corpse-burning beams, orb denial",
            tldr = "Oozing Xylem pulses group damage the ENTIRE fight -- it's an attrition race. Kill Awaken the Lightbloom adds (kick Lightspore Shot), then aim Concentrated Lightbeam over their corpses to destroy them permanently -- point it at the platform edge. Soak Lightbloom's Essence orbs spread across players; any orb reaching the boss = shield + damage spike.",
            abilities = {
                { name = "Oozing Xylem", desc = "Permanent pulsing group damage -- healer endurance check." },
                { name = "Awaken the Lightbloom", desc = "Summons adds -- kick Lightspore Shot, kill fast." },
                { name = "Concentrated Lightbeam", desc = "Frontal beam: aim it over dead add bodies to burn them for good; puddles go toward the platform edge." },
                { name = "Lightbloom's Essence", desc = "Orbs drift to the boss -- soak them SPREAD across players (soak = buff but increased damage taken); an orb reaching Ziekket = shield + spike." },
                { name = "Thornspike", desc = "Tank hit + knockback + bleed -- defensive, watch the knock direction." },
            },
            tank = "Gather adds instantly, feed the beam over their corpses toward the edge, control Thornspike knockback.",
            healer = "Mana marathon -- Xylem never stops. Track essence-stacked players (amplified damage) and spot-heal; CD when an orb slips.",
            dps = "Kick adds, kill adds, soak your fair share of orbs -- never let one player stack 4.",
            positioning = "Fight near (not on) the platform edge so beam puddles leave the playable area; loose spread covering orb lanes.",
            wipes = "Orbs reaching the boss. Free-casting adds. Beam puddles through mid-room. One over-soaker exploding.",
            tyrannical = "Baseline Xylem alone is a full-time healing check; unkicked add casts stack unhealable rot; over-soaks and boss-shield spikes are instant deaths. Tightest mana budget in the dungeon.",
        },
    },
}

----------------------------------------------------------------------
-- S2 DUNGEON: VOIDSCAR ARENA (30:00 timer)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Voidscar Arena",
    trashNotes = "PATH CHOICE at entry: left (Aegyra) = Versatility buff, right (Raj'kess) = Mastery buff -- Icy Veins recommends RIGHT. INTERRUPT every Demoralizing Shout (Dominated Brawler) + CC its Bloodsurge tank stacks. INTERRUPT every Shadowbolt Volley (Voidtouched Magi). ALWAYS kick Mass Shriek (Killvore Screamer, AoE fear). Kick Lava Bolt + destroy Magma Totem (Enthralled Shaman). Brutal Overseer: DESTROY the Brutal Slams shield or the channel is wipe-level -- swap immediately; dodge Macestorm. Devouring Brutalizer x3: healer CD for Dreadbellow; when it casts Devour, KILL the low-health mob it's eating before the cast finishes or it heals/empowers. DISPEL Melt Armor (tank) + Corrosive Essence (poison). Mini-bosses: Aegyra -- move out after Ferocious Leap, destroy Champion's Spear tether, spread for Savage Smash. Raj'kess -- spread for Forked Lightning, SWAP instantly to Orb of Disruption, healer CDs for Thundering Storm.",
    bosses = {
        {
            name = "Taz'Rah",
            order = 1,
            contentType = "dungeon",
            bossType = "Geometry exam: lines, puddles, orb sprays",
            tldr = "Nether Dash draws lines through every player -- spread loosely at the room edge with drop-spots clumped so the Void Fissure puddles stack in one zone. Dark Bloom then makes every puddle spray orbs: rotate around the room as a group dodging them. Organized floor = free boss; scattered puddles = nowhere to stand.",
            abilities = {
                { name = "Nether Dash", desc = "Line attacks through player positions -- spread so lines don't cross allies; cluster the drop zone." },
                { name = "Umbral Rupture / Void Fissure", desc = "Persistent void puddles -- placement control is the whole fight." },
                { name = "Dark Bloom", desc = "All puddles fire orbs -- pre-move and rotate around the room; dodge everything." },
                { name = "Void Blast", desc = "Tank hit + knockback -- mitigate, and check what's BEHIND you." },
            },
            tank = "Rotate the boss clockwise along the wall as the floor fills; never get knocked into fissures; defensive every Blast.",
            healer = "Damage here is almost all avoidable -- top people pre-Bloom and punish nobody.",
            dps = "Puddle placement IS your dps mechanic: drop tight, then full uptime while strafing orbs.",
            positioning = "Loose spread along the wall, migrating one slice at a time; keep a clean arc reserved for Bloom dodging.",
            wipes = "Scattered puddles making Bloom undodgeable. Tank knocked into fissures. Multiple Dash lines clipping one player.",
            tyrannical = "Bloom orbs and fissures become one-shots -- a pure don't-get-hit exam. Void Blast deletes tanks without active mitigation.",
        },
        {
            name = "Atroxus",
            order = 2,
            contentType = "dungeon",
            bossType = "Add-priority brute with tank double-kiting",
            tldr = "Monstrous Roar spawns a Toxic Creeper that pulses group-wide Toxic Aura the whole time it lives -- kill it IMMEDIATELY every time while the tank kites it (its Sickening Bite stacks + Hulking Claw is a tank one-shot combo). Dodge Poison Splash pools; stay near the boss so Noxious Breath is a cheap sidestep.",
            abilities = {
                { name = "Poison Splash", desc = "Spawns poison pools (Mind-Numbing Poison) -- dodge." },
                { name = "Noxious Breath", desc = "Frontal at a random player -- stay close, sidestep." },
                { name = "Monstrous Roar / Toxic Creeper", desc = "Spawns the add; its Toxic Aura pulses group damage while alive. Hard-swap and kill." },
                { name = "Sickening Bite", desc = "Creeper melee stacks a tank debuff -- tank KITES the Creeper to deny hits." },
                { name = "Hulking Claw", desc = "Tank buster w/ dispellable poison -- big defensive at LOW Bite stacks; dispel after." },
            },
            tank = "The dance: hold Atroxus, kite the Creeper so it never melees you, line defensives so Claw never lands on high stacks.",
            healer = "Every Creeper window is a CD window -- Aura + Splash overlap is the rawest throughput check here. Dispel the Claw poison.",
            dps = "Creeper > boss, zero delay, every time. Watch pool spawns mid-burst.",
            positioning = "Melee-range default; pools baited outward; Creeper kited in a wide arc away from the group.",
            wipes = "Slow Creeper kills (attrition wipe). Tank eating Bite stacks into Claw. Pool-choked floor late.",
            tyrannical = "Claw + Bite stacks is a genuine tank one-shot combo; every extra second of Creeper uptime is unhealable; healer CDs must map 1:1 to Roars.",
        },
        {
            name = "Charonus",
            order = 3,
            contentType = "dungeon",
            bossType = "Voidlord finale: kite orbs into singularities",
            tldr = "Unstable Singularity spawns three stars that pulse AoE and ATOMIZE (disable) anyone who touches them uninvited. Gravitic Orbs then fixate three players who must each kite their orb INTO a singularity to destroy both -- before Condensed Mass stacks kill them. Spread for Cosmic Crash, tank faces Dark Waves out, Void Cascade targets run wide.",
            abilities = {
                { name = "Unstable Singularity", desc = "Three pulsing stars; touching one = Atomized (damage/healing disabled). They're your ammunition -- stand near, not on." },
                { name = "Gravitic Orbs", desc = "Fixate 3 players, stacking escalating Condensed Mass while alive. Kite YOUR orb into a singularity -- destroys both." },
                { name = "Cosmic Crash", desc = "AoE around every player -- loose spread, no overlaps." },
                { name = "Dark Waves", desc = "Frontal tank buster -- mitigation, faced out." },
                { name = "Void Cascade", desc = "Projectile spray at a player -- run it away; everyone dodges the trails." },
            },
            tank = "Center Charonus between the three singularities so every kiter has a short path. Dark Waves out + mitigated every cast.",
            healer = "Spot-heal kiters hard (Mass ramps fast) while covering the pulse rot. An Atomized healer is a dead group -- mind your feet.",
            dps = "Fixated? Your dps IS the kite: shortest path, pop the orb, get back. Spread discipline between orb phases.",
            positioning = "Boss centered in the singularity triangle; group spread in the gaps; kite lanes pre-agreed so two orbs never race to one star.",
            wipes = "Kiters dying to Mass ramp or dragging orbs through the group. Atomized healer mid-spike. Crash overlaps. Waves clipping the party.",
            tyrannical = "Orbs must die on the FIRST pass -- the ramp outpaces spot-healing. Crash overlaps and pulses one-shot; Waves is a tank-CD-every-cast buster.",
        },
    },
}

----------------------------------------------------------------------
-- S2 DUNGEON: KINGS' REST (33:00 timer, BfA legacy -- 12.1 modernized)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Kings' Rest",
    trashNotes = "Nearly 100% pull required for count. Pre-boss-1: Animated Guardians -- avoid Suppression Slam frontal + stacking Heavy Slams (empowered <50%). Risen Hexers: INTERRUPT every Hex Volley. Minions of Zul: PURGE Bound by Shadow to instant-kill them. Shadow-Borne Champions: purge/soothe Ancestral Fury, dodge Shadow Whirlwind + Necrotic puddles. THE GAUNTLET (4 sequential spirit packs -- kill each fast): Timalji = run from Bladestorm; Wasi = KICK Bind Soul (top priority); A'akul = CLEANSE Sudden Rupture bleeds before Blood Drain executes bleeders; Patlaa = purge Bestial Berserk, dispel Serpent Strike. Boss-2 room: INTERRUPT Unholy Mending (Seneschal M'bara); press the extra action button when Entombed; break allies out fast; kick Wretched Discharge (mummies). Hall to boss 3: KILL Healing Tide Totem instantly; kick Hex + Spectral Bolt; run out of Seismic Upheaval (lethal). Shadow of Zul mini-boss: TWO players in Pool of Darkness soaks at all times; purge the spawned Minions.",
    bosses = {
        {
            name = "The Golden Serpent",
            order = 1,
            contentType = "dungeon",
            bossType = "Construct: bait gold puddles, kill the animated blobs",
            tldr = "Bait Spit Gold puddles into ONE stack away from the boss; when Lucre's Call animates them, slow/CC and cleave the Animated Gold down. ANY Gold reaching the boss = huge Luster shield + lethal group damage -- that's the fail condition. Heal hard through Serpentine Gust.",
            abilities = {
                { name = "Spit Gold", desc = "DoT on 2 players; drops a puddle on expiry -- run to the existing cluster, away from the boss." },
                { name = "Lucre's Call", desc = "Animates all puddles into adds crawling to the boss. Slow/root/stun + cleave before contact." },
                { name = "Serpentine Gust", desc = "Channeled heavy group AoE -- defensives + healer CD." },
                { name = "Tail Thrash", desc = "Tankbuster -- active mitigation." },
            },
            tank = "Boss away from the gold pile, drag further if adds close in. Mitigate Tail Thrash. Help slow Golds.",
            healer = "CD rotation per Serpentine Gust; top Spit Gold targets; plan for Gust + adds overlapping.",
            dps = "Stack puddles tight, then own the adds -- slows + cleave the instant Lucre's Call fires. Nothing touches the boss.",
            positioning = "Loose stack for Gust healing; designated puddle corner; boss opposite the pile.",
            wipes = "A Gold reaching the boss. Scattered puddles. Gust with no defensives.",
            tyrannical = "Gust is a rotated-CD healing check; Tail Thrash one-shots unmitigated; more add waves means slow/CC discipline must hold all fight.",
        },
        {
            name = "Mchimba the Embalmer",
            order = 2,
            contentType = "dungeon",
            bossType = "Sarcophagus rescues + interrupt-critical mummies",
            tldr = "Free Entombed allies IMMEDIATELY (victim presses the extra action button to shake their coffin; everyone else breaks it), keep Burn Corruption fire away from boss and coffins, and kick every mummy Wretched Discharge. Focus the Drain Fluids target above 90% to strip Desiccation.",
            abilities = {
                { name = "Entomb", desc = "Locks a player in a sarcophagus (ticking damage). Victim presses the button; group breaks them out instantly." },
                { name = "Drain Fluids", desc = "Channel on a player -- defensive + heal above 90% to clear the follow-up debuff." },
                { name = "Burn Corruption", desc = "Fire on a player -- take it to the room edge, never near coffins." },
                { name = "Awakening Slam", desc = "Spawns 2 mummies -- their Wretched Discharge MUST be kicked." },
                { name = "Wail of Mourning", desc = "Escalating group damage while anyone stays entombed -- rescue speed is everything." },
            },
            tank = "Stack mummies on the boss for cleave; help kick Discharge.",
            healer = "Focus the Drain Fluids target above 90%; sustain through Wail on slow rescues.",
            dps = "Drop everything for rescues; kick rotation on mummies; fire to the edge.",
            positioning = "Loose spread for clean fire drops; boss centered so every sarcophagus is reachable fast.",
            wipes = "Slow rescues (Wail ramps + extra mummies). Unkicked Discharge. Fire blocking rescue paths.",
            tyrannical = "Drain Fluids kills without a defensive + focused heals; Wail during a slow rescue is unhealable; assign interrupts pre-pull.",
        },
        {
            name = "The Council of Tribes",
            order = 3,
            contentType = "dungeon",
            bossType = "Sequential council (S2 fixed order: Kula -> Aka'ali -> Zanazal)",
            tldr = "Survive Kula's patrolling axes and bleeds, stack to split Aka'ali's Barrel Through and let the tank kite Debilitating Backhand, then win or lose on Zanazal: KILL the Explosive Totem before Call of the Elements completes and interrupt Poison Nova.",
            abilities = {
                { name = "Whirling Axes (Kula)", desc = "AoE on spawn, then axes patrol the room applying bleeds -- sprint out, dodge all phase." },
                { name = "Barrel Through (Aka'ali)", desc = "Charge at a player -- group STACKS in the line to split it." },
                { name = "Debilitating Backhand (Aka'ali)", desc = "Knockback buster + damage-amp -- tank kites until it expires." },
                { name = "Call of the Elements (Zanazal)", desc = "Totems: kill Explosive -> Thundering -> Torrent. Explosive completing = wipe." },
                { name = "Poison Nova (Zanazal)", desc = "INTERRUPT -- heavy AoE if it lands." },
                { name = "Arc Lightning (Zanazal)", desc = "Rolling group damage -- the healing wall of the fight." },
            },
            tank = "Kula centered for dodgeable axes; kite every Backhand; drag Zanazal onto the Explosive Totem for cleave.",
            healer = "Spot-heal axe bleeds; save throughput CDs for Arc Lightning.",
            dps = "Dodge axes with uptime; stack for Barrel Through; INSTANT swap to Explosive Totem; hold kicks for Poison Nova.",
            positioning = "Kula: spread at range. Aka'ali: stacked for charges, kite lanes clear. Zanazal: boss on totem spawns.",
            wipes = "Explosive Totem completing. Missed Poison Nova. Amped Backhand hits. Bleeds during Arc Lightning.",
            tyrannical = "Arc Lightning needs assigned CDs per cast; Explosive Totem HP scales -- reserve burst; Backhand deletes non-kiting tanks.",
        },
        {
            name = "Dazar, The First King",
            order = 4,
            contentType = "dungeon",
            bossType = "Two-phase king (S2-overhauled): raptor -> mounted duo",
            tldr = "Kick Deathly Roar in P1. In P2 spread for Quaking Leap, KEEP MOVING during Gilded Destruction (Impaling Spears spawn on YOUR location and melee attacks become frontals), and cover every Blade Combo with a real tank CD -- dispel Savage Maul first.",
            abilities = {
                { name = "Deathly Roar (P1)", desc = "AoE fear -- INTERRUPT every cast." },
                { name = "Hunting Leap / Aerial Smash (P1)", desc = "Frontal leap + 2-player smash -- stay spread." },
                { name = "Quaking Leap (P2)", desc = "Leaps onto ~4 marked players -- spread, sidestep the impact." },
                { name = "Savage Maul", desc = "Dispellable tank bleed -- cleanse BEFORE the buster." },
                { name = "Blade Combo", desc = "Big tankbuster -- major CD, lethal with Maul running." },
                { name = "Gilded Destruction", desc = "Heaviest window: rolling AoE, frontal melee autos, Impaling Spears under player feet -- everyone pre-moves and rotates." },
            },
            tank = "Face bosses away ALWAYS (frontal autos in the burn window); Maul dispelled before every Blade Combo; CD or external per Combo.",
            healer = "Biggest CD for Gilded Destruction; dispel Maul; triage Leap victims and spear bleeds.",
            dps = "Kick Roar in P1; stay spread; pre-move as Gilded Destruction starts; personals for the window.",
            positioning = "Permanent loose spread; behind/beside bosses during Gilded Destruction; rotate around mapped spear circles.",
            wipes = "Unkicked fear chaining into spears/frontals. Stacked Quaking Leap. Maul + Combo overlap. Standing still in Gilded Destruction.",
            tyrannical = "Blade Combo one-shots without mitigation + dispel; Gilded Destruction is a full group-CD moment every cycle; a feared group during the burst is a wipe. Longest boss here -- budget lust accordingly.",
        },
    },
}

----------------------------------------------------------------------
-- S2 DUNGEON: RUBY LIFE POOLS (28:00 timer, DF legacy -- 12.1 retuned)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Ruby Life Pools",
    trashNotes = "S2 retune: slower boss pacing, thinner trash, Thunderhead + Flamegullet now GROUND patrols. Entrance: INTERRUPT Ice Shield (Flashfrost Chillweaver); don't path whelps over Dragon Eggs (spawns extras); dodge Primal Juggernaut's Excavating Blast, tank CD for Crushing Smash. Defier Draghar mini-boss: tank CD through Steel Barrage, bait Blazing Rush into a wall. Fire wing: CC Flaming Barrage (Ashseer Flamelasher); Blazebound Destroyer: KICK Fiery Blast, DISPEL Living Bomb, group defensives for Inferno, evacuate its ~20yd death explosion; INTERRUPT Cinderbolt / Flame Dance / Flashfire at all costs. Flamegullet patrol: dodge Flame Breath, tank CD on Fire Maw, burst after 50%. Storm wing: Thunderhead patrol -- dodge Storm Breath, DISPEL Rolling Thunder ONE AT A TIME (dispel triggers damage); stay out of Thunderclap; PURGE Stormcloud/Tempest Barriers; kick Thunder Blast + Storm Bolt; avoid the 100-energy Thunderstorm knockback. High Channeler Ryvati: KICK Shock Blast, break Tempest Stormshield fast.",
    bosses = {
        {
            name = "Melidrussa Chillworn",
            order = 1,
            contentType = "dungeon",
            bossType = "Frost caster: consolidate ice, break the Overload shield",
            tldr = "Bait Hailburst ice into ONE pile to keep the floor open, position Chillstorm knocks toward open ground, and kick Frigid Shard (interruptible in S2). At 66%/33% burst the Frost Overload absorb fast -- it blocks kicks while pulsing group AoE -- and cleave the whelps on the boss.",
            abilities = {
                { name = "Hailburst / Hailbombs", desc = "Ice blocks spawn on players -- bait them into a consolidated pile; touching them on a knock = death." },
                { name = "Chillstorm", desc = "Pull-then-knock circle -- position so the knock sends you into OPEN floor." },
                { name = "Frigid Shard", desc = "Interruptible tank nuke -- kick every cast." },
                { name = "Frost Overload (66%/33%)", desc = "Whelps spawn + pulsing AoE behind an absorb that blocks interrupts -- break the shield FAST, cleave whelps." },
            },
            tank = "Call Frigid Shard kicks; stack whelps on the boss.",
            healer = "CDs for Chillstorm bursts + Overload pulses.",
            dps = "Full kick coverage; instant swap to the Overload shield; cleave whelps.",
            positioning = "Move as one unit around the ring, ice in one pile; knock trajectory always clear of bombs.",
            wipes = "Knocked into Hailbombs. Room choked with scattered ice. Shield not broken (unhealable pulses).",
            tyrannical = "Overload pulses are a hard burst check -- the shield must die instantly; bomb touches are lethal; every missed Shard kick hurts the tank badly.",
        },
        {
            name = "Kokia Blazehoof",
            order = 2,
            contentType = "dungeon",
            bossType = "Bruiser + summoned add, terrain-denial fire",
            tldr = "Place Ritual of Blazebinding near the boss but out of the group, then KILL the Blazebound Firestorm while kicking Blaze Volley. Sidestep Molten Boulder (S2 shows its explosion point at cast start). Slowly rotate the arena so you always have clean floor.",
            abilities = {
                { name = "Ritual of Blazebinding", desc = "Spawns a Firestorm add at the target's spot -- place near boss, out of group. The add is kill priority." },
                { name = "Blaze Volley (add)", desc = "INTERRUPT on the add." },
                { name = "Inferno (add)", desc = "Unavoidable AoE while it lives -- healer CD." },
                { name = "Molten Boulder", desc = "Rolling frontal boulder, explodes on terrain -- sidestep, bait off the path." },
                { name = "Searing Blows", desc = "Tankbuster with stacking bleed -- defensive every cast." },
            },
            tank = "Kokia next to the Firestorm for cleave; mitigation every Searing Blows; manage bleed stacks.",
            healer = "CD per Inferno; tank triage through the bleed.",
            dps = "Instant swap to the Firestorm, kick Blaze Volley; bait boulders toward walls.",
            positioning = "Slow rotation keeping fresh floor ahead; never stand in boulder lanes.",
            wipes = "Boulder hits (stun -> death). Free-cast Blaze Volley. Room painted with scorched ground. Unmitigated bleed stacks.",
            tyrannical = "Searing bleed is a tank-death machine -- assign externals; overlapping Infernos need a CD rotation; boulders go from damage to one-shot.",
        },
        {
            name = "Kyrakka and Erkhart Stormvein",
            order = 3,
            contentType = "dungeon",
            bossType = "Duo: ground vet + dragon, merge at 50%",
            tldr = "Burn Kyrakka whenever she lands -- dragon first. DISPEL Stormslam off the tank after EVERY cast (stacked = tank one-shot via Nature vulnerability), stop casting for Interrupting Cloudburst, and drop Inferno Spit fire downwind at the rim so Winds of Change blows embers off the platform. Pool lust for the 50% merge.",
            abilities = {
                { name = "Stormslam", desc = "Tankbuster + dispellable Nature-vulnerability -- dispel after every cast." },
                { name = "Interrupting Cloudburst", desc = "AoE that LOCKS OUT anyone mid-cast -- stop casting." },
                { name = "Winds of Change", desc = "Rotating room-wide wind (weaker in S2) -- still moves fire embers; track the direction." },
                { name = "Inferno Spit", desc = "Fire DoT on 2 (3 in P2) leaving ember patches -- carry to the downwind edge." },
                { name = "Roaring Flamebreath", desc = "Dragon frontal -- never in front of Kyrakka." },
            },
            tank = "Erkhart held near Kyrakka's landing spots for cleave; big mitigation on Stormslam + demand the dispel; dragon faced away.",
            healer = "Stormslam dispel EVERY application -- the classic tank-killer; top Spit targets; big CD for the merge.",
            dps = "Kyrakka priority whenever grounded; stop-cast discipline; Spit to the rim; pool CDs and lust for P2.",
            positioning = "Mid-platform, wind-aware; Spit runners downwind to the edge; breath lane clear.",
            wipes = "Undispelled Stormslam stacks. Embers blown through the group. Caster lockouts killing coverage. P2 with no CDs left.",
            tyrannical = "P2 is the wall: 3x Spit + Cloudburst + Stormslam overlap. Hold lust for 50% and burst the merge before overlaps stack.",
        },
    },
}

----------------------------------------------------------------------
-- S2 DUNGEON: TEMPLE OF SETHRALISS (32:00 timer, BfA legacy -- 12.1 reworked)
----------------------------------------------------------------------
D.dungeons[#D.dungeons + 1] = {
    name = "Temple of Sethraliss",
    trashNotes = "Needs bonus packs for count -- plan the route. Snake wing: Shrouded Fangs (stealthed packs) -- prevent Poisoned Cheap Shot (lethal stun opener; poison-dispel victims); defensives for Barbed Krolusk Serrated Charge bleeds; CC/KICK Arrow Barrage (Sandswept Hunter -- S2: dodges Sandburst Arrow circles first); kill Sand-Sworn Riders FAST (endless Swarming Krolusk summons). Merektha wing: DISPEL Cytotoxin constantly; INTERRUPT/CC Addle Mind on cooldown (critical); avoid Serpent's Stormcall puddles. Storm ascent: kick Lightning Bolts everywhere; DISPEL Imbued Conduction; PURGE Accumulate Charge (Agitated Nimbi); spread for Spark Step; tank CD for Sunder Slam; avoid Loose Sparks orbs. Orb event (S2 REWORK -- nobody channels anymore): CC the Temple Disruptor and the orb completes and FOLLOWS you; kite the CC-immune Orb Watcher outside the Eye area; kick Flame Shock, take Hex Muck out of the group.",
    bosses = {
        {
            name = "Adderis and Aspix",
            order = 1,
            contentType = "dungeon",
            bossType = "Duo with alternating immunity (S2 forced swaps)",
            tldr = "Always hit the boss WITHOUT the Storm Blessed shield -- it passes at health thresholds, so swap cleanly. Stack to split Thunder and Lightning, and never get Gale Force-knocked into Tempest Winds silence zones. After the first death the survivor Frenzies -- keep their HP even-ish and save CDs.",
            abilities = {
                { name = "Storm Blessed", desc = "One boss immune at all times, passing at thresholds -- mandatory target swaps." },
                { name = "Thunder and Lightning", desc = "Group soak -- stack to split, then out." },
                { name = "Gale Force", desc = "Knockback lines -- brace against walls, never toward wind zones or packs." },
                { name = "Tempest Winds", desc = "2 players drop silence/damage zones -- walk them to the rim." },
                { name = "Frenzy (P2)", desc = "Survivor casts everything much faster after the first death." },
            },
            tank = "Swap with the group; mitigation for Overload; bosses off the wind zones, wall-safe knock direction.",
            healer = "Focus Gust targets; group topped before each soak; sustained AoE healing in Frenzy.",
            dps = "Zero damage into immunity; collapse fast for soaks; zones dropped on the rim.",
            positioning = "Near a wall to kill the knockback; zones away from the stack point; know your landing spot before Gale Force.",
            wipes = "Tunneling the immune boss. Knocked into silence zones (silenced healer). Under-soaked Thunder and Lightning. Frenzy with no CDs.",
            tyrannical = "The Frenzy after the first death is the killer -- keep damage even so the swap thresholds don't strand you in a long Frenzy; under-soaks one-shot.",
        },
        {
            name = "Merektha",
            order = 2,
            contentType = "dungeon",
            bossType = "Snake: CC the knots, dodge the burrow, cleave the hatch",
            tldr = "Break A Knot of Snakes with AoE CC -- group on the arrow-marked player BEFORE the cast. Paint Thunder Spit lightning along the wall, and during Hatch cleave the double-HP Storm Serpent first while kicking Poison Spit. Dodge the Burrow charge (S2 added an indicator).",
            abilities = {
                { name = "A Knot of Snakes", desc = "Stuns wrapped players -- freed ONLY by CC/disturb effects. Collapse on the marked player pre-cast." },
                { name = "Thunder Spit", desc = "Targets trail lightning -- keep moving, paint the room edge." },
                { name = "Hatch", desc = "3 Toxic Vipers + 1 Storm Serpent (2x HP -- cleave it first); kick Poison Spit; boss burrows with constant AoE until adds die." },
                { name = "Burrow", desc = "Underground charge -- lethal on high keys; dodge via the indicator." },
                { name = "Lightning Bite / Serpentstorm", desc = "Tankbuster (defensive every cast) + channeled group AoE (healer CDs)." },
            },
            tank = "Mitigate every Bite; drag the Storm Serpent into the viper pile; help CC knots.",
            healer = "Major CDs for Serpentstorm + the burrowed Hatch phase; poison dispels.",
            dps = "Hold an AoE CC for every Knot; Storm Serpent -> vipers with kicks; uptime while dodging Burrow.",
            positioning = "Loose mid-room, collapsing on the marked player before Knots; spit trails on the wall; center clear for Burrow.",
            wipes = "Spread group during Knots (stunlocked players eaten). Center covered in lightning. Missed Poison Spit kicks. Burrow hits.",
            tyrannical = "Burrow one-shots; Hatch AoE while adds live is a brutal check -- burst the Serpent; Bite needs a real defensive every time.",
        },
        {
            name = "Galvazzt",
            order = 3,
            contentType = "dungeon",
            bossType = "Pure beam-soak execution (S2: +7% HP)",
            tldr = "Lightning Spires beam energy into the boss -- a NON-TANK body-blocks each beam immediately, rotating as Galvanized stacks build. 100 energy = Consume Charge = wipe. Rotate defensives through the constant Induction pulses and drag the boss off his own void fields.",
            abilities = {
                { name = "Lightning Spire", desc = "Three pillars beam into the boss -- intercept between spire and boss. Soaking stacks Galvanized damage-taken; rotate soakers; tank does NOT soak." },
                { name = "Consume Charge", desc = "At full energy -- effectively a wipe. Never let energy cap." },
                { name = "Induction", desc = "Heavy pulsing group damage + void field under the boss -- reposition, don't stand in fields." },
            },
            tank = "Boss out of Induction fields, positioned to shorten block lines. Do not soak.",
            healer = "Throughput marathon -- spread CDs evenly, spot-heal Galvanized soakers, call personals on Induction.",
            dps = "Assign the three beams instantly each set (closest takes closest); swap on stacks; damage between soaks.",
            positioning = "Pre-assigned spire directions; boss central so all beams are blockable; readable floor.",
            wipes = "Unsoaked beams -> Consume Charge. One soaker eating too many stacks. Healer OOM. Boss parked in fields.",
            tyrannical = "The whole fight IS the Tyrannical check -- more spire sets, longer Induction. Strict soak rotation or the floor damage becomes unhealable.",
        },
        {
            name = "Avatar of Sethraliss",
            order = 4,
            contentType = "dungeon",
            bossType = "Inverse boss: HEAL her to full (S2 heavily retuned)",
            tldr = "You heal the Avatar to full while killing what corrupts her. Essence Defilers FIRST -- their Defiling Taint blocks all boss healing. Guardian deaths drop Corrupted Lifeforce soaks (S2: 4.5s window, DPS soak them -- a miss now fires a +150% Corruption Burst). AoE the Tormentor swarms chasing the healer.",
            abilities = {
                { name = "Defiling Taint (Essence Defiler)", desc = "Blocks healing the Avatar -- kill priority #1, always." },
                { name = "Corrupted Guardian", desc = "Mini-tank add: Tainted Strike buster, leaves puddles, drops Lifeforce orbs on death." },
                { name = "Corrupted Lifeforce", desc = "Purple soaks, one per player, DPS preferred (soak = healing-done + phys-taken debuff). S2: 4.5s window; missed soak = +150% burst." },
                { name = "Siphon the Weak (Tormentors)", desc = "Swarms chase the HEALER, each siphons boss HP -- AoE them down." },
                { name = "Latent Hex / Hex Muck", desc = "S2: 1 target, prefers the healer -- place the muck away; kick Flame Shock." },
            },
            tank = "Own the Guardian: mitigation for Tainted Strike, corner-drag the puddles, peel Tormentors off the healer.",
            healer = "Two jobs: party alive AND Avatar pumped whenever Taint is down. Kite Tormentors. Don't soak Lifeforce (healing debuff).",
            dps = "Kill order: Defiler -> Guardian -> AoE Tormentors. Grab your Lifeforce soak within 4.5s. Kick Flame Shock.",
            positioning = "Guardian in a corner; group center for soak coverage; muck and puddles on edges; healer keeps escape lanes.",
            wipes = "Missed Lifeforce soaks (+150% bursts). Defiler alive (boss healing = zero, timer bleeds). Tormentors mobbing the healer.",
            tyrannical = "Add HP scaling makes Defiler kill speed THE fight; Guardian needs real tank CDs; one missed soak or a healer death typically ends the run.",
        },
    },
}

----------------------------------------------------------------------
-- Register dungeon bosses in byName lookup
----------------------------------------------------------------------
for _, dungeon in ipairs(D.dungeons) do
    D.byInstanceBoss[dungeon.name] = {}
    local bossList = dungeon.bosses or dungeon.encounters
    if bossList then
        for _, boss in ipairs(bossList) do
            D.byExactName[boss.name] = boss
            D.byInstanceBoss[dungeon.name][#D.byInstanceBoss[dungeon.name] + 1] = boss
            local key = boss.name:lower():gsub("[%s%-'']", "")
            D.byName[key] = boss

            -- Common aliases
            if boss.name == "Arcanotron Custos" then
                D.byName["arcanotron"] = boss
                D.byName["custos"] = boss
            elseif boss.name == "Seranel Sunlash" then
                D.byName["seranel"] = boss
                D.byName["sunlash"] = boss
            elseif boss.name == "Degentrius" then
                -- already covered by gsub
            elseif boss.name == "Muro'jin & Nekraxx" then
                D.byName["murojin"] = boss
                D.byName["nekraxx"] = boss
                D.byName["murojinandnekraxx"] = boss
            elseif boss.name == "Rak'tul, Vessel of Souls" then
                D.byName["raktul"] = boss
                D.byName["vesselofsouls"] = boss
            elseif boss.name == "Chief Corewright Kasreth" then
                D.byName["kasreth"] = boss
                D.byName["corewright"] = boss
            elseif boss.name == "Corewarden Nysarra" then
                D.byName["nysarra"] = boss
            elseif boss.name == "Lothraxion" then
                -- already covered
            elseif boss.name == "Emberdawn" then
                -- already covered
            elseif boss.name == "Derelict Duo" then
                D.byName["kalis"] = boss
                D.byName["latch"] = boss
                D.byName["kalisandlatch"] = boss
            elseif boss.name == "Commander Kroluk" then
                D.byName["kroluk"] = boss
            elseif boss.name == "The Restless Heart" then
                D.byName["restlessheart"] = boss
            elseif boss.name == "Forgemaster Garfrost" then
                D.byName["garfrost"] = boss
            elseif boss.name == "Ick and Krick" then
                D.byName["ick"] = boss
                D.byName["krick"] = boss
            elseif boss.name == "Scourgelord Tyrannus" then
                D.byName["tyrannus"] = boss
            elseif boss.name == "Echo of Doragosa" then
                D.byName["doragosa"] = boss
            elseif boss.name == "High Sage Viryx" then
                D.byName["viryx"] = boss
            elseif boss.name == "Overgrown Ancient" then
                D.byName["ancient"] = boss
            elseif boss.name == "Zuraal the Ascended" then
                D.byName["zuraal"] = boss
            elseif boss.name == "Viceroy Nezhar" then
                D.byName["nezhar"] = boss
            end
        end
    end
end

----------------------------------------------------------------------
-- Boss positions for proximity detection (from Wowhead zone maps)
----------------------------------------------------------------------
-- Magisters' Terrace (zone 15829)
D.bossPositions["Seranel Sunlash"]          = { mapID = 15829, x = 0.558, y = 0.333 }
D.bossPositions["Gemellus"]                 = { mapID = 15829, x = 0.459, y = 0.657 }
D.bossPositions["Degentrius"]               = { mapID = 15829, x = 0.502, y = 0.504 }
-- Maisara Caverns (zone 16395)
D.bossPositions["Muro'jin & Nekraxx"]       = { mapID = 16395, x = 0.522, y = 0.686 }
D.bossPositions["Vordaza"]                  = { mapID = 16395, x = 0.777, y = 0.590 }
D.bossPositions["Rak'tul, Vessel of Souls"] = { mapID = 16395, x = 0.777, y = 0.100 }
-- Windrunner Spire (zone 15808)
D.bossPositions["Emberdawn"]                = { mapID = 15808, x = 0.831, y = 0.507 }
D.bossPositions["Derelict Duo"]             = { mapID = 15808, x = 0.524, y = 0.885 }
D.bossPositions["Commander Kroluk"]         = { mapID = 15808, x = 0.704, y = 0.514 }
D.bossPositions["The Restless Heart"]       = { mapID = 15808, x = 0.674, y = 0.535 }
-- Seat of the Triumvirate (zone 8910)
D.bossPositions["Zuraal the Ascended"]      = { mapID = 8910, x = 0.246, y = 0.726 }
D.bossPositions["Saprish"]                  = { mapID = 8910, x = 0.305, y = 0.367 }
D.bossPositions["Viceroy Nezhar"]           = { mapID = 8910, x = 0.501, y = 0.166 }
D.bossPositions["L'ura"]                    = { mapID = 8910, x = 0.621, y = 0.332 }
-- Algeth'ar Academy (zone 14032)
D.bossPositions["Overgrown Ancient"]        = { mapID = 14032, x = 0.563, y = 0.417 }
D.bossPositions["Crawth"]                   = { mapID = 14032, x = 0.467, y = 0.369 }
D.bossPositions["Vexamus"]                  = { mapID = 14032, x = 0.303, y = 0.357 }
D.bossPositions["Echo of Doragosa"]         = { mapID = 14032, x = 0.617, y = 0.606 }
-- Skyreach (zone 6988) — partial data
D.bossPositions["Ranjit"]                   = { mapID = 6988, x = 0.633, y = 0.385 }

----------------------------------------------------------------------
-- NPC ID → Boss lookup (bypasses WoW 12.0 tainted strings)
----------------------------------------------------------------------
local dungeonNpcIDs = {
    -- Magisters' Terrace
    [231861] = "Arcanotron Custos",
    [231863] = "Seranel Sunlash",
    [231864] = "Gemellus",
    [231865] = "Degentrius",
    -- Maisara Caverns
    [247570] = "Muro'jin & Nekraxx",
    [247572] = "Muro'jin & Nekraxx",  -- Nekraxx
    [248595] = "Vordaza",
    [248605] = "Rak'tul, Vessel of Souls",
    -- Nexus-Point Xenas
    [241539] = "Chief Corewright Kasreth",
    [254227] = "Corewarden Nysarra",
    [241546] = "Lothraxion",
    -- Windrunner Spire
    [231606] = "Emberdawn",
    [231626] = "Derelict Duo",  -- Kalis
    [231629] = "Derelict Duo",  -- Latch
    [231631] = "Commander Kroluk",
    [231636] = "The Restless Heart",
    -- Algeth'ar Academy
    [196482] = "Overgrown Ancient",
    [191736] = "Crawth",
    [194181] = "Vexamus",
    [190609] = "Echo of Doragosa",
    -- Seat of the Triumvirate
    [122313] = "Zuraal the Ascended",
    [122316] = "Saprish",
    [124309] = "Viceroy Nezhar",
    [214650] = "L'ura",
    -- Skyreach
    [75964]  = "Ranjit",
    [76141]  = "Araknath",
    [76379]  = "Rukhran",
    [76266]  = "High Sage Viryx",
    -- Pit of Saron
    [36494]  = "Forgemaster Garfrost",
    [36476]  = "Ick and Krick",  -- Ick
    [36658]  = "Scourgelord Tyrannus",
}
for npcID, bossName in pairs(dungeonNpcIDs) do
    local boss = D.byName[bossName:lower():gsub("[%s%-'']", "")]
    if boss then
        D.byNpcID[npcID] = boss
    end
end

----------------------------------------------------------------------
-- S2 dungeon encounter IDs (ENCOUNTER_START auto-popup) -- from the
-- in-game /vs s2 EJ probe 2026-08-19 (dungeonEncounterIDs).
----------------------------------------------------------------------
local s2DungeonEncounterIDs = {
    -- Altar of Fangs
    [3456] = "Rav'i", [3457] = "The Writhing Coil", [3458] = "Zul'jan",
    -- Murder Row
    [3101] = "Kystia Manaheart", [3102] = "Zaen Bladesorrow",
    [3103] = "Xathuux the Annihilator", [3105] = "Lithiel Cinderfury",
    -- Den of Nalorakk
    [3207] = "The Hoardmonger", [3208] = "Sentinel of Winter", [3209] = "Nalorakk",
    -- The Blinding Vale
    [3199] = "Lightblossom Trinity", [3200] = "Ikuzz the Light Hunter",
    [3201] = "Lightwarden Ruia", [3202] = "Ziekket",
    -- Voidscar Arena
    [3285] = "Taz'Rah", [3286] = "Atroxus", [3287] = "Charonus",
    -- Kings' Rest
    [2139] = "The Golden Serpent", [2142] = "Mchimba the Embalmer",
    [2140] = "The Council of Tribes", [2143] = "Dazar, The First King",
    -- Ruby Life Pools
    [2609] = "Melidrussa Chillworn", [2606] = "Kokia Blazehoof",
    [2623] = "Kyrakka and Erkhart Stormvein",
    -- Temple of Sethraliss
    [2124] = "Adderis and Aspix", [2125] = "Merektha",
    [2126] = "Galvazzt", [2127] = "Avatar of Sethraliss",
}
for eid, bossName in pairs(s2DungeonEncounterIDs) do
    local boss = D.byName[bossName:lower():gsub("[%s%-'']", "")]
    if boss then
        D.byEncounterID[eid] = boss
        boss.encounterID = eid
    end
end
