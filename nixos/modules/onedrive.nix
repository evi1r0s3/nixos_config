{ pkgs-unstable, ... }:
{
  services.onedrive.enable = true;
  environment.systemPackages = with pkgs-unstable; [
    #onedrivegui
    onedriver
  ];
}
