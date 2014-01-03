PlayerClass = nil
if select(3,UnitClass("player")) == 6
then
	PlayerClass = DK
end

Racial = 0
local _,Race = UnitRace("player")
if Race == "Orc"
	then
		local Orc_Racial = {
		20572,
		33697,
		33702,
		82836
		}
	
		for i=1, #Orc_Racial do
			if IsSpellKnown(Orc_Racial[i]) then
				Racial = Orc_Racial[i]
			end
		end
	end

if Race == "Troll"
then
	Racial = 26297
end

AntiMagicShell = 48707
ArmyoftheDead = 42650
BloodBoil = 48721
BloodPresence = 48263
BloodStrike = 45902
BloodTap = 45529
ChainsofIce = 45524
ControlUndead = 111673
DarkSimulacrum = 77606
DeathCoil = 47541
DeathGrip = 49576
DeathStrike = 49998
DeathandDecay = 43265
EmpowerRuneWeapon = 47568
FrostPresence = 48266
IceboundFortitude = 48792
IcyTouch = 45477
Lichborne = 49039
MindFreeze = 47528
Outbreak = 77575
PathofFrost = 3714
Pestilence = 50842
PlagueStrike = 45462
PlagueLeech = 123693
RaiseAlly = 61999
RaiseDead = 46584
RunicEmpowerment = 81229
Strangulate = 47476
UnholyBlight = 115989
UnholyPresence = 48265
WildMushroom = 113516
BoneShield = 49222
DancingRuneWeapon = 49028
DarkCommand = 56222

--BLOOD
HeartStrike = 55050
RuneStrike = 56815
RuneTap = 48982
SoulReaperBlood = 114866
VampiricBlood = 55233

--FROST
FrostStrike = 49143
HornofWinter = 57330
HowlingBlast = 49184
Obliterate = 49020
PillarofFrost = 51271
SoulReaperFrost = 130735

--UNHOLY
DarkTransformation = 63560
FesteringStrike = 85948
ScourgeStrike = 55090
SoulReaperUnholy = 130736
SummonGargoyle = 49206
UnholyFrenzy = 49016

--TALENT
DeathSiphon = 108196
DeathPact = 48743

Claw = 47468
GargoyleStrike = 51963
Gnaw = 47481
Huddle = 47484
Leap = 47482

--SPECIAL
NecroticStrike = 73975

--BUFFS
CrimsonScourge = 81141
BloodShield = 77535

FreezingFog = 59052
KillingMachine = 51124

DarkSuccor = 101568

--DEBUFFS
FrostFever = 55095
BloodPlague = 55078
-----------------
-- PROCS/BUFFS --
-----------------
--LichborneBuff = PlayerBuff(49039)
--VampiricBloodBuff = PlayerBuff(55233)
--Rime = PlayerBuff("player",59052)
--KillingMachine = PlayerBuff(51124)
--ShadowInfusionBuff,_,_,ShadowInfusionCount = PlayerBuff(91342)
--CrimsonScourge = PlayerBuff(81141)
--if not ShadowInfusionBuff
--then
--	ShadowInfusionCount = 0
--end

--SuddenDoomBuff = PlayerBuff(81340)

--DarkTransformationBuff,_,_,_,_,_,DarkTransformationTimer = UnitBuffID("pet",63560)
--if not DarkTransformationBuff
--then
--	DarkTransformationTimer = 0
--else
--	DarkTransformationTimer = DarkTransformationTimer - GetTime()
--end

--BC,_,_,BCCount = PlayerBuff(114851)


-------------
-- DEBUFFS --
-------------
--FF,_,_,_,_,_,FFtimer = UnitDebuffID("target",55095,"player")
--BP,_,_,_,_,_,BPtimer = UnitDebuffID("target",55078,"player")