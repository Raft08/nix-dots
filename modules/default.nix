{ lib, ... }: 

{
  imports = [
    ./apps/developpement.nix
    ./hardware/kernel.nix
    ./hardware/nvidia.nix
    ./services/bluetooth.nix
    ./services/bootloader.nix
    ./services/pipewire.nix
    ./services/sddm.nix
    ./services/swww.nix
    ./wm/hyprland.nix
  ];

  # Apps
  module.dev.enable = lib.mkDefault true; # Enable Developpement Stuff
  module.dev.cli.enable = lib.mkDefault true; # Enables all the cli

  # Driver & Kernel
  module.nvidia.enable = lib.mkDefault false; # Enable Nvidia Drivers.
  module.kernel.unstable = lib.mkDefault false; # Use the kernel and unstable driver packages.
  
  # Window Manager
  module.hyprland.enable = lib.mkDefault true; # Enable Hyprland by default.

  # Services
  module.pipewire.enable = lib.mkDefault true; # Enable pipewire & wireplumber.
  module.bluetooth.enable = lib.mkDefault true; # Enable bluetooth.
  module.sddm.enable = lib.mkDefault true; # Enable SDDM
  module.sddm.customTheme = lib.mkDefault true; # Enable SDDM's custom theme.
  module.swww.enable = lib.mkDefault true; # Enable swww.


  # Misc Stuff
  programs.fish.enable = lib.mkDefault true; # Enable fish by default.
}
