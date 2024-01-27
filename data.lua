
-- Ensure that each patch that makes use of do_data is instantiated.
require("nulls-k2se.patches.restore-efficiency-module-use")

local util = require("nulls-k2se.util")
util.patch.do_data()
