{ lib, config, pkgs, ... }: 

{
  options = {
    module.alacritty.enable = lib.mkEnableOption "Enables alacritty.";
  };

  config = lib.mkIf config.module.alacritty.enable {
    environment.systemPackages = with pkgs; [
      alacritty
    ];
  };
}
