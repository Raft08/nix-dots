{ config, lib, nixosConfig, ... }:

with lib;

let
  cfg = config.home.cli.rclone;
in {
  options.home.cli.rclone = {
    enable = mkEnableOption "Enable rclone.";
  };

  config = mkIf cfg.enable {
    programs.rclone = {
      enable = true;
      remotes = {
        media = {
          config = {
            type = "sftp";
            port = 32;
          };

          secrets = {
            host = nixosConfig.sops.secrets."rclone/media/host".path;
            user = nixosConfig.sops.secrets."rclone/media/user".path;
            pass = nixosConfig.sops.secrets."rclone/media/password".path;
          };
        };

        cloud = {
          config = {
            type = "webdav";
            vendor = "other";
          };

          secrets = {
            url = nixosConfig.sops.secrets."rclone/cloud/host".path;
            user = nixosConfig.sops.secrets."rclone/cloud/user".path;
            pass = nixosConfig.sops.secrets."rclone/cloud/password".path;
          };
        };
      };
    };
  };
}
