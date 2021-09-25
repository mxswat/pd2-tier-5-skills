-- Avoids crashed when a sub skill tree has less then 5 tiers
function NewSkillTreeTreeItem:link(left_tree, right_tree)
	local first_item, last_item = nil

	for tier, tier_item in ipairs(self._tiers) do
		first_item = tier_item:first_item()
		last_item = tier_item:last_item()

		if left_tree and first_item and tier and left_tree:tier(tier) then
			first_item:link(left_tree:tier(tier):last_item(), nil, nil, nil)
		end

		if right_tree and last_item and tier and right_tree:tier(tier)  then
			last_item:link(nil, right_tree:tier(tier):first_item(), nil, nil)
		end
	end
end