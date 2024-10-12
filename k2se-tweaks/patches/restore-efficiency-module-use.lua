--- Space Exploration 0.6.121 removed the use of efficiency modules in the Atmospheric Condenser
--- when producing oxygen/nitrogen and in the Electrolysis Plant when electrolyzing water.

local util = require("k2se-tweaks.util")

local patch = util.patch.new_patch("restore-efficiency-module-use")
patch:add_required_startup_setting_equal("nulls-k2se-restore-efficiency-module-use", true)

function patch.on_data()
	-- Allow effiency modules for atmospheric condensers.
	util.recipe.allow_module("effectivity", "oxygen")
	util.recipe.allow_module("effectivity", "nitrogen")

	-- Allow effiency modules for water electrolysis.
	util.recipe.allow_module("effectivity", "kr-water-electrolysis")
	util.recipe.allow_module("effectivity", "kr-water-separation")
end

return patch