{
  description = "Builditluc's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/5633bcff0c6162b9e4b5f1264264611e950c8ec7";

    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = inputs@{ self, utils, home-manager, nixos-hardware, ... }: 
    utils.lib.mkFlake {
      inherit self inputs;

      nixosModules = {
        wm = {
          gnome = import ./system/wm/gnome.nix;
          xmonad = import ./system/wm/xmonad.nix;
          hyprland = import ./system/wm/hyprland.nix;
        };
        yubikey = import ./system/yubikey.nix;
        steam = import ./system/steam.nix;
        system = import ./system/configuration.nix;
        power-management = import ./system/power-management.nix;
        networking = import ./system/networking.nix;
        ly = import ./system/ly.nix;
      };

      channelsConfig = { 
        allowUnfree = true;
      };

      hosts.ash = {
        system = "x86_64-linux";
        modules = with self.nixosModules; [
          yubikey
          steam
          system
          power-management
          networking
          ly

          wm.hyprland

          nixos-hardware.nixosModules.framework-13th-gen-intel
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.builditluc = import ./hm/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; } ;
          }
        ];
      };
    };
}
