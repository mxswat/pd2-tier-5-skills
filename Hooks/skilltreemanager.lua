-- This is to have a common tier_cost instead of the crap overkill did
local function get_skill_costs()
	local t = tweak_data.skilltree.tier_cost

	return t
end

-- ignores incoming skill_cost
function SkillTreeManager:skill_cost(tier, skill_level, skill_cost)
	local t = get_skill_costs()
	return t[tier][skill_level]
end
