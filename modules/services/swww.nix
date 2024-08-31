{ lib, config, pkgs, ... }: 

{
  options = {
    module.swww.enable = lib.mkEnableOption "Enables swww wallpaper engine.";
  };

  config = lib.mkIf config.module.swww.enable {
    environment.systemPackages = with pkgs; [
      swww
    ];  
  };
}
