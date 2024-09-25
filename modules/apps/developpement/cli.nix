{ lib, config, pkgs, pkgs-unstable, ... }: 

{
  options = {
    module.dev.cli.enable = lib.mkEnableOption "Enables developpement stuff.";
  };

  config = lib.mkIf config.module.dev.cli.enable {
    environment.systemPackages = with pkgs; [
      # CLI
      git
      nano

      # Utilities
      curl
      wget
      unzip
      tree
      lsof
      lshw

      fzf
      atuin
      dust
      bat
      eza
      zoxide
      
      # Monitoring
      htop
      btop
      
      # Stuff
      pipes-rs
      cava
      figlet
      cowsay
      cmatrix
      cbonsai

      # Media Editing
      ffmpeg

      # Process Killing
      killall
      
      # Macros
      xdotool
      
      # System Info
      pfetch
      neofetch

      # Theming
      starship
    ];
  };
}
