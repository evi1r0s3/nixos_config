{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    neovim
  ];
  environment.systemPackages = with pkgs-unstable.vimPlugins; [
    packer-nvim
    dracula-nvim
  ];
}
