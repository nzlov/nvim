require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "s", "<cmd>HopChar1<cr>", { desc = "Search Char" })
map("n", "S", "<cmd>HopChar<cr>", { desc = "Search Word" })

map("n", "gd", "<cmd> Telescope lsp_definitions<cr>", { desc = "LSP Definition" })
map("n", "gr", "<cmd> Telescope lsp_references<cr>", { desc = "LSP References" })
map("n", "gi", "<cmd> Telescope lsp_implementations<cr>", { desc = "LSP Implementations" })
map("n", "K", "<cmd> lua vim.lsp.buf.hover()<cr>", { desc = "LSP Hover" })

map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>a", "<cmd>%y+<cr>", { desc = "Copy whole file" })
map("n", "<leader>o", "<cmd>AerialToggle!<CR>", { desc = "AerialToggle" })
map("n", "<leader>q", "<cmd>q!<CR>", { desc = "Exit" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save File" })
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })
map("n", "<leader>n", "<cmd>enew <CR>", { desc = "New File" })
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "UndotreeToggle" })
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "toggle nvimtree" })

map("n", "<leader>tn", "<cmd> set nu! <CR>", { desc = "toggle line number" })
map("n", "<leader>tr", "<cmd> set rnu! <CR>", { desc = "toggle relative number" })
map("n", "<leader>tt", "<cmd> lua require('base46').toggle_theme() <CR>", { desc = "toggle theme" })

-- dap
function _float_console()
  require("dapui").float_element(
    "console",
    { position = "center", height = math.floor(vim.o.lines * 0.9), width = math.floor(vim.o.columns * 0.8) }
  )
end

map("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", { desc = "Step Back" })
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" })
map("n", "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", { desc = "Run To Cursor" })
map("n", "<leader>dQ", "<cmd>lua require'dap'.terminate()<cr>", { desc = "Quit" })
map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step Into" })
map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step Over" })
map("n", "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step Out" })
map("n", "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", { desc = "Pause" })
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle({height=1})<cr>", { desc = "Toggle Repl" })
map("n", "<leader>dR", "<cmd>lua require'dap'.restart()<cr>", { desc = "Restart" })
map("n", "<leader>dg", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "UI Toggle" })
map("n", "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", { desc = "Eval" })
map("n", "<leader>dl", "<cmd>lua _float_console()<cr>", { desc = "Float Console" })

-- git
map("n", "]g", function()
  if vim.wo.diff then
    return "]g"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to next hunk" })

map("n", "[g", function()
  if vim.wo.diff then
    return "[g"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to prev hunk" })

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new {
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

function _lazygit_toggle()
  lazygit:toggle()
end

map("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<cr>", { desc = "Git" })
map("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", { desc = "Next Hunk" })
map("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", { desc = "Prev Hunk" })
map("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" })
map("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" })
map("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" })
map("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = "Reset Buffer" })
map("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" })
map("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = "Undo Stage Hunk" })
map("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout branch" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Checkout commit" })
map("n", "<leader>gC", "<cmd>Telescope git_bcommits<cr>", { desc = "Checkout commit(for current file)" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "Git Diff" })

map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
map("n", "<leader>ld", "<cmd> Telescope diagnostics bufnr=0 theme=dropdown<cr>", { desc = "Document Diagnostics" })
map("n", "<leader>lD", "<cmd> Telescope diagnostics <cr>", { desc = "Workspace Diagnostics" })
map("n", "<leader>ls", "<cmd> Telescope lsp_document_symbols symbol_width=0.9<cr>", { desc = "Document Symbols" })
map(
  "n",
  "<leader>lS",
  "<cmd> Telescope lsp_dynamic_workspace_symbols symbol_width=0.9<cr>",
  { desc = "Workspace Symbols" }
)
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format() <cr>", { desc = "Format" })
map("n", "<leader>lI", "<cmd>LspInfo<cr>", { desc = "Info" })
map("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "CodeLens Action" })
map("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", { desc = "Quickfix" })
map("n", "<leader>lr", "<cmd>lua require 'nvchad.renamer'.open()<cr>", { desc = "Rename" })
map("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "Restart" })
map("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", { desc = "Add Wrokspace Folder" })
map("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", { desc = "Remove Wrokspace Folder" })

-- map({ "n", "i", "v" }) "<C-s>", "<cmd> w <cr>")

-- Disable mappings
local nomap = vim.keymap.del
nomap("n", "<leader>wk")
nomap("n", "<leader>wK")
