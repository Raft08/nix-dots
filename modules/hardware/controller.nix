{ lib, config, pkgs, ... }: 

{
  options = {
    module.controller.enable = lib.mkEnableOption "Enables support for controllers.";
  };

  config = lib.mkIf config.module.controller.enable {
    hardware.xpadneo.enable = true;
    hardware.xone.enable = true;

    hardware.bluetooth.settings = {
      General = {
        Privacy = "device";
        JustWorksRepairing = "always";
        Class = "0x000100";
        FastConnectable = true;
      };
    };

    boot = {
      extraModulePackages = with config.boot.kernelPackages; [ xpadneo xone];
      extraModprobeConfig = ''
        options bluetooth disable_ertm=Y
      '';
    };
  };
}