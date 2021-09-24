Hooks:PostHook(UpgradesTweakData, "init", "TIER5_UpgradesTweakData_init", function(self)
	self.values.player.heisters_never_die = {
		50, 
		100
	}
	self:add_definition_v2("player", "heisters_never_die", {1, 2})
	
end)