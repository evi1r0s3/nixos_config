{ pkgs, ... }:
{
  #environment.systemPackages = with pkgs; [
  #  fcitx5
  #  fcitx5-chinese-addons
  #];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-chinese-addons
    ];
  };
}
