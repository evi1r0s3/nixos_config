{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
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
    foot
    # warp-terminal
    zig
    linux-wifi-hotspot
    iw
    remnote
    # discord
    youtube-music
    onlyoffice-bin
    siyuan
    yazi
    libpcap
  ];
}
