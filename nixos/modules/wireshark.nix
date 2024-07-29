{ pkgs-unstable, ... }:
{
  programs.whireshark.enable = true;
  users.users.evi1_f4iry.extraGroups = [ "wireshark" ];
}
