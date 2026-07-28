local look = {}
local helpers = require("helpers")

look.appearance_config = function()
	if helpers.get_appearance():find("dark") then
		return {
			dark_mode = true,
			scheme = "Catppuccin Mocha",
			opacity = helpers.is_linux() and 0.8 or 1.0,
		}
	else
		return {
			dark_mode = false,
			scheme = "Catppuccin Latte",
			opacity = 1.0,
		}
	end
end

return look
