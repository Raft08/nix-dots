{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      live_config_reload = true;
      window.opacity = 0.1;
      window.blur = true; # Layer rule on Hyprland.

      colors = {
        bright = {
          black = "#585B70";
          blue = "#89B4FA";
          cyan = "#94E2D5";
          green = "#A6E3A1";
          magenta = "#F5C2E7";
          red = "#F38BA8";
          white = "#A6ADC8";
          yellow = "#F9E2AF";
        };

        cursor = {
          cursor = "#F5E0DC";
          text = "#1E1E2E";
        };

        dim = {
          black = "#45475A";
          blue = "#89B4FA";
          cyan = "#94E2D5";
          green = "#A6E3A1";
          magenta = "#F5C2E7";
          red = "#F38BA8";
          white = "#BAC2DE";
          yellow = "#F9E2AF";
        };

        hints.end = {
          background = "#A6ADC8";
          foreground = "#1E1E2E";
        };

        hints.start = {
          background = "#F9E2AF";
          foreground = "#1E1E2E";
        };

        normal = {
          black = "#45475A";
          blue = "#89B4FA";
          cyan = "#94E2D5";
          green = "#A6E3A1";
          magenta = "#F5C2E7";
          red = "#F38BA8";
          white = "#BAC2DE";
          yellow = "#F9E2AF";
        };

        primary = {
          background = "#000000";
          bright_foreground = "#CDD6F4";
          dim_foreground = "#CDD6F4";
          foreground = "#CDD6F4";
        };

        selection = {
          background = "#F5E0DC";
          text = "#1E1E2E";
        };

        vi_mode_cursor = {
          cursor = "#B4BEFE";
          text = "#1E1E2E";
        };

        search = {
          focused_match = {
            background = "#A6E3A1";
            foreground = "#1E1E2E";
          };

          matches = {
            background = "#A6ADC8";
            foreground = "#1E1E2E";
          };
        };
      };

      font = {
        size = 10.0;

        bold = {
          family = "JetBrains Mono Nerd Font";
          style = "Bold";
        };

        bold_italic = {
          family = "JetBrains Mono Nerd Font";
          style = "Bold Italic";
         };

        italic = {
          family = "JetBrains Mono Nerd Font";
          style = "Italic";
        };

        normal = {
          family = "JetBrains Mono Nerd Font";
          style = "Regular";
        };
      };

      shell = {
        program = "fish";
      };

      window.padding = {
        x = 15;
        y = 15;
      };
    };
  };
}