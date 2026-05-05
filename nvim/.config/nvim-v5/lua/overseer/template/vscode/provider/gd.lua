local M = {}

M.get_task_opts = function(defn)
  return {
    cmd = vim.list_extend({ "gd" }, defn.args or {}),
    cwd = defn.options and defn.options.cwd,
    env = defn.options and defn.options.env,
  }
end

M.problem_matchers = {
  ["$gdlint"] = {
    pattern = {
      regexp = "^(.+):(\\d+): Error: (.+) \\((.+)\\)$",
      file = 1,
      line = 2,
      severity = 3,
      message = 4,
    },
    fileLocation = { "absolute" },
  },
}

return M
