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
      ls = "eza -l";
      lsa = "eza -la";
      e = "nvim $(fzf)";
      o = "cd $(find * -type d | fzf)";
    };
    initExtra = ''
      # Git status info
      autoload -Uz vcs_info
      precmd() { vcs_info }
      zstyle ':vcs_info:git:*' formats " %F{#e0af68} %b%f"
      setopt prompt_subst
      # Prompt
      PROMPT='%F{#7aa2f7} % %F{#ffffff}%~%f%F{#f7768e} 󰄾 %f'

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
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];
  };
}
