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
    environment.systemPackages = [
      # pkgs -> Stable Branch
      # pkgs-unstable -> Unstable Branch

      # VSCode
      pkgs-unstable.vscode
    ];
  };
}
