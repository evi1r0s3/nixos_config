{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [
    hyprland
    hyprpaper
    xorg.xrdb
    #hyprland-qtutils
    wev
    hypridle
    hyprcursor
    wl-clipboard
    cliphist
    tofi
    grim
    swappy
    wf-recorder
    slurp
    networkmanagerapplet
    playerctl
    # for nvidia
    egl-wayland
    mako
    libnotify
    easyeffects
  ];
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
