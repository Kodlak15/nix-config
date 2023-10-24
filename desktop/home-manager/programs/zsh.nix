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
      {
        name = "enhancd";
        file = "init.sh";
        src = pkgs.fetchFromGitHub {
          owner = "b4b4r07";
          repo = "enhancd";
          rev = "v2.2.1";
          sha256 = "0iqa9j09fwm6nj5rpip87x3hnvbbz9w9ajgm6wkrd5fls8fn8i5g";
        };
      }
    ];
  };
}
