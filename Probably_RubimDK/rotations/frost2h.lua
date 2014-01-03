local DSL = ProbablyEngine.dsl.eval
local notDSL = ProbablyEngine.dsl.notEval

ProbablyEngine.rotation.register_custom(251, "DK Reborn (Frost2H-Rubim)", {
--MODIFIER
{ "Pause" , "@Rubim.PQIPause" },
{ DeathandDecay, "@Rubim.PQIDnD", "ground" },

-- BUFFS
{ FrostPresence, "!player.buff" },
{ HornofWinter, "!player.buff" },
{ PillarofFrost, DSL("spell.range" , "target" , FrostStrike)},
{ Racial, DSL("spell.range" , "target" , FrostStrike)},
{ RaiseDead, DSL("spell.range" , "target" , FrostStrike)},

-- PQI
{ "PQI Healthstone" , "@Rubim.PQIHealthstone()" },
{ DeathSiphon,"@Rubim.PQIDeathSiphon()" },
{ DeathStrike, { DSL("buff" , "player" , DarkSuccor), "@Rubim.PQIDarkSuccor()" }},

{{ -- S I N G L E   T A R G E T

--actions.single_target=plague_leech,if=talent.plague_leech.enabled&((dot.blood_plague.remains<1|dot.frost_fever.remains<1))
{ PlagueLeech , { DSL("debuff" , "target" , FrostFever) , DSL("debuff" , "target" , BloodPlague) , "target.debuff(55095).duration < 1" }}, 
{ PlagueLeech , { DSL("debuff" , "target" , FrostFever) , DSL("debuff" , "target" , BloodPlague) , "target.debuff(55078).duration < 1" }}, 

--actions.single_target+=/outbreak,if=!dot.frost_fever.ticking|!dot.blood_plague.ticking
{ Outbreak , notDSL("debuff" , "target" , FrostFever) },
{ Outbreak , notDSL("debuff" , "target" , BloodPlague) }, 

--actions.single_target+=/unholy_blight,if=talent.unholy_blight.enabled&((!dot.frost_fever.ticking|!dot.blood_plague.ticking))
{ "Unholy Blight", "!target.debuff(Frost Fever)" },
{ "Unholy Blight", "!target.debuff(Blood Plague)" },

--actions.single_target+=/soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35
{ SoulReaperFrost, "@Rubim.soulreaper()"},

--actions.single_target+=/blood_tap,if=talent.blood_tap.enabled&((target.health.pct-3*(target.health.pct%target.time_to_die)<=35&cooldown.soul_reaper.remains=0))
--{ "Blood Tap", { "@Rubim.soulreaper", "player.spell(Soul Reaper).cooldown = 0", "player.buff(Blood Charge).count >= 5" }},

--actions.single_target+=/howling_blast,if=!dot.frost_fever.ticking
{ HowlingBlast , notDSL("debuff" , "target" , FrostFever) },

--actions.single_target+=/plague_strike,if=!dot.blood_plague.ticking
{ PlagueStrike , notDSL("debuff" , "target" , BloodPlague) }, 

--actions.single_target+=/howling_blast,if=buff.rime.react
{ HowlingBlast , DSL("buff" , "player" , FreezingFog) },

--actions.single_target+=/obliterate,if=buff.killing_machine.react
{ Obliterate, DSL("buff" , "player" , KillingMachine) },

--actions.single_target+=/blood_tap,if=talent.blood_tap.enabled&buff.killing_machine.react
--{ "Blood Tap", { "player.buff(Killing Machine)" , "player.buff(Blood Charge).count >= 5" }},

--actions.single_target+=/blood_tap,if=talent.blood_tap.enabled&(buff.blood_charge.stack>10&runic_power>76)
--{ "Blood Tap", { "player.buff(Blood Charge).count > 10" , "player.runicpower > 76" }},

--actions.single_target+=/frost_strike,if=runic_power>76
{ FrostStrike, "player.runicpower > 76" },

--actions.single_target+=/obliterate,if=blood=2|frost=2|unholy=2
{ Obliterate, "player.runes(blood).count = 2"},
{ Obliterate, "player.runes(frost).count = 2"},
{ Obliterate, "player.runes(unholy).count = 2"},

--actions.single_target+=/plague_leech,if=talent.plague_leech.enabled&((dot.blood_plague.remains<3|dot.frost_fever.remains<3))
{ PlagueLeech , { DSL("debuff" , "target" , FrostFever) , DSL("debuff" , "target" , BloodPlague) , "target.debuff(55095).duration < 3" }}, 
{ PlagueLeech , { DSL("debuff" , "target" , FrostFever) , DSL("debuff" , "target" , BloodPlague) , "target.debuff(55078).duration < 3" }}, 

--actions.single_target+=/outbreak,if=dot.frost_fever.remains<3|dot.blood_plague.remains<3
{ Outbreak , "target.debuff(55095).duration < 3" },
{ Outbreak , "target.debuff(55078).duration < 3" },

--actions.single_target+=/unholy_blight,if=talent.unholy_blight.enabled&((dot.frost_fever.remains<3|dot.blood_plague.remains<3))
--{ "Unholy Blight", "target.debuff(Frost Fever).duration < 3" },
--{ "Unholy Blight", "target.debuff(Blood Plague).duration < 3" },

--actions.single_target+=/frost_strike,if=talent.runic_empowerment.enabled&(frost=0|unholy=0|blood=0)
{ FrostStrike, "player.runes(frost).count = 0"},
{ FrostStrike, "player.runes(unholy).count = 0"},
{ FrostStrike, "player.runes(blood).count = 0"},

--actions.single_target+=/frost_strike,if=talent.blood_tap.enabled&buff.blood_charge.stack<=10
--{ "Frost Strike", "player.buff(Blood Charge).count <= 10" },

--actions.single_target+=/horn_of_winter
{ HornofWinter },

--actions.single_target+=/obliterate
{ Obliterate },

--actions.single_target+=/blood_tap,if=talent.blood_tap.enabled&(buff.blood_charge.stack>10&runic_power>=20)
--{ BloodTap , { "player.buff(Blood Charge).count > 10" , "player.runicpower >= 20" }},

--actions.single_target+=/frost_strike
{ FrostStrike },

--actions.single_target+=/plague_leech,if=talent.plague_leech.enabled
{ PlagueLeech , { DSL("debuff" , "target" , FrostFever) , DSL("debuff" , "target" , BloodPlague) }}, 
{ PlagueLeech , { DSL("debuff" , "target" , FrostFever) , DSL("debuff" , "target" , BloodPlague) }}, 

--actions.single_target+=/empower_rune_weapon
{ EmpowerRuneWeapon , { "@Rubim.bosscheck()" , DSL("spell.range" , "target" , RuneStrike), "modifier.cooldowns" }},

--actions.single_target+=/outbreak,if=!dot.frost_fever.ticking|!dot.blood_plague.ticking
{ Outbreak, notDSL("debuff" , "target" , FrostFever) },
{ Outbreak, notDSL("debuff" , "target" , BloodPlague) },
}, "!modifier.multitarget" },

{{ -- M U L T I   T A R G E T

{ Outbreak, notDSL("debuff" , "target" , FrostFever) },
{ Outbreak, notDSL("debuff" , "target" , BloodPlague) },
--actions.aoe=unholy_blight,if=talent.unholy_blight.enabled
--actions.aoe+=/pestilence,if=dot.blood_plague.ticking&talent.plague_leech.enabled,line_cd=28
--actions.aoe+=/pestilence,if=dot.blood_plague.ticking&talent.unholy_blight.enabled&cooldown.unholy_blight.remains<49,line_cd=28
{ "Pestilence", "modifier.rcontrol" },
--actions.aoe+=/howling_blast
{ HowlingBlast },
--actions.aoe+=/blood_tap,if=talent.blood_tap.enabled&buff.blood_charge.stack>10
--{ "Blood Tap" , "player.buff(Blood Charge).count > 10" },
--actions.aoe+=/frost_strike,if=runic_power>76
{ FrostStrike, "player.runicpower > 76" },
--actions.aoe+=/death_and_decay,if=unholy=1
{ DeathandDecay, "player.runes(unholy) = 1", "ground" },
--actions.aoe+=/plague_strike,if=unholy=2
{ PlagueStrike, "player.runes(unholy) = 2" },
--actions.aoe+=/blood_tap,if=talent.blood_tap.enabled
--{ BloodTap , "player.buff(Blood Charge).count >= 5" },
--actions.aoe+=/frost_strike
{ FrostStrike },
--actions.aoe+=/horn_of_winter
{ HornofWinter },
--actions.aoe+=/plague_leech,if=talent.plague_leech.enabled&unholy=1
{ PlagueLeech , { DSL("debuff" , "target" , FrostFever) , DSL("debuff" , "target" , BloodPlague) , "player.runes(unholy) = 1" }}, 

--actions.aoe+=/plague_strike,if=unholy=1
{ PlagueStrike, "player.runes(unholy) = 1" },
--actions.aoe+=/empower_rune_weapon
{ EmpowerRuneWeapon , { "@Rubim.bosscheck()" , DSL("spell.range" , "target" , RuneStrike), "modifier.cooldowns" }},
}, "modifier.multitarget"},


-- Out Of Combat -- Fora do Combate
},

{
-- Buffs + Presença
{ "Pause" , "@Rubim.PQIPause" },
{ FrostPresence, "!player.buff" },
{ HornofWinter, "!player.buff" },
{ DeathandDecay, "@Rubim.PQIDnD", "ground" },
})