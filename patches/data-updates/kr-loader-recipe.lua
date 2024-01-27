
-- Restores the Krastorio 2 recipe values for loaders, when AAI Loaders is installed in Graphics Only mode.
-- This also brings the space loaders more in line with K2's recipe values.

-- We only care if AAI Loaders is installed.
if not mods["aai-loaders"] then
	return
end

-- We also only care if the mod is set to "Graphics Only" mode.
if settings.startup["aai-loaders-mode"].value ~= "graphics-only" then
	return
end

local util = require("util")

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
