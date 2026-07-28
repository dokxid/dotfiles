local events = {}

local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

--- @param wezterm Wezterm
events.apply_events = function(wezterm)
	wezterm.on("trigger-toggle-lineheight", function(window, pane)
		local overrides = window:get_config_overrides() or {}
		if not overrides.line_height then
			overrides.line_height = 1.2
		else
			overrides.line_height = nil
		end
		wezterm.log_info("triggered toggle-lineheight")
		window:set_config_overrides(overrides)
	end)

	wezterm.on("update-status", function(window, pane)
		local overrides = window:get_config_overrides() or {}
		if string.find(pane:get_title(), "- [Nn]-vi-m$") then
			overrides.window_padding = {
				left = 0,
				right = 0,
				top = 0,
				bottom = 0,
			}
		else
			overrides.window_padding = {
				left = 40,
				right = 40,
				top = 40,
				bottom = 0,
			}
		end
		window:set_config_overrides(overrides)
	end)

	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local pane = tab.active_pane
		local title = pane.pane_index .. "|" .. basename(pane.foreground_process_name)
		return {
			{ Text = " " .. title .. " " },
		}
	end)

	-- wezterm.on("update-right-status", function(window, pane)
	-- 	local cells = {}
	--
	-- 	-- cwd and hostname
	-- 	local cwd_uri = pane:get_current_working_dir()
	-- 	if cwd_uri then
	-- 		local cwd = ""
	-- 		local hostname = ""
	-- 		if type(cwd_uri) == "userdata" then
	-- 			cwd = cwd_uri.file_path
	-- 			hostname = cwd_uri.host or wezterm.hostname()
	-- 		end
	-- 		local dot = hostname:find("[.]")
	-- 		if dot then
	-- 			hostname = hostname:sub(1, dot - 1)
	-- 		end
	-- 		if not hostname == "" then
	-- 			hostname = wezterm.hostname()
	-- 		end
	-- 		table.insert(cells, "  " .. cwd)
	-- 		-- table.insert(cells, hostname)
	-- 	end
	--
	-- 	local workspace = "  " .. window:active_workspace()
	-- 	table.insert(cells, workspace)
	--
	-- 	-- I like my date/time in this style: "Wed Mar 3 08:14"
	-- 	local date = wezterm.strftime("󰥔  %a %d.%m %H:%M:%S")
	-- 	table.insert(cells, date)
	--
	-- 	local colors = {
	-- 		"#b4befe",
	-- 		"#89b4fa",
	-- 		"#f38ba8",
	-- 		"#89b4fa",
	-- 	}
	-- 	-- The powerline < symbol
	-- 	local LEFT_ARROW = utf8.char(0xe0b3)
	-- 	-- The filled in variant of the < symbol
	-- 	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	--
	-- 	-- Foreground color for the text across the fade
	-- 	local text_fg = "#1e1e2e"
	--
	-- 	-- The elements to be formatted
	-- 	local elements = {}
	-- 	-- How many cells have been formatted
	-- 	local num_cells = 0
	--
	-- 	-- Translate a cell into elements
	-- 	function push(text, is_last)
	-- 		local cell_no = num_cells + 1
	-- 		table.insert(elements, { Foreground = { Color = text_fg } })
	-- 		table.insert(elements, { Background = { Color = colors[cell_no] } })
	-- 		table.insert(elements, { Text = " " .. text .. " " })
	-- 		if not is_last then
	-- 			table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
	-- 			table.insert(elements, { Text = SOLID_LEFT_ARROW })
	-- 		end
	-- 		num_cells = num_cells + 1
	-- 	end
	--
	-- 	while #cells > 0 do
	-- 		local cell = table.remove(cells, 1)
	-- 		push(cell, #cells == 0)
	-- 	end
	--
	-- 	window:set_right_status(wezterm.format(elements))
	-- end)

	return wezterm
end

return events
