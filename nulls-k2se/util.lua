local util = {}

util.ingredient = require("nulls-k2se.util.ingredient")
util.patch = require("nulls-k2se.util.patch")
util.recipe = require("nulls-k2se.util.recipe")
util.table = require("nulls-k2se.util.table")

function util.log(fmt, ...)
	log(string.format(fmt, ...))
end

return util