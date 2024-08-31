{ lib, config, pkgs, ... }: 

{
  options = {
    module.bluetooth.enable = lib.mkEnableOption "Enables bluetooth.";
  };

  config = lib.mkIf config.module.bluetooth.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    environment.systemPackages = with pkgs; [
      playerctl # Enables bluetooth control
      bluetuith # CLI bluetooth
    ];
  };
}
