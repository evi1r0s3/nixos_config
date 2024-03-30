{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    emacs
  ];
  environment.systemPackages = with pkgs-unstable.emacsPackages; [
    use-packge
  ];
}
