{ pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    # 插件
    plugins = with pkgs.xfce; [
      # TODO：archive 功能暂时还有问题
      thunar-archive-plugin
      thunar-volman
    ];
  };
  # 因为未使用xfce4作为桌面环境，所以开启xfconf程序用于保存xfce配置选项
  programs.xfconf.enable = true;
  # thunar的额外功能，挂载和图片预览
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
