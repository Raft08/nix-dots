{ config, pkgs, ... }:

{
  imports = [
    ./../../modules/home/fish.nix
    ./../../modules/home/hyprland.nix
    # ./../../modules/home/spicetify.nix - Broken
    ./../../modules/home/starship.nix
    ./../../modules/home/xdg-user-dirs.nix

  ];

  programs.home-manager.enable = true;

  home.username = "raftdev";
  home.homeDirectory = "/home/raftdev";
  home.stateVersion = "24.05"; 

  home.packages = with pkgs; [
    
  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "nano";
  };
}
