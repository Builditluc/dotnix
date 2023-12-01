{ inputs, config, pkgs, ... }:

{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  home.packages = with pkgs; [
    unzip # for tabnine-nvim
  ];

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
    ];

    plugins = {
      nvim-autopairs.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-ultisnips.enable = true;
      typst-vim.enable = true;

      cmp-tabnine.enable = true;

      packer.enable = true;
      packer.plugins = [
        { 
          name = "codota/tabnine-nvim"; 
          run = "./dl_binaries.sh"; # unzip is required (see top)
          config = ''require('tabnine').setup {
            accept_keymap = "<S-Tab>",
            debounce_ms = 500,
            log_file_path = nil,
          }'';
        }
      ];

      fidget.enable = true;

      lsp.enable = true;
      lsp.keymaps.lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
        "<leader>r" = "rename";
        "<leader>a" = "code_action";
        "=" = "format";
      };
      lsp.servers = {
        nixd.enable = true;
        rust-analyzer.enable = true;
        typst-lsp.enable = true;
        pyright.enable = true;
      };

      rust-tools.enable = true;

      telescope.enable = true;
      telescope.extensions.fzf-native.enable = true;

      treesitter.enable = true;
      treesitter.indent = true;

      nvim-cmp = {
        enable = true;
        preselect = "Item";
        sources = [
          { name = "tabnine"; }
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
            tabnine = "[AI]",
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
      { action = "<cmd>Telescope find_files<CR>"; key = "<leader>f"; mode = "n"; }
      { action = "<cmd>Telescope lsp_document_symbols<CR>"; key = "<leader>s"; mode = "n"; }
      { action = "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>"; key = "<leader>S"; mode = "n"; }
    ];
  };
}
