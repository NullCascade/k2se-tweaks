local util = {}

-- 
-- Library to work on lua tables.
-- 

util.table = {}

--- Clears all data from a table.
--- @param t table
function util.table.clear(t)
	for k, _ in pairs(t) do
		t[k] = nil
	end
end

--- Determines if a table contains a given value.
--- @param t table The table to search.
--- @param value any The value to search for.
--- @return boolean contained Set if the value is contained in the given table.
function util.table.contains(t, value)
	return util.table.find(t, value) ~= nil
end

--- Returns the first (arbitrary) key for a given value.
--- @param t table The table to search.
--- @param value any The value to search for.
--- @return any key key associated with the given value.
function util.table.find(t, value)
	for i, v in pairs(t) do
		if (v == value) then
			return i
		end
	end
end

--- Removes the first (arbitrary) instance of a value in a given table.
--- @param t table The table to modify.
--- @param value any The value to remove.
--- @return boolean success True if the value was successfully removed.
function util.table.remove_value(t, value)
	local i = util.table.find(t, value)
	if (i ~= nil) then
		table.remove(t, i)
		return true
	end
	return false
end

--
-- Recipe modification
-- 

util.recipe = {}

local limitation_strings = {
	effectivity = "efficiency-module-not-allowed",
}

--- Allows the use of a module by a given recipe.
--- @param module string The substring name for the module.
--- @param recipe_name string The id of the recipe.
function util.recipe.allow_module(module, recipe_name)
	local recipe = data.raw.recipe[recipe_name]
	if (recipe == nil) then
		log(string.format("Could not find recipe '%s'", recipe_name))
		return
	end

	for _, prototype in pairs(data.raw["module"]) do
		-- log(string.format("[%s/%s] -> %s", recipe_name, module, prototype.name))
		if (prototype.limitation_blacklist and string.find(prototype.name, module, 1, true)) then
			local limitation_message_key = limitation_strings[module]
			if (limitation_message_key and prototype.limitation_message_key == limitation_message_key) then
				prototype.limitation_message_key = nil
			end
			util.table.remove_value(prototype.limitation_blacklist, recipe_name)
			log(string.format("Allowed recipe '%s' to use module '%s'", recipe_name, prototype.name))
		end
	end
end

--- Disallows the use of a module by a given recipe.
--- @param module string The substring name for the module.
--- @param recipe_name string The id of the recipe.
function util.recipe.disallow_module(module, recipe_name)
	local recipe = data.raw.recipe[recipe_name]
	if (recipe == nil) then
		return
	end

	for _, prototype in pairs(data.raw["module"]) do
		if (string.find(prototype.name, module, 1, true)) then
			local limitation_message_key = limitation_strings[module]
			if (limitation_message_key and prototype.limitation_message_key == nil) then
				prototype.limitation_message_key = limitation_message_key
			end

			prototype.limitation_blacklist = prototype.limitation_blacklist or {}
			if not util.table.contains(prototype.limitation_blacklist, recipe_name) then
				table.insert(prototype.limitation_blacklist, recipe_name)
			end
		end
	end
end

--- Gets the ingredients table for a given recipe.
--- @param recipe_name string The name of the recipe.
--- @param expensive boolean? If true, the expensive ingredient is fetched.
--- @return table?
function util.recipe.get_ingredient_table(recipe_name, expensive)
	local recipe = data.raw.recipe[recipe_name]
	if (recipe == nil) then
		return
	end

	if (expensive) then
		return assert((recipe.expensive and recipe.expensive.ingredients) or recipe.ingredients)
	else
		return assert((recipe.normal and recipe.normal.ingredients) or recipe.ingredients)
	end
end

--- Returns the ingredient entry for a given recipe.
--- @param recipe_name string
--- @param search_ingredient string
--- @param type string
--- @return IngredientPrototype|nil ingredient
--- @return integer|nil ingredient_index
function util.recipe.find_ingredient(recipe_name, search_ingredient, type)
	local recipe = data.raw.recipe[recipe_name]
	if (recipe == nil) then
		return
	end
	
	local ingredients = util.recipe.get_ingredient_table(recipe_name)
	for ingredient_index, ingredient in ipairs(ingredients) do
		if (util.ingredient.get_name(ingredient) == search_ingredient and util.ingredient.get_type(ingredient) == type) then
			return ingredient, ingredient_index
		end
	end
end

--- Removes an ingredient from a given recipe.
--- @param recipe_name string
--- @param ingredient_name string
--- @param type string The 
--- @return boolean success If true, the ingredient was removed.
function util.recipe.remove_ingredient(recipe_name, ingredient_name, type)
	local recipe = data.raw.recipe[recipe_name]
	if (recipe == nil) then
		return false
	end

	local ingredients = util.recipe.get_ingredient_table(recipe_name)
	if (not ingredients) then
		return false
	end

	local _, ingredient_index = util.recipe.find_ingredient(recipe_name, ingredient_name, type)
	if (not ingredient_index) then
		return false
	end

	table.remove(ingredients, ingredient_index)
	return true
end

--- Modifies the amount of an item needed for a given recipe. The item must already exist in the recipe.
--- @param recipe_name string
--- @param ingredient_name string
--- @param new_amount number
--- @param type string
--- @return boolean was_modified
function util.recipe.replace_ingredient_amount(recipe_name, ingredient_name, new_amount, type)
	local ingredient = util.recipe.find_ingredient(recipe_name, ingredient_name, type)
	if (not ingredient) then
		return false
	end

	util.ingredient.set_amount(ingredient, new_amount)
	return true
end

--- Wrapper around remove_ingredient and add_ingredient, which removes then adds a replacement ingredient.
--- @param recipe_name string The recipe name.
--- @param old_ingredient string The ingredient name to replace.
--- @param new_ingredient string The ingredient name to use instead.
--- @param amount number The amount of the ingredient needed.
--- @param type string The ingredient type, defaulting to "item".
function util.recipe.replace_ingredient(recipe_name, old_ingredient, new_ingredient, amount, type)
	if (old_ingredient) then
		if (util.recipe.remove_ingredient(recipe_name, old_ingredient, type)) then
			util.recipe.add_ingredient(recipe_name, new_ingredient, amount, type)
		end
	else
		util.recipe.add_ingredient(recipe_name, new_ingredient, amount, type)
	end
end

-- 
-- Ingredient modification
-- 

util.ingredient = {}

function util.ingredient.get_amount(ingredient)
	if (#ingredient == 0) then
		return ingredient.amount
	else
		return ingredient[2]
	end
end

function util.ingredient.set_amount(ingredient, amount)
	if (#ingredient == 0) then
		ingredient.amount = assert(amount)
	else
		ingredient[2] = assert(amount)
	end
end

function util.ingredient.get_name(ingredient)
	if (#ingredient == 0) then
		return assert(ingredient.name)
	else
		return assert(ingredient[1])
	end
end

function util.ingredient.set_name(ingredient, name)
	if (#ingredient == 0) then
		ingredient.name = name
	else
		ingredient[1] = name
	end
end

function util.ingredient.get_type(ingredient)
	if (#ingredient == 0) then
		return assert(ingredient.type or "item")
	else
		return assert("item")
	end
end

return util