{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [ 
    vscode
    xclip 
  ];
}
