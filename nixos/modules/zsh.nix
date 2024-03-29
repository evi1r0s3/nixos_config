{ pkgs, pkgs-unstable, ... }:
{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = with pkgs-unstable; [
    lsd
    zsh-powerlevel10k
    atuin
  ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "lsd";
      ll = "lsd -l";
      la = "lsd -a";
      lla = "lsd -la";
      lt = "lsd --tree";
      tree = "lsd --tree";
    };
    histSize = 10000;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    ohMyZsh = {
      enable = true;
      #theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
  };
}
