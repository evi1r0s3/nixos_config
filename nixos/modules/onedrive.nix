{ pkgs-default, ... }:
{
  services.onedrive.enable = true;
  environment.systemPackages = with pkgs-default; [
    onedrivegui
  ];
}
