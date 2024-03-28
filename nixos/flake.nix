{
  description = "Make from A template that shows all standard flake outputs";
   
  inputs = {
    # 默认分支设置是unstable
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
    # 然后将stable的分支设置为一个参数，用来回退个别软件包版本为使用stable版
    nixpkgs-stable.url = "github:Nixos/nixpkgs/nixos-23.11";
    
    # homemanager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      ZenNix0s = nixpkgs.lib.nixosSystem rec {
        # 架构
	system = "x86_64-linux";
        
	# 参数传递
	specialArgs = {
    pkgs-stable = import nixpkgs-stable {
      # 架构仍然使用外部的配置
	    system = system;
	    config.allowUnfree = true;
	  };
    pkgs-unstable = import nixpkgs {
      system = system;
      config.allowUnfree = true;
    };
	};

        # 模块
	modules = [
          ./hosts/Asus_UX8402Z
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.evi1_f4iry = import ./home_confs;
	    home-manager.users.root = import ./home_confs/root.nix;
	    home-manager.extraSpecialArgs = inputs;
	  }
        ];
      };
    };
  };
}
