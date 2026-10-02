vim.pack.add {
  {
    src = 'https://github.com/Vigemus/iron.nvim',
  },
}

local iron = require 'iron.core'
local view = require 'iron.view'
local common = require 'iron.fts.common'

iron.setup {
  config = {
    -- Remove the REPL buffer when the REPL is closed.
    scratch_repl = true,

    repl_definition = {
      python = {
        command = { 'python3' },

        -- Correctly send multiline Python code to the REPL.
        format = common.bracketed_paste_python,

        -- Treat these comments as code-cell boundaries.
        block_dividers = {
          '# %%',
          '#%%',
        },

        -- Required for the basic REPL in Python 3.13 and later.
        env = {
          PYTHON_BASIC_REPL = '1',
        },
      },
    },

    -- Give the REPL buffer the same filetype as the source buffer.
    repl_filetype = function(_, filetype) return filetype end,

    -- Open the REPL in a 20-line split at the bottom.
    repl_open_cmd = view.bottom(20),
  },

  keymaps = {
    toggle_repl = '<localleader>rr',
    restart_repl = '<localleader>rR',

    send_motion = '<localleader>sc',
    visual_send = '<localleader>sc',
    send_file = '<localleader>sf',
    send_line = '<localleader>sl',
    send_paragraph = '<localleader>sp',
    send_until_cursor = '<localleader>su',

    interrupt = '<localleader>s<space>',
    exit = '<localleader>sq',
    clear = '<localleader>cl',
  },

  highlight = {
    italic = true,
  },

  ignore_blank_lines = true,
}
