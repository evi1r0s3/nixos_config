{ pkgs-default, ... }:
{
   programs.obs-studio = {
    enable = true;
    plugins = with pkgs-default.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };
}
