{ pkgs-unstable, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs-unstable.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 48;
  };
  gtk.enable = true;
}

# 为了应对当使用hyprland+eww+nixos，鼠标指针在不同显示后端的应用下尺寸不统一的问题。
# 建议使用hyprland生态的hyprcursor，这能基本覆盖除gtk3等后端的所有程序下尺寸，如qt等
# 参考：https://wiki.hyprland.org/Hypr-Ecosystem/hyprcursor/
# 然后在nix homemanager配置home.pointerCursor，和hyprcursor一样的尺寸及主题;
# 另外，homemanager配置中home.pointerCursor.gtk.enable只能为gtk生成配置，但并不能启用配置
# 所以需要额外配置gtk.enbale，这个细节比较有坑。
# 参考：https://mynixos.com/home-manager/option/home.pointerCursor
