{ ... }:
{
  imports = [
    ./hyprland
    ./gui
    ./kitty
    ./eww
    ./ranger
    ./Pictures
    ./swaylock
    ./fcitx5
    ./cursor
    ./helix
    ./emacs
    ./neovim
    ./develop
    ./foot
    ./shell
    ./virt_manager
    ./firefox
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
