{ lib, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      live_config_reload = true;
      window.blur = true; # Layer rule on Hyprland.

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