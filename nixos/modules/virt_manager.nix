{ pkgs-unstable, ... }:
{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.evi1_f4iry.extraGroups = [ "libvirtd" ];
}
