-- if we detect a state file from noctalia, change :background for theme detection
-- else, ignore
local theme = io.popen("cat ~/.cache/noctalia-theme 2>/dev/null"):read "*l"
if theme == "dark" then
  vim.o.background = "dark"
elseif theme == "light" then
  vim.o.background = "light"
end
