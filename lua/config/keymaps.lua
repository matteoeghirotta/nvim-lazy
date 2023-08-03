-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Move to window using the <ctrl> hjkl keys
map("n", "<A-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<A-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<A-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<A-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Move Lines
map("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
