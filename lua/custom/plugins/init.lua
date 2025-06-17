-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local map = vim.keymap.set

return {
  {
    'numToStr/Comment.nvim',
  },
  {
    'xiyaowong/transparent.nvim',
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'marilari88/neotest-vitest',
    },
    config = function()
      local neotest = require 'neotest'

      neotest.setup {
        adapters = {
          require 'neotest-vitest' {
            filter_dir = function(name, rel_path, root)
              return name ~= 'node_modules'
            end,
          },
        },
      }

      map('n', '<Leader>tr', function()
        neotest.run.run()
        neotest.summary.open()
      end, { noremap = true, desc = 'Run Nearest' })
      map('n', '<leader>tc', function()
        neotest.run.run(vim.fn.expand '%')
        neotest.summary.open()
      end, { desc = 'Run Current File' })
      map('n', '<Leader>tl', '<cmd>Neotest run last<CR>', { noremap = true })
      map('n', '<Leader>ts', '<cmd>Neotest summary<CR>', { noremap = true })
      map('n', '<leader>twr', "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>", { desc = 'Run Watch' })
      map('n', '<leader>twf', "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'vitest --watch' })<cr>", { desc = 'Run Watch File' })
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup {}

      map('n', '[e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
      map('n', ']e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
      map('n', 'd', '<cmd>Lspsaga peek_definition<CR>')
      map('n', 'o', '<cmd>Lspsaga outline<CR>')
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons', -- optional
    },
    opts = {
      diagnostic = {
        jump_num_shortcut = true,
      },
      definition = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
      },
      outline = {
        layout = 'float',
      },
    },
  },
  {
    'smoka7/hop.nvim',
    version = '*',
    opts = {
      keys = 'etovxqpdygfblzhckisuran',
    },
    config = function()
      require('hop').setup()

      map('n', '<Leader>b', '<cmd>HopWordBC<CR>', { noremap = true })
      map('n', '<Leader>w', '<cmd>HopWordAC<CR>', { noremap = true })
    end,
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.keymap.set('i', '<C-g>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, silent = true })
    end,
  },
}
