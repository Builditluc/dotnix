{ config, pkgs, nixvim, ... }:

{
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";
    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      scrolloff = 20;
      colorcolumn = "100";
      textwidth = 100;
      cmdheight = 0;
    }; 

    colorschemes.gruvbox.enable = true; 
    colorschemes.gruvbox.settings.contrast_dark = "hard"; 

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
      typst-vim.enable = true;

      fidget.enable = true;

      project-nvim.enable = true;
      project-nvim.enableTelescope = true;

      lsp.enable = true;
      lsp.keymaps.lspBuf = {
        "gr" = "references";
        "gd" = "definition";
        "gi" = "implementation";
        "K" = "hover";
        "<leader>rn" = "rename";
        "ca" = "code_action";
        "=" = "format";
      };
      lsp.servers = {
        nixd.enable = true;

        rust-analyzer.enable = true;
        rust-analyzer.settings.check.command = "clippy";
        rust-analyzer.installCargo = false;
        rust-analyzer.installRustc = false;

        typst-lsp.enable = true;
        pyright.enable = true;
        gopls.enable = true;
      };

      telescope.enable = true;
      telescope.extensions.fzf-native.enable = true;

      treesitter.enable = true;
      treesitter.indent = true;

      rust-tools.enable = true;

      which-key.enable = true;

      cmp.enable = true;
      cmp.settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<c-j>" = "cmp.mapping.select_next_item()";
          "<c-k>" = "cmp.mapping.select_prev_item()";
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
        snippet.expand = ''function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end
        '';
      };
      cmp-nvim-lsp.enable = true;
      cmp-nvim-ultisnips.enable = true;


      lualine.enable = true;
      lualine.theme = "gruvbox";
    };

    keymaps = [
      { action = "<cmd>w<CR>"; key = "<leader>w"; mode = "n"; options.silent = true; }
      { action = "<cmd>wa<CR>"; key = "<leader>wa"; mode = "n"; options.silent = true; }
      { action = "<cmd>Telescope projects<CR>"; key = "<leader>p"; options.silent = true; }
      { action = "<cmd>Telescope lsp_document_symbols<CR>"; key = "<leader>ds"; options.silent = true; }
      { action = "<cmd>Telescope lsp_workspace_symbols<CR>"; key = "<leader>ws"; options.silent = true; }
      { action = "<cmd>Telescope find_files<CR>"; key = "<leader>ff"; options.silent = true; }
    ];
  };
}
