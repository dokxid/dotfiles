hl.window_rule({
	match = {
		initial_class = "(gimp|file_png|org.nomacs.ImageLounge)",
	},
	workspace = "name:tools",
	tag = "+gtk",
})

hl.window_rule({
	match = { tag = "gtk" },
	float = true,
})
