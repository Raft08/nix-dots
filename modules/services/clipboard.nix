{ lib, config, pkgs, ... }: 

{
  options = {
    module.clipboard.enable = lib.mkEnableOption "Enables the clipboard.";
  };

  config = lib.mkIf config.module.clipboard.enable {
    environment.systemPackages = with pkgs; [
      wofi
      wl-clipboard
      cliphist
    ];
  };
}
