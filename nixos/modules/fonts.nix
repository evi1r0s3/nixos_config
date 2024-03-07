{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    intel-one-mono
    vistafonts-chs
    unifont
    emojione
  ];
}
