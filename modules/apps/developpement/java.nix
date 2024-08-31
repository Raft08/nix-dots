{ lib, config, pkgs, pkgs-unstable, ... }: 

{
  options = {
    module.dev.java.enable = lib.mkEnableOption "Enables developpement stuff.";
  };

  config = lib.mkIf config.module.dev.java.enable {
    environment.systemPackages = with pkgs-unstable; [

      # Java Stuff
      temurin-bin
      temurin-bin-8
      temurin-bin-11
      temurin-bin-17
      temurin-bin-21
      
      # Jetbrains IDE
      jetbrains.idea-ultimate
    ];
  };
}
