
local function find_skilltree(tab, val)
  for _, value in ipairs(tab) do
      if value.name_id == val then

        return value
      end
  end
  return nil
end

Hooks:PostHook(SkillTreeTweakData, "init", "TIER5_SkillTreeTweakData_init", function(self)
  local function digest(value)
		return Application:digest_value(value, true)
	end

	self.tier_unlocks = {
		digest(0),
		digest(1),
		digest(3),
		digest(18),
		digest(25)
	}
	self.costs = {
		unlock_tree = digest(0),
		default = digest(1),
		pro = digest(3),
		hightier = digest(4),
		hightierpro = digest(8),
		tier5 = digest(8),
	}
	self.unlock_tree_cost = {
		digest(0),
		digest(0),
		digest(0),
		digest(0),
		digest(0),
    digest(0)
	}
	self.skill_pages_order = {
		"mastermind",
		"enforcer",
		"technician",
		"ghost",
		"hoxton"
	}
	self.tier_cost = {
		{
			1,
			3
		},
		{
			2,
			4
		},
		{
			3,
			6
		},
		{
			4,
			8
		},
    {
			6,
			10
		}
	}

	self.num_tiers = #self.tier_cost

	self.skills.explosive_sentries = {
		{
			upgrades = {
				
			},
			cost = self.costs.default
		},
		{
			upgrades = {
				
			},
			cost = self.costs.pro
		},
		name_id = "menu_explosive_sentries",
		desc_id = "menu_explosive_sentries_desc",
		icon_xy = {
			7,
			7
		}
	}

	-- local tree = find_skilltree(self.trees ,"st_menu_technician_sentry")
  -- table.insert(tree.tiers, {
  --   "explosive_sentries"
  -- })

	self.skills.heisters_never_die = {
		{
			upgrades = {
				"player_heisters_never_die_1"
			},
			cost = self.costs.default
		},
		{
			upgrades = {
				"player_heisters_never_die_2"
			},
			cost = self.costs.pro
		},
		name_id = "menu_heisters_never_die",
		desc_id = "menu_heisters_never_die_desc",
		icon_xy = {
			2,
			9
		}
	}
	
	local tree = find_skilltree(self.trees ,"st_menu_mastermind_inspire")
	table.insert(tree.tiers, {
		"heisters_never_die"
	})

	self.skills.dodge_T5_boost = {
		{
			upgrades = {
				"player_dodge_T5_boost_1"
			},
			cost = self.costs.default
		},
		{
			upgrades = {
				"player_dodge_T5_boost_2"
			},
			cost = self.costs.pro
		},
		name_id = "menu_dodge_T5_boost",
		desc_id = "menu_dodge_T5_boost_desc",
		icon_xy = {
			2,
			9
		}
	}
	
	local tree = find_skilltree(self.trees ,"st_menu_ghost_concealed")
	table.insert(tree.tiers, {
		"dodge_T5_boost",
	})
  
end)