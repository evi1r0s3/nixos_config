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
    histSize = 10000;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };
}
