local wezterm = require("wezterm") ---@type Wezterm
local helpers = {}

helpers.is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

helpers.is_macos = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

return helpers
