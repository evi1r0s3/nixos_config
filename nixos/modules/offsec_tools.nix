{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ 
    nmap
    rustscan
    socat
    metasploit
    #wireshark
    sqlmap
    hashcat
    dirb
    gobuster
    hping
    aircrack-ng
    netdiscover
    john
    netcat
    ffuf
    tcpdump
    kismet
    binwalk
    socat
    can-utils
    cve-bin-tool
    inetutils #telnent
    netcat #nc
    ghidra
    thc-hydra
    seclists
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "segger-jlink-qt4-796s"
  ];
}
