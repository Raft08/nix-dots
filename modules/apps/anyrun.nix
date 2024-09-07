{ lib, config, pkgs, inputs, ... }: 

{
  options = {
    module.anyrun.enable = lib.mkEnableOption "Enables anyrun.";
  };

  config = lib.mkIf config.module.anyrun.enable {
    environment.systemPackages = with pkgs; [
      inputs.anyrun.packages.${pkgs.system}.anyrun
    ];
  };
}
