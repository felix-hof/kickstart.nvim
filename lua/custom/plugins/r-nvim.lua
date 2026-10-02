vim.pack.add {
  'https://github.com/R-nvim/R.nvim',
}

-- Create a table with the options to be passed to setup()
---@type RConfigUserOpts
local opts = {
  hook = {
    on_filetype = function()
      -- This function is called for file types supported by R.nvim.
      -- It provides an opportunity to create buffer-local mappings.
      vim.keymap.set(
        'n',
        '<LocalLeader>d',
        '<Plug>RDSendLine',
        { buffer = true }
      )

      vim.keymap.set(
        'v',
        '<LocalLeader>ss',
        '<Plug>RSendSelection',
        { buffer = true }
      )
    end,
  },

  R_args = { '--quiet', '--no-save' },

  -- Rout_more_colors = false,
  -- Rout_follow_colorscheme = false,

  pdfviewer = 'evince',
  synctex = false,
  min_editor_width = 72,
  rconsole_width = 80,

  disable_cmds = {
    'RClearConsole',
    'RCustomStart',
    'RSPlot',
    'RSaveClose',
  },
}

vim.g.R_rmdchunk = '``'
vim.g.R_assign_map = '<M-->'

-- Start R automatically when Neovim was launched with:
--
--   R_AUTO_START=true nvim
--
if vim.env.R_AUTO_START == 'true' then
  opts.auto_start = 1
  opts.objbr_auto_start = true
end

require('r').setup(opts)
