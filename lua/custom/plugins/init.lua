-- We are just modifying lspconfig's packer definition table
-- Put this in your custom plugins section i.e M.plugins field 
return {
  ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
  },
 ["williamboman/mason.nvim"] = {
   override_options = {
      ensure_installed = {
        -- lua stuff
        "typescript-language-server",
        "gopls",
      },
    },
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
 },
  ["akinsho/toggleterm.nvim"] = {
    config = function()
        require "custom.plugins.gitui"
    end
  }
-- load it after nvim-lspconfig cuz we lazy loaded lspconfig 
}
