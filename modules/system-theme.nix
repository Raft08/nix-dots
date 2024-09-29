{ lib, pkgs, ... }: 

{
  stylix.enable = true;
  stylix.autoEnable = true;

  # Disables TTY theming
  stylix.targets.console.enable = false;

  # Color Schemes : https://tinted-theming.github.io/base16-gallery/
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/eris.yaml";
  stylix.image = ./../assets/wallpaper/river_medieval_world.png;

  stylix.opacity = {
    applications = 1.0;
    terminal = 0.8;
    desktop = 1.0;
    popups = 1.0;
  };

  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Ice";
    size = 24;
  };

  stylix.fonts = {
    sizes = {
      terminal = 10;
      applications = 10;
      desktop = 10;
      popups = 10;
    };

    monospace = {
      package = pkgs.nerdfonts;
      name = "JetBrains Mono Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
