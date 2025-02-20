{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    gdb
    pwndbg
  ];
}
