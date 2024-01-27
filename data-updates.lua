
-- Ensure that each patch that makes use of do_data_updates is instantiated.
require("nulls-k2se.patches.kr-loader-recipes")

local util = require("nulls-k2se.util")
util.patch.do_data_updates()
