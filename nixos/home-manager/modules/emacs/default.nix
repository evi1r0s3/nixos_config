{ pkgs-unstable, ... }:
{
#  programs.emacs = {
#    enable = true;
#    package = pkgs-unstable.emacs;
#    extraPackages = epkgs: [
#      epkgs.dashboard
#      epkgs.rainbow-delimiters
#      epkgs.dracula-theme
#      epkgs.doom-modeline
#    ];
#  };
  home.file.".emacs.d" = {
    source = ./.emacs.d;
    recursive = true;
  };
}
