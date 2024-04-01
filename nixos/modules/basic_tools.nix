{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ 
    #helix
    wget
    git
    curl
    openssh
    neofetch
    btop
    iotop
    iftop
    strace
    lsof
    ethtool
    which
    file
    gnutar
    zip
    unzip
    xz
    kitty
  ];
}
