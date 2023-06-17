---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<C-j>"] = { ":bprevious<CR>", "BufPrevious" },
    ["<C-k>"] = { ":bnext<CR>", "BufNext" },

    ["<S-h>"] = { "^", "Start of the line" },
    ["<S-l>"] = { "$", "End of the line" },

    ["g<C-o>"] = { "o<ESC>k", "k new line" },
    ["gO"] =     { "O<ESC>j", "j new line" },

    ["<leader>n"] = { "<cmd> Nvdash <CR>", "DashBoard" },
    ["<leader>ss"] = { "<cmd> SessionManager load_session<CR>", "Select Session to Load" },
    ["<leader>sl"] = { "<cmd> SessionManager load_last_session<CR>", "Load Last Session" },
  },
}
    -- dashboard.button("s", "  Sessions", ":SessionManager load_session<CR>"),
    -- dashboard.button("l", "  Last Session", ":SessionManager load_last_session<CR>"),
-- 
-- more keybinds!

return M
