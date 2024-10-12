
-- Ensure that each patch that makes use of do_data_updates is instantiated.
require("k2se-tweaks.patches.kr-loader-recipes")

local util = require("k2se-tweaks.util")
util.patch.do_data_updates()
