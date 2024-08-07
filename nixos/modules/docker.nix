{ pkgs-unstable, ... }:
{
  virtualisation.docker = { 
    enable = true;
    daemon.settings = {
      data-root = "/home/evi1_f4iry/docker_data";
    };
  };
  users.users.evi1_f4iry.extraGroups = [ "docker" ];
}
