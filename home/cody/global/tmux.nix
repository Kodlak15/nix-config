{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # Match session numbers to number row
      set -g base-index 0
      # Set TERM, the default is "screen", "screen-256color" can be tried if "tmux-256color" doesn't work.
      set -g default-terminal "tmux-256color"
      # Enable mouse
      set -g mouse on
      # Disable drag action in normal mode if your pointer causes problems with
      unbind -n MouseDrag1Pane
      # Set the colors
      set-option -g status-style fg="#15161e",bg="#7aa2f7"
      set-window-option -g window-status-current-style bg="#7aa2f7"
      set-option -g pane-border-style fg="#7aa2f7"
      set-option -g pane-active-border-style fg="#7aa2f7"
    '';
  };
}
