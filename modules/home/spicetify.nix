{ pkgs, lib, inputs, ... }:
let
  spicetify-nix = inputs.spicetify-nix;
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  imports = [ spicetify-nix.homeManagerModule ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # configure spicetify :)
  programs.spicetify = {
    enable = true;
  };
}