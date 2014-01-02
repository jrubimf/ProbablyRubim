-- :3

ProbablyEngine.rotation.register_custom(269, "MK Reborn (Windwalker-Rubim)", {

{ "Legacy of the Emperor" , "@Rubim.RaidBuffs('STATS')" },
{ "Legacy of the White Tiger" , "@Rubim.RaidBuffs('CRIT')" },

-- B U F F S
{ "Touch of Death" , { "player.buff(Death Note)" , "toggle.touchofdeath" }},

{ "Blood Fury", "target.spell(Jab).range" },
{ "Chi Wave" , "player.health <= 80" },

--B	17.92	tiger_palm,if=buff.tiger_power.remains<=3
{ "Tiger Palm" , "!player.buff(Tiger Power)" },
{ "Tiger Palm" , "player.buff(Tiger Power).duration <= 3" },

--C	0.07	tigereye_brew,if=buff.tigereye_brew_use.down&buff.tigereye_brew.stack=20
--D	6.36	tigereye_brew,if=buff.tigereye_brew_use.down&trinket.proc.agility.react
--E	13.07	tigereye_brew,if=buff.tigereye_brew_use.down&chi>=2&(trinket.proc.agility.react|trinket.proc.strength.react|buff.tigereye_brew.stack>=15|target.time_to_die<40)&debuff.rising_sun_kick.up&buff.tiger_power.up
{ "Tigereye Brew", { "target.spell(Jab).range" , "player.buff(Tigereye Brew).count >= 10" }},

--F	6.69	energizing_brew,if=energy.time_to_max>5
{ "Energizing Brew" , "@Rubim.timetoMax(5)" },

--G	1.02	rising_sun_kick,if=debuff.rising_sun_kick.down
{ "Rising Sun Kick" , "!target.debuff(Rising Sun Kick)" },

--H	0.00	tiger_palm,if=buff.tiger_power.down&debuff.rising_sun_kick.remains>1&energy.time_to_max>1
{ "Tiger Palm" , { "!player.buff(Tiger Power)" , "!target.debuff(Rising Sun Kick).duration > 1" , "@Rubim.timetoMax(1)" }},

--I	3.01	invoke_xuen,if=talent.invoke_xuen.enabled
--J	0.00	run_action_list,name=aoe,if=active_enemies>=3
--K	0.00	run_action_list,name=single_target,if=active_enemies<3
--actions.single_target
--#	count	action,conditions
--R	49.73	rising_sun_kick
{ "Rising Sun Kick" },

--S	12.97	fists_of_fury,if=buff.energizing_brew.down&energy.time_to_max>4&buff.tiger_power.remains>4
{ "Fists of Fury" , { "!player.buff(Energizing Brew)" , "@Rubim.timetoMax(4)" , "player.buff(Tiger Power).duration > 4" }},

--T	27.29	chi_wave,if=talent.chi_wave.enabled&energy.time_to_max>2
--U	0.00	chi_burst,if=talent.chi_burst.enabled&energy.time_to_max>2
--V	0.00	zen_sphere,cycle_targets=1,if=talent.zen_sphere.enabled&energy.time_to_max>2&!dot.zen_sphere.ticking

--W	17.56	blackout_kick,if=buff.combo_breaker_bok.react
{ "Blackout Kick", "player.buff(Combo Breaker: Blackout Kick)" },

--X	15.28	tiger_palm,if=buff.combo_breaker_tp.react&(buff.combo_breaker_tp.remains<=2|energy.time_to_max>=2)
{ "Tiger Palm", "player.buff(Combo Breaker: Tiger Palm)" },

--Y	152.15	jab,if=chi.max-chi>=2
{ "Jab" , "@Rubim.jabChi" },

--Z	94.36	blackout_kick,if=energy+energy.regen*cooldown.rising_sun_kick.remains>=40
{ "Blackout Kick" , "@Rubim.blackoutZ" },
--{ "Blackout Kick" , { "" , "" }},

-- Out Of Combat -- Fora do Combate
},

{
-- Buffs + Presença
{ "Legacy of the Emperor" , "@Rubim.RaidBuffs('STATS')" },
{ "Legacy of the White Tiger" , "@Rubim.RaidBuffs('CRIT')" },
},
function()
ProbablyEngine.toggle.create('touchofdeath', 'Interface\\Icons\\ability_monk_touchofdeath.png', 'Touch of Death', 'Hue')
end)