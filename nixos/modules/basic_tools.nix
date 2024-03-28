{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ 
    helix # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
