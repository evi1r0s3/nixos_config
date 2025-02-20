{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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
    # enableNvidiaPatches = true; # unstable nixpkgs dont need this
  };
}
