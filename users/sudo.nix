{ lib, config, ... }:

{
  options = {
    users.sudo.noPassword = lib.mkEnableOption "Sets whether sudo users should provide a password when executing a command.";
  };

  config = lib.mkIf config.users.sudo.noPassword {
    security.sudo.wheelNeedsPassword = false;
  };
}