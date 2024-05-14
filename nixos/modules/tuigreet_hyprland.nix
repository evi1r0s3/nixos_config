{ pkgs-unstable, ... }: let
  tuigreet = "${pkgs-unstable.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${pkgs-unstable.hyprland}/share/wayland-sessions";
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --time --time-format '%I:%M %p | %a - %h | %F' -g 'Nothing is true, everything is permitted.' --remember --sessions ${hyprland-session} -c Hyprland";
	user = "greeter";
      };
    };
  };
  
  environment.systemPackages = with pkgs-unstable; [ greetd.tuigreet ];

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
