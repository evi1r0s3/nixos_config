{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [
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
