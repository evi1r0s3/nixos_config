{ pkgs, ... }:
{
  services.onedrive.enable = true;
  environment.systemPackages = with pkgs; [
    onedrivegui
  ];
}
