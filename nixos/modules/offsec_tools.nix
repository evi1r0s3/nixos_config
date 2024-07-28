{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ 
    nmap
    ncat
    nping
    metasploit-framework
    wireshark
    sqlmap
    hashcat
    hydra
    dirb
    gobuster
    hping3
    aircrack-ng
    airgraph-ng
    netdiscover
    john
    netcat
    ffuf
    tcpdump
    kismet
    binwalk
    socat
    can-utils
  ];
}
