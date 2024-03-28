{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ ranger ];
}
