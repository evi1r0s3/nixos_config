{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [ swaylock-effects ];
  security.pam.services.swaylock = {};
}
