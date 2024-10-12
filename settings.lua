
local mod_prefix = "nulls-k2se-"

local settings = {
	{
		type = "bool-setting",
		name = mod_prefix .. "k2-loader-recipe",
		setting_type = "startup",
		default_value = true,
		order = "denerf-loaders",
	},
	{
		type = "bool-setting",
		name = mod_prefix .. "restore-efficiency-module-use",
		setting_type = "startup",
		default_value = true,
		order = "denerf-efficiency-module-use",
	},
	{
		type = "bool-setting",
		name = mod_prefix .. "use-k2-robot-statistics",
		setting_type = "startup",
		default_value = true,
		order = "se-k2-robot-statistics",
	},
}
data:extend(settings)
