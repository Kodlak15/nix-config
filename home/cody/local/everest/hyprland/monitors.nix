{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      ----------------------------------------------
      		id    res@ref	       pos     scale
      ----------------------------------------------
      monitor = DP-1, 2560x1440@165.0, 1080x0, 1
      monitor = DP-2, 1920x1080@144.0, 0x0,    1
      monitor = DP-3, 1920x1080@240.0, 3640x0, 1

      monitor = DP-2, transform, 3 # rotate 270 degrees clockwise
    '';
  };
}
