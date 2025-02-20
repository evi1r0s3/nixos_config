{ pkgs, ... }:
{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = with pkgs; [
    lsd
    # zsh-powerlevel10k
    atuin
    starship
  ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
    # promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    # ohMyZsh = {
    #   enable = true;
    #   plugins = [
    #     "git"
    #     "direnv"
    #   ];
    # };
  };
}
