{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      default_shell = "zsh";
      pane_frames = false;
      tab_bar = false;
      default_layout = "compact";
    };
  };
}
