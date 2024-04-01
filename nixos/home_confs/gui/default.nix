{ pkgs-unstable, ... }:
{
  gtk = {
    theme = {
      name = "Dracula";
      package = pkgs-unstable.dracula-theme;
    };
  };
}
