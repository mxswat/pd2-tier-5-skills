Hooks:PostHook(UpgradesTweakData, "init", "TIER5_UpgradesTweakData_init", function(self)
	self.values.player.heisters_never_die = {
		50, 
		100
	}
	self:add_definition_v2("player", "heisters_never_die", {1, 2})

	self.values.player.dodge_speed_boost = {
		0.4, 
		0.6
	}
	self:add_definition_v2("player", "dodge_speed_boost", {1, 2})
	
	self.values.temporary.dodge_speed_boost = {
		{
			1.4, -- value
			1, -- duration
		},
		{
			1.6, -- value
			1, -- duration
		}
	}

	self:add_temporary_upgrades_v2("dodge_speed_boost", {1, 2})
end)