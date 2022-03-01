{
  description = "Builditluc's system config";

  inputs = {
    nixpkgs.url = "github:/nixos/nixpkgs/nixos-unstable";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";

    darwin.url = "github:lnl7/nix-darwin/master";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, utils, darwin, home-manager }@inputs: utils.lib.mkFlake {
    inherit self inputs;

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

          home-manager.users.builditluc = {
            # when using HM as a module, the username and homeDirectory are automatically set
            imports = [
              ./hm/default-home.nix
            ];
          };
        }
      ];
      output = "darwinConfigurations";
      builder = darwin.lib.darwinSystem;
    };
  };
}
