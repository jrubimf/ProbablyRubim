-- Init
if not Rubim then Rubim = {} end

--if not PQI_Started then
--	PQI_Started = true
--	PQR_BotLoaded()
--	PQR_RotationChanged("Rubim")
--	PQR_Text("Rubim",nil,"FFFFFF")
--
--	xrn:message("...Rubim...")
--	end
	

--CDCheck
function CdCheck(spellid)
	Sstart, Sduration, Senabled = GetSpellCooldown(spellid)
	Scooldown = (Sstart + Sduration - GetTime())
	if Sstart == 0
	then
		Scooldown = 0
	end
	return Scooldown
end

--RAID BUFFS
function Rubim.RaidBuffs(Buff)
	if Buff == "STATS"
	then
		if not GetRaidBuffTrayAuraInfo(1)
		then
			return true
		else
			return false
		end
	elseif Buff == "STAMINA"
	then
		if not GetRaidBuffTrayAuraInfo(2)
		then
			return true
		else
			return false
		end
	elseif Buff == "AP"
	then
		if not GetRaidBuffTrayAuraInfo(3)
		then
			return true
		else
			return false
		end
	elseif Buff == "CRIT"
	then
		if not GetRaidBuffTrayAuraInfo(7)
		then
			return true
		else
			return false
		end
	end

end
--MOUSE4 and MOUSE5 modifier
ProbablyEngine.condition.register("modifier.mouse4", function()
  return IsMouseButtonDown(4) == 1
 end)
 
 ProbablyEngine.condition.register("modifier.mouse5", function()
  return IsMouseButtonDown(5) == 1
 end)

--COMMANDS
ProbablyEngine.command.register('r', function(msg, box)
local command, text = msg:match("^(%S*)%s*(.-)$")

	if command == 'aoe' then
		if ProbablyEngine.config.read('button_states', 'multitarget', false) then
			ProbablyEngine.buttons.toggle('multitarget')
			--ProbablyEngine.buttons.buttons['multitarget']:Click()
			print("|cff08CEFFAreas of Effect:|r |cffFF0000OFF|r")
			RotationText = "Single Target"
		else
			ProbablyEngine.buttons.toggle('multitarget')
			--ProbablyEngine.buttons.buttons['multitarget']:Click()
			print("|cff08CEFFAreas of Effect:|r |cff00FF00ON|r")
			RotationText = "Multi Target"
		end
	end
	
		if command == 'master' then
		if ProbablyEngine.config.read('button_states', 'MasterToggle', false) then
			ProbablyEngine.buttons.toggle('MasterToggle')
			print("|cff08CEFFRotation:|r |cffFF0000OFF|r")
		else
			ProbablyEngine.buttons.toggle('MasterToggle')
			print("|cff08CEFFRotation:|r |cff00FF00ON|r")
		end
	end   
	
end)

--WARRIOR ONLY
local SpellQueueTest = false
ProbablyEngine.listener.register("UNIT_SPELLCAST_FAIL", function(unitID, _, _, _, spellID)
  if unitID == "player" then
    BoFFail = true
	print("falhou")
  end
end)

function Rubim.boffail()
  if SpellQueueTest == true then
    SpellQueueTest = false
    return true
  else
    return false
  end
end

--DK ONLY
--local RaiseAllyFail = false
--ProbablyEngine.listener.register("UNIT_SPELLCAST_FAIL", function(unitID, _, _, _, spellID)
  --if unitID == "player" and spellID == 61999 then
    --RaiseAllyFail = true
--  end
--end)

--function Rubim.raiseally()
  --if RaiseAllyFail == true then
    --RaiseAllyFail = false
--    return true
  --else
    --return false
--  end
--end

--ENCOUNTER CHECK
function Rubim.bosscheck()
	if IsEncounterInProgress()
	then return true else return false
	end
end

--NOT >.>
function Rubim.spellrange(spellid)
	if IsSpellInRange(GetSpellInfo(spellid), "target") == 1
	then return true else return false
	end
end

--Are we tanking?
function Rubim.tanking()
	if UnitThreatSituation("player") == nil
	then
		return false
	elseif UnitThreatSituation("player") == 2
	or UnitThreatSituation("player") == 3
	then
		return true
	else
		return false
	end
end

--Do we have enough AoE aggro?
function Rubim.aggrocheck()
	if UnitThreatSituation("player") == nil
	then
		return false
	elseif UnitThreatSituation("player") == 2
	then
		return true
	else
		return false
	end
end

-- Time to Die
function Rubim.round2(num, idp)
  mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function Rubim.ttd(unit)
	unit = unit or "target";
	if thpcurr == nil then
		thpcurr = 0
	end
	if thpstart == nil then
		thpstart = 0
	end
	if timestart == nil then
		timestart = 0
	end
	if UnitExists(unit) and not UnitIsDeadOrGhost(unit) then
		if currtar ~= UnitGUID(unit) then
			priortar = currtar
			currtar = UnitGUID(unit)
		end
		if thpstart==0 and timestart==0 then
			thpstart = UnitHealth(unit)
			timestart = GetTime()
		else
			thpcurr = UnitHealth(unit)
			timecurr = GetTime()
			if thpcurr >= thpstart then
				thpstart = thpcurr
				timeToDie = 999
			else
				if ((timecurr - timestart)==0) or ((thpstart - thpcurr)==0) then
					timeToDie = 999
				else
					timeToDie = Rubim.round2(thpcurr/((thpstart - thpcurr) / (timecurr - timestart)),2)
				end
			end
		end
	elseif not UnitExists(unit) or currtar ~= UnitGUID(unit) then
		currtar = 0 
		priortar = 0
		thpstart = 0
		timestart = 0
		timeToDie = 0
	end
	if timeToDie==nil then
		return 999
	else
		return timeToDie
	end
