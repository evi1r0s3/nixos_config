{ config, pkgs-stable, inputs, ... }:
{
  imports = [
    ./modules/hyprland
    ./modules/gui
    ./modules/kitty
    ./modules/eww
    ./modules/ranger
    ./modules/Pictures
    ./modules/swaylock
    ./modules/fcitx5
    ./modules/cursor
    ./modules/helix
    ./modules/emacs
    ./modules/neovim
    ./modules/develop
    ./modules/foot
    ./modules/shell
    ./modules/virt_manager
    ./modules/firefox
  ];

  home.username = "evi1_f4iry";
  home.homeDirectory = "/home/evi1_f4iry";

  programs.git = {
    enable = true;
    userName = "evi1r0s3";
    userEmail = "evi1_r0s3_a0f4r@outlook.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
