{ pkgs-unstable, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs-unstable.rose-pine-cursor;
    #name = "Bibata-Modern-Ice";
    size = 32;
  };
}
