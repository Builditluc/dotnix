{
  description = "Builditluc's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nixvim }@inputs: {
    nixosModules = {
      gnome = import ./system/gnome.nix;
      gpg-yubi = import ./system/gpg-yubi.nix;
      steam = import ./system/steam.nix;
      system = import ./system/configuration.nix;
    };
    nixosConfigurations = {
      ash = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = with self.nixosModules; [
          gnome
          gpg-yubi
          steam
          system

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
