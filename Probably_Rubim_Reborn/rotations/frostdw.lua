local DSL = ProbablyEngine.dsl.eval
local notDSL = ProbablyEngine.dsl.notEval

ProbablyEngine.rotation.register_custom(251, "DK Reborn (FrostDW-Rubim)", {
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

------------------------
----  SINGLE TARGET ----
------------------------
{{
--actions.single_target=blood_tap,if=talent.blood_tap.enabled&(buff.blood_charge.stack>10&(runic_power>76|(runic_power>=20&buff.killing_machine.react)))
--actions.single_target+=/frost_strike,if=buff.killing_machine.react|runic_power>88
{ FrostStrike , DSL("buff" , "player" , "KillingMachine") },
{ FrostStrike , "player.runic > 88" },

--actions.single_target+=/howling_blast,if=death>1|frost>1
{ HowlingBlast , "player.runes(death) > 1" },
{ HowlingBlast , "player.runes(frost) > 1" },

--actions.single_target+=/unholy_blight,if=talent.unholy_blight.enabled&((dot.frost_fever.remains<3|dot.blood_plague.remains<3))

--actions.single_target+=/soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35
{ SoulReaperFrost , "Rubim.soulreaper()" },

--actions.single_target+=/blood_tap,if=talent.blood_tap.enabled&((target.health.pct-3*(target.health.pct%target.time_to_die)<=35&cooldown.soul_reaper.remains=0))
{ "Blood Tap", { "@Rubim.soulreaper", "player.spell(Soul Reaper).cooldown = 0", "player.buff(Blood Charge).count >= 5" }},

--actions.single_target+=/howling_blast,if=!dot.frost_fever.ticking
{ HowlingBlast , notDSL("debuff" , "target" , FrostFever)},

--actions.single_target+=/plague_strike,if=!dot.blood_plague.ticking&unholy>0
{ PlagueStrike , { notDSL("debuff" , "target" , BloodPlague) , "player.runes(unholy) > 0" }},

--actions.single_target+=/howling_blast,if=buff.rime.react
{ HowlingBlast , DSL("buff" , "player" , FreezingFog) },

--actions.single_target+=/frost_strike,if=runic_power>76
{ FrostStrike , "player.runic > 76" },

--actions.single_target+=/obliterate,if=unholy>0&!buff.killing_machine.react
{ Obliterate , { "player.runes(unholy) > 0" , DSL ("buff" , "player" , KillingMachine) }},

--actions.single_target+=/howling_blast
{ HowlingBlast },

--actions.single_target+=/frost_strike,if=talent.runic_empowerment.enabled&unholy=1
{ FrostStrike , "player.runes(unholy) = 1" },

--actions.single_target+=/blood_tap,if=talent.blood_tap.enabled&(target.health.pct-3*(target.health.pct%target.time_to_die)>35|buff.blood_charge.stack>=8)

--actions.single_target+=/frost_strike,if=runic_power>=40
{ FrostStrike , "player.runic >= 40" },

--actions.single_target+=/horn_of_winter
{ HornofWinter },

--actions.single_target+=/blood_tap,if=talent.blood_tap.enabled
--actions.single_target+=/plague_leech,if=talent.p
{ PlagueLeech , { DSL("debuff" , "target" , FrostFever) , DSL("debuff" , "target" , BloodPlague) }}, 

--actions.single_target+=/empower_rune_weapon
{ EmpowerRuneWeapon , { "@Rubim.bosscheck()" , DSL("spell.range" , "target" , RuneStrike), "modifier.cooldowns" }},
}, "!modifier.multitarget" },

-----------------------
----  MULTI TARGET ----
-----------------------
{{

--actions.aoe=unholy_blight,if=talent.unholy_blight.enabled
--actions.aoe+=/pestilence,if=dot.blood_plague.ticking&talent.plague_leech.enabled,line_cd=28
--actions.aoe+=/pestilence,if=dot.blood_plague.ticking&talent.unholy_blight.enabled&cooldown.unholy_blight.remains<49,line_cd=28

--actions.aoe+=/howling_blast
{ HowlingBlast },

--actions.aoe+=/blood_tap,if=talent.blood_tap.enabled&buff.blood_charge.stack>10

--actions.aoe+=/frost_strike,if=runic_power>76
{ FrostStrike , "player.runic > 76" },

--actions.aoe+=/death_and_decay,if=unholy=1
{ DeathandDecay , "player.runes(unholy) = 1" , "ground" },

--actions.aoe+=/plague_strike,if=unholy=2
{ PlagueStrike , "player.runes(unholy) = 2" },

--actions.aoe+=/blood_tap,if=talent.blood_tap.enabled

--actions.aoe+=/frost_strike
{ FrostStrike },

--actions.aoe+=/horn_of_winter
{ HornofWinter },

--actions.aoe+=/plague_leech,if=talent.plague_leech.enabled&unholy=1
{ PlagueLeech, { DSL("debuff" , "target" , FrostFever) , DSL("debuff" , "target" , BloodPlague) , "player.runes(unholy) = 1" }},

--actions.aoe+=/plague_strike,if=unholy=1
{ PlagueStrike , "player.runes(unholy) = 1" },

--actions.aoe+=/empower_rune_weapon
{ EmpowerRuneWeapon , { "@Rubim.bosscheck()" , DSL("spell.range" , "target" , RuneStrike), "modifier.cooldowns" }},

}, "modifier.multitarget" },


},

{
{ "Pause" , "@Rubim.PQIPause" },
{ FrostPresence, "!player.buff" },
{ HornofWinter, "!player.buff" },
{ DeathandDecay, "@Rubim.PQIDnD", "ground" },
})