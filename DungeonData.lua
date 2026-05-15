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
