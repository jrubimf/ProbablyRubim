-- :3

ProbablyEngine.rotation.register_custom(73, "WR Reborn (Protection-Rubim)", {

{ "Battle Shout" , "@Rubim.RaidBuffs('AP')" },
{ "Blood Fury", "target.spell(Heroic Strike).range" },

{ "Thunder Clap", { "!target.debuff(Weakened Blows)" , "target.spell(Heroic Strike).range" }},
{ "Victory Rush", { "player.buff(Victorious)" , "player.health <= 90" }},
{ "Shield Slam", "player.rage <= 80" },
{ "Revenge" , "player.rage <= 80" },
{ "Devastate", "!target.debuff(Weakened Armor) <= 3" },
{ "Devastate", "!target.debuff(Deep Wounds)" },
{ "Battle Shout" },
{ "Execute", "player.rage >= 70" },
{ "Heroic Strike" , { "player.buff(Incite)" , "!modifier.multitarget" }},
{ "Heroic Strike", { "player.rage >= 70", "!modifier.multitarget" }},
{ "Cleave" , { "player.buff(Incite)" , "modifier.multitarget" }},
{ "Cleave", { "player.rage >= 70" , "modifier.multitarget" }},
{ "Devastate" },

-- Out Of Combat -- Fora do Combate
},

{
-- Buffs + Presença
{ "Battle Shout" , "@Rubim.RaidBuffs('AP')" },
{ "Defensive Stance", "!player.buff" }, --Blood Presence
})