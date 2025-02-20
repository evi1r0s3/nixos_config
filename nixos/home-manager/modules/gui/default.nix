{ pkgs, ... }:
{
  gtk = {
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
  };
}
