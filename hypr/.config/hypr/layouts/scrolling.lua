local DIRECTIONS = require("layouts.general").DIRECTIONS

-- layout rules
hl.config({ scrolling = {
	wrap_focus = false,
	wrap_swapcol = false,
} })

-- all dirs
for dir, keys in pairs(DIRECTIONS) do
	for _, key in ipairs(keys) do
		hl.bind(SUPER .. key, function()
			hl.dispatch(hl.dsp.layout("focus " .. dir))
			hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
		end)
	end
end

-- dimension specific
for dir, keys in pairs(DIRECTIONS) do
	if string.match(dir, "^[du]") then
		for _, key in ipairs(keys) do
			hl.bind(SUPER_SHIFT .. key, hl.dsp.window.swap({ direction = dir }))
		end
	else
		for _, key in ipairs(keys) do
			hl.bind(SUPER_SHIFT .. key, hl.dsp.layout("swapcol " .. string.sub(dir, 1, 1)))
		end
	end
end

hl.bind(SUPER .. "minus", hl.dsp.layout("colresize -conf"))
hl.bind(SUPER .. "equal", hl.dsp.layout("colresize +conf"))
hl.bind(SUPER_ALT .. "space", hl.dsp.layout("consume_or_expel prev"))
