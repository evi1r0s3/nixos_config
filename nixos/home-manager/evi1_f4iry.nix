{ config, pkgs-unstable, inputs, ... }:
{
  imports = [
    ./modules/hyprland
    ./modules/gui
    ./modules/kitty
    ./modules/eww
    ./modules/ranger
    #./modules/zellij
    ./modules/Pictures
    ./modules/swaylock
    ./modules/fcitx5
    #./modules/zsh_atuin_p10k
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
  home.packages = with pkgs-unstable;[
    obsidian
  ];

  programs.git = {
    enable = true;
    userName = "evi1r0s3";
    userEmail = "evi1_r0s3_a0f4r@outlook.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
  # home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
