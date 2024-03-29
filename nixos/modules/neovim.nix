{ pkgs-unstable, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = [
       pkgs-unstable.vimPlugins.packer-nvim;
    ];
  };
}
