{ inputs, config, pkgs, ... }:

{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";
    options = {
      number = true;
      relativenumber = true;
      cursorline = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      scrolloff = 20;
      colorcolumn = "100";
      textwidth = 100;
    };

    colorschemes.gruvbox.enable = true;
    colorschemes.gruvbox.contrastDark = "hard";

    extraPlugins = with pkgs.vimPlugins; [
      ultisnips
      go-nvim
      vim-wakatime
      direnv-vim
    ];

    extraConfigLua = ''
      require("go").setup {}
    '';

    extraConfigVim = ''
      set noshowmode
    '';

    plugins = {
      nvim-autopairs.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-ultisnips.enable = true;
      typst-vim.enable = true;

      fidget.enable = true;

      project-nvim.enable = true;

      lsp.enable = true;
      lsp.keymaps.lspBuf = {
        "<leader>gr" = "references";
        "<leader>gd" = "definition";
        "<leader>gi" = "implementation";
        "<leader>gtd" = "type_definition";
        "<leader>vh" = "hover";
        "<leader>vr" = "rename";
        "<leader>vca" = "code_action";
        "<leader>vf" = "format";
      };
      lsp.servers = {
        nixd.enable = true;

        rust-analyzer.enable = true;
        rust-analyzer.settings.check.command = "clippy";

        typst-lsp.enable = true;
        pyright.enable = true;
        gopls.enable = true;
      };

      telescope.enable = true;
      telescope.extensions.fzf-native.enable = true;
      telescope.extensions.project-nvim.enable = true;

      treesitter.enable = true;
      treesitter.indent = true;

      rust-tools.enable = true;

      nvim-cmp = {
        enable = true;
        preselect = "Item";
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<c-n>" = "cmp.mapping.select_next_item()";
          "<c-j>" = "cmp.mapping.select_prev_item()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
        formatting.format = ''function(entry, vim_item)
          local source_mapping = {
            nvim_lsp = "[LSP]",
            path = "[PATH]",
            buffer = "[BFR]",
          }
          vim_item.menu = source_mapping[entry.source.name]
          return vim_item
        end
        '';
        snippet.expand = "ultisnips";
      };
    };

    keymaps = [
      { action = "<cmd>w<CR>"; key = "<leader>w"; mode = "n"; }
      { action = "<cmd>wa<CR>"; key = "<leader>wa"; mode = "n"; }
      { action = "<cmd>Telescope projects<CR>"; key = "<leader>p"; }
      { action = "<cmd>Telescope lsp_document_symbols<CR>"; key = "<leader>ds"; }
      { action = "<cmd>Telescope lsp_workspace_symbols<CR>"; key = "<leader>ws"; }
      { action = "<cmd>Telescope find_files<CR>"; key = "<leader>ff"; }
    ];
  };
}
