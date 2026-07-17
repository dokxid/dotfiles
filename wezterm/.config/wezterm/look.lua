local look = {}

local appearance = require("helpers").get_appearance()

look.appearance_config = function()
	if appearance:find("dark") then
		return {
			dark_mode = true,
			scheme = "Catppuccin Mocha",
		}
	else
		return {
			dark_mode = false,
			scheme = "Catppuccin Latte",
		}
	end
end

return look
