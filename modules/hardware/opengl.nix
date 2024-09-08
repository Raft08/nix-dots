{ lib, config, pkgs, ... }: 

{
  options = {
    module.opengl.enable = lib.mkEnableOption "Enables opengl.";
  };

  config = lib.mkIf config.module.opengl.enable {
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };  
  };
}
