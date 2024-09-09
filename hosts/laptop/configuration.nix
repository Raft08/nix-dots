{ config, pkgs, pkgs-unstable, ... }:

{
  imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/default.nix
      ./../../users/users.nix
  ];

  # Enable Flakes - Allow Unfree programs.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Device Name
  networking.hostName = "Raft-Laptop";

  # Kernel & Driver
  module.nvidia.enable = false; # Enable Nvidia Drivers.
  module.kernel.unstable = true; # Use the Nixos unstable kernel drivers.
 
  # Apps - Dev
  module.dev.enable = true; # Enable developpement stuff.
  module.dev.cli.enable = true;
  module.dev.java.enable = true;
  module.dev.network.enable = true;

  # Apps - Nautilus
  module.nautilus.enable = true;

  # Apps - Gaming
  module.gaming.enable = false;
  module.gaming.steam.enable = false;

  # Window Manager
  module.hyprland.enable = true;

  # Users
  users.sudo.noPassword = true; # Disable password prompt for sudo.

  # Services
  module.pipewire.enable = true;
  module.bluetooth.enable = true;
  module.sddm.enable = true;
  module.sddm.customTheme = false; # Broken
  module.swww.enable = true;

  # Utilities
  module.screenshots.enable = true;
  module.clipboard.enable = true;

  # TO BE EDITED INTO MODULES.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_BE.UTF-8";
    LC_IDENTIFICATION = "fr_BE.UTF-8";
    LC_MEASUREMENT = "fr_BE.UTF-8";
    LC_MONETARY = "fr_BE.UTF-8";
    LC_NAME = "fr_BE.UTF-8";
    LC_NUMERIC = "fr_BE.UTF-8";
    LC_PAPER = "fr_BE.UTF-8";
    LC_TELEPHONE = "fr_BE.UTF-8";
    LC_TIME = "fr_BE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "be";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "be-latin1";

  # Allow unfree packages

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    firefox-wayland

    prismlauncher
    vesktop
    spotify

    whatsapp-for-linux
    teams-for-linux
  ];
  
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
