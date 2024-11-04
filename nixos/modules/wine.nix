{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    # support both 32- and 64-bit applications
    wineWowPackages.stable
    
    # support 32-bit only
    wine

    # support 64-bit only
    (wine.override { wineBuild = "wine64"; })

    # support 64-bit only
    #wine64

    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # winetricks 配合wine安装字体，dll等 (all versions)
    winetricks

    # 原生wayland支持的wine版本(unstable)
    wineWowPackages.waylandFull
    # 支持ntlm_auth功能
    samba
  ];
}
