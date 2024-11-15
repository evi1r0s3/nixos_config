{ config, ... }:

{
  imports = [
    ./modules/shell
  ];

  home.username = "root";
  home.homeDirectory = "/root";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
