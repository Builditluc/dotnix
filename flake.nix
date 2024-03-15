{
  description = "Builditluc's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, utils, home-manager, nixvim, nixos-hardware }: 
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
      };

      channelsConfig = { 
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-25.9.0"
          "nix-2.16.2"
        ];
      };

      channels.nixpkgs = {
        input = nixpkgs;
      };

      channels.unstable = {
        input = nixpkgs-unstable;
      };

      hosts.ash = {
        system = "x86_64-linux";
        modules = with self.nixosModules; [
          yubikey
          steam
          system
          power-management

          #wm.gnome
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
