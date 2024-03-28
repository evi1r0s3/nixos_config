{ config, pkgs, ... }:

{
  imports = [
    ./zsh_atuin_p10k
    ./helix
  ];

  home.username = "root";
  home.homeDirectory = "/home/root";

    # home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
