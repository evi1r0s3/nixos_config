{
  description = "Make from A template that shows all standard flake outputs";
   
  inputs = {
    # 默认分支设置是unstable
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
    # 然后将stable的分支设置为一个参数，用来回退个别软件包版本为使用stable版
    nixpkgs-stable.url = "github:Nixos/nixpkgs/nixos-24.05";
    
    # homemanager 使用unstable,这样保证在配置一些软件时和pkgs用的分支一致
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs-stable, nixpkgs, home-manager, ... }: 
  let
    systemSettings = {
      system = "x86_64-linux";
    };
    lib = nixpkgs.lib;
    pkgs-stable = import nixpkgs-stable {
      system = systemSettings.system;
      config.allowUnfree = true;
    };
    pkgs-unstable = import nixpkgs {
      system = systemSettings.system;
      config.allowUnfree = true;
    };
  in {
      nixosConfigurations = {
        ZenNix0s = lib.nixosSystem rec {
          # 架构
          system = systemSettings.system;
          # 参数传递
	      specialArgs = {
            inherit pkgs-stable;
            inherit pkgs-unstable;
	      };
          # 模块
	      modules = [
            ./hosts/Asus_UX8402Z
	        home-manager.nixosModules.home-manager {
	          home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.users.evi1_f4iry = import ./home-manager/evi1_f4iry.nix;
	          home-manager.users.root = import ./home-manager/root.nix;
	          home-manager.extraSpecialArgs = {
              inherit pkgs-stable;
              inherit pkgs-unstable;
              };
	        }
            ./modules/zen_kernel.nix
            ./modules/basic_tools.nix
            ./modules/security.nix
            ./modules/garbage_collect.nix
            ./modules/tuigreet_hyprland.nix
            ./modules/hyprland.nix
            ./modules/v2raya.nix
            ./modules/fcitx5.nix
            ./modules/ranger.nix
            ./modules/fonts.nix
            ./modules/eww.nix
            ./modules/swaylock_effects.nix
            ./modules/zsh.nix
            ./modules/emacs.nix
        ];
      };
    };
  };
}
