--- AAI Loaders tend to require items in the tens or hundreds. K2 also requries these items, but
--- tends to require only 1/10th the amount. Here we manually adjust the items back into line with
--- Krastorio 2's balancing.
--- 
--- Note that this also affects Space Loaders and Deep Space Loaders, which wasn't the case before
--- patch 0.6.121.

local util = require("k2se-tweaks.util")
local patch = util.patch.new_patch("kr-loader-recipe")

patch:add_required_startup_setting_equal("nulls-k2se-k2-loader-recipe", true)

function patch.on_data_updates()
	-- Loader
	util.recipe.replace_ingredient_amount("kr-loader", "electronic-circuit", 5, "item")
	util.recipe.replace_ingredient_amount("kr-loader", "iron-gear-wheel", 10, "item")

	-- Fast Loader
	util.recipe.replace_ingredient_amount("kr-fast-loader", "advanced-circuit", 5, "item")
	util.recipe.replace_ingredient_amount("kr-fast-loader", "electric-motor", 5, "item")

	-- Express Loader
	util.recipe.replace_ingredient_amount("kr-express-loader", "electric-engine-unit", 5, "item")
	util.recipe.replace_ingredient_amount("kr-express-loader", "lubricant", 50, "fluid")
	util.recipe.replace_ingredient_amount("kr-express-loader", "processing-unit", 5, "item")

	-- Advanced Loader
	util.recipe.replace_ingredient_amount("kr-advanced-loader", "imersium-gear-wheel", 5, "item")
	util.recipe.replace_ingredient_amount("kr-advanced-loader", "rare-metals", 5, "item")

	-- Superior Loader
	util.recipe.replace_ingredient_amount("kr-superior-loader", "imersium-gear-wheel", 5, "item")
	util.recipe.replace_ingredient_amount("kr-superior-loader", "imersium-plate", 5, "item")
	util.recipe.replace_ingredient_amount("kr-superior-loader", "se-heavy-bearing", 5, "item")

	-- Space Loader
	util.recipe.replace_ingredient_amount("kr-se-loader", "electric-engine-unit", 5, "item")
	util.recipe.replace_ingredient_amount("kr-se-loader", "low-density-structure", 5, "item")
	util.recipe.replace_ingredient_amount("kr-se-loader", "lubricant", 50, "fluid")
	util.recipe.replace_ingredient_amount("kr-se-loader", "processing-unit", 5, "item")

	-- Deep Space Loader
	util.recipe.replace_ingredient_amount("kr-se-deep-space-loader-black", "imersium-gear-wheel", 10, "item")
	util.recipe.replace_ingredient_amount("kr-se-deep-space-loader-black", "lubricant", 100, "fluid")
	util.recipe.replace_ingredient_amount("kr-se-deep-space-loader-black", "se-heavy-assembly", 5, "item")
	util.recipe.replace_ingredient_amount("kr-se-deep-space-loader-black", "se-nanomaterial", 5, "item")
	util.recipe.replace_ingredient_amount("kr-se-deep-space-loader-black", "se-naquium-cube", 1, "item")
	util.recipe.replace_ingredient_amount("kr-se-deep-space-loader-black", "se-quantum-processor", 5, "item")
end

return patch