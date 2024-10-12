
-- Ensure that each patch that makes use of on_data_final_fixes is instantiated.
require("k2se-tweaks.patches.use-k2-robot-statistics")

local util = require("k2se-tweaks.util")
util.patch.do_data_final_fixes()
