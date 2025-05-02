{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [ ranger ];
}
