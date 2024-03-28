{ inputs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs-unstable.rose-pine-cursor;
    name = "BreezeX-RosePineDawn";
    size = 32;
  };
}
