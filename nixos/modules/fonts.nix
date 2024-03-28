{ pkgs, pkgs-unstable, ... }:
{
  fonts.packages = with pkgs; [
    nerdfonts
    vistafonts-chs
    unifont
    emojione
  ];
}
