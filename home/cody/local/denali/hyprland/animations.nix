{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      animations {
          enabled = true
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
          animation = windows, 1, 8, myBezier, slide
          animation = windowsOut, 1, 8, myBezier, slide
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }
    '';
  };
}
