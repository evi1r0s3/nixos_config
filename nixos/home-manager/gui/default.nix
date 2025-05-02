{ pkgs-default, ... }:
{
  gtk = {
    theme = {
      name = "Dracula";
      package = pkgs-default.dracula-theme;
    };
  };
}
