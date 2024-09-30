{ lib, config, pkgs, pkgs-unstable, inputs, ... }: 

{
  options = {
    module.hyprland.enable = lib.mkEnableOption "Enables Hyprland WM.";
  };

  config = lib.mkIf config.module.hyprland.enable {
    environment.systemPackages = with pkgs-unstable; [
      hyprpanel
    ];
    
    programs.hyprland = {
      enable = true;
      xwayland.enable = true; # Allow Xorg apps to run on Wayland
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };
}
