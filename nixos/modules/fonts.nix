{ pkgs, pkgs-unstable, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerdfonts
      vistafonts-chs
      unifont
      emojione
      emacs-all-the-icons-fonts
    ];
    fontDir.enable = true;
    fontconfig.enable = true;
    # /run/current-system/sw/share/X11/fonts/
  };
}
