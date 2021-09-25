-- This is for the Tier 5 Inspire
local old_PlayerStandard__get_unit_intimidation_action = PlayerStandard._get_unit_intimidation_action
function PlayerStandard:_get_unit_intimidation_action(intimidate_enemies, intimidate_civilians, intimidate_teammates, only_special_enemies, intimidate_escorts, intimidation_amount, primary_only, detect_only, secondary)
	local voice_type, plural, prime_target = old_PlayerStandard__get_unit_intimidation_action(self, intimidate_enemies, intimidate_civilians, intimidate_teammates, only_special_enemies, intimidate_escorts, intimidation_amount, primary_only, detect_only, secondary)

  if voice_type == "revive" and managers.player:has_category_upgrade("player", "heisters_never_die") then
    local range = managers.player:upgrade_value("player", "heisters_never_die")
    local __units = World:find_units("sphere", prime_target.unit:position(), number_to_meters(range), managers.slot:get_mask("persons"))
		for _, _unit in pairs(__units) do 
			if _unit and alive(_unit) and _unit ~= self._unit then
        _unit:interaction():interact(self._unit)
			end
		end
  end

	return voice_type, plural, prime_target
end
