{ lib, config, pkgs, pkgs-unstable, ... }: 

{
  options = {
    module.dev.network.enable = lib.mkEnableOption "Enables network analysing tools";
  };

  config = lib.mkIf config.module.dev.network.enable {
    environment.systemPackages = with pkgs; [
      nmap

      wireshark-qt
      wireshark-cli
      termshark
    ];
  };
}
