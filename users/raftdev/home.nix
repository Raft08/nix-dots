{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
    ./../../modules/home/alacritty.nix
    ./../../modules/home/anyrun.nix
    ./../../modules/home/bluetooth.nix
    ./../../modules/home/btop.nix
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

  # Virtualization
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  home.file = {

  };

  programs.git = {
    enable = true;
    userName = "RaftDev";
    userEmail = "theraft08@gmail.com";
  };

  home.sessionVariables = {
    EDITOR = "nano";
  };
}
