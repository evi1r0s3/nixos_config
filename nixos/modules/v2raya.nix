{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ v2raya ];

  services.v2raya.enable = true;
}
