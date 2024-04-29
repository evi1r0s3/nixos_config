{ pkgs, pkgs-unstable, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerdfonts
      vistafonts-chs
      unifont
      emojione
    ];
    fontDir.enable = true;
    fontconfig.enable = true;
    # /run/current-system/sw/share/X11/fonts/
  };
}
