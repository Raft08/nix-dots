{ lib, config, pkgs, ... }: 

{
  options = {
    module.nautilus.enable = lib.mkEnableOption "Enables nautilus.";
  };

  config = lib.mkIf config.module.nautilus.enable {
    environment.systemPackages = with pkgs; [
      gnome.nautilus
      gnome.nautilus-python
      nautilus-open-any-terminal

      udiskie
    ];
  };
}
