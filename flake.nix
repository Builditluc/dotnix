{
  description = "Builditluc's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, home-manager, nixvim, nixos-hardware }@inputs: {
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

    nixosConfigurations = {
      ash = nixpkgs.lib.nixosSystem {
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
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}
