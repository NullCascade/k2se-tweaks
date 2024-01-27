
local util = require("util")

-- Allow effiency modules for atmospheric condensers.
util.recipe.allow_module("effectivity", "oxygen") 
util.recipe.allow_module("effectivity", "nitrogen")

-- Allow effiency modules for water electrolysis.
util.recipe.allow_module("effectivity", "kr-water-electrolysis")
util.recipe.allow_module("effectivity", "kr-water-separation")
