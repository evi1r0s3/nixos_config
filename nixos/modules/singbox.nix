{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    gui-for-singbox
  ];
  networking.firewall = {
    allowedTCPPorts = [
      2080
      20171
      56789
    ];
  };
}
