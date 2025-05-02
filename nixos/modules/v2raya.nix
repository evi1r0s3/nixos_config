{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [ v2raya ];

  services.v2raya.enable = true;
  networking.firewall = {
    allowedTCPPorts = [
      2080
      20171
      20172
    ];
  };
}
