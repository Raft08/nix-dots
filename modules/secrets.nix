{ config, ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;

    age = {
      keyFile = "/home/raftdev/.config/sops/age/keys.txt";     
    };

    secrets = {
      aw_username = {
        owner = "raftdev";
      };
      aw_password = {
        owner = "raftdev";
      };

      wireguard_laptop = {
        key = "wireguard_laptop";
        owner = "root";
      };

      # RClone

      "rclone/media/user" = {
        key = "rclone/media/user";
        owner = "raftdev";
      };
      "rclone/media/password" = {
        key = "rclone/media/password";
        owner = "raftdev";
      };
      "rclone/media/host" = {
        key = "rclone/media/host";
        owner = "raftdev";
      };

      "rclone/cloud/user" = {
        key = "rclone/cloud/user";
        owner = "raftdev";
      };
      "rclone/cloud/password" = {
        key = "rclone/cloud/password";
        owner = "raftdev";
      };
      "rclone/cloud/host" = {
        key = "rclone/cloud/host";
        owner = "raftdev";
      };
    };
  };

  environment.sessionVariables = {
    REPO_USERNAME = "$(< ${config.sops.secrets.aw_username.path})";
    REPO_PASSWORD = "$(< ${config.sops.secrets.aw_password.path})";
  };
}