local wezterm = require("wezterm") ---@type Wezterm
local helpers = {}

helpers.is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

helpers.is_macos = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

helpers.get_appearance = function()
	if not wezterm.gui then
		return "dark"
	end
	if wezterm.gui.get_appearance():find("Dark") then
		return "dark"
	else
		return "light"
	end
end

return helpers
