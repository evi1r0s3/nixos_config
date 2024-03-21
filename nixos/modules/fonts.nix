{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    #intel-one-mono
    nerdfonts
    vistafonts-chs
    unifont
    emojione
  ];
}
