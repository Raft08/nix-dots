{ config, lib, nixosConfig, pkgs, ... }:

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

    systemd.user.services.cloud-sync = {
      Unit = {
        Description = "Mount cloud sync directory";
        After = [ "network-online.target" ];
        Wants = [ "network-online.target" ];
      };

      Service = {
        Type = "notify";

        ExecStartPre = [
          "${pkgs.coreutils}/bin/mkdir -p %h/Cloud"
          "${pkgs.coreutils}/bin/mkdir -p %h/.cache/rclone/cloud"
        ];

        ExecStart = ''
          ${pkgs.rclone}/bin/rclone mount cloud: %h/Cloud \
            --vfs-cache-mode full \
            --cache-dir %h/.cache/rclone/cloud \
            --vfs-cache-max-size 20G \
            --vfs-cache-max-age 3650d \
            --vfs-write-back 10s \
            --poll-interval 1m \
            --attr-timeout 1m \
            --buffer-size 32M
        '';

        ExecStop = "${pkgs.fuse3}/bin/fusermount3 -u %h/School";

        Restart = "on-failure";
        RestartSec = "10s";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
