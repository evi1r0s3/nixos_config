{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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
