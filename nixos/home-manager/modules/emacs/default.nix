{ pkgs-unstable, ... };
{
  programs.emacs = {
    enable = true;
    package = pkgs-unstable.emacs;
    extraPackages = epkgs: [
      epkgs.dashboard
      epkgs.rainbow-delimiters
      epkgs.powerline
      epkgs.dracula-theme
    ];
  };
  home.file.".emacs.d" = {
    source = ./.emacs.d;
    recursive = true;
  };
}
