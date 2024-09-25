{ lib, pkgs, ... }: 

{
  imports = [
    ./apps/alacritty.nix
    ./apps/anyrun.nix
    ./apps/developpement.nix
    ./apps/gaming.nix
    ./apps/nautilus.nix
    ./hardware/controller.nix
    ./hardware/kernel.nix
    ./hardware/nvidia.nix
    ./hardware/opengl.nix
    ./services/bluetooth.nix
    ./services/bootloader.nix
    ./services/clipboard.nix
    ./services/performance.nix
    ./services/pipewire.nix
    ./services/power-management.nix
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

  # Keyring
  services.gnome.gnome-keyring.enable = true;

  # Apps
  module.dev.enable = lib.mkDefault true; # Enable Developpement Stuff
  module.alacritty.enable = lib.mkDefault true;
  module.anyrun.enable = lib.mkDefault true;
  module.nautilus.enable = lib.mkDefault true;

  # Driver & Kernel
  module.controller.enable = lib.mkDefault true; # Enables Controller Support.
  module.nvidia.enable = lib.mkDefault false; # Enable Nvidia Drivers.
  module.kernel.unstable = lib.mkDefault false; # Use the kernel and unstable driver packages.
  module.opengl.enable = lib.mkDefault true;

  
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
  module.power.enable = lib.mkDefault true; # Enable power optimisations.

  # Misc Stuff
  programs.fish.enable = lib.mkDefault true; # Enable fish by default.
}
