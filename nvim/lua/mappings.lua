local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })

-- Buffer navigation
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<leader>x", function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs == 1 then
    vim.cmd("q")
  else
    vim.cmd("bdelete %")
  end
end, { desc = "Close current buffer" })

-- Format
map("n", "<leader>fm", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format file" })

-- Fold
map("n", "<leader>z", function()
  if vim.wo.foldlevel > 0 then
    vim.cmd("normal! za")
  else
    vim.cmd("normal! zM")
  end
end, { desc = "Toggle fold" })

-- Terminal
map("n", "<leader>t", function()
  require("nvchad.term").toggle({ pos = "float", id = "floatterm" })
end, { desc = "Toggle float terminal" })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Exit terminal mode" })

-- Snacks Picker (replaces Telescope)
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find files" })
map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Live grep" })
map("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Search grep" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Find buffers" })
map("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help tags" })
map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Search word under cursor" })
map("n", "<C-LeftMouse>", function()
  local word = vim.fn.expand("<cword>")
  if word ~= "" then
    Snacks.picker.grep({ search = word })
  end
end, { desc = "Search word under cursor via mouse" })

-- Git
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })