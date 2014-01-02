-- :3
local DSL = ProbablyEngine.dsl.eval
local notDSL = ProbablyEngine.dsl.notEval

ProbablyEngine.rotation.register_custom(250, "DK Reborn (Blood-Rubim)", {

-- HOTKEY
{ "Pause" , "@Rubim.PQIPause" },
{ DeathandDecay, "@Rubim.PQIDnD", "ground" },

-- PQI
{ "PQI Healthstone" , "@Rubim.PQIHealthstone()" },
{ RaiseDead , { "@Rubim.PQIDeathPact()" , "player.spell.cooldown(48743) <= 0" }},
{ DeathPact , "@Rubim.PQIDeathPact()" },
--"player.spell.cooldown(46584) >= 1" ,

--MODIFIER
{ MindFreeze, "modifier.interrupts" },
{ DarkCommand, "modifier.taunt" },
--{ DeathGrip, "modifier.taunt" },

--PREBUFFS
{ Racial, DSL("spell.range" , "target" , RuneStrike)},
{ BloodPresence, "!player.buff" },
{ HornofWinter, "!player.buff" },
{ BoneShield, "!player.buff" },

-- Vampiric Blood
{ BloodTap , DSL("buff","player",VampiricBlood) },

--DISEASES
{ Outbreak , notDSL("debuff" , "target" , FrostFever) },
{ Outbreak , notDSL("debuff" , "target" , BloodPlague) }, 

--DISEASES MINAR
{ IcyTouch , notDSL("debuff" , "target" , FrostFever) },
{ PlagueStrike , notDSL("debuff" , "target" , BloodPlague) }, 

{ RuneStrike , "player.runicpower >= 76" },

{{
}, "toggle.deeps"},

{{ -- SINGLE TARGET
{ DeathStrike , notDSL("buff","player",BloodShield) },
{ SoulReaperBlood , { "@Rubim.soulreaper()" , "player.runes(blood).count > 1" , "!modifier.multitarget"}},
{ HearthStrike , { "player.runes(blood).count > 1" , "!modifier.multitarget" }},
{ BloodBoil, { DSL("buff","player",CrimsonScourge) , "player.runicpower < 90" , DSL("spell.range" , "target" , RuneStrike)}},
{ DeathStrike },
}, "!modifier.multitarget" },

{{ -- MULTI
{ BloodBoil , { "@Rubim.aggrocheck" , DSL("spell.range" , "target" , RuneStrike) , "modifier.multitarget" }},
{ BloodBoil , { "player.runes(blood).count > 0" , DSL("spell.range" , "target" , RuneStrike) }},
{ BloodBoil, { DSL("buff","player",CrimsonScourge) , DSL("spell.range" , "target" , RuneStrike) }},
{ DeathStrike },

}, "modifier.multitarget" },

--RuneStrike
{ RuneStrike, "player.runes(blood).count < 2"},
{ RuneStrike, "player.runes(death).count < 2"},
{ RuneStrike, "player.runes(unholy).count < 2"},

--{ BloodTap , { "player.buff(Blood Charge).count > 10" , "player.runes(blood).count <= 1" }},
---{ BloodTap , { "player.buff(Blood Charge).count > 10" , "player.runes(frost).count <= 1" }},
--{ BloodTap , { "player.buff(Blood Charge).count > 10" , "player.runes(unholy).count <= 1" }},

--Heart Strike -- Blood boil
{ SoulReaperBlood , { "@Rubim.soulreaper()" , "player.runes(blood).count > 0" , "!modifier.multitarget"}},
{ HeartStrike , { "player.runes(blood).count >  0" , "!modifier.multitarget"}},
{ BloodBoil , { "player.runes(blood).count > 0" , DSL("spell.range" , "target" , RuneStrike) , "modifier.multitarget" }},
{ HornofWinter },

-- Out Of Combat -- Fora do Combate
},

{
-- Buffs + Presença
{ "Pause" , "@Rubim.PQIPause" },
{ BloodPresence, "!player.buff" },
{ HornofWinter, "!player.buff" },
{ BoneShield, "!player.buff" },
{ DeathandDecay, "@Rubim.PQIDnD", "ground" },
})