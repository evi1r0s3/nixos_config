{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [
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
