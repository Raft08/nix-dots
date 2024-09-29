{ lib, pkgs, ... }: 

{
  stylix.enable = true;
  stylix.autoEnable = true;

  # Disables TTY theming
  stylix.targets.console.enable = false;

  # Color Schemes : https://tinted-theming.github.io/base16-gallery/
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/eris.yaml";
  stylix.image = ./../assets/wallpaper/river_medieval_world.png;
}
