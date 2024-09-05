{ lib, config, pkgs, ... }:

{
  imports = [
    ./sudo.nix

    # Users
    ./raftdev/raftdev.nix
  ];

  users.sudo.noPassword = lib.mkDefault false; # Password required for sudo.

  # XDG User Directories
  environment.systemPackages = with pkgs; [
    xdg-user-dirs
  ];
}