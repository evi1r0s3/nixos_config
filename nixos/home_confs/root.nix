{ config, ... }:

{
  imports = [
    ./zsh_atuin_p10k
    ./helix
    ./emacs
    #./nvim
  ];

  home.username = "root";
  home.homeDirectory = "/root";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
