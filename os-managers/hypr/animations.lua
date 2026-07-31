hl.curve("overshoot", { type = "bezier", points = { { 0.5, 0.9 }, { 0.1, 1.1 } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.22, 1 }, { 0.36, 1 } } })

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 0.6,
	bezier = "easeOutQuint",
	style = "popin 80%",
})
hl.animation({
	leaf = "fade",
	enabled = false,
})
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 1.3,
	bezier = "easeOutQuint",
	style = "slidefadevert",
})

hl.config({
	animations = {
		enabled = true,
	},
})