end	

--Soulreaper timer check (according to simcraft)
function Rubim.soulreaper()
local TargetHP = 100 * UnitHealth("target") / UnitHealthMax("target") 
	if TargetHP - 3 * (TargetHP/Rubim.ttd()) <= 35
	then
		return true
	else
		return false
	end
end

function Rubim.jabChi()
	CurrentChi = UnitPower("player", 12)
	MaxChi = 4
	if MaxChi - CurrentChi >= 2
	then
		return true
	else
		return false
	end
end

--energy+energy.regen*cooldown.rising_sun_kick.remains>=40
function Rubim.blackoutZ()
	EnergyMax = UnitPowerMax("player")
	EnergyRegen = select(2, GetPowerRegen("player"))
	CurrentEnergy = UnitPower("player")
	
	if ((UnitPower("player") + select(2, GetPowerRegen("player"))) * CdCheck(107428)) >= 40
	then
		return true
	else
		return false
	end
end


function Rubim.timetoMax(secs)
	EnergyMax = UnitPowerMax("player")
	EnergyRegen = select(2, GetPowerRegen("player"))
	CurrentEnergy = UnitPower("player")
	TimeToMax = (EnergyMax - CurrentEnergy) * (1.0 / EnergyRegen)
	if TimeToMax > secs
	then
		return true
	else
		return false
	end
end

---PQI SPELLS---
function Rubim.PQIDeathSiphon()
if PQI_RubimGeneral_DeathSiphon_enable ~= true then return false end
local HealthFrame = tonumber(PQI_RubimGeneral_DeathSiphon_value)
local PlayerHP = 100 * UnitHealth("player") / UnitHealthMax("player") 

if PlayerHP <= HealthFrame
then
	return true
else
	return false
end
end

function Rubim.PQIDarkSuccor()
if PQI_RubimGeneral_DarkSuccor_enable ~= true then return false end
local HealthFrame = tonumber(PQI_RubimGeneral_DarkSuccor_value)
local PlayerHP = 100 * UnitHealth("player") / UnitHealthMax("player") 
if PlayerHP <= HealthFrame
then
	return true
else
	return false
end
end

function Rubim.PQIHealthstone()
if PQI_RubimGeneralDeathKnight_Healthstone_enable ~= true then return false end
local HealthFrame = tonumber(PQI_RubimGeneralDeathKnight_Healthstone_value)
local PlayerHP = 100 * UnitHealth("player") / UnitHealthMax("player") 

if GetItemCount(5512,false,true) > 0
and PlayerHP <= HealthFrame
and UnitAffectingCombat("player")
and GetItemCooldown(5512) == 0
	then
		UseItemByName(5512)
		return false
end

end

function Rubim.PQIDeathPact()
Sstart, Sduration, Senabled = GetSpellCooldown(46584)
Scooldown = (Sstart + Sduration - GetTime())
if Sstart ~= 0 and Scooldown >= 60 then return true end
if not PQI_RubimGeneralDeathKnight_DeathPactCombo_enable then return false end
local HealthFrame = tonumber(PQI_RubimGeneralDeathKnight_DeathPactCombo_value)
local PlayerHP = 100 * UnitHealth("player") / UnitHealthMax("player") 
if PlayerHP <= HealthFrame
then
	return true
end
end

function Rubim.PQIDnD()
if not PQI_RubimGeneralDeathKnight_DeathnDecay_enable then return false end
if not PQI:IsHotkeys( PQI_RubimGeneralDeathKnight_DeathnDecay_key  ) then return false end
return true
end

function Rubim.PQINecrotic()
if not PQI_RubimGeneralDeathKnight_NecroticStrike_enable then return false end
if not PQI:IsHotkeys( PQI_RubimGeneralDeathKnight_NecroticStrike_key  ) then return false end
return true
end

function Rubim.PQIChains()
if UnitDebuff("mouseover",GetSpellInfo(ChainsofIce)) ~= nil then return false end
if not PQI_RubimGeneralDeathKnight_Chains_enable then return false end
if not PQI:IsHotkeys( PQI_RubimGeneralDeathKnight_Chains_key  ) then return false end
return true
end

function Rubim.PQIPause()
if not PQI_RubimGeneralDeathKnight_Pause1_enable then return false end
if not PQI:IsHotkeys( PQI_RubimGeneralDeathKnight_Pause1_key  ) then return false end
return true
end
--function Rubim.PQIRotation()
--end

-- Well well well
ProbablyEngine.library.register("Rubim", Rubim)