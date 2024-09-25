{ lib, config, pkgs, inputs, ... }: 

{
  options = {
    module.browser.zen.enable = lib.mkEnableOption "Enables anyrun.";
  };

  config = lib.mkIf config.module.browser.zen.enable {
    environment.systemPackages = with pkgs; [
      inputs.zen.packages."${system}".default
    ];
  };
}
