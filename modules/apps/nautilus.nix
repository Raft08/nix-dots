{ lib, config, pkgs, ... }: 

{
  options = {
    module.nautilus.enable = lib.mkEnableOption "Enables nautilus.";
  };

  config = lib.mkIf config.module.dev.enable {
    environment.systemPackages = with pkgs; [
      gnome.nautilus
      nautilus-open-any-terminal

      udiskie
    ];
  };
}
