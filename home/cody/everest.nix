{inputs, ...}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ./local/everest
    # ./hyprland
    # ./programs
  ];

  home = {
    username = "cody";
    homeDirectory = "/home/cody";

    # -------------------------------------------------------
    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    # -------------------------------------------------------
    stateVersion = "23.05";
  };

  # -------------------------------------------------------
  # Let home-manager install and manager itself
  # -------------------------------------------------------
  programs.home-manager.enable = true;
}
