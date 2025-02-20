{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ v2raya ];

  services.v2raya.enable = true;
  networking.firewall = {
    allowedTCPPorts = [
      2080
      20171
      20172
    ];
  };
}
