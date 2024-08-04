{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [ wechat-uos ];
}
