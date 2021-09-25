Hooks:PostHook(UpgradesTweakData, "init", "TIER5_UpgradesTweakData_init", function(self)
	self.values.player.heisters_never_die = {
		50, 
		100
	}
	self:add_definition_v2("player", "heisters_never_die", {1, 2})

	self.values.player.dodge_T5_boost = {
		0.4, 
		0.6
	}
	self:add_definition_v2("player", "dodge_T5_boost", {1, 2})
	
	self.values.player.dodge_T5_boost = {
		{
			armor = 0.25, 
			stamina = 20
		},
		{
			armor = 0.50, 
			stamina = 40
		},
	}

	self:add_definition_v2("player", "dodge_T5_boost", {1, 2})
end)