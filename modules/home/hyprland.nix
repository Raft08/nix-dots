{ config, pkgs, split-monitor-workspaces, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    plugins = [
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];

    settings = { 
      debug = {
        error_position=-1; # Sets the error message to be on the bottom of the screen instead of the top bar.
      };

      input = {
        kb_layout = "be";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        sensitivity = 0.1;

        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      env = [
        "GDK_BACKEND,wayland,x11,*"
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"

        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"

        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"

        "XCURSOR_SIZE, 32"

        # Themes
        "GTK_THEME, Adwaita:dark"
        "GTK2_RC_FILES, /usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc"
        "QT_STYLE_OVERRIDE, Adwaita-Dark"
      ];

      monitor = [
        "Unknown-1, disable"
        "HDMI-A-1, preferred, 1920x0, 1"
        "DP-1, preferred, 0x0, 1"
      ];

      exec-once = [
        "swww-daemon"
        "udiskie &"

        "wl-paste --type text --watch cliphist store" # Text
        "wl-paste --type image --watch cliphist store" # Image
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 2;

        "col.active_border" = "rgb(00B4D8) rgba(90E0EFEE) 45deg";
        "col.inactive_border" = "rgba(0077B6aa)";

        resize_on_border = false; 
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        active_opacity = 1;
        inactive_opacity = 1;

        drop_shadow = false;
        shadow_range = 4;
        shadow_render_power = 1;
        shadow_scale = 1;
        shadow_offset = "-4 4";
        "col.shadow" = "rgba(18181880)";

        blur = {
          enabled = true;

          size = 2;
          passes = 2;
          vibrancy = 1;

          new_optimizations = true;
        };
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = { 
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      xwayland = {
       force_zero_scaling = true;
      };

      bind = [
        # Actions
        "Super + Shift, Q, exit"
        "Super, Return, exec, pkill anyrun || anyrun"
        ''Super + Shift, S, exec, grim -g "$(slurp -d)" - | wl-copy'' # Screenshots
        "Super, C, killactive"
        "Super, V, exec, pkill wofi || cliphist list | wofi --dmenu | cliphist decode | wl-copy"

        # Action Function Keys
        ", XF86Search, exec, pkill anyrun || anyrun"
        ", XF86Calculator, exec, pkill anyrun || anyrun"        

        # Navigation
        "Super + Ctrl, Right, workspace, +1"
        "Super + Ctrl, Left, workspace, -1"
      
        "Super + Alt, Left, splitratio, -0.1"
        "Super + Alt, Right, splitratio, +0.1"
        "Super + Alt, Up, splitratio, -0.1"
        "Super + Alt, Down, splitratio, +0.1"

        "Super, Left, movefocus, l"
        "Super, Right, movefocus, r"
        "Super, Up, movefocus, u"
        "Super, Down, movefocus, d"
       
        # Apps
        "Super, R, exec, alacritty"
        "Super, E, exec, nautilus --new-window"
        "Super, W, exec, firefox"    
      ];

      bindm = [ # Mouse Stuff
        "Super, mouse:272, movewindow"
        "Super, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"
        '', F86AudioNext, exec, playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`''
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioPlay, exec, playerctl play-pause"
      ];

      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
    };
  };
}
