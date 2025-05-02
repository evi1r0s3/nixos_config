{ pkgs-default, config, ...}:
{
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs-default.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  system.fsPackages = [ pkgs-default.bindfs ];

  fileSystems = let
    mkRoSymBind = path: {
      device = path;
      fsType = "fuse.bindfs";
      options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
    };
    aggregated = pkgs-default.buildEnv {
        name = "system-fonts-and-icons";
        paths = config.fonts.packages ++ (with pkgs-default; [
          # Add your cursor themes and icon packages here
          rose-pine-cursor
          # etc.
        ]);
        pathsToLink = [ "/share/fonts" "/share/icons" ];
    };
  in {
    "/usr/share/fonts" = mkRoSymBind "${aggregated}/share/fonts";
    "/usr/share/icons" = mkRoSymBind "${aggregated}/share/icons";
  };
}
