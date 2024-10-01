{ lib, pkgs, inputs, config, ... }: 

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops.age.keyFile = "/home/raftdev/.config/sops/age/keys.txt";

  sops.defaultSopsFile = ./../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.secrets.aw_username = {};
  sops.secrets.aw_username.owner = "raftdev";
  

  sops.secrets.aw_password = {};
  sops.secrets.aw_password.owner = "raftdev";

  environment.sessionVariables = rec {
    AW_REPO_USERNAME = "$(< ${config.sops.secrets.aw_username.path})";
    AW_REPO_PASSWORD = "$(< ${config.sops.secrets.aw_password.path})";
  };
}
