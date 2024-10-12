--- Space Exploration 0.6.121 adjusts the rather generous K2 robot stats. It doubles their health,
--- but reduces their speed by 33%, max energy by 50%, and minimizes their carry capacity.

local util = require("k2se-tweaks.util")

local patch = util.patch.new_patch("use-k2-robot-statistics")
patch:add_required_startup_setting_equal("nulls-k2se-use-k2-robot-statistics", true)

function patch.on_data_final_fixes()
	local logistic_bot = data.raw["logistic-robot"]["logistic-robot"]
	if (logistic_bot) then
		logistic_bot.speed = 0.0694 -- SE value: 0.05
		logistic_bot.max_energy = "3MJ" -- SE value: 1.5 MJ
		logistic_bot.max_health = 50 -- SE value: 100
		logistic_bot.max_payload_size = 7 -- SE value: 1
	end

	local construction_bot = data.raw["construction-robot"]["construction-robot"]
	if (construction_bot) then
		construction_bot.speed = 0.09257 -- SE value: 0.06
		construction_bot.max_energy = "3MJ" -- SE value: 1.5 MJ
		construction_bot.max_health = 50 -- SE value: 100
		construction_bot.max_payload_size = 2 -- SE value: 1
	end
end

return patch