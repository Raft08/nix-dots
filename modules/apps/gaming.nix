{ lib, config, ... }: 

{
  imports = [
    ./gaming/steam.nix
  ];

  options = {
    module.gaming.enable = lib.mkEnableOption "Enables gaming apps.";
  };

  config = lib.mkIf config.module.dev.enable {
    module.gaming.steam.enable = lib.mkDefault true;
  };
}
