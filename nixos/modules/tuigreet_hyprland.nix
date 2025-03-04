{ pkgs, lib, ... }: let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";
  tuigreetOptions = [
    "--remember"
    "--time"
    "--asterisks"
    "--time-format '%I:%M %p | %a - %h | %F'"
    "--greeting 'Nothing is true, everything is permitted.'"
    "--theme 'border=lightmagenta;text=lightgreen;prompt=lightgreen;time=lightmagenta;action=lightgreen;button=cyan;container=black;input=lightmagenta'"
    "--cmd Hyprland"
  ];
  flags = lib.concatStringsSep " " tuigreetOptions;
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} ${flags}";
        user = "evi1_f4iry";
      };
    };
  };
  
  environment.systemPackages = with pkgs; [ greetd.tuigreet ];

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYHangup = true;
    TTYVTDisallocate = true;
  };
}
