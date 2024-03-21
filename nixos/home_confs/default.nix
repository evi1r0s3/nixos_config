{ config, pkgs, ... }:

{
  imports = [
    ./hyprland
    ./kitty
    ./eww
    ./tofi
    ./ranger
    ./zellij
    ./swaylock
    ./Pictures
  ];

  home.username = "evi1_f4iry";
  home.homeDirectory = "/home/evi1_f4iry";

  xresources.properties = {
    "Xcursor.size" = 32;
    "Xft.dpi" = 150;
  };

  home.packages = with pkgs;[
    microsoft-edge
    nmap
    rustscan
    socat
    # warp-terminal
  ];

  # wayland.windowManager.hyprland.enable = true;

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
