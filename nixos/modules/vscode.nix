{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ 
    vscode
    xclip 
  ];
}
