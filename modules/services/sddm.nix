{ lib, config, pkgs, ... }: 

{
  options = {
    module.sddm.enable = lib.mkEnableOption "Enables sddm.";
    module.sddm.customTheme = lib.mkEnableOption "Enables SDDM's custom theme.";
  };

  config = lib.mkMerge [
    (lib.mkIf config.module.sddm.enable {
      services.xserver.enable = true; # Needed for SDDM.
      services.displayManager.sddm.enable = true;
    })

    (lib.mkIf config.module.sddm.customTheme {
      services.displayManager.sddm.theme = "sugar-dark";
      environment.systemPackages = let themes = pkgs.callPackage ./../../pkgs/sddm-sugar-dark-theme.nix {}; in [ 
        themes.sddm-sugar-dark 
        pkgs.sddm-kcm
      ];
    })
  ];
}
