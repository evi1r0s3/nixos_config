{
  description = "Make from A template that shows all standard flake outputs";
   
  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-23.11";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # EXAMPLE_1,step_1, 
    # helix.url = "github:helix-editor/helix/master";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      Nix0s = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/Asus_UX8402Z
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.evi1_f4iry = import ./home_confs;
	    home-manager.extraSpecialArgs = inputs;
	  }
        ];
      };
    };
  };
}
