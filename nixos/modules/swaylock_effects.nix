{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ swaylock-effects ];
  security.pam.services.swaylock = {};
}
