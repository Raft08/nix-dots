{ lib, pkgs, ... }: 

{
  imports = [
    ./apps/developpement.nix
    ./hardware/kernel.nix
    ./hardware/nvidia.nix
    ./services/bluetooth.nix
    ./services/bootloader.nix
    ./services/clipboard.nix
    ./services/pipewire.nix
    ./services/screenshots.nix
    ./services/sddm.nix
    ./services/swww.nix
    ./wm/hyprland.nix
  ];
  
  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-extra
    noto-fonts-emoji

    nerdfonts
  ];

  # Apps
  module.dev.enable = lib.mkDefault true; # Enable Developpement Stuff
  module.dev.cli.enable = lib.mkDefault true; # Enables all the cli
  module.dev.java.enable = lib.mkDefault true;
  module.dev.network.enable = lib.mkDefault true;

  # Driver & Kernel
  module.nvidia.enable = lib.mkDefault false; # Enable Nvidia Drivers.
  module.kernel.unstable = lib.mkDefault false; # Use the kernel and unstable driver packages.
  
  # Window Manager
  module.hyprland.enable = lib.mkDefault true; # Enable Hyprland by default.

  # Services
  module.pipewire.enable = lib.mkDefault true; # Enable pipewire & wireplumber.
  module.bluetooth.enable = lib.mkDefault true; # Enables bluetooth.
  module.clipboard.enable = lib.mkDefault true; # Enables the clipboard.
  module.screenshots.enable = lib.mkDefault true; # Enables screenshotting.
  module.sddm.enable = lib.mkDefault true; # Enable SDDM
  module.sddm.customTheme = lib.mkDefault true; # Enable SDDM's custom theme.
  module.swww.enable = lib.mkDefault true; # Enable swww.

  # Misc Stuff
  programs.fish.enable = lib.mkDefault true; # Enable fish by default.
}
