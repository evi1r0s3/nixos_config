{ pkgs-unstable, ... }:
{
  virtualisation.docker.enable = true;
  users.users.evi1_f4iry.extraGroups = [ "docker" ];
  virtualisation.docker.daemon.settings = {
    registry-mirrors = [
      "https://hub.uuuadc.top"
      "https://docker.anyhub.us.kg"
      "https://dockerhub.jobcher.com"
      "https://docker.ckyl.me"
      "https://docker.awsl9527.cn"
    ];
  };
}
