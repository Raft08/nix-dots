{ lib, config, pkgs, ... }: 

{
  options = {
    module.gaming.steam.enable = lib.mkEnableOption "Enables steam.";
  };

  config = lib.mkIf config.module.gaming.steam.enable {
    programs.steam.enable = true;

    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };
}
