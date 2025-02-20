{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    vscode
    xclip 
  ];
}
