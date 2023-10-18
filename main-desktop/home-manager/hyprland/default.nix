{
  pkgs,
  config,
  ...
}: 
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = true;
    systemdIntegration = true;
    extraConfig = ''
      # This is an example Hyprland config file.
      #
      # Refer to the wiki for more information.
      
      #
      # Please note not all available settings / options are set here.
      # For a full list, see the wiki
      #
      
      # See https://wiki.hyprland.org/Configuring/Monitors/
      # monitor=,preferred,auto,auto
      # monitor=,highrr, auto, 1
      # monitor=,highres, auto, 1
      
      ### Laptop ###
      # Set resolution, position, scale
      monitor=DP-1, 3840x2160@60.0, auto, 2
      
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      
      # sets xwayland scale
      exec-once=xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2
      # toolkit-specific scale
      env = GDK_SCALE,2
      env = XCURSOR_SIZE,32
      
      # Execute your favorite apps at launch
      exec-once = $HOME/bin/swww-daemon
      exec-once = $HOME/bin/eww daemon
      exec-once = $HOME/.config/eww/scripts/bars/default.sh --launch
      exec-once = /usr/bin/gentoo-pipewire-launcher
      exec-once = /usr/bin/spotifyd --config-path /home/cody/.config/spotifyd/spotifyd.toml --no-daemon
      
      # Source a file (multi-file configs)
      # source = ~/.config/hypr/myColors.conf
      
      # Some default env vars.
      env = XCURSOR_SIZE,24
      
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
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
          gaps_in = 2.5
          gaps_out = 5
          border_size = 2
          col.active_border = rgba(7dcfffff) rgba(7dcfffff) 90deg # cyan
          # col.active_border = rgba(f7768eff) rgba(f7768eff) 90deg # red
          # col.active_border = rgba(e0af68ff) rgba(e0af68ff) 90deg # yellow
      
          col.inactive_border = rgba(59595900)
      
          layout = dwindle
      }
      
      decoration {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
          rounding = 10
      
          blur {
            enabled = false
          }
      
          drop_shadow = false
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      
          # opacity
          fullscreen_opacity = 1.0
          active_opacity = 0.90
          inactive_opacity = 0.90
      }
      
      animations {
          enabled = true
      
          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
      
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
      
          animation = windows, 1, 8, myBezier, slide
          animation = windowsOut, 1, 8, myBezier, slide
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }
      
      dwindle {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true # you probably want this
      }
      
      master {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true
      }
      
      gestures {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = false
      }
      
      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      device:epic-mouse-v1 {
          sensitivity = -0.5
      }
      
      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      windowrule = opacity 1.0 override 1.0 override, ^(firefox)$ # Remove opacity for firefox
      windowrule = opacity 1.0 override 1.0 override, ^(librewolf)$ # Remove opacity for librewolf 
      windowrule = opacity 1.0 override 1.0 override, ^(brave-browser)$ # Remove opacity for brave
      windowrule = opacity 1.0 override 1.0 override, ^(virt-manager)$ # Remove opacity for vms
      windowrule = opacity 1.0 override 1.0 override, ^(thunar)$ # Remove opacity for vms
      
      
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      $mainMod = SUPER
      $altMod = ALT_L
      
      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = $mainMod, Return, exec, alacritty
      bind = $mainMod, Q, killactive,
      bind = $mainMod, Delete, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, E, exec, dolphin
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle
      
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
      
      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $altMod, mouse:272, movewindow
      bindm = $altMod, mouse:273, resizewindow
      
      # Adjust volume
      bind = , F1, exec, amixer -D default set Master 1+ toggle
      bind = , F2, exec, wpctl set-volume 45 0.02-
      bind = , F3, exec, wpctl set-volume 45 0.02+
      
      # Go fullscreen
      bind = $mainMod, F, fullscreen
      
      # Open browsers
      bind = $mainMod, b, exec, librewolf
      
      # Open file explorer
      bind = $mainMod, t, exec, thunar 
      
      # Open Neovim
      bind = $mainMod, e, exec, /usr/bin/alacritty -e $SHELL -c 'nvim && exec $SHELL' & 2> ./logs/nvim
      
      # Open file explorer
      bind = $mainMod $altMod, v, exec, virt-manager 
      
      # Rofi
      # bind = $altMod, b, exec, $HOME/.config/rofi/applets/bin/battery.sh
      bind = $altMod, p, exec, $HOME/.config/rofi/powermenu/type-1/powermenu.sh
      bind = $altMod, o, exec, $HOME/.config/rofi/launchers/type-1/launcher.sh
      
      # Eww
      # bind = $mainMod, d, exec, $HOME/.config/eww/scripts/toggle_dashboard.sh $HOME/.config/eww/bars/default/
      bind = $mainMod, d, exec, $HOME/.config/eww/scripts/dashboard.sh -t $HOME/.config/eww/bars/default/
      bind = $altMod, b, exec, $HOME/.config/eww/scripts/dropdown.sh --battery
      bind = $altMod, c, exec, $HOME/.config/eww/scripts/dropdown.sh --calendar
      
      # Change wallpaper
      bind = $mainMod $altMod, s, exec, $HOME/bin/wpswap.sh -D $HOME/images/wallpaper/space
      bind = $mainMod $altMod, f, exec, $HOME/bin/wpswap.sh -D $HOME/images/wallpaper/forest
      bind = $mainMod $altMod, o, exec, $HOME/bin/wpswap.sh -D $HOME/images/wallpaper/ocean
      bind = $mainMod $altMod, m, exec, $HOME/bin/wpswap.sh -D $HOME/images/wallpaper/mountains
      bind = $mainMod $altMod, n, exec, $HOME/bin/wpswap.sh -n
      bind = $mainMod $altMod, p, exec, $HOME/bin/wpswap.sh -P
    '';
  };
}
