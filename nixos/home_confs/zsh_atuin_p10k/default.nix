{
  home.file.".zshrc".source = ./.zshrc;
  home.file.".p10k.zsh".source = ./.p10k.zsh;
  home.file.".config/lsd" = {
    source = ./lsd;
    recursive = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [
      "--disable-up-arrow"
      # "--disable-ctrl-r"
    ];
    settings = {
      style = "full";
      inline_height = 18;
      show_preview = true;
      secrets_filter = true;
    };
  };
}
