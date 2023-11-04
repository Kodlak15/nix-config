{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    # -------------------------------------------------------
    # Zsh config (equivalent to .zshrc)
    # -------------------------------------------------------
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    shellAliases = {
      NIXCFG = "$HOME/nix-config/";
      ls = "eza -l";
      lsa = "eza -la";
      e = "nvim $(fzf)";
      o = "cd $(find * -type d | fzf)";
      alacritty = "nvidia-offload alacritty";
      screenshots = "$HOME/nix-config/scripts/screenshot.sh";
    };
    initExtra = ''
      # Edit PATH
      export PATH="$PATH:$HOME/nix-config/scripts/"

      # Git status info
      autoload -Uz vcs_info
      precmd() { vcs_info }
      zstyle ':vcs_info:git:*' formats " %F{#e0af68} %b%f"
      setopt prompt_subst
      source $HOME/.nix-profile/share/git/contrib/completion/git-prompt.sh
      setopt PROMPT_SUBST

      # Set pywal generated terminal colors
      # (cat ~/.cache/wal/sequences &)

      # Prompt
      PROMPT='%F{#7aa2f7} % %F{#c0caf5}%~%f %F{#bb9af7}$(__git_ps1 "(%s)")%f%F{#89ddff}󰄾 %f'
    '';
    # -------------------------------------------------------
    # Zsh plugins
    # -------------------------------------------------------
    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
        };
      }
      {
        # will source zsh-syntax-highlighting.plugin.zsh
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
        };
      }
    ];
  };
}
