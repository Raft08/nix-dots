{ config, pkgs, inputs, split-monitor-workspaces, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  users.users.raftdev = {
    isNormalUser = true;
    description = "raftdev";
    extraGroups = [ "raftdev" "networkmanager" "wheel" "docker" ];
    initialPassword = "1234";
    shell = pkgs.fish;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs split-monitor-workspaces; };
    users = {
      "raftdev" = import ./home.nix;
    };
  };
}