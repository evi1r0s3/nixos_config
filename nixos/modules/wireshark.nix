{ pkgs, ... }:
{
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
  users.users.evi1_f4iry.extraGroups = [ "wireshark" ];
}
