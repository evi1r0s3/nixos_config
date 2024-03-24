{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [
      "--disable-up-arrow"
      # "--disable-ctrl-r"
    ];
    settings = {
      style = "full";
      inline_height = 5;
      show_preview = true;
      secrets_filter = true;
    };
  };
}
