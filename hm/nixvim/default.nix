{ inputs, config, pkgs, ... }:

{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
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

    plugins = {
      nvim-autopairs.enable = true;
      cmp-nvim-lsp.enable = true;
      typst-vim.enable = true;

      fidget.enable = true;

      lsp.enable = true;
      lsp.keymaps.lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
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
      };
    };

    keymaps = [
    ];
  };
}
