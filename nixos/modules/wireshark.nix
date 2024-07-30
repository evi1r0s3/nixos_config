{ pkgs-unstable, ... }:
{
  programs.wireshark = {
    enable = true;
    package = pkgs-unstable.wireshark;
  };
  users.users.evi1_f4iry.extraGroups = [ "wireshark" ];
}
