vim.cmd('source ~/.vim/common.vim')

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
require("lazy").setup({
  -- The GOATs
  'tpope/vim-surround',
  {
    'tpope/vim-commentary',
    config = function()
      vim.keymap.set("n", "<leader>/", ":Commentary<CR>", { noremap = true })
      vim.keymap.set("x", "<leader>/", ":Commentary<CR>", { noremap = true })
    end
  },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gl", ":Gclog -n 100<CR>", { noremap = true })
    end,
  },

  -- language specific plugins
  'tpope/vim-rails',

  -- colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd("colorscheme tokyonight-moon")
    end
  },

  -- file browsing
  { "junegunn/fzf", build = './install --bin' }, -- This ensures the fzf binary is installed
  {
    "junegunn/fzf.vim",
    config = function()
      vim.keymap.set("n", "<leader>f", ":Files<CR>", { noremap = true })
      vim.keymap.set("n", "<leader>a", ":Ag<CR>")
      vim.keymap.set("n", "<leader>b", ":Buffers<CR>")
    end
  },
  {
    'preservim/nerdtree',
    config = function()
      vim.keymap.set("n", "<leader>n", ":NERDTreeToggle<CR>", { noremap = true })
      vim.cmd("let g:NERDTreeShowHidden=1")
    end
  },

  -- coding steroids
  'github/copilot.vim',
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "solargraph" }
      })

      -- After setting up mason-lspconfig you may set up servers via lspconfig
      require('lspconfig').lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {
                'vim',
              },
            },
          },
        },
      }
      require('lspconfig').tsserver.setup {}
      require('lspconfig').solargraph.setup {}

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          -- would be nice, but <leader>f is engrained in my fingers from fzf and
          -- auto save formating is working well enough
          -- vim.keymap.set('n', '<space>f', function()
          --   vim.lsp.buf.format { async = true }
          -- end, opts)
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.rs", "*.go", "*.lua" },
            callback = function(args)
              vim.lsp.buf.format({
                bufnr = args.buf,
                async = false,
              })
            end,
          })
        end,
      })
    end
  },
})
