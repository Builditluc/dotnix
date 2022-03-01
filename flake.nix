{
  description = "Builditluc's system config";

  inputs = {
    nixpkgs.url = "github:/nixos/nixpkgs/nixos-unstable";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";

    darwin.url = "github:lnl7/nix-darwin/master";
    home-manager.url = "github:nix-community/home-manager";
    nur.url = "github:nix-community/nur";

    nix-colors.url = "github:misterio77/nix-colors";
    nixvim.url = "github:pta2002/nixvim";
  };

  outputs = { self, nixpkgs, utils, darwin, home-manager, nur, nix-colors, nixvim }@inputs: utils.lib.mkFlake {
    inherit self inputs;

    homeModules = utils.lib.exportModules [
      ./hm/alacritty.nix
      ./hm/default-home.nix
      ./hm/direnv.nix
      ./hm/firefox.nix
      ./hm/git.nix
      ./hm/nvim.nix
      ./hm/starship.nix
      ./hm/yabai-skhd.nix
      ./hm/zsh.nix
    ];

    colorscheme = nix-colors.colorSchemes.nord;
    colorscheme-name = "nord";

    sharedOverlays = [ nur.overlay ];

    channels."unstable" = {
      input = nixpkgs;
      config = {
        allowUnfree = true;
      };
    };

    hostDefaults = {
      channelName = "unstable";
      extraArgs = { inherit utils inputs; };
    };

    hosts.macbook = {
      system = "x86_64-darwin";
      modules = [
        ./hosts/macbook/configuration.nix
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            colorscheme = self.colorscheme; 
            colorscheme-name = self.colorscheme-name;
          };

          home-manager.users.builditluc = { pkgs, ... }:
          {
            imports = with self.homeModules; [
              default-home
              nixvim.homeManagerModules.nixvim

              alacritty
              direnv
              firefox
              git
              nvim
              starship
              yabai-skhd
              zsh
            ];

            programs.firefox.package = (pkgs.callPackage ./custom-pkgs/firefox { });
          };
        }
      ];
      output = "darwinConfigurations";
      builder = darwin.lib.darwinSystem;
    };
  };
}
