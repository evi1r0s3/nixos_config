{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    emacs
#    (emacsWithPackages (epkgs: with emacsPackages; [
#       dashboard
#       rainbow-delimiters
#       dracula-theme
#       doom-modeline
#    ]))
  ];
}
