{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ v2raya ];

  services.v2raya.enable = true;
  networking.firewall = {
    allowedTCPPorts = [
      2080
      20171
      20172
    ];
  };
}
