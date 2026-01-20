return {
  'R-nvim/R.nvim',
  -- enabled = false,
  lazy = false,
  -- submodules = true,
  -- version = '~0.1.0',
  config = function()
    -- Create a table with the options to be passed to setup()
    ---@type RConfigUserOpts
    local opts = {
      hook = {
        on_filetype = function()
          -- This function will be called at the FileType event
          -- of files supported by R.nvim. This is an
          -- opportunity to create mappings local to buffers.
          vim.api.nvim_buf_set_keymap(0, 'n', '<LocalLeader>d', '<Plug>RDSendLine', {})
          vim.api.nvim_buf_set_keymap(0, 'v', '<LocalLeader>ss', '<Plug>RSendSelection', {})
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
    -- Check if the environment variable "R_AUTO_START" exists.
    -- If using fish shell, you could put in your config.fish:
    -- alias r "R_AUTO_START=true nvim"
    if vim.env.R_AUTO_START == 'true' then
      opts.auto_start = 1
      opts.objbr_auto_start = true
    end
    require('r').setup(opts)
  end,
}
