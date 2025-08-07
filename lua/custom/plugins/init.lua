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
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
      -- Map toggle Ctr + n to nvim-tree
      map('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
    end,
    opts = {
      sort_by = 'case_sensitive',
      view = {
        width = 60,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        custom = { '.DS_Store' },
      },
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'benelan/neotest-vitest',
    },
    config = function()
      local neotest = require 'neotest'

      -- Function to extract package name from file path
      local function get_package_name_from_path(file_path)
        local package_pattern = 'packages/([^/]+)'
        return file_path:match(package_pattern)
      end

      neotest.setup {
        adapters = {
          require 'neotest-vitest' {
            cwd = function(testFilePath)
              return vim.fs.root(testFilePath, 'node_modules')
            end,
            filter_dir = function(name, rel_path, root)
              return name ~= 'node_modules'
            end,
            -- Default vitest command (fallback)
            vitestCommand = 'npx projen test',
            -- Enable debug mode to see more output
            debug = false,
          },
        },
      }
      -- -- Do not run with --testNamePattern because it's buggy
      map('n', '<Leader>tr', function()
        neotest.run.run()
        neotest.summary.open()
      end, { noremap = true, desc = 'Run Nearest' })

      map('n', '<leader>tc', function()
        neotest.run.run { vim.fn.expand '%:p' }
        neotest.summary.open()
      end, { desc = 'Run Current File' })

      map('n', '<leader>tp', function()
        neotest.output_panel.open()
      end, { desc = 'Open Output Panel' })

      -- map('n', '<Leader>tl', '<cmd>Neotest run last<CR>', { noremap = true })

      map('n', '<Leader>ts', function()
        neotest.summary.open()
      end, { noremap = true, desc = 'Open Summary' })

      map('n', '<leader>twf', function()
        neotest.run.run { vim.fn.expand '%:p', vitestCommand = 'npx projen test:watch' }
        neotest.summary.open()
      end, { desc = 'Run Watch' })
      -- map('n', '<leader>twf', "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'vitest --watch' })<cr>", { desc = 'Run Watch File' })
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup {}

      map('n', '[e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
      map('n', ']e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
      map('n', '<leader>d', '<cmd>Lspsaga peek_definition<CR>')
      map('n', '<leader>i', '<cmd>Lspsaga finger imp<CR>')
      map('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
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
