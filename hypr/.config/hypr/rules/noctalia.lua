hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
	},
	no_anim = true,
	ignore_alpha = 0.3,
	blur = true,
	blur_popups = true,
})

hl.window_rule({
	match = { initial_class = "dev.noctalia.Noctalia" },
	float = true,
	size = { 1080, 920 },
})

require("noctalia").apply_theme()
