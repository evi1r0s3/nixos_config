{
  home.file.".zshrc".source = ./.zshrc;
  home.file.".p10k.zsh".source = ./.p10k.zsh;
  home.file.".config/lsd/config.yaml".source = ./lsd/config.yaml;
  home.file.".config/lsd/colors.yaml".source = ./lsd/dracula.yaml;

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
