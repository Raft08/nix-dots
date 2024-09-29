{ lib, config, pkgs, ... }: 

{
  options = {
    module.blockbench.enable = lib.mkEnableOption "Enables blockbench.";
  };

  config = lib.mkIf config.module.blockbench.enable {
    environment.systemPackages = with pkgs; [
      blockbench
    ];
  };
}
