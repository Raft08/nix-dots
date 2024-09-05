{ lib, config, pkgs, ... }: 

{
  options = {
    module.screenshots.enable = lib.mkEnableOption "Enables screenshotting.";
  };

  config = lib.mkIf config.module.screenshots.enable {
    environment.systemPackages = with pkgs; [
      grim
      slurp
    ];
  };
}
