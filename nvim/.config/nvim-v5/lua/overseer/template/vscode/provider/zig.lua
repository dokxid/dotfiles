local M = {}

M.get_task_opts = function(defn)
  return {
    cmd = vim.list_extend({ "zig" }, defn.args or {}),
    cwd = defn.options and defn.options.cwd,
    env = defn.options and defn.options.env,
  }
end

-- Optional: Define problem matchers for Zig compiler output
M.problem_patterns = {
  ["$zig"] = {
    regexp = "^(.+):(\\d+):(\\d+): (error|warning|note): (.+)$",
    file = 1,
    line = 2,
    column = 3,
    severity = 4,
    message = 5,
  },
}

M.problem_matchers = {
  ["$zig"] = {
    owner = "zig",
    pattern = "$zig",
    fileLocation = { "relative", "${workspaceFolder}" },
  },
}

return M
