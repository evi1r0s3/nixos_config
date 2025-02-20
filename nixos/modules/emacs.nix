{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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
