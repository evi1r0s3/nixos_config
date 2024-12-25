{ pkgs, pkgs-unstable, ... }:
{
  fonts = {
    packages = with pkgs; [
      # After 25.05 必须使用nerd-fonts.下面的字体
      nerd-fonts.intone-mono
      nerd-fonts.comic-shanns-mono
      nerd-fonts.jetbrains-mono
      vistafonts-chs
      unifont
      maple-mono-SC-NF
      # emojione #
    ];
    fontDir.enable = true;
    fontconfig.enable = true;
    # /run/current-system/sw/share/X11/fonts/
  };
}
