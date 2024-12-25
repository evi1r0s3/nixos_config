{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    #emacs-gtk
    emacs30-pgtk
    nodejs
    # (emacsWithPackages (epkgs: with emacsPackages; [
    #    dashboard
    #    rainbow-delimiters
    #    dracula-theme
    #    doom-modeline
    #    all-the-icons
    # ]))
  ];
}
