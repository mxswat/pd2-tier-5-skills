
function PlayerManager:_dodge_speed_boost()
	-- mx_log_chat('dodge_speed_boost', 'dodge_speed_boost')
	self:activate_temporary_upgrade("temporary", "dodge_speed_boost")
	local stamina_regen = self:player_unit():movement():_max_stamina() * 0.10
	self:player_unit():movement():add_stamina(stamina_regen)
end

Hooks:PostHook(PlayerManager, "init", "TIER5_PlayerManager_init", function(self)
  if self:has_category_upgrade("temporary", "dodge_speed_boost") then
		self:register_message(Message.OnPlayerDodge, "dodge_speed_boost", callback(self, self, "_dodge_speed_boost"))
	else
		self:unregister_message(Message.OnPlayerDodge, "dodge_speed_boost")
	end
end)

local TIER5_PlayerManager_movement_speed_multiplier = PlayerManager.movement_speed_multiplier
function PlayerManager:movement_speed_multiplier(speed_state, bonus_multiplier, upgrade_level, health_ratio)
	local multiplier = TIER5_PlayerManager_movement_speed_multiplier(self, speed_state, bonus_multiplier, upgrade_level, health_ratio)
	multiplier = self:multiply_by_temporary_value_boost_v2(multiplier, "dodge_speed_boost")
	return multiplier
end