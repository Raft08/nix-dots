{ lib, config, inputs, pkgs, ... }: 

{
  options = {
    module.gaming.suyu.enable = lib.mkEnableOption "Enables suyu switch Emulator.";
  };

  config = lib.mkIf config.module.gaming.suyu.enable {
    environment.systemPackages = [
        inputs.suyu.packages.${pkgs.system}.suyu
    ];
  };
}