{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ tofi ];
}
