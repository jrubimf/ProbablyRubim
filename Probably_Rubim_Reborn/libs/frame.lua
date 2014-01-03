if ProbablyEngine.config.read('button_states', 'multitarget', true)
then
	RotationText = "Multi Target"
elseif ProbablyEngine.config.read('button_states', 'multitarget', false)
then
	RotationText = "Single Target"
end
	

local rotype = CreateFrame("Frame", "Rotation Indicator", UIParent)
local rottext = rotype:CreateFontString("MyrotypeText", "OVERLAY")
local event = function()
	rotype:SetWidth(240)
	rotype:SetHeight(40)
	rotype:SetPoint("TOP") -- Whats the chat anchor?
	local tex = rotype:CreateTexture("BACKGROUND")
	tex:SetAllPoints()
	tex:SetTexture(0, 0, 0); tex:SetAlpha(0.5)

	rottext:SetFontObject(GameFontNormalSmall)
	rottext:SetJustifyH("CENTER") -- 
	rottext:SetPoint("CENTER", rotype, "CENTER", 0, 0) -- Text on center
	rottext:SetFont("Fonts\\FRIZQT__.TTF", 20)
	rottext:SetShadowOffset(1, -1)
	rottext:SetText("Hello")

	rotype:SetScript("OnUpdate", function()
	rottext:SetText("Rotation: " .. RotationText)
	end)
   
	rotype:SetMovable(true)
	rotype:EnableMouse(true)
	rotype:SetScript("OnMouseDown", function(self, button)
	if button == "LeftButton" and not self.isMoving then
		self:StartMoving();
		self.isMoving = true;
		end
	end)
	rotype:SetScript("OnMouseUp", function(self, button)
	if button == "LeftButton" and self.isMoving then
		self:StopMovingOrSizing();
		self.isMoving = false;
	end
	end)
	rotype:SetScript("OnHide", function(self)
	if ( self.isMoving ) then
		self:StopMovingOrSizing();
		self.isMoving = false;
	end
	end)
end

rotype:SetScript("OnEvent", event)
rotype:RegisterEvent("PLAYER_LOGIN")

if RUBIM_GENERALDK then return false end

local config = {
	name	= 'General Death Knight',
	author	= 'Rubim',
	abilities = {
		{ 	name = "Healthstone",			newSection = true,
			enable = true,
			widget = { type = 'numBox',
				value = 20,
				step = 5,
			},
		},
		{ 	name = "Death Siphon",
			enable = false,
			widget = { type = 'numBox',
				value = 50,
				step = 5,
				tooltip = "You need to have the apropriate talent to use this",
			},
		},
		{ 	name = "Death Pact Combo",
			enable = true,
			widget = { type = 'numBox',
				value = 30,
				step = 5,
				tooltip = "You need the Death Pact talent for this",
			},
		},		
		{ 	name = "Dark Succor", 			newSection = true,
			enable = true,
			widget = { type = 'numBox',
				value = 90,
				step = 5,
				tooltip = "Only works if you have Dark succor Glyphed",
			},
		},		
	},
	hotkeys = {
		{	name = "Death n Decay",		enable = true,	hotkeys = {	'ra' },	},
		{	name = "Necrotic Strike",	enable = true,	hotkeys = {	'ls' },	},
		{	name = "Chains",			enable = true,	hotkeys = {	'lc' },	},
		{	name = "Dispel",			enable = true,	hotkeys = {	'la' },	},
		{	name = "Pause 1",			enable = true,	hotkeys = {	'rc' },	},
	},
}
RUBIM_GENERALDK = PQI:AddRotation(config)