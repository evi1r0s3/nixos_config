{
  home.file.".zshrc".source = ./.zshrc;
  home.file.".p10k.zsh".source = ./.p10k.zsh;
  home.file.".config/atuin/config.toml".source = ./atuin_config.toml;
  home.file.".config/lsd" = {
    source = ./lsd;
    recursive = true;
  };
}
