{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ sing-box ];

  services.sing-box.enable = true;
}
