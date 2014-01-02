-- :3

ProbablyEngine.rotation.register_custom(268, "MK Reborn (Brewmaster-Rubim)", {

--INIT--
{ "pause" , "modifier.mouse5" },

--STUFF
{ "Dizzying Haze", "modifier.mouse4", "ground" },

--AFFS
{ "Breath of Fire", { "@Rubim.boffail" }},
 
-- RACIAL/BUFFS --
{ "Legacy of the Emperor" , "@Rubim.RaidBuffs('STATS')" },
{ "Blood Fury", "target.spell(Jab).range" },


-- FIRST --
{ "Touch of Death" , { "player.buff(Death Note)" , "toggle.touchofdeath" }},


-- CHI BUILDERS --
{ "Keg Smash" , "player.chi <= 2" },
{ "Expel Harm" , { "player.chi <= 3" ,"player.health <= 90" }},
{ "Jab" , "player.chi <= 3" },

{ "Spinning Crane Kick", { "@Rubim.aggrocheck" , "target.spell(Jab).range", "modifier.multitarget" }},
-- CHI FINISHERS --
{ "Blackout Kick" , "!player.buff(Shuffle)" },
{ "Blackout Kick" , { "player.buff(Shuffle).duration <= 4" , "!modifier.multitarget" }},
{ "Tiger Palm" , "!player.buff(Tiger Power)" },
{ "Tiger Palm" , { "!player.buff(Guard)" , "!player.buff(Power Guard)" }},
{ "Spinning Crane Kick", { "target.spell(Jab).range" , "modifier.multitarget" }},
{ "Breath of Fire" , { "player.buff(Shuffle).duration >= 4" , "!target.debuff(Breath of Fire)" , "target.debuff(Dizzying Haze)" , "modifier.multitarget" }},
{ "Guard" , { "@Rubim.tanking" , "player.buff(Power Guard)" }},
{ "Spinning Crane Kick", { "target.spell(Jab).range", "modifier.multitarget" }},
{ "Chi Wave" , "player.health <= 90" },
{ "Blackout Kick" },
{ "Tiger Palm" },

-- Out Of Combat -- Fora do Combate
},

{
-- Out of Combat Buffs --
{ "Legacy of the Emperor" , "@Rubim.RaidBuffs('STATS')" },

{ "Dizzying Haze", "modifier.mouse4", "ground" },
{ "Dizzying Haze", "modifier.lalt", "ground" },


{ "Death and Decay", "modifier.lalt", "ground" },
{"!/click PE_Buttons_multitarget", {	--AoE Toggle
	"modifier.rshift",
 }},
},
function()
ProbablyEngine.toggle.create('touchofdeath', 'Interface\\Icons\\ability_monk_touchofdeath.png', 'Touch of Death', 'Hue')
end)