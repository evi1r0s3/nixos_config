{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ emacs ];
}
