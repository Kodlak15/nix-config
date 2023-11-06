{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      # Set mod keys
      $mainMod = SUPER
      $altMod = ALT_L
      $ctlL = Control_L
      $ctlR = Control_R

      # Set key bindings
      bind = $mainMod, Return, exec, alacritty
      # bind = $mainMod, Return, exec, /run/current-system/sw/bin/nvidia-offload alacritty
      bind = $mainMod, Q, killactive,
      bind = $mainMod, Delete, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle
      bind = $mainMod, F, fullscreen
      bind = $mainMod, b, exec, librewolf
      bind = $mainMod, t, exec, thunar
      bind = $mainMod, e, exec, /usr/bin/alacritty -e $SHELL -c 'nvim && exec $SHELL' & 2> ./logs/nvim
      bind = $mainMod $altMod, v, exec, virt-manager
      bind = $ctlR, m, exec, spotify
      # bind = $ctlR, s, exec, grim -g "$(slurp)" $HOME/screenshots/$(date + '%s_grim.png') 2> $HOME/screenshots/error.log
      bind = $ctlR, s, exec, $HOME/nix-config/scripts/screenshot.sh
      bind = $ctlR $altMod, v, exec, pavucontrol

      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with altMod + LMB/RMB and dragging
      bindm = $altMod, mouse:272, movewindow
      bindm = $altMod, mouse:273, resizewindow

      # Adjust volume
      bind = , F1, exec, amixer -D default set Master 1+ toggle
      bind = , F2, exec, wpctl set-volume 54 0.05-
      bind = , F3, exec, wpctl set-volume 54 0.05+

      # Adjust brightness
      bind = , F6, exec, brightnessctl set 5%-
      bind = , F7, exec, brightnessctl set 5%+

      # Eww
      bind = $mainMod, d, exec, $HOME/.config/eww/scripts/dashboard.sh -t $HOME/.config/eww/bars/default/
      bind = $altMod, b, exec, $HOME/.config/eww/scripts/dropdown.sh --battery
      bind = $altMod, c, exec, $HOME/.config/eww/scripts/dropdown.sh --calendar

      # Change wallpaper
      bind = $mainMod $altMod, s, exec, $HOME/nix-config/scripts/wpswap.sh -D $HOME/nix-config/home/cody/local/denali/images/wallpaper/space
      bind = $mainMod $altMod, f, exec, $HOME/nix-config/scripts/wpswap.sh -D $HOME/nix-config/home/cody/local/denali/images/wallpaper/forest
      bind = $mainMod $altMod, o, exec, $HOME/nix-config/scripts/wpswap.sh -D $HOME/nix-config/home/cody/local/denali/images/wallpaper/ocean
      bind = $mainMod $altMod, m, exec, $HOME/nix-config/scripts/wpswap.sh -D $HOME/nix-config/home/cody/local/denali/images/wallpaper/mountains
      bind = $mainMod $altMod, n, exec, $HOME/nix-config/scripts/wpswap.sh -n
      bind = $mainMod $altMod, p, exec, $HOME/nix-config/scripts/wpswap.sh -P
    '';
  };
}
