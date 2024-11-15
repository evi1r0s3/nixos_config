{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    hyprland
    hyprpaper
    xorg.xrdb
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
