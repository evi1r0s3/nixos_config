{ pkgs, ... }:
{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = with pkgs; [ lsd ];

  programs.zsh = {
    enable = true;
    #enableAutosuggestions.enable = true;
    #syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "autojump"
	"zsh-autosuggestions"
	"zsh-syntax-higlighting"
      ];
    };
  };
}
