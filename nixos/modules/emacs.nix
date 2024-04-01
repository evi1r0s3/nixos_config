{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    emacs
  ];
  environment.systemPackages = with pkgs-unstable.emacsPackages; [
    # emacs 29.1 已经集成了use-packge,直接配置就可以，无需安装
    # use-packge
    dashboard
    rainbow-delimiters
    powerline
    dracula-theme
    #highlight-symbol
    #highlight-escape-sequences
  ];
}
