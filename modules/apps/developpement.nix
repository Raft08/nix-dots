{ lib, config, pkgs, pkgs-unstable, ... }: 

{
  imports = [
    ./developpement/cli.nix
    ./developpement/java.nix
    ./developpement/network.nix
  ];

  options = {
    module.dev.enable = lib.mkEnableOption "Enables developpement tools.";
  };

  config = lib.mkIf config.module.dev.enable {
    module.dev.cli.enable = lib.mkDefault true; # Enables all the cli
    module.dev.java.enable = lib.mkDefault true;
    module.dev.network.enable = lib.mkDefault true;

    environment.systemPackages = [
      # pkgs -> Stable Branch
      # pkgs-unstable -> Unstable Branch

      # VSCode
      pkgs-unstable.vscode
    ];
  };
}
