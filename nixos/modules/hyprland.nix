{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    hyprland
    hyprpaper
    xorg.xrdb
    wev
    hypridle
  ];
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # enableNvidiaPatches = true; # unstable nixpkgs dont need this
  };
}
