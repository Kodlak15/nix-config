{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = true;
    systemdIntegration = true;
    extraConfig = ''
      # Set XWayland scale
      exec-once=xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2

      # Get rid of default wallpaper
      misc {
        disable_hyprland_logo=1
        disable_splash_rendering=1
      }

      # Set up monitors
      ----------------------------------------------
      		      id    res@ref	         pos     scale
      ----------------------------------------------
      monitor = DP-1, 3456x2160@60.0,  0x0,    1

      # Toolkit-specific scale
      env = GDK_SCALE,2
      env = XCURSOR_SIZE,32

      # Environment variables
      env = WLR_NO_HARDWARE_CURSORS,1
      env = CLUTTER_BACKEND,wayland
      env = SDL_VIDEODRIVER,wayland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_DESKTOP,Hyprland
      env = MOZ_ENABLE_WAYLAND,1
      env = MOZ_DBUS_REMOTE,1
      env = NIXOS_OZONE_WL,1

      # Startup scripts
      exec-once = swww init

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =
          follow_mouse = 1
          touchpad {
              natural_scroll = false
          }
          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      general {
          gaps_in = 2.5
          gaps_out = 5
          border_size = 2.5
          col.active_border = rgba(89ddffff) rgba(89ddffff) 90deg
          col.inactive_border = rgba(394b70ff)
          layout = dwindle
      }

      decoration {
          rounding = 10
          blur {
            enabled = false
          }
          drop_shadow = false
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
          fullscreen_opacity = 1.0
          active_opacity = 0.90
          inactive_opacity = 0.90
      }

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

      dwindle {
          pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true # you probably want this
      }

      master {
          new_is_master = true
      }

      gestures {
          workspace_swipe = false
      }

      device:epic-mouse-v1 {
          sensitivity = -0.5
      }

      windowrule = opacity 1.0 override 1.0 override, ^(firefox)$         # Remove opacity for firefox
      windowrule = opacity 1.0 override 1.0 override, ^(librewolf)$       # Remove opacity for librewolf
      windowrule = opacity 1.0 override 1.0 override, ^(brave-browser)$   # Remove opacity for brave
      windowrule = opacity 1.0 override 1.0 override, ^(virt-manager)$    # Remove opacity for vms
      windowrule = opacity 1.0 override 1.0 override, ^(thunar)$          # Remove opacity for thunar
      windowrule = opacity 1.0 override 1.0 override, ^(spotify)$         # Remove opacity for spotify

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
      bind = , F2, exec, wpctl set-volume 45 0.02-
      bind = , F3, exec, wpctl set-volume 45 0.02+

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
