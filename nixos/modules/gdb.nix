{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ 
    gdb
    pwndbg
  ];
}
