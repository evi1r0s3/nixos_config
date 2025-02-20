{ pkgs, ... }:
{
  programs.adb.enable = true;
  users.users.evi1_f4iry.extraGroups = ["adbusers"];
  environment.systemPackages = with pkgs; [ android-studio ];
}
