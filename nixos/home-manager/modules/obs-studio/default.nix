{ pkgs-unstable, ... }:
{
   programs.obs-studio = {
    enable = true;
    plugins = with pkgs-unstable.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };
}
