NanosuitUpgrade =
{
	Client = {},
	Server = {},
	
	Properties =
	{
		object_Model				= "objects/props/ammo_crates/nano_crate_wb.cgf", 
    OnUsedParticleEffect = "",

		bUsable						= 1,
		UseMessage				= "@ui_interaction_collect_nanosuit_upgrade",
		nUpgradePoints			= 1,

		Physics = 
		{
			bRigidBody				= 0,
			bPushableByPlayers		= 0,
			fMass					= 0,
		},

		Tutorial =
		{
			bShowAlways    = 1,
		},
	},
}

function NanosuitUpgrade:OnPropertyChange()
	self:OnReset();
	Game.SendEventToGameObject( self.id, "PropertyChange" );
end

function NanosuitUpgrade.Server:OnInit()
	self:OnReset();
end

function NanosuitUpgrade:OnReset()
	self.used   = 0;
	if (System and System.IsMultiplayer and not System.IsMultiplayer()) then
		Game.AddTacticalEntity(self.id, eTacticalEntity_Story);
	else
		Game.RemoveTacticalEntity(self.id, eTacticalEntity_Story);
	end
end

function NanosuitUpgrade:OnLoad(table)
	self.used = table.used;
	if (System and System.IsMultiplayer and not System.IsMultiplayer() and self.used ~= 1) then
		Game.AddTacticalEntity(self.id, eTacticalEntity_Story);
	else
		Game.RemoveTacticalEntity(self.id, eTacticalEntity_Story);
	end
end

function NanosuitUpgrade:OnSave(table)
	table.used = self.used;
end

function NanosuitUpgrade:IsUsable()
	if (self.Properties.bUsable and (self.used == 0)) then
		return 1;
	else
		return 0;
	end
end

function NanosuitUpgrade:GetUsableMessage()
	return self.Properties.UseMessage;
end

function NanosuitUpgrade:OnUsed(user, idx)
	self.used = 1;
	Game.RemoveTacticalEntity(self.id, eTacticalEntity_Story);
	Game.SendEventToGameObject( self.id, "Used" );
	BroadcastEvent(self, "Used");
end

NanosuitUpgrade.FlowEvents =
{
	Inputs =
	{
	},
	Outputs =
	{
		Used = "bool",
	},
}		
