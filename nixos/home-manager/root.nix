{ config, ... }:

{
  imports = [
    #./modules/zsh_atuin_p10k
    
    ./modules/shell
  ];

  home.username = "root";
  home.homeDirectory = "/root";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
