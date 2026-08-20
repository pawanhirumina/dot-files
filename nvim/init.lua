vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.swapfile = false
vim.opt.termguicolors = true	

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "


-- Custom Keymapping --

	-- Save --
keymap('n', '<leader>w', function()
  vim.cmd('silent write')
  local file = vim.fn.expand('%:t')
  print("Saved " .. file .. " 💾")
end, opts)
	-- Hot Reload --
keymap('n', '<leader>o', function()
	vim.cmd('silent update')
	vim.cmd('silent source %')
	vim.notify("Reloaded", vim.log.levels.INFO)
end, opts)


keymap('n', '<leader>q', ':quit<CR>', opts) -- quit
keymap('n', '<leader>fq', ':quit!<CR>', opts) -- force-quit
keymap('n', '<leader>e', ':Ex<CR>', opts) -- file-explorer
keymap('n', '<leader>nt', ':tabnew<CR>', opts) -- new-tab
keymap('n', '<leader>ct', ':tabclose<CR>', opts) -- close-tab
keymap('n', '<A-Tab>', 'gt', opts) -- cycle-through-tabs


keymap('n', '<A-j>', ':m .+1<CR>==', opts) -- move line down (normal mode)
keymap('n', '<A-k>', ':m .-2<CR>==', opts) -- move line up   (normal mode)
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts) -- move line down (insert mode)
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts) -- move line down (insert mode)


keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Transparent Nvim Setup --
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE ctermbg=NONE
  hi StatusLine guibg=NONE ctermbg=NONE
  hi StatusLineNC guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi CursorLineNr guibg=NONE ctermbg=NONE
  hi TabLine guibg=NONE ctermbg=NONE
  hi TabLineFill guibg=NONE ctermbg=NONE
  hi TabLineSel guibg=NONE ctermbg=NONE
  hi FloatBorder guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE ctermbg=NONE
]])

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
    ]])
  end,
})



-- put this in init.lua, works alone
local autosave_group = vim.api.nvim_create_augroup("Autosave", { clear = true })
local timer = nil

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = autosave_group,
  callback = function()
    if timer then
      timer:stop()
      timer:close()
      timer = nil
    end
    timer = vim.defer_fn(function()
      if vim.bo.modifiable and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
        vim.cmd("silent! write")
      end
      timer = nil
    end, 500)
  end,
})


