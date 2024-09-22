{
  description = "NixOS Configuration";

  inputs = {
    
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  } : {
  
    nixosConfigurations = {
      alfred = let

        username = "ms-nixos";
        full_name = "Manas Sambare";
        timezone = "Asia/Kolkata";
        locale = "en_IN";
        terminals = [ "kitty" ];

        specialArgs = {
          inherit username;
          inherit full_name;
          inherit timezone;
          inherit locale;
          inherit terminals;
        };
      in
        nixpkgs.lib.nixosSystem {

          inherit specialArgs;
          system = "x86_64-linux";
          
          modules = [
            ./hosts/alfred
            ./users/${username}/modules.nix
            
            home-manager.nixosModules.home-manager
            {
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
    };
  };
}
