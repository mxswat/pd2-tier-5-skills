
function PlayerManager:_dodge_T5_boost()
	local bonus = self:upgrade_value("player", "dodge_T5_boost")
	local stamina_regen = self:player_unit():movement():_max_stamina() * bonus.stamina
	local armor_regen = self:player_unit():character_damage():_max_armor() * bonus.armor
	mx_log_chat('self:player_unit():character_damage():_max_armor()', self:player_unit():character_damage():_max_armor())
	mx_log_chat('armor_regen', armor_regen)
	self:player_unit():character_damage():change_armor(armor_regen)
	self:player_unit():movement():add_stamina(stamina_regen)
end

Hooks:PostHook(PlayerManager, "init", "TIER5_PlayerManager_init", function(self)
  if self:has_category_upgrade("player", "dodge_T5_boost") then
		self:register_message(Message.OnPlayerDodge, "dodge_T5_boost", callback(self, self, "_dodge_T5_boost"))
	else
		self:unregister_message(Message.OnPlayerDodge, "dodge_T5_boost")
	end
end)