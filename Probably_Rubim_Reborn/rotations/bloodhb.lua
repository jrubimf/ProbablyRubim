-- :3

ProbablyEngine.rotation.register_custom(250, "DK HonorBuddy(Blood-Rubim)", {

-- IMPORTANT
{ "Raise Ally", { "@Rubim.raiseally" } , "mouseover" },
{ "Mind Freeze", "modifier.interrupts" },
{ "Dark Command", "modifier.taunt" },
{ "Death Grip", "modifier.taunt" },

-- Death Pact Macro
  { "!/cast Raise Dead\n/cast Death Pact", {
    "player.health < 30",
    "player.spell(Death Pact).cooldown",
    "player.spell(Raise Dead).cooldown",
    "player.spell(Death Pact).usable"
  }},

--STUFF
  { "!/run ProbablyEngine.buttons.buttons['​multitarget']:Click()", "modifier.rshift" }, -- Credit to some random guy.
  { "Death and Decay", "modifier.lalt", "ground" },
 
-- B U F F S
{ "Berserking", "@Rubim.meelerange()" },
{ "Horn of Winter", "!player.buff(Horn of Winter)" }, --Horn
{ "Bone Shield", "!player.buff(Bone Shield)" }, --Bone Shield

--DISEASES
{ "Outbreak", { "!target.debuff(Frost Fever)", "!target.debuff(Blood Plague)", }},
{ "Rune Tap" , "player.health <= 75" },
{ "Rune Strike" , "player.runicpower <= 90" },
{ "Death Siphon" },
{ "Blood Boil" , "target.range <= 8"},
{ "Rune Strike" },

-- Out Of Combat -- Fora do Combate
},

{
-- Buffs + Presença
{ "Repeat" , "@Rubim.Repeat()" },
})