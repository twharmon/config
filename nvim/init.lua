local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  { 'nvim-telescope/telescope.nvim', tag = '0.1.2', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'lewis6991/gitsigns.nvim' },

  {
    'VonHeikemen/lsp-zero.nvim',
  	dependencies = {
  		'neovim/nvim-lspconfig',
  		'hrsh7th/nvim-cmp',
  		'hrsh7th/cmp-nvim-lsp',
  		'L3MON4D3/LuaSnip',
    },
  },
  { 'nvim-treesitter/nvim-treesitter', tag = 'v0.9.1', cmd = 'TSUpdate' },
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {})
vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>', {})
vim.keymap.set('n', '<leader>c', '<cmd>bdelete<cr>', {})

vim.cmd.colorscheme("catppuccin-macchiato")

vim.opt.shortmess:append { c = true }
vim.opt.showcmd = false
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.ignorecase = false
vim.opt.smartcase = false
vim.opt.hlsearch = false
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.signcolumn = 'yes:2'

require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    -- map('n', '<leader>hs', gs.stage_hunk)
    -- map('n', '<leader>hr', gs.reset_hunk)
    -- map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    -- map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    -- map('n', '<leader>hS', gs.stage_buffer)
    -- map('n', '<leader>hu', gs.undo_stage_hunk)
    -- map('n', '<leader>hR', gs.reset_buffer)
    -- map('n', '<leader>hp', gs.preview_hunk)
    -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
    -- map('n', '<leader>hd', gs.diffthis)
    -- map('n', '<leader>hD', function() gs.diffthis('~') end)
    -- map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

local function statusline()
    local set_color_1 = "%#PmenuSel#"
    local set_color_2 = "%#LineNr#"
    local file_name = " %f"
    local modified = "%m"
    local align_right = "%="
    local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
    local filetype = " %y"
    local percentage = " %p%%"
    local linecol = " %l:%c"

    return string.format(
        "%s %s %s%s %s %s%s%s%s%s",
        set_color_1,
        "%{get(b:,'gitsigns_head','')}",
        set_color_2,
        file_name,
        modified,
        "%{get(b:,'gitsigns_status','')}",
        align_right,
        filetype,
        percentage,
        linecol
    )
end

vim.opt.statusline = statusline()

require('lsp')

